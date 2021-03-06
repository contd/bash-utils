#!/usr/bin/env bash

for j in utils bin media web; do
	for i in ~/.bash/$j/*;do
		fname=$(basename $i)
		bname=${fname%.*}
		if [[ ! -L ~/bin/$bname ]];then
			ansi --green "ln -s ~/.bash/$j/$fname ~/bin/$bname"
			ln -s ~/.bash/$j/$fname ~/bin/$bname
		else
			ansi --blue --no-newline "Keeping existing: ~/bin/$bname";ansi --green "(${j})"
		fi
	done
done

# Utils
#for i in ~/.bash/utils/*;do fname=$(basename $i);bname=${fname%.*};echo "alias $bname=\"$i\""; done
# Media
#for i in ~/.bash/media/*;do fname=$(basename $i);bname=${fname%.*};echo "alias $bname=\"$i\""; done
# Web
#for i in ~/.bash/web/*;do fname=$(basename $i);bname=${fname%.*};echo "alias $bname=\"$i\""; done

exit 0
