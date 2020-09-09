<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="html" encoding="utf-8"/>

  <xsl:template match="/">

    Trüki välja auto registrinumber:
    <br />
    <ul>
      <xsl:for-each select="autod/auto/reg">
        <li>
          <xsl:value-of select="."/>
        </li>
        <xsl:text></xsl:text>
      </xsl:for-each>
    </ul>
    <br />
    Trüki välja auto registrinumbri numbrite osa:
    <br />
    <ul>
      <xsl:for-each select="/autod/auto">
        <li>
          <xsl:value-of select="substring(reg, 0 , 4)"/>
        </li>
        <xsl:text></xsl:text>
      </xsl:for-each>
    </ul>
    <br />
    Trüki välja auto registrinumbri tähtede osa:
    <br />
    <ul>
      <xsl:for-each select="/autod/auto">
        <li>
          <xsl:value-of select="substring(reg, 4 , 6)"/>
        </li>
        <xsl:text></xsl:text>
      </xsl:for-each>
    </ul>
    <br />
    Trüki välja inimese perekonnanime esimene täht:
    <br />
    <ul>
      <xsl:for-each select="/autod/auto">
        <li>
          <xsl:value-of select="substring(perenimi, 1 , 1)"/>
        </li>
        <xsl:text></xsl:text>
      </xsl:for-each>
    </ul>
    <br />
    Trüki välja inimese perekonnanime viimane täht:
    <br />
    <ul>
      <xsl:for-each select="/autod/auto">
        <li>
          <xsl:value-of select="substring( perenimi, string-length(perenimi) )"/>
        </li>
        <xsl:text></xsl:text>
      </xsl:for-each>
    </ul>
    <br />
    Leia, mitme inimese perekonnanimi on Gorodnitsev:
    <br />
      <xsl:value-of select="count(/autod/auto[perenimi='Gorodnitsev'])"/>
    <br />
    <br />
    Leia, mitme inimese perekonnanimi algab M-tähega:
    <br />
      <xsl:value-of select="count(/autod/auto[substring( perenimi, 1,1)='M'])"/>
    <br />
    <br />
    Leia, mitme auto registrimärgi numbritest viimane on 2:
    <br />
    <xsl:value-of select="count(/autod/auto[substring(reg,3,1)='2'])"/>
    <br />
    <br />
    Leia, mitme auto registrimärgi numbritest viimane on 1 või 2:
    <br />
    <xsl:value-of select="count(/autod/auto[substring(reg,3,1)='1' or substring(reg,3,1)='2'])"/>
    <br />
    <br />
    Kui registrimärgi viimane number on 5, siis teata, et ülevaatuse kuu on juuli:
    <br />
    <ul>
      <xsl:for-each select="/autod/auto">
        <li>
          <br />
          <xsl:value-of select="substring( reg, 1,1 )='5'"/>
        </li>
        <xsl:text>техосмотр в июле</xsl:text>
      </xsl:for-each>
    </ul>
    <br />
    <br />
    Teata iga registrinumbri puhul, millises kuus auto ülevaatusele peab minema:
    <br />
    <xsl:value-of select="count(/autod/auto[substring(reg,3,1)='1' or substring(reg,3,1)='2'])"/>
    <br />
    <br />
    Kui perekonnanimes sisaldub täht x, siis teata, et tegemist on võõrnimega:
    <br />
    <ul>
      <xsl:for-each select="/autod/auto/surname">
        <li>
          <xsl:value-of select="."/>
          <xsl:if test="contains(., 'X')">
            <b style ="color: goldenrod;">
              <xsl:value-of select="' - võõrnimi'"/>
            </b>
          </xsl:if>
        </li>
        <xsl:text></xsl:text>
      </xsl:for-each>
    </ul>
    <br />
    <br />
    Выводить в xml файл количество авто, где в рег номере последняя цифра 5 или 0:
    <br />
    <xsl:value-of select="count(/autod/auto[substring(reg,3,1)='5' or substring(reg,3,1)='0'])"/>
    <br />
    <br />
    Добавить марки машин и выводить их  количество по первой букве F!
    <br />
    <xsl:value-of select="count(/autod/auto[substring(mark, 1, 1)='F'])"/>
    <br />
    <br />
    Добавить марки машин и выводить их  количество по первой букве F!
    <br />
    
    
  </xsl:template>
</xsl:stylesheet>
