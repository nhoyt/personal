<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:java="http://xml.apache.org/xalan/java"
	exclude-result-prefixes="java">

<!-- today's date -->
<xsl:variable name="today" select="java:java.util.Date.new()"/>

<!-- date format patterns -->

<xsl:variable name="pattern-timestamp"		select="'yyyyMMdd'"/>

<xsl:variable name="pattern-month-day-year"	select="'MMMM d, yyyy'"/>

<xsl:variable name="pattern-year"			select="'yyyy'"/>

<!-- date formatters based on specified pattern -->
<xsl:variable name="formatter-timestamp"
	select="java:java.text.SimpleDateFormat.new($pattern-timestamp)"/>

<xsl:variable name="formatter-month-day-year"
	select="java:java.text.SimpleDateFormat.new($pattern-month-day-year)"/>

<xsl:variable name="formatter-year"
	select="java:java.text.SimpleDateFormat.new($pattern-year)"/>

<!-- date strings derived from formatters -->
<xsl:variable name="timestamp"				select="java:format($formatter-timestamp, $today)"/>

<xsl:variable name="month-day-year"			select="java:format($formatter-month-day-year, $today)"/>

<xsl:variable name="year"					select="java:format($formatter-year, $today)"/>

<!-- convert string in mm/dd/yy format to timestamp format -->
<xsl:template name="numerical-date">
	<xsl:param name="text"/>

	<xsl:variable name="date-string" select="concat($text, ' 0:0 AM, CST')"/>
	<xsl:variable name="formatter" select="java:java.text.SimpleDateFormat.new()"/>
	<xsl:variable name="parse-position" select="java:java.text.ParsePosition.new(0)"/>
	<xsl:variable name="date" select="java:parse($formatter, $date-string, $parse-position)"/>

	<xsl:value-of select="java:format($formatter-timestamp, $date)"/>
</xsl:template>

<!-- date source file was last modified -->
<xsl:variable name="lastModified" select="java:java.util.Date.new(java:lastModified($fileObj))"/>
<xsl:variable name="dateLastModified" select="java:format($formatter-month-day-year, $lastModified)"/>

</xsl:stylesheet>
