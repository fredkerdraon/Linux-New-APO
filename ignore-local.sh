#!/bin/bash
#
# Apoweb a de nombreux fichiers modifiés en local,
# mais qui ne doivent pas être commités. Leur présence
# est gênante dans l'utilisation de git, ces fichiers
# apparaissant comme modifiés tout le temps.
#
# Pour pallier à ce problème, ces fichiers sont "ignorés"
# en local via ce script en utilisant :
#
#	git update-index --assume-unchanged "file/to/ignore"
#
# Lancer simplement ce script en étant placé à la racine du
# repository :
#
#	cd /path/to/lswa
#	sh ./ignore-local.sh
#
#
# La commande suivante permet de lister les fichiers ignorés :
#
#	git ls-files -v | grep -e "^[hsmrck]"
#
# Pour ne plus ignorer un fichier, il y a la commande :
#
#	git update-index --no-assume-unchanged "file/to/ignore"
#

ignorefiles=(
        '*.pdf'
)


ignoredir()
{
	dir=$1

	for i in $(ls "$dir")
	do
		if [[ -d "$dir/$i" ]]; then
        		echo "ignoring directory $dir/$i"
			ignoredir "$dir/$i"
		elif [[ -f "$dir/$i" ]]; then
                	echo "ignoring $dir/$i"
	                git update-index --assume-unchanged "$dir/$i"
        	else
                	echo "skip $i"
	        fi
	done
}

for i in "${ignorefiles[@]}"
do
	if [[ -d "$i" ]]; then
		echo "ignoring directory $i"
                ignoredir "$i"
	elif [[ -f "$i" ]]; then
		echo "ignoring $i"
		git update-index --assume-unchanged "$i"
	else
		echo "skip $i"
	fi
done

