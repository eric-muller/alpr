. 00_common.sh

if [ -f summary.html ] ; then
  java -jar "${SAXON_JAR}" -xsl:../../scripts/summary.xslt -s:summary.html \
       > reports/$schema.html

  mkdir -p ../../efele.net/reports
  cp reports/$schema.html ../../efele.net/summaries/$schema.html
fi
