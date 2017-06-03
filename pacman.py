"""Pacman helper funcs"""

import subprocess

import utils


def my_explicits():
    """
    Returns explicitly installed packages that do not belong to
    the base nor base-devel groups
    """
    essentials = utils.make_set_from_stdout("pacman -Qq --groups base base-devel")
    explicits = utils.make_set_from_stdout("pacman -Qq --explicit")
    return explicits.difference(essentials)


def mark_as_deps(pkgs):
    """Mark pkgs as non-explicit installs"""
    cmd = ["sudo", "pacman", "-D", "--asdeps"]
    cmd.extend(set(pkgs))
    subprocess.call(cmd)
