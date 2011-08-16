<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/data">
        <xsl:apply-templates select="*"/>
    </xsl:template>
    
    <xsl:template match="h1">
        <xsl:copy>
            <xsl:for-each select="@*"><xsl:copy-of select="."/></xsl:for-each>
            <xsl:for-each select="child::node()"><xsl:copy-of select="."/></xsl:for-each>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="h2">
        <xsl:copy>
            <xsl:for-each select="@*"><xsl:copy-of select="."/></xsl:for-each>
            <xsl:for-each select="child::node()"><xsl:copy-of select="."/></xsl:for-each>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="h3">
        <xsl:copy>
            <xsl:for-each select="@*"><xsl:copy-of select="."/></xsl:for-each>
            <xsl:for-each select="child::node()"><xsl:copy-of select="."/></xsl:for-each>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="p">
        <xsl:copy>
            <xsl:for-each select="@*"><xsl:copy-of select="."/></xsl:for-each>
            <xsl:for-each select="child::node()"><xsl:copy-of select="."/></xsl:for-each>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="h2[1]">
        <xsl:copy>
            <xsl:for-each select="@*"><xsl:copy-of select="."/></xsl:for-each>
            <xsl:attribute name="class">first</xsl:attribute>
            <xsl:for-each select="child::node()"><xsl:copy-of select="."/></xsl:for-each>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ul">
        <xsl:copy>
            <xsl:for-each select="@*"><xsl:copy-of select="."/></xsl:for-each>
            <xsl:for-each select="child::node()"><xsl:copy-of select="."/></xsl:for-each>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ul[1]">
        <xsl:copy>
            <xsl:for-each select="@*"><xsl:copy-of select="."/></xsl:for-each>
            <xsl:attribute name="id">actualite</xsl:attribute>
            <xsl:for-each select="child::node()"><xsl:copy-of select="."/></xsl:for-each>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="li[1]">
        <xsl:copy>
            <xsl:for-each select="@*"><xsl:copy-of select="."/></xsl:for-each>
            <xsl:attribute name="class">first open</xsl:attribute>
            <xsl:for-each select="child::node()"><xsl:copy-of select="."/></xsl:for-each>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="li">
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

    <xsl:template match="br"><xsl:copy-of select="."/></xsl:template>
</xsl:stylesheet>