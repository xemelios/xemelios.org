<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/data">
        <xsl:for-each select="child::node()">
            <xsl:for-each select="@*"><xsl:copy-of select="."/></xsl:for-each>
            <xsl:copy-of select="."/>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>