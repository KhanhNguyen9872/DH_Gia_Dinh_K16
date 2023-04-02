#!/bin/bash
# Easy run one C code from GoormIDE by KhanhNguyen9872
if [[ "$0" != "khanhnguyen9872" ]] 2> /dev/null && [ ! -f "/usr/bin/khanhnguyen9872" ] 2> /dev/null; then
sudo="$(which sudo)"
${sudo} echo
cat <<EOF

>> please write below command to [Script] from run command goormide!
khanhnguyen9872 "${c.cpp.set.build.options}" "${current.file.path}"

EOF
printf "\nInstalling script....";
${sudo} mv "$0" "/usr/bin/khanhnguyen9872" >/dev/null 2>&1;
${sudo} chmod 777 "/usr/bin/khanhnguyen9872" >/dev/null 2>&1;
echo "OK!";
exit;
fi;
red='\033[1;31m';
orange='\33[38;5;208m';
reset='\033[0m';
light_cyan='\033[1;96m';
green='\033[1;32m';
yellow='\033[1;33m';
blue='\033[1;34m';
clear; printf '\e[3J';
printf "${red}>> ${yellow}gcc: ${light_cyan}$(gcc --version | grep 'gcc' | sed 's/gcc//g' | awk '{print $3}')\n";
if [ ! -f "${2}" ]; then
	printf "${red}>> source file not found!\n${reset}";
	exit;
fi;
printf "${red}>> ${yellow}khanhnguyen9872 ${orange}\"${light_cyan}${1}${orange}\" \"${green}${2}${orange}\"\n${reset}";
name="$(echo ${2} | sed 's/\// /g' | awk '{print $NF}' | sed 's/\./ /g' | awk '{print $1}')";
mkdir -p "/workspace/coding/bin/";
gcc "${2}" -o "/workspace/coding/bin/${name}" ${1} -lm && { 
	printf "${red}>> ${blue}output file: ${orange}\"${green}/workspace/coding/bin/${name}${orange}\"\n${reset}"; "/workspace/coding/bin/${name}"
} || {
	printf "${red}>> gcc compile failed!${reset}"
};
printf "\n";
exit;