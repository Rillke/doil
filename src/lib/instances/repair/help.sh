#!/bin/bash

cat <<-EOF
NAME
  doil instances:repair - repairs an instance

SYNOPSIS
  doil instances:repair [instance]

ALIAS
  doil repair

DESCRIPTION
  This command repairs the system of an instance by its setted
  configuration. If [instance] not given doil will try to repair
  the instance from the current active directory if doil can
  find a suitable configuration.

EXAMPLE:
  doil instances:repair ilias

OPTIONS
  -h|--help       displays this help message
EOF