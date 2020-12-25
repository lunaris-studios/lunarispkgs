# @author      Sam Craig <sam@talisman.dev>
# @link        https://github.com/talismanco/talismanpkgs
# ------------------------------------------------------------------------------


from invoke import Collection, task

import os

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
    rootdir = os.path.dirname(os.path.join(os.path.realpath(__file__)))
    context.run(f'python ./scripts/python/setup.py {rootdir} {stage}')

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
