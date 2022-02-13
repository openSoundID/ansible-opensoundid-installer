#!/bin/bash

function display_usage { 
	echo "install.sh -local | install opensoundid on local host"  
	echo "install.sh -remote hostname username| install opensoundid on remote host: hostname with ssh user username"
        echo "install.sh -h| help on install.sh"
	exit 1
}

key="$1"

case $key in
    -local)
    LOCAL=true
    shift # past argument
    ;;    
    -remote)
    LOCAL=false
    shift # past argument
    ;;    
    -h|--help)
    display_usage
    shift # past argument
    ;;
    *)    # unknown option
    display_usage
    shift # past argument
    ;;
esac

command -v ansible-playbook &> /dev/null
if [ $? != 0 ] ; then
   echo "ansible not installed. openSoundID installer requires Ansible"
   exit 1
fi

if [ "${LOCAL}" = true ] ; then
   echo "local install"
   ansible-playbook -c local playbook-opensoundid-installer.yml
fi

if [ "${LOCAL}" = false ] ; then
   echo "remote install on $1"
   ansible-playbook -i $1, -u $2 -k playbook-opensoundid-installer.yml
fi

