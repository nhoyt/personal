<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">

<!-- ================================================ -->
<!-- imports -->

<xsl:import href="../common/xsl-fo/custom.xsl"/>
<xsl:import href="../common/xsl-fo/default-layout.xsl"/>
<xsl:import href="../common/xsl-fo/inline-block.xsl"/>
<xsl:import href="../common/xsl/text.xsl"/>

<!-- ================================================ -->
<!-- includes -->

<xsl:include href="../common/xsl/resume.xsl"/>

<!-- ================================================ -->
<!-- variables -->

<xsl:variable name="input-name"     select="substring-before($inputFile, '.xml')"/>
<xsl:variable name="output"         select="concat($output-prefix, ' print')"/>
<xsl:variable name="email"          select="false()"/>

<!--
  Note:
    font-stretch not currently supported in FOP
    letter-spacing not currently supported in FOP
-->

<xsl:variable name="header">
  <fo:block font-size="16pt" font-weight="bold">NICHOLAS HOYT</fo:block>
  <fo:block font-size="8pt" font-stretch="expanded" space-before="3pt">
    <fo:inline letter-spacing="1mm">204 PELL CIRCLE <xsl:value-of select="$bullet-separator"/> URBANA IL 61801 <xsl:value-of select="$bullet-separator"/> 217.344.6229 <xsl:if test="$email"> <xsl:value-of select="$bullet-separator"/> nhoyt.01@pobox.com</xsl:if></fo:inline>
  </fo:block>
</xsl:variable>

<xsl:variable name="footer">
  <fo:block><fo:page-number/></fo:block>
</xsl:variable>

<xsl:variable name="background-color"   select="'#ddd'"/>
<xsl:variable name="bullet-separator"   select="'&#8226;'"/>
<xsl:variable name="header-footer"      select="true()"/>
<xsl:variable name="header-margin"      select="'0.75in'"/>
<xsl:variable name="space-before-section" select="'12pt'"/>
<xsl:variable name="path"               select="'fo'"/>

<!-- ================================================ -->
<!-- overrides -->

<xsl:variable name="font-size-num"      select="11"/>
<xsl:variable name="space-before"     select="'8pt'"/>

<xsl:template name="layout-master-set">
  <fo:layout-master-set>
    <fo:simple-page-master  master-name="{$default-page}"
      page-width="{$page-width}"    page-height="{$page-height}"
      margin-top="{$outer-margin}"  margin-bottom="{$outer-margin}"
      margin-left="{$outer-margin}" margin-right="{$outer-margin}">
      <fo:region-start  extent="{$inner-margin}"/>
      <fo:region-before extent="{$inner-margin}"/>
      <fo:region-body   margin="{$header-margin}"/>
      <fo:region-end    extent="{$inner-margin}"/>
      <fo:region-after  extent="{$inner-margin}"/>
    </fo:simple-page-master>
  </fo:layout-master-set>
</xsl:template>

<!-- ================================================ -->
<!-- templates -->

<xsl:template match="/">
  <xsl:variable name="filename" select="concat($input-name, $output-ext)"/>

  <xsl:variable name="content">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
      <xsl:call-template name="layout-master-set"/>

      <fo:page-sequence master-reference="{$default-page}"
        font-family="{$font-family}" font-size="{$font-size}">

        <xsl:if test="$header-footer">
          <fo:static-content flow-name="xsl-region-before" text-align="center">
            <xsl:copy-of select="$header"/>
          </fo:static-content>

          <fo:static-content flow-name="xsl-region-after" text-align="center">
            <xsl:copy-of select="$footer"/>
          </fo:static-content>
        </xsl:if>

        <fo:flow flow-name="xsl-region-body">
          <xsl:for-each select="resume/section[@output='all' or contains($output, @output)]">
            <xsl:call-template name="section"/>
          </xsl:for-each>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:variable>

  <xsl:call-template name="write-output-file">
    <xsl:with-param name="filename" select="$filename"/>
    <xsl:with-param name="content" select="$content"/>
  </xsl:call-template>
</xsl:template>

<!-- ================================================ -->
<xsl:template name="section">
  <fo:block font-weight="bold" background-color="{$background-color}">
    <xsl:if test="position() &gt; 1">
      <xsl:attribute name="space-before">
        <xsl:value-of select="$space-before-section"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:call-template name="uppercase">
      <xsl:with-param name="text"><xsl:apply-templates select="title"/></xsl:with-param>
    </xsl:call-template>
  </fo:block>
  <xsl:apply-templates/>
</xsl:template>

<!-- ================================================ -->
<xsl:template name="employment-info">
  <xsl:param name="time-span" select="true()"/>

  <fo:block space-before="{$space-before}" font-weight="bold">
    <xsl:for-each select="role[@output='all' or contains($output, @output)]">
      <xsl:if test="position() &gt; 1"><xsl:text>, </xsl:text></xsl:if><xsl:value-of select="."/>
    </xsl:for-each>
  </fo:block>
  <fo:block>
    <xsl:apply-templates select="client/company"/>, <xsl:apply-templates select="client/location"/>
  </fo:block>
  <xsl:if test="$time-span">
    <fo:block>
      <xsl:value-of select="client/time-span"/>
    </fo:block>
  </xsl:if>
</xsl:template>

<!-- ================================================ -->
<xsl:template match="project-list[project-ref]">
  <fo:list-block start-indent="{$list-indent}"
    provisional-distance-between-starts="{$font-size}">
  <xsl:for-each select="project-ref">
    <xsl:variable name="id" select="@id"/>
    <xsl:variable name="company" select="//employment-info[@id=$id]/client/company"/>

    <xsl:call-template name="list-item">
      <xsl:with-param name="label" select="$bullet"/>
      <xsl:with-param name="body">
        <xsl:value-of select="$company"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:for-each>
  </fo:list-block>
</xsl:template>

<!-- ================================================ -->
<xsl:template match="school">
  <fo:block space-before="{$space-before}" font-weight="bold">
    <xsl:apply-templates select="name"/>
  </fo:block>
  <xsl:for-each select="desc">
    <fo:block>
      <xsl:value-of select="."/>
    </fo:block>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
