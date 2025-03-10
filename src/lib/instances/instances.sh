#!/bin/bash

# get the command
CMD=""
oIFS=$IFS
IFS=":"
declare -a COMMANDS=(${1})
if [ ! -z ${COMMANDS[1]} ]
then
  CMD=${COMMANDS[1]}
fi
IFS=$oIFS
unset $oIFS

# check if command is just plain help
# if we don't have any command we load the help
if [ -z "${CMD}" ] \
	|| [ "${CMD}" == "help" ] \
  || [ "${CMD}" == "--help" ] \
  || [ "${CMD}" == "-h" ]
then
  eval "/usr/local/lib/doil/lib/instances/help.sh"
  exit
fi

# check if the command exists
if [ ! -f "/usr/local/lib/doil/lib/instances/${CMD}/${CMD}.sh" ]
then
  echo -e "\033[1mERROR:\033[0m"
  echo -e "\tCan't find a suitable command."
  echo -e "\tUse \033[1mdoil instances:help\033[0m for more information"
  exit 255
fi

eval "/usr/local/lib/doil/lib/instances/${CMD}/${CMD}.sh" $@