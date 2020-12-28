<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template name="popup">
function popup (size, URL) {
   var props;
   var width, height;
   if (size == 'sm') {
      props = "width=700,height=600,resizable=yes,scrollbars=yes";
      width = 700; height = 630;
   }
   if (size == 'lg') {
      props = "width=700,height=720,resizable=yes,scrollbars=yes";
      width = 700; height = 750;
   }
   var win = window.open (URL, "pw", props);
   win.focus();
   win.resizeTo (width, height);
}
</xsl:template>

<xsl:template name="newWindow">
function newWindow (URL) {
   var props = "menubar=yes,toolbar=yes,location=yes,resizable=yes,scrollbars=yes,status=yes";
   var win = window.open (URL, "nw", props);
   win.focus();
}
</xsl:template>

</xsl:stylesheet>
