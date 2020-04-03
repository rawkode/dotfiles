from salt.exceptions import CommandExecutionError, CommandNotFoundError
import subprocess


def installed(name, aur_tool="yay"):
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

    ret = __salt__['state.single'](fun='cmd.run', name=command, runas=__grains__["user"])

    return ret.items()[0][1]
