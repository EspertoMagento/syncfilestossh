#!/bin/bash
clear

if [ "" == "$1" ]; then
	echo -e "first parameter left: daysback last changes (es ./copy-files.sh daysback output.txt)"
	exit;
fi

if [ "" != "$2" ]; then

	echo -e "\n----------------"
	echo -e "LIST FILES FOUND"
	echo -e "----------------\n"

	find www -type f -mtime -"$1" -name '*.*' -print | fgrep -v -e var -e media -e *.sql -e .DS_Store > "$2"	
	find www -type f -mtime -"$1" -name '*.*' -print | fgrep -v -e var -e media -e *.sql -e .DS_Store
	
	echo -n "Vuoi copiare i file in SSH? [Y/n]"
	read bkdb || exit 1
	case "$bkdb" in
	[Nn]*) bkdb=n with=out;;
	*)     bkdb=y with=;;
	esac

	if [ 'y' = $bkdb ]; then

		IFS=$'\n'       # make newlines the only separator
		set -f          # disable globbing
		for i in $(cat < "$2"); do
	
			echo "scp -P22 $i xx@xxx.it:$i"
			scp -P22 "$i" xx@xxx.it:"$i"
		done
	else
		exit;
	fi
	
else
	echo -e "second parameter left: destination filename (es ./copy-files.sh daysback output.txt)"
fi

echo -e "----------------------------------"
echo -e "THE COPY IS ENDED. THANK YOU! :)"
echo -e "----------------------------------\n"
exit;
