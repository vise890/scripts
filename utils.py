from subprocess import getoutput

def make_set_from_stdout(cmd, sep="\n"):
    """makes a set of the outputs of cmd, splitting on sep"""
    out = getoutput(cmd)
    elements = out.split(sep)
    return set(elements)

def make_set(string, sep="\n"):
    elements = string.strip().split(sep)
    return set(elements)
