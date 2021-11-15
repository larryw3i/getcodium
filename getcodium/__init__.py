
import os
import platform
import re
import subprocess
import sys

__version__ = '0.0.1'
__appauthor__ = 'larryw3i & Contributors'

system = platform.system().lower()
sys_argv = ' '.join(sys.argv[1:])

def run():
    # wait for you to contribute the code
    os.system(
        f'. getcodium.sh ${sys_argv}' if system == 'linux' else \
        ''
    )

