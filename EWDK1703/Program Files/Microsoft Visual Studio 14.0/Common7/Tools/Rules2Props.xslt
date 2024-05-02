<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
      xmlns="http://schemas.microsoft.com/developer/msbuild/2003"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:transformCallback="Microsoft.Cpp.Dev10.ConvertPropertyCallback"
      xmlns:msxsl="urn:schemas-microsoft-com:xslt"
      exclude-result-prefixes="msxsl transformCallback"
      version="1.0">
  <xsl:output method="xml" indent="yes" encoding="utf-8"/>

  <xsl:template match="/">
    <xsl:apply-templates select="//*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'visualstudiotoolfile']"/>
  </xsl:template>

  <xsl:template match="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'visualstudiotoolfile']">
    <xsl:apply-templates select="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'rules']"/>
  </xsl:template>

  <xsl:template match="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'rules']">
    <Project>
      <xsl:apply-templates select="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'custombuildrule']"/>
    </Project>
  </xsl:template>

  <xsl:template match="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'custombuildrule']">
    <xsl:variable name="cbrname" select="translate(@name|@Name, '(){}[]- /\+#', '__________XX')"/>
    <PropertyGroup>
      <xsl:attribute name="Condition">'$(<xsl:value-of select="$cbrname"/>BeforeTargets)' == '' and '$(<xsl:value-of select="$cbrname"/>AfterTargets)' == '' and '$(ConfigurationType)' != 'Makefile'</xsl:attribute>
      <xsl:element name="{$cbrname}BeforeTargets">Midl</xsl:element>
      <xsl:element name="{$cbrname}AfterTargets">CustomBuild</xsl:element>
    </PropertyGroup>

    <PropertyGroup>
      <xsl:element name="{$cbrname}DependsOn"><xsl:attribute name="Condition">'$(ConfigurationType)' != 'Makefile'</xsl:attribute>_SelectedFiles;$(<xsl:value-of select="$cbrname"/>DependsOn)</xsl:element>
    </PropertyGroup>
    
    <ItemDefinitionGroup>
      <xsl:element name="{$cbrname}">
          <xsl:apply-templates select="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'properties']">
            <xsl:with-param name="CustomBuildRuleName" select="$cbrname" />
          </xsl:apply-templates>
        <xsl:if test="@commandline|@CommandLine">
          <CommandLineTemplate><xsl:value-of select="transformCallback:Transform('CommandLine', @commandline|@CommandLine, 'CustomBuildRuleName')"/></CommandLineTemplate>
        </xsl:if>
        <xsl:if test="@outputs|@Outputs">
          <Outputs><xsl:value-of select="transformCallback:Transform('Outputs', @outputs|@Outputs, 'CustomBuildRuleName')"/></Outputs>
        </xsl:if>
        <xsl:if test="@ExecutionDescription|@executiondescription">
          <ExecutionDescription><xsl:value-of select="transformCallback:Transform('ExecutionDescription', @ExecutionDescription|@executiondescription, 'CustomBuildRuleName')"/></ExecutionDescription>
        </xsl:if>
        <xsl:if test="@ShowOnlyRuleProperties|@showonlyruleproperties">
          <ShowOnlyRuleProperties>
            <xsl:value-of select="transformCallback:Transform('ShowOnlyRuleProperties', @ShowOnlyRuleProperties|@showonlyruleproperties, 'CustomBuildRuleName')"/>
          </ShowOnlyRuleProperties>
        </xsl:if>
        <xsl:if test="@AdditionalDependencies|@additionaldependencies">
          <AdditionalDependencies>
            <xsl:value-of select="transformCallback:Transform('AdditionalDependencies', @AdditionalDependencies|@additionaldependencies, 'CustomBuildRuleName')"/>
          </AdditionalDependencies>
        </xsl:if>
      </xsl:element>
    </ItemDefinitionGroup>
  </xsl:template>

  <xsl:template match="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'properties']">
    <xsl:param name="CustomBuildRuleName" />
      <xsl:apply-templates select="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'booleanproperty']">
        <xsl:with-param name="CustomBuildRuleName" select="$CustomBuildRuleName" />
      </xsl:apply-templates>
      <xsl:apply-templates select="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'stringproperty']">
        <xsl:with-param name="CustomBuildRuleName" select="$CustomBuildRuleName" />
      </xsl:apply-templates>
      <xsl:apply-templates select="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'integerproperty']">
        <xsl:with-param name="CustomBuildRuleName" select="$CustomBuildRuleName" />
      </xsl:apply-templates>
      <xsl:apply-templates select="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'enumproperty']">
        <xsl:with-param name="CustomBuildRuleName" select="$CustomBuildRuleName" />
      </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'booleanproperty']">
    <xsl:param name="CustomBuildRuleName" />
    <xsl:variable name="boolname" select="translate(@name|@Name, ' ', '_')"/>
    <xsl:choose>
      <xsl:when test="@DefaultValue|@defaultvalue">
        <xsl:element name="{$boolname}"><xsl:value-of select="transformCallback:Transform(@name|@Name, @DefaultValue|@defaultvalue, 'CustomBuildRuleName')"/></xsl:element>
      </xsl:when>
      <xsl:otherwise>
        <xsl:element name="{$boolname}">False</xsl:element>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'integerproperty']">
    <xsl:param name="CustomBuildRuleName" />
    <xsl:variable name="intname" select="translate(@name|@Name, ' ', '_')"/>
    <xsl:choose>
      <xsl:when test="@DefaultValue|@defaultvalue">
        <xsl:element name="{$intname}"><xsl:value-of select="transformCallback:Transform(@name|@Name, @DefaultValue|@defaultvalue, 'CustomBuildRuleName')"/></xsl:element>
      </xsl:when>
      <xsl:otherwise>
        <xsl:element name="{$intname}">0</xsl:element>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="stringproperty" match="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'stringproperty']">
    <xsl:param name="CustomBuildRuleName" />
    <xsl:variable name="strname" select="translate(@name|@Name, ' ', '_')"/>
    <xsl:choose>
      <xsl:when test="@Delimited|@delimited = 'true'">
        <xsl:if test="@DefaultValue|@defaultvalue">
         <xsl:element name="{$strname}"><xsl:value-of select="transformCallback:Transform('StringListDefaultValue', @DefaultValue|@defaultvalue, 'CustomBuildRuleName')"/></xsl:element>
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:if test="@DefaultValue|@defaultvalue">
          <xsl:element name="{$strname}"><xsl:value-of select="transformCallback:Transform('StringDefaultValue', @DefaultValue|@defaultvalue, 'CustomBuildRuleName')"/></xsl:element>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'enumproperty']">
    <xsl:param name="CustomBuildRuleName" />
    <xsl:variable name="enumname" select="translate(@name|@Name, ' ', '_')"/>
    <xsl:choose>
      <xsl:when test="@DefaultValue|@defaultvalue">
        <xsl:element name="{$enumname}">
          <xsl:value-of select="transformCallback:Transform(@name|@Name, @DefaultValue|@defaultvalue, 'CustomBuildRuleName')"/>
        </xsl:element>
      </xsl:when>
      <xsl:otherwise>
        <xsl:element name="{$enumname}">0</xsl:element>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
