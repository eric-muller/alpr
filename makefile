build:
	(cd data; ../scripts/all.sh > ../build.log 2>&1)

archive-data:
	rm -fr efele.net/data/*.tar.bz2
	mkdir -p efele.net/data
	for f in data/*; do \
		git status -s --ignored $$f |\
		sed -e 's/!! //' |\
		sed -e 's/?? //' |\
		sed -e 's/"//g' |\
		tar cjf efele.net/$$f.tar.bz2 -T -; \
	done


tidy:
	find . -name '.DS_Store' -delete
	rm -fr data/*/reports
	rm -fr temp

clean: tidy
	rm -fr efele.net/data/*.tar.bz2
