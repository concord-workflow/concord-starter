#!/usr/bin/env bash

source ./concord/setup

mkdir -p ${CONCORD_DOTDIR} > /dev/null 2>&1
# Setup concord profile files
concord_def_profile_file="${CONCORD_DOTDIR}/default";
if [ -f ${concord_def_profile_file} ]
then
  echo "Concord profile file [${concord_def_profile_file}] already exists. Omitting override."
else
  cp ${DIR}/concord/templates/profile.template ${concord_def_profile_file}
fi
[ -f "${CONCORD_DOTDIR}/profile" ] && rm ${CONCORD_DOTDIR}/profile
ln -s ${concord_def_profile_file} ${CONCORD_DOTDIR}/profile

# Main Concord Started script extract for builder projects
cp ${DIR}/concord/concord.bash ${CONCORD_DOTDIR}
# Helpers to extract for builder projects
cp -r ${DIR}/concord/helpers ${CONCORD_DOTDIR}

echo "Concord profile setup success"
