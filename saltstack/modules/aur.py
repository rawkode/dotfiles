import pprint
import subprocess


def install(name, aur_tool="yay"):
    p = subprocess.Popen(
        ["pacman", "-Qi", name],
        shell=False,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
    )

    retval = p.wait()

    if retval == 0:
        return {
            "name": name,
            "changes": {"new_install": False},
            "result": True,
            "comment": "",
        }

    command = "{0} -S --noconfirm {1}".format(aur_tool, name)
    result = __salt__['cmd.run'](command, runas=__grains__['user'])

    return {
        "name": name,
        "changes": {"new_install": True},
        "result": True,
        "comment": "Done",
    }
