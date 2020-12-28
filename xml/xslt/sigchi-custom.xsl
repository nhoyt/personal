<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<!-- REQUIRED DEFINITIONS -->

	<!-- VARIABLES -->

	<xsl:variable name="stylesheetVersion">2002/08/03</xsl:variable>
	<xsl:variable name="cssStylesheet">sigchi.css</xsl:variable>

	<xsl:variable name="bulletImage">bullet.gif</xsl:variable>
	<xsl:variable name="bulletWidth">5</xsl:variable>
	<xsl:variable name="bulletHeight">5</xsl:variable>
	<xsl:variable name="bulletHSpace">1</xsl:variable>
	<xsl:variable name="bulletVSpace">6</xsl:variable>

	<xsl:variable name="hrImage">images/rule.gif</xsl:variable>
	<xsl:variable name="hrWidth">500</xsl:variable>
	<xsl:variable name="hrHeight">2</xsl:variable>

	<xsl:variable name="menuWidth">151</xsl:variable>
	<xsl:variable name="outerTableWidth">100%</xsl:variable>
	<xsl:variable name="spacerHeight">8</xsl:variable>
	<xsl:variable name="spacerWidth">10</xsl:variable>
	<xsl:variable name="tableWidth">100%</xsl:variable>

	<xsl:variable name="officer-kb" select="'Kay Burnett'"/>
	<xsl:variable name="officer-ec" select="'Elizabeth Carpenter'"/>
	<xsl:variable name="officer-jf" select="'Jessica Friedman'"/>
	<xsl:variable name="officer-nh" select="'Nicholas Hoyt'"/>

	<xsl:variable name="e-mail-kb" select="'kburnett@acm.org'"/>
	<xsl:variable name="e-mail-ec" select="'ecarpenter@spss.com'"/>
	<xsl:variable name="e-mail-jf" select="'jeccika@att.net'"/>
	<xsl:variable name="e-mail-nh" select="'nhoyt@acm.org'"/>

	<!-- ATTRIBUTE SETS -->

	<xsl:attribute-set name="layout-table">
		<xsl:attribute name="border">0</xsl:attribute>
		<xsl:attribute name="cellpadding">10</xsl:attribute>
		<xsl:attribute name="cellspacing">0</xsl:attribute>
		<xsl:attribute name="width"><xsl:value-of select="$outerTableWidth"/></xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="inner-table">
		<xsl:attribute name="border">0</xsl:attribute>
		<xsl:attribute name="cellpadding">10</xsl:attribute>
		<xsl:attribute name="cellspacing">0</xsl:attribute>
		<xsl:attribute name="width"><xsl:value-of select="$tableWidth"/></xsl:attribute>
	</xsl:attribute-set>

	<!-- NAMED TEMPLATES -->

	<xsl:template name="html-title">
		<xsl:choose>
		<xsl:when test="/meeting">CHI-Squared Meeting &#8211; <xsl:value-of select="/meeting/@date"/></xsl:when>
		<xsl:when test="/page/@code='about'">About CHI-Squared</xsl:when>
		<xsl:when test="/page/@code='bylaws'">CHI-Squared: Bylaws</xsl:when>
		<xsl:when test="/page/@code='feedback'">CHI-Squared: Feedback</xsl:when>
		<xsl:when test="/page/@code='history'">CHI-Squared: History</xsl:when>
		<xsl:when test="/page/@code='index'">CHI-Squared Home</xsl:when>
		<xsl:when test="/page/@code='join'">Join CHI-Squared</xsl:when>
		<xsl:when test="/page/@code='library'">CHI-Squared: Library</xsl:when>
		<xsl:when test="/page/@code='mail'">CHI-Squared: Mailing List</xsl:when>
		<xsl:when test="/page/@code='nextMtg'">CHI-Squared: Next Meeting</xsl:when>
		<xsl:when test="/page/@code='officers'">CHI-Squared: Officers</xsl:when>
		<xsl:when test="/page/@code='parents'">CHI-Squared: Parent Organizations</xsl:when>
		<xsl:when test="/page/@code='prevMtgs'">CHI-Squared: Previous Meetings</xsl:when>
		<xsl:when test="/page/@code='sponsors'">CHI-Squared: Sponsors</xsl:when>
		<xsl:when test="/page/@code='volunteer'">CHI-Squared: Volunteers</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="nbsp">
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
	</xsl:template>

	<xsl:template match="e-mail">
		<xsl:choose>
		<xsl:when test="@id='kb'"><a href="mailto:{$e-mail-kb}"><xsl:value-of select="$e-mail-kb"/></a></xsl:when>
		<xsl:when test="@id='ec'"><a href="mailto:{$e-mail-ec}"><xsl:value-of select="$e-mail-ec"/></a></xsl:when>
		<xsl:when test="@id='jf'"><a href="mailto:{$e-mail-jf}"><xsl:value-of select="$e-mail-jf"/></a></xsl:when>
		<xsl:when test="@id='nh'"><a href="mailto:{$e-mail-nh}"><xsl:value-of select="$e-mail-nh"/></a></xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="officer">
		<xsl:choose>
		<xsl:when test="@id='kb'"><xsl:value-of select="$officer-kb"/></xsl:when>
		<xsl:when test="@id='ec'"><xsl:value-of select="$officer-ec"/></xsl:when>
		<xsl:when test="@id='jf'"><xsl:value-of select="$officer-jf"/></xsl:when>
		<xsl:when test="@id='nh'"><xsl:value-of select="$officer-nh"/></xsl:when>
		</xsl:choose>
	</xsl:template>

	<!-- SITE-SPECIFIC DEFINITIONS -->

	<!-- VARIABLES -->

	<!-- 9cb5ce, 336699, 4c657e -->
	<xsl:variable name="columnSpacer">20</xsl:variable>
	<xsl:variable name="emphColor">#ff0033</xsl:variable>
	<xsl:variable name="imagePath">images/</xsl:variable>

	<!-- SITE-SPECIFIC TEMPLATE OVERRIDES -->

	<xsl:template name="bullet">
		<xsl:variable name="prefix">
		<xsl:choose>
		<xsl:when test="/meeting">../</xsl:when>
		<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
		</xsl:variable>

		<img xsl:use-attribute-sets="bullet"><xsl:attribute name="src"><xsl:value-of select="concat($prefix,$imagePath,$bulletImage)"/></xsl:attribute></img>
	</xsl:template>

	<!-- link -->
	<xsl:template match="link[@href]">
		<span class="link"><a href="{@href}"><xsl:apply-templates/></a></span>
	</xsl:template>

	<!-- bulleted-list headline -->

	<xsl:template match="bulleted-list/headline">
		<tr><td colspan="2" class="headline"><xsl:apply-templates/></td></tr>
	</xsl:template>

</xsl:stylesheet>
