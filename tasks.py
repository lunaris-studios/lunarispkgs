# @author      Sam Craig <sam@talisman.dev>
# @link        https://github.com/talismanco/talismanpkgs
# ------------------------------------------------------------------------------


from invoke import Collection, task

import dotenv
import os
import json
import jsonmerge
import re
import yaml

from scripts.python import file as sfile
from scripts.python import env as senv


# === Clean ===


@task()
def _clean(context):
    context.run(
        "find . -type f -name '.env.*' -o -name '*.env' | xargs rm -f")

# === Setup ===


@task(pre=[_clean])
def _setup(context, stage="development"):
    # Get the full path directory that the `tasks.py` file is
    # contained in.
    rootdir = os.path.dirname(os.path.realpath(__file__))

    # Frequently accessed directories
    configdir = os.path.join(rootdir, "config")
    settingsdir = os.path.join(configdir, "settings")
    targetdir = os.path.join(rootdir, "target")

    # Combine the active project stage configuration settings
    # with the default `default.json` configuration settings via
    # via `.env.json`. We'll use this file as our base source of truth
    # for generating other configuration file types (.yaml, .env, etc.)
    default_settings_path = os.path.join(settingsdir, "default.json")
    default_settings_str = sfile.get(default_settings_path)
    default_settings_json = json.loads(default_settings_str)

    stage_settings_path = os.path.join(settingsdir, "{}.json".format(stage))
    stage_settings_str = sfile.get(stage_settings_path)
    stage_settings_json = json.loads(stage_settings_str)

    settings_json = jsonmerge.merge(default_settings_json, stage_settings_json)
    settings_json_str = json.dumps(settings_json, indent=4, sort_keys=True)
    sfile.write(".env.json", settings_json_str)

    # Create `.env.yaml`
    settings_yaml = yaml.load(settings_json_str, Loader=yaml.SafeLoader)
    settings_yaml_str = yaml.dump(settings_yaml)
    sfile.write(".env.yaml", settings_yaml_str)

    # Create `.env`
    settings_env_str = senv.json2env(settings_json_str)
    sfile.write(".env", settings_env_str)

    # Create `.tool-versions.env`
    tool_versions_path = os.path.join(rootdir, ".tool-versions")
    tool_versions_str = sfile.get(tool_versions_path)
    tool_versions_env_str = senv.toolversions2env(tool_versions_str)
    sfile.write(".tool-versions.env", tool_versions_env_str)

    # Instantiate the environment variables in `.env`
    # and `.tool-versions.env` via `dotenv`
    dotenv.load_dotenv(".env")
    dotenv.load_dotenv(".tool-versions.env")

# === Create ===


@task(pre=[_setup], aliases=["c"])
def create(context, name, version):
    """
    Scaffold new package dirtory & files
    """
    context.run(f'mkdir -p ./pkgs/{name}')
    context.run(f'mkdir -p ./pkgs/{name}/versions')

    context.run(f'touch ./pkgs/{name}/default.nix')
    context.run(f'touch ./pkgs/{name}/versions/{version}.nix')


# === Update ===


@task(pre=[_setup], aliases=["univ"])
def update_niv(context):
    """
    Update niv dependencies
    """
    context.run("niv update")


@task(pre=[_setup], aliases=["unpm"])
def update_npm(context):
    """
    Update npm packages
    """
    context.run("npm run update")


update = Collection("update")
update.add_task(update_niv, "niv")
update.add_task(update_npm, "npm")

#

ns = Collection()
ns.add_task(create)

ns.add_collection(update)
