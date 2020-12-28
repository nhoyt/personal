<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- menu -->
<xsl:template name="menu">
  <xsl:param name="name"/>

  <div id="menubar">
  <div id="menu">

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">services.html</xsl:with-param>
    <xsl:with-param name="text">Services</xsl:with-param>
    <xsl:with-param name="current">
      <xsl:choose>
      <xsl:when test="starts-with($name, 'Se')">2</xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">method.html</xsl:with-param>
    <xsl:with-param name="text">Methodology</xsl:with-param>
    <xsl:with-param name="current">
      <xsl:choose>
      <xsl:when test="starts-with($name, 'Me')">2</xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">clients.html</xsl:with-param>
    <xsl:with-param name="text">Clients</xsl:with-param>
    <xsl:with-param name="current">
      <xsl:choose>
      <xsl:when test="starts-with($name, 'Cl')">2</xsl:when>
      <xsl:when test="starts-with($name, 'Ca')">1</xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">about.html</xsl:with-param>
    <xsl:with-param name="text">About</xsl:with-param>
    <xsl:with-param name="current">
      <xsl:choose>
      <xsl:when test="starts-with($name, 'Ab')">2</xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">contact.html</xsl:with-param>
    <xsl:with-param name="text">Contact</xsl:with-param>
    <xsl:with-param name="current">
      <xsl:choose>
      <xsl:when test="starts-with($name, 'Co')">2</xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">index.html</xsl:with-param>
    <xsl:with-param name="text">Home</xsl:with-param>
    <xsl:with-param name="current">
      <xsl:choose>
      <xsl:when test="starts-with($name, 'Ho')">2</xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:with-param>
  </xsl:call-template>

  </div>
  </div>
</xsl:template>

<!-- menu-item -->
<xsl:template name="menu-item">
  <xsl:param name="href"/>
  <xsl:param name="text"/>
  <xsl:param name="current"/>

  <xsl:choose>
  <xsl:when test="$current=0">
    <a href="{$href}"><xsl:value-of select="$text"/></a>
  </xsl:when>
  <xsl:when test="$current=1">
    <a href="{$href}" class="current"><xsl:value-of select="$text"/></a>
  </xsl:when>
  <xsl:when test="$current=2">
    <span class="current"><xsl:value-of select="$text"/></span>
  </xsl:when>
  </xsl:choose>
</xsl:template>

<!-- google search -->
<xsl:template name="search">
<div id="search">
  <form method="get" action="http://www.google.com/search">
  <input type="hidden" name="ie" value="UTF-8"/>
  <input type="hidden" name="oe" value="UTF-8"/>

  <input class="text" type="text" name="q" size="14" maxlength="255" value=""/>
  <input class="button" type="submit" name="btnG" value="Search"/>
  <input type="hidden" name="domains" value="webui.com"/>
  <input type="hidden" name="sitesearch" value="webui.com"/>
  </form>
</div>
</xsl:template>

</xsl:stylesheet>
