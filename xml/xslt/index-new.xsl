<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:output
  encoding="iso-8859-1"
  indent="yes"
  omit-xml-declaration="yes"
  method="xml"/>

<xsl:variable name="columnCount" select="count(//column)"/>

<!-- ================================================ -->
<xsl:template match="index"> 
  <table class="content" cellpadding="0" cellspacing="0"> 
    <tr> 
      <xsl:apply-templates select="column"/> 
    </tr> 
  </table> 
</xsl:template> 
 
<!-- ================================================ -->
<xsl:template match="column[1]">
  <td class="left">
    <xsl:if test="$columnCount=1">
      <xsl:attribute name="class">single</xsl:attribute>
    </xsl:if>
    <xsl:apply-templates select="category"/>
  </td>
</xsl:template>

<xsl:template match="column[2]">
  <td class="right">
    <xsl:apply-templates select="category"/>
  </td>
</xsl:template>

<!-- ================================================ -->
<xsl:template match="category">
  <h2 class="category">
    <xsl:if test="position() = 1">
      <xsl:attribute name="class">category first</xsl:attribute>
    </xsl:if>
    <xsl:value-of select="@name"/>
  </h2>

  <ul class="category">
    <xsl:choose>
      <xsl:when test="@sort='yes'">
        <xsl:for-each select="site">
          <xsl:sort select="name"/>
          <xsl:call-template name="site"/>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        <xsl:for-each select="site">
          <xsl:call-template name="site"/>
        </xsl:for-each>
      </xsl:otherwise>
    </xsl:choose>
  </ul>
</xsl:template>

<!-- ================================================ -->
<xsl:template name="site">
  <li><a href="{@href}"><xsl:apply-templates select="name"/></a><xsl:if test="@new"><xsl:call-template name="new"/></xsl:if><xsl:if test="@rec"><xsl:call-template name="rec"/></xsl:if></li>
  <xsl:apply-templates select="desc"/>
</xsl:template>

<xsl:template name="new">
  <span class="new">*</span>
</xsl:template>

<xsl:template name="rec">
  <span class="rec">*</span>
</xsl:template>

<!-- ================================================ -->
<xsl:template match="name">
  <xsl:value-of select="."/>
</xsl:template>

<!-- ================================================ -->
<xsl:template match="desc">
  <li class="desc"><xsl:value-of select="."/></li>
</xsl:template>

</xsl:transform>
