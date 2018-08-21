# !/bin/bash
# after source build/envsetup.sh; lunch

if [ ! -z $OUT ]; then
	# rm installed dirs
	rm $OUT/system $OUT/data $OUT/rootdir -rf

	# make
	time make -j16
else
	echo 'OUT is empty!'
fi
