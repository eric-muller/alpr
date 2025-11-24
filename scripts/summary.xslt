<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:html="http://www.w3.org/1999/xhtml"
  version="2.0">

<xsl:output
  method="xml"
  indent="no"
  encoding="UTF-8"/>


<xsl:template match='html:insert[@f]'>
  <xsl:variable name='f'>reports/<xsl:value-of select='@f'/></xsl:variable>
  <xsl:variable name='d' select='document($f,.)'/>

  <xsl:element name='{local-name($d/*)}'
               namespace="http://www.w3.org/1999/xhtml">
    <xsl:if test='@i'>
      <xsl:attribute name='id' select='@i'/>
    </xsl:if>
    <!-- not applied to the attributes of the top node
         we loose (correctly) the @border on <table>
         that psql insists to emit -->
    <xsl:apply-templates select='$d/*/node()' mode='m'/>
  </xsl:element>

</xsl:template>

<xsl:template match='*' mode='m'>
  <xsl:element name='{local-name()}' namespace="http://www.w3.org/1999/xhtml">
    <xsl:apply-templates select='@*|*|text()' mode='m'/>
  </xsl:element>
</xsl:template>

<xsl:template match="@align" mode="m">
  <xsl:attribute name="style">text-align: <xsl:value-of select="."/></xsl:attribute>
</xsl:template>

<xsl:template match="@*|text()" mode='m'>
  <xsl:copy>
    <xsl:apply-templates select="@*|node()" mode='m'/>
  </xsl:copy>
</xsl:template>


<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>
