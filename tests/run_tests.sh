#!/bin/bash

set -eu

cmd="java -Djava.awt.headless=true -jar /opt/plantuml/plantuml.jar"
result=0

output1=$(${cmd} -version 2>&1) || result=$?
if [ ! "${result}" = "0" ]; then
  echo >&2 "ERROR: command '${cmd}' not found."
  exit ${result}
fi

output2=$(echo ${output1} | grep "PlantUML version ${DOCKER_TAG}") || result=$?
if [ ! "${result}" = "0" ]; then
  echo >&2 "ERROR: wrong version of command '${cmd}'."
  exit ${result}
fi

${cmd} tests/example1.pu -o /tmp
cmp -s tests/example1.png /tmp/example1.png || result=$?
if [ ! "${result}" = "0" ]; then
  echo >&2 "ERROR: output image does not match."
  exit ${result}
fi
