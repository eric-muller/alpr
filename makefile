build:
	(cd data; ../script/all.sh)

archive:
	rm -fr efele.net/data/*.tar
	for f in data/*; do tar czf efele.net/$f.tar $f/data*; done

tidy:
	rm -fr data/*/reports
	rm -fr temp
