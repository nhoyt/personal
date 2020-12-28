<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:variable name="link-check" select="false()"/>

<!-- ======================================== -->
<xsl:template name="logo">
  <xsl:param name="local"/>

  <xsl:variable name="imageName" select="'logo.gif'"/>
  <xsl:variable name="altText">N. Hoyt's Web Index - Home</xsl:variable>

  <xsl:variable name="href">
    <xsl:choose>
      <xsl:when test="$local">../index.html</xsl:when>
      <xsl:otherwise>index.html</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <div id="logo">
    <xsl:choose>
    <xsl:when test="starts-with(*/@name,'N. Hoyt')">
      <img src="{$imagePath}/{$imageName}" alt="{$altText}"/>
    </xsl:when>
    <xsl:otherwise>
      <a title="{$altText}" href="{$href}"><img src="{$imagePath}/{$imageName}" alt="{$altText}"/></a>
    </xsl:otherwise>
    </xsl:choose>
  </div>
</xsl:template>

<!-- ======================================== -->
<xsl:template name="menu">
  <xsl:param name="local" select="false()"/>

  <xsl:choose>
  <xsl:when test="$local">
    <xsl:call-template name="menu-local"/>
  </xsl:when>
  <xsl:otherwise>
    <xsl:call-template name="menu-news"/>
    <xsl:call-template name="menu-music"/>
    <xsl:call-template name="menu-tech"/>
    <xsl:call-template name="menu-general"/>
  </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- ======================================== -->
<xsl:template name="menu-news">

  <h2 class="menu">News</h2>

  <ul class="menu">

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">current-events</xsl:with-param>
    <xsl:with-param name="text">Current Events</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">liberalism</xsl:with-param>
    <xsl:with-param name="text">Liberal/Progressive</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">magazines</xsl:with-param>
    <xsl:with-param name="text">Magazines</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">media</xsl:with-param>
    <xsl:with-param name="text">Media Reform &amp; FOI</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">technology</xsl:with-param>
    <xsl:with-param name="text">Technology News</xsl:with-param>
    <xsl:with-param name="last" select="true()"/>
  </xsl:call-template>

  </ul>
</xsl:template>

<!-- ======================================== -->
<xsl:template name="menu-music">

  <h2 class="menu">Music</h2>

  <ul class="menu">

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">guitar</xsl:with-param>
    <xsl:with-param name="text">Guitar</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">home-audio</xsl:with-param>
    <xsl:with-param name="text">Home Audio</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">pro-audio</xsl:with-param>
    <xsl:with-param name="text">Pro Audio</xsl:with-param>
    <xsl:with-param name="last" select="true()"/>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">music-reference</xsl:with-param>
    <xsl:with-param name="text">Reference</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">music-software</xsl:with-param>
    <xsl:with-param name="text">Software</xsl:with-param>
  </xsl:call-template>

  </ul>

</xsl:template>

<!-- ======================================== -->
<xsl:template name="menu-tech">

  <h2 class="menu">Technology</h2>

  <ul class="menu">

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">gui</xsl:with-param>
    <xsl:with-param name="text">GUI Construction</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">hci</xsl:with-param>
    <xsl:with-param name="text">HCI Design</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">html</xsl:with-param>
    <xsl:with-param name="text">HTML/CSS</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">java</xsl:with-param>
    <xsl:with-param name="text">Java</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">javascript</xsl:with-param>
    <xsl:with-param name="text">JavaScript/DHTML</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">ocaml</xsl:with-param>
    <xsl:with-param name="text">OCaml</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">programming</xsl:with-param>
    <xsl:with-param name="text">Programming</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">swc</xsl:with-param>
    <xsl:with-param name="text">SW Construction</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">web-accessibility</xsl:with-param>
    <xsl:with-param name="text">Web Accessibility</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">web-development</xsl:with-param>
    <xsl:with-param name="text">Web Development</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">xml</xsl:with-param>
    <xsl:with-param name="text">XML</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">xsl</xsl:with-param>
    <xsl:with-param name="text">XSL</xsl:with-param>
    <xsl:with-param name="last" select="true()"/>
  </xsl:call-template>

  </ul>

</xsl:template>

<!-- ======================================== -->
<xsl:template name="menu-general">

  <h2 class="menu">General</h2>

  <ul class="menu">

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">business</xsl:with-param>
    <xsl:with-param name="text">Business</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">entertainment</xsl:with-param>
    <xsl:with-param name="text">Entertainment</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">job-search</xsl:with-param>
    <xsl:with-param name="text">Job Search</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">philosophy</xsl:with-param>
    <xsl:with-param name="text">Philosophy</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">psychology</xsl:with-param>
    <xsl:with-param name="text">Psychology</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">gen-reference</xsl:with-param>
    <xsl:with-param name="text">Reference</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">shopping</xsl:with-param>
    <xsl:with-param name="text">Shopping</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">software</xsl:with-param>
    <xsl:with-param name="text">Software</xsl:with-param>
  </xsl:call-template>

  </ul>

</xsl:template>

<!-- ======================================== -->
<xsl:template name="menu-local">

  <h2 class="menu">General</h2>

  <ul class="menu">

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">cars</xsl:with-param>
    <xsl:with-param name="text">Cars</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">cms</xsl:with-param>
    <xsl:with-param name="text">CMS</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">finance</xsl:with-param>
    <xsl:with-param name="text">Finance</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">health</xsl:with-param>
    <xsl:with-param name="text">Health</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">linux</xsl:with-param>
    <xsl:with-param name="text">Linux</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">misc</xsl:with-param>
    <xsl:with-param name="text">Miscellaneous</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">op-ed</xsl:with-param>
    <xsl:with-param name="text">Op-Ed</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">photography</xsl:with-param>
    <xsl:with-param name="text">Photography</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">schools</xsl:with-param>
    <xsl:with-param name="text">Schools</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">travel</xsl:with-param>
    <xsl:with-param name="text">Travel</xsl:with-param>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">unsorted</xsl:with-param>
    <xsl:with-param name="text">Unsorted</xsl:with-param>
    <xsl:with-param name="last" select="true()"/>
  </xsl:call-template>

  <xsl:call-template name="menu-item">
    <xsl:with-param name="href">web-navigation</xsl:with-param>
    <xsl:with-param name="text">Web Navigation</xsl:with-param>
    <xsl:with-param name="last" select="true()"/>
  </xsl:call-template>

  <xsl:if test="$link-check">
    <li><a style="color: red" href="http://validator.w3.org/checklink?uri=http://nhoyt.com/index/local/{$htmlFile}">Check Links</a></li>
  </xsl:if>

  </ul>

</xsl:template>

<!-- ======================================== -->
<xsl:template name="menu-item">
  <xsl:param name="href"/>
  <xsl:param name="text"/>
  <xsl:param name="last"/>

  <li>
    <xsl:if test="$last"><xsl:attribute name="class">last</xsl:attribute></xsl:if>
    <a href="{$href}.html"><xsl:if test="$href=$htmlFile"><xsl:attribute name="class">current</xsl:attribute></xsl:if><xsl:value-of select="$text"/></a>
  </li>
</xsl:template>

<!-- ======================================== -->
<xsl:template name="search">

  <div class="label">Search/Lookup:</div>

  <!-- Google Search -->
  <xsl:if test="true()">
    <xsl:call-template name="google-search"/>
  </xsl:if>

  <!-- Yahoo Search -->
  <xsl:if test="true()">
    <xsl:call-template name="yahoo-search"/>
  </xsl:if>

  <!-- M-W Dictionary -->
  <xsl:if test="false()">
    <xsl:call-template name="dictionary"/>
  </xsl:if>

  <!-- M-W Collegiate Dictionary -->
  <xsl:if test="true()">
    <xsl:call-template name="collegiate"/>
  </xsl:if>

  <!-- HTML Validator -->
  <xsl:if test="true()">
    <xsl:call-template name="validator"/>
  </xsl:if>

</xsl:template>

<!-- ======================================== -->
<xsl:template name="google-search">
  <form method="get" action="http://www.google.com/search">
  <div><input type="text" tabindex="1" name="q" id="google-search" onfocus="select()" class="first"/></div>
  <div><label for="google-search"><a href="javascript:search(0,'www.google.com')">Google</a></label></div>
  </form>
</xsl:template>

<!-- ======================================== -->
<xsl:template name="yahoo-search">
  <form method="get" action="http://search.yahoo.com/search">
  <div><input type="text" tabindex="2" name="p" id="yahoo-search" onfocus="select()"/></div>
  <div><label for="yahoo-search"><a href="javascript:search(1,'search.yahoo.com')">Yahoo!<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>Search</a></label></div>
  <div><input type="hidden" name="fr" value="yscpb"/></div>
  </form>
</xsl:template>

<!-- ======================================== -->
<xsl:template name="dictionary">
  <form method="get" action="http://www.m-w.com/cgi-bin/dictionary">
  <div><input type="text" tabindex="3" name="va" id="dictionary" onfocus="select()"/></div>
  <div><label for="dictionary"><a href="javascript:search(2,'www.m-w.com')">Merriam-Webster</a></label></div>
  <div><input type="hidden" name="book" value="Dictionary"/></div>
  </form>
</xsl:template>

<!-- ======================================== -->
<xsl:template name="collegiate">
  <form method="get" action="http://www.merriam-webstercollegiate.com/cgi-bin/collegiate">
  <div><input type="text" tabindex="3" name="va" id="collegiate" onfocus="select()"/></div>
  <div><label for="collegiate"><a href="javascript:search(2,'www.merriam-webstercollegiate.com')">Merriam-Webster</a></label></div>
  </form>
</xsl:template>

<!-- ======================================== -->
<xsl:template name="validator">
  <div class="validator">
  <a tabindex="4" href="http://validator.w3.org/check/referer"><img src="{$imagePath}/valid-xhtml10.png" alt="Valid XHTML 1.0!" width="88" height="31"/></a>
  </div>
</xsl:template>

</xsl:stylesheet>
