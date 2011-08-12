<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="xsl/displayPresentation.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:template match="/">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="data">
        <xsl:for-each select="*"><xsl:copy-of select="."/></xsl:for-each>
    </xsl:template>
</xsl:stylesheet>