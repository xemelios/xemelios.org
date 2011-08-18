<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="*">
        <xsl:copy>
            <xsl:for-each select="@*"><xsl:copy-of select="."/></xsl:for-each>
            <xsl:for-each select="child::node()"><xsl:copy-of select="."/></xsl:for-each>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="a">
        <xsl:copy>
            <xsl:for-each select="@*"><xsl:copy-of select="."/></xsl:for-each>
            <xsl:attribute name="target">_blank</xsl:attribute>
            <xsl:for-each select="child::node()"><xsl:copy-of select="."/></xsl:for-each>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>