# -Embedded_Linux_Z2H
current_time=$(date +%s)

mkdir -p ~/TRASH

if [ "$(ls -A ~/TRASH)"]
then
	for file in ~/TRASH/*.gz
	do
		file_time=$(date -r $file +%s)
		if(( file_time < ( current_time - ( 60 * 60 * 2 * 24 ) ) ))
		then 
			rm $file
		fi
	done
fi

for args in $@
do
	if [ $(file -b --mime-type $args) != "application/gzip" ]
	then
		$(tar -zcf $args.tar.gz $args)
		rm -r $args
		mv $args.tar.gz ~/TRASH
	else
		mv $args ~/TRASH
	fi
done
