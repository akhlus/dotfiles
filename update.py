import sys
import os
import subprocess
from datetime import datetime


def update(path, sys_type, format, mode):
    os.chdir(path)
    changes = os.system('git diff --quiet')
    if changes == 0:
        cont = str(input('No changes detected - proceed anyway? [y]/n'))
        # TODO add input sanitisation
        if cont == 'n':
            return
    if format:
        os.system('alejandra . --quiet')
    os.system('git add .')
    os.system('git diff')  # doesn't work
    print('Rebuilding...')
    if sys_type == 'home':
        name = 'home'
        command = 'home-manager'
    elif sys_type == 'nixos':
        command = 'sudo nixos-rebuild'
        name = 'system'
    else:
        print('error with sys_type')
        return
    try:
        subprocess.run(f'{command} {mode} --flake {path}#{name} &>nixos-switch.log || (cat nixos-switch.log | grep --color error >&2 && exit 1)', shell=True, check=True, capture_output=True, text=True)
    except subprocess.CalledProcessError as e:
        print(e.stderr)
        return
    date = str(datetime.now().strftime('%Y-%m-%d-%H-%M'))
    commit = input('Commit to git? [y]/n')
    if commit == 'n':
        return
    commit_message = date + ' ' + str(input('Git commit message: '))
    os.system(f'git commit -am "{commit_message}"')
    push = str(input('Push to github? [y]/n'))
    if push == 'n':
        return
    os.system('git push')


if __name__ == '__main__':
    try:
        flake_path = os.environ['FLAKE_PATH']
    except:
        print('Environment Variable FLAKE_PATH not found')
        flake_path = str(input('Full path to flake '))
    curdir = os.getcwd()
    update(flake_path, *sys.argv[1:])
    os.chdir(curdir)
