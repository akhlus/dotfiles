import sys
import os
import subprocess
from datetime import datetime

def update(path, sys_type, format, mode):
    os.system(f'cd {path}')
    changes = os.system('git diff --quiet')
    if changes == 0:
        cont = str(input('No changes detected - proceed anyway? [y]/n'))
        # TODO add input sanitisation
        if cont == 'n':
            return
    if format:
        os.system('alejandra .')
    os.system('git add .')
    os.system('git diff -U0')
    print('Rebuilding...')
    if sys_type == 'home':
        name='home'
    elif sys_type == 'nixos':
        sys_type = 'sudo nixos'
        name = 'system'
    os.system(f'{sys_type} {mode} --flake {path}#{name} &>nixos-switch.log || (cat nixos-switch.log | grep --color error && exit 1)')
    date = datetime.now().strftime('%Y-%m-%d-%H-%M')
    commit_message = date + str(input('Git commit message: '))
    os.system(f'git commit -am {commit_message}')
    push = str(input('Push to github? [y]/n'))
    if push=='n':
        pass
    elif push=='y' or push=='':
        os.system('git push')





if __name__ == '__main__':
    try:
        flake_path = os.environ['FLAKE_PATH']
    except:
        print('Environment Variable FLAKE_PATH not found')
        flake_path = str(input('Full path to flake '))
    curdir = os.getcwd()
    update(flake_path,*sys.argv[1:])
    os.system(f'cd {curdir}')
