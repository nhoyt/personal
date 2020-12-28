<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:java="http://xml.apache.org/xalan/java"
  exclude-result-prefixes="java">

<!-- parameters -->

<!-- stylesheet parameter passed in by update.java -->
<xsl:param name="inputFile"/>

<!-- variables -->

<!--
<xsl:variable name="fileObj"    select="java:java.io.File.new($inputFile)"/>
<xsl:variable name="filePath"   select="java:getAbsolutePath($fileObj)"/>
-->
<xsl:variable name="imagePath"  select="'images'"/>
<xsl:variable name="language"   select="'amer'"/>
<xsl:variable name="output"     select="'all'"/>

<!-- match templates -->

<!-- footer -->
<xsl:template match="footer">
  <xsl:apply-templates/>
  <xsl:if test="@copyright='yes'">
  <p><xsl:call-template name="copyright-notice"/></p>
  </xsl:if>
</xsl:template>

<!-- named templates -->

<xsl:template name="copyright-notice"/>

<xsl:template name="meta-tags">
  <xsl:param name="description"/>
  <xsl:param name="keywords"/>

  <meta content="text/html; charset=iso-8859-1" http-equiv="content-type"/>
  <xsl:if test="string-length($description)">
    <meta content="{$description}" name="description"/>
  </xsl:if>
  <xsl:if test="string-length($keywords)">
    <meta content="{$keywords}" name="keywords"/>
  </xsl:if>
</xsl:template>

</xsl:stylesheet>
