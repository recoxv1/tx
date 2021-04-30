
#!/bin/bash
#! BY SAMHAX
libs(){
	ban; brew install aria2; brew install figlet; 
}

magnet(){
	read -r -p "Magnet Link: " __MAG__;
	aria2c "${__MAG__}" -d ~/"${BASE}"
}

ban(){
	figlet Torrent X;
	echo "\033[0;32mBy SAMHAX \033[0m"
	echo '-------------------------------------------'
}

main(){
	BASE="Torrent_Downloads"; [ -d "~/${BASE}" ]&& mkdir ~/"${BASE}";
	aria=$(command -v aria2c); [ -z "${aria}" ]&& ban && libs;
	fig=$(command -v figlet); [ -z "${fig}" ]&& ban && libs;
	ban; echo "\n[1] Magnet Link\n[0] Quit\n"
	read -r -p "=> " __CH__;
	[ -z ${__CH__} ]&& main;
	if [ "${__CH__}" -eq 1 ]
	then
		magnet
	elif [ "${__CH__}" -eq 0 ]
	then
		exit 1
	else
		echo "\n[!] Wrong Selection. Try Again..."
	fi
}
clear; main
