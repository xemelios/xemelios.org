<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template match="/">
        <ul class="first">
            <xsl:apply-templates />
        </ul>
    </xsl:template>
    
    <xsl:template match="/menu/menu-entry">
        <li class="empty"><a href="#" onClick="{@onClick}"><xsl:copy-of select="child::node()"/></a></li>
    </xsl:template>
    
    <xsl:template match="sub-menu">
        <xsl:variable name="idMenu" select="generate-id()"/>
        <li class="sub-menu" style="padding-bottom: 0; padding-bottom: 12px;">
            <xsl:element name="a">
                <xsl:attribute name="href">javascript:hideShowMenu('<xsl:value-of select="$idMenu"/>');</xsl:attribute>
                <xsl:if test="@onClick"><xsl:attribute name="onClick"><xsl:value-of select="@onClick"/></xsl:attribute></xsl:if>
                <xsl:value-of select="./@title"/>
            </xsl:element>
<!--a href="javascript:hideShowMenu('{$idMenu}');"><xsl:value-of select="./@title"/></a-->
<ul class="inner" id="{$idMenu}" style="display: none;"><xsl:apply-templates/></ul>
</li>
    </xsl:template>

    <xsl:template match="menu-entry">
        <li>
            <xsl:element name="a">
                <xsl:attribute name="class">nav</xsl:attribute>
                <xsl:choose>
                    <xsl:when test="@onClick and @href">
                        <xsl:attribute name="onClick"><xsl:value-of select="@onClick"/></xsl:attribute>
                        <xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>
                    </xsl:when>
                    <xsl:when test="@onClick and not(@href)">
                        <xsl:attribute name="onClick"><xsl:value-of select="@onClick"/></xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>
                        <xsl:if test="not(@href='#')"><xsl:attribute name="target">_blank</xsl:attribute></xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:value-of select="text()"/>
            </xsl:element>
        </li>
    </xsl:template>
</xsl:stylesheet>
