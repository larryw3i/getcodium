
_kernel_=$(echo `uname -s` | tr '[:upper:]' '[:lower:]')
_processor_=$(echo `uname -p` | tr '[:upper:]' '[:lower:]')
__release_id__=$(cat /etc/os-release | grep -Eo  '^ID=(\S*)')
_release_id_=${__release_id__:3}

_processor_=$([[ "*${_processor_}*"=='x86_64 amd64' ]] && echo "amd64" || \
    echo "amd64")
_pkg_ext_=$([[ "*${_release_id_}*"=='ubuntu debian' ]] && echo "deb" || \
    echo "deb")

_args_=($@) # all parameters from terminal.

_mirror_=${_args_[0]}

printf "\n"
printf "kernel\n\t${_kernel_}\n"
printf "processor\n\t${_processor_}\n"
printf "pkg_ext\n\t${_pkg_ext_}\n"
printf "args\n\t${_args_[*]}\n"
printf "mirror\n\t${_mirror_}\n"

if [[ "${_args_[*]}"=='-h' ]]; then
    echo ""
    return
fi

_mirror_url_=$(cat ./codium.mirrors | grep ${_mirror_})
printf "mirror_url\n\t${_mirror_url_}\n"
