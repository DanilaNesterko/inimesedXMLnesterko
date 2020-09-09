<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" encoding="utf-8"/>

  <xsl:template match="/">
    Esimene:
    <xsl:value-of select="/inimesed/inimene[1]/eesnimi"/> <!--первый человек-->

    <br /> Viimane:
    <xsl:value-of select="/inimesed/inimene[last()]/eesnimi"/> <!--последний человек-->
    <br /> Esitäht:
    <xsl:value-of select="substring(/inimesed/inimene[last()]/eesnimi, 1, 1)"/>
    <br /> Eesnimi, Perekonnanimi:
    <xsl:value-of select="concat(/inimesed/inimene[last()]/eesnimi, ', ' , /inimesed/inimene[last()]/perenimi)"/>
    <br /> Teksti pikkus
    <xsl:value-of select="string-length(/inimesed/inimene[1]/eesnimi)"/>
    <br /> Loendamine, näiteks Inimeste arv
    <xsl:value-of select="count(/inimesed/inimene)"/>
    <br /> Alexandri arv
    <xsl:value-of select="count(/inimesed/inimene[eesnimi='Alexandr'])"/>
    <br /> Sündinud 2000 aasta arv
    <xsl:value-of select="count(/inimesed/inimene[synd &gt; 2000])"/>
    <br />
    Kordused:
    <br />
    <ul>
    <xsl:for-each select="inimesed/inimene">
      <li>
        <xsl:value-of select="perenimi"/>
      </li>
      <xsl:text></xsl:text>
    </xsl:for-each>
    </ul>
    <br />
    Kordused variant2:
    <br />
    <ul>
      <xsl:for-each select="inimesed/inimene">
        <li>
          <xsl:value-of select="."/>
        </li>
        <xsl:text></xsl:text>
      </xsl:for-each>
    </ul>

  </xsl:template>
</xsl:stylesheet>
