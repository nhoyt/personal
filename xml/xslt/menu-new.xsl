<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:output
  encoding="iso-8859-1"
  indent="yes"
  omit-xml-declaration="yes"
  method="xml"/>

<xsl:param name="id"/>
<xsl:param name="local"/>
<xsl:variable name="link-check" select="false()"/>

<!-- ================================================ -->
<xsl:template match="menu">
  <xsl:choose>
  <xsl:when test="$local">
    <xsl:apply-templates select="menu-list[@id='local']"/>
  </xsl:when>
  <xsl:otherwise>
    <xsl:apply-templates select="menu-list[@id='news']"/>
    <xsl:apply-templates select="menu-list[@id='tech']"/>
    <xsl:apply-templates select="menu-list[@id='music']"/>
    <xsl:apply-templates select="menu-list[@id='general']"/>
  </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- ================================================ -->
<xsl:template match="menu-list">
  <h2 class="menu">
    <xsl:apply-templates select="title"/>
  </h2>
  <ul class="menu">
    <xsl:apply-templates select="menu-item"/>
  </ul>
</xsl:template>

<!-- ================================================ -->
<xsl:template match="menu-item">
  <xsl:variable name="var">
    <xsl:choose>
      <xsl:when test="$local">local</xsl:when>
      <xsl:otherwise>id</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <li>
    <xsl:if test="position()=last()"><xsl:attribute name="class">last</xsl:attribute></xsl:if>
    <a href="/index/?{$var}={@href}"><xsl:if test="@href=$id"><xsl:attribute name="class">current</xsl:attribute></xsl:if><xsl:value-of select="."/></a>
  </li>
</xsl:template>

</xsl:transform>
