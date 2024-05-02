<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
      xmlns="clr-namespace:Microsoft.Build.Framework.XamlTypes;assembly=Microsoft.Build.Framework"
      xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
      xmlns:sys="clr-namespace:System;assembly=mscorlib"
      xmlns:transformCallback="Microsoft.Cpp.Dev10.ConvertPropertyCallback"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
      version="1.0">
  <xsl:output method="xml" indent="yes" encoding="utf-8"/>

  <xsl:template match="/">
    <xsl:apply-templates select="//*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'visualstudiotoolfile']"/>
  </xsl:template>

  <xsl:template match="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'visualstudiotoolfile']">
    <xsl:apply-templates select="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'rules']"/>
  </xsl:template>

  <xsl:template match="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'rules']">
    <ProjectSchemaDefinitions>
      <xsl:apply-templates select="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'custombuildrule']"/>
    </ProjectSchemaDefinitions>
  </xsl:template>

  <xsl:template match="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'custombuildrule']">
    <xsl:variable name="cbrname" select="translate(@name|@Name, '(){}[]- /\+#', '__________XX')"/>
    <Rule
        Name="{$cbrname}"
        PageTemplate="tool"
        DisplayName="{@DisplayName|@displayname}"
        Order="200">
      <Rule.DataSource>
        <DataSource Persistence="ProjectFile" ItemType="{$cbrname}" />
      </Rule.DataSource>
      <Rule.Categories>
	    <Category Name="General">
          <Category.DisplayName>
            <sys:String>General</sys:String>
          </Category.DisplayName>
        </Category>
        <Category Name="Command Line" Subtype="CommandLine">
          <Category.DisplayName>
            <sys:String>Command Line</sys:String>
          </Category.DisplayName>
        </Category>
       </Rule.Categories>
      <StringListProperty Name="Inputs" Category="Command Line" IsRequired="true">
        <xsl:choose>
          <xsl:when test="@BatchingSeparator|@batchingseparator">
            <xsl:attribute name="Switch">
              <xsl:value-of select="@BatchingSeparator|@batchingseparator"/>
            </xsl:attribute>
          </xsl:when>
          <xsl:otherwise>
            <xsl:attribute name="Switch"><xsl:text> </xsl:text></xsl:attribute>
          </xsl:otherwise>
        </xsl:choose>
        <StringListProperty.DataSource>
          <DataSource Persistence="ProjectFile" ItemType="{$cbrname}" SourceType="Item"/>
        </StringListProperty.DataSource>
      </StringListProperty>
      <xsl:apply-templates select="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'properties']">
        <xsl:with-param name="CustomBuildRuleName" select="$cbrname" />
      </xsl:apply-templates>
      <StringProperty
       Name="CommandLineTemplate"
       DisplayName="Command Line" Visible="False" IncludeInCommandLine="False"/>
      <DynamicEnumProperty Name="{$cbrname}BeforeTargets" Category="General" EnumProvider="Targets" IncludeInCommandLine="False">
        <DynamicEnumProperty.DisplayName>
          <sys:String>Execute Before</sys:String>
        </DynamicEnumProperty.DisplayName>
        <DynamicEnumProperty.Description>
          <sys:String>Specifies the targets for the build customization to run before.</sys:String>
        </DynamicEnumProperty.Description>
        <DynamicEnumProperty.ProviderSettings>
          <NameValuePair Name="Exclude" Value="^{$cbrname}BeforeTargets|^Compute" />
        </DynamicEnumProperty.ProviderSettings>
        <DynamicEnumProperty.DataSource>
          <DataSource Persistence="ProjectFile" HasConfigurationCondition="true">
          </DataSource>
        </DynamicEnumProperty.DataSource>
      </DynamicEnumProperty>
      <DynamicEnumProperty Name="{$cbrname}AfterTargets" Category="General" EnumProvider="Targets" IncludeInCommandLine="False">
        <DynamicEnumProperty.DisplayName>
          <sys:String>Execute After</sys:String>
        </DynamicEnumProperty.DisplayName>
        <DynamicEnumProperty.Description>
          <sys:String>Specifies the targets for the build customization to run after.</sys:String>
        </DynamicEnumProperty.Description>
        <DynamicEnumProperty.ProviderSettings>
          <NameValuePair Name="Exclude" Value="^{$cbrname}AfterTargets|^Compute" />
        </DynamicEnumProperty.ProviderSettings>
        <DynamicEnumProperty.DataSource>
          <DataSource Persistence="ProjectFile" ItemType="" HasConfigurationCondition="true">
          </DataSource>
        </DynamicEnumProperty.DataSource>
      </DynamicEnumProperty>
      <StringListProperty
        Name="Outputs"
        DisplayName="Outputs" Visible="False" IncludeInCommandLine="False"/>
      <StringProperty
        Name="ExecutionDescription"
        DisplayName="Execution Description" Visible="False" IncludeInCommandLine="False"/>
      <StringListProperty
        Name="AdditionalDependencies"
        DisplayName="Additional Dependencies" IncludeInCommandLine="False">
        <xsl:choose>
          <xsl:when test="@ShowOnlyRuleProperties|@showonlyruleproperties = 'false'">
            <xsl:attribute name="Visible">true</xsl:attribute>
          </xsl:when>
          <xsl:otherwise>
            <xsl:attribute name="Visible">false</xsl:attribute>
          </xsl:otherwise>
        </xsl:choose>
      </StringListProperty>
      <StringProperty Subtype="AdditionalOptions" Name="AdditionalOptions" Category="Command Line">
        <StringProperty.DisplayName>
          <sys:String>Additional Options</sys:String>
        </StringProperty.DisplayName>
        <StringProperty.Description>
          <sys:String>Additional Options</sys:String>
        </StringProperty.Description>
      </StringProperty>
    </Rule>
    <ItemType Name="{$cbrname}" DisplayName="{@DisplayName|@displayname}"/>
    <FileExtension Name="{@FileExtensions|@fileextensions}" ContentType="{$cbrname}" />
    <ContentType Name="{$cbrname}" DisplayName="{@DisplayName|@displayname}" ItemType="{$cbrname}" />
  </xsl:template>

  <xsl:template match="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'properties']">
    <xsl:param name="CustomBuildRuleName" />
      <xsl:apply-templates select="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'booleanproperty']">
        <xsl:with-param name="CustomBuildRuleName" select="$CustomBuildRuleName" />
      </xsl:apply-templates>
      <xsl:apply-templates select="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'stringproperty']">
        <xsl:with-param name="CustomBuildRuleName" select="$CustomBuildRuleName" />
      </xsl:apply-templates>
      <xsl:apply-templates select="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'enumproperty']">
        <xsl:with-param name="CustomBuildRuleName" select="$CustomBuildRuleName" />
      </xsl:apply-templates>
      <xsl:apply-templates select="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'integerproperty']">
        <xsl:with-param name="CustomBuildRuleName" select="$CustomBuildRuleName" />
      </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'booleanproperty']">
    <xsl:param name="CustomBuildRuleName" />
    <BoolProperty>
      <xsl:if test="@name|@Name">
        <xsl:attribute name="Name">
          <xsl:value-of select="@name|@Name"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="@IsReadOnly|@isreadonly">
        <xsl:attribute name="ReadOnly">
          <xsl:value-of select="@IsReadOnly|@isreadonly"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="@PropertyPageName|@propertypagename">
        <xsl:attribute name="Category">
          <xsl:value-of select="@PropertyPageName|@propertypagename"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="@category|@Category">
        <xsl:attribute name="Subcategory">
          <xsl:value-of select="@category|@Category"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:choose>
        <xsl:when test="@helpcontext|@HelpContext">
          <xsl:attribute name="HelpContext">
            <xsl:value-of select="@helpcontext|@HelpContext"/>
          </xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="HelpContext">0</xsl:attribute>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:if test="@helpfile|@HelpFile">
        <xsl:attribute name="HelpFile">
          <xsl:value-of select="@helpfile|@HelpFile"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="@helpurl|@HelpURL">
        <xsl:attribute name="HelpUrl">
          <xsl:value-of select="@helpurl|@HelpURL"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="@DisplayName|@displayname">
        <xsl:attribute name="DisplayName">
          <xsl:value-of select="@DisplayName|@displayname"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="@Description|@description">
        <xsl:attribute name="Description">
          <xsl:value-of select="@Description|@description"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="@switch|@Switch">
        <xsl:attribute name="Switch">
          <xsl:value-of select="@switch|@Switch"/>
        </xsl:attribute>
      </xsl:if>
    </BoolProperty>
  </xsl:template>

  <xsl:template match="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'integerproperty']">
    <xsl:param name="CustomBuildRuleName" />
    <IntProperty>
      <xsl:if test="@name|@Name">
        <xsl:attribute name="Name">
          <xsl:value-of select="@name|@Name"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="@IsReadOnly|@isreadonly">
        <xsl:attribute name="ReadOnly">
          <xsl:value-of select="@IsReadOnly|@isreadonly"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="@PropertyPageName|@propertypagename">
        <xsl:attribute name="Category">
          <xsl:value-of select="@PropertyPageName|@propertypagename"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="@category|@Category">
        <xsl:attribute name="Subcategory">
          <xsl:value-of select="@category|@Category"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:choose>
        <xsl:when test="@helpcontext|@HelpContext">
          <xsl:attribute name="HelpContext">
            <xsl:value-of select="@helpcontext|@HelpContext"/>
          </xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="HelpContext">0</xsl:attribute>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:if test="@helpfile|@HelpFile">
        <xsl:attribute name="HelpFile">
          <xsl:value-of select="@helpfile|@HelpFile"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="@helpurl|@HelpURL">
        <xsl:attribute name="HelpUrl">
          <xsl:value-of select="@helpurl|@HelpURL"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="@DisplayName|@displayname">
        <xsl:attribute name="DisplayName">
          <xsl:value-of select="@DisplayName|@displayname"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="@Description|@description">
        <xsl:attribute name="Description">
          <xsl:value-of select="@Description|@description"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="@switch|@Switch">
        <xsl:attribute name="Switch">
          <xsl:value-of select="@switch|@Switch"/>
        </xsl:attribute>
      </xsl:if>
    </IntProperty>
  </xsl:template>

  <xsl:template name="stringproperty" match="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'stringproperty']">
    <xsl:param name="CustomBuildRuleName" />
    <xsl:choose>
      <xsl:when test="@Delimited|@delimited = 'true'">
        <StringListProperty>
          <xsl:if test="@name|@Name">
            <xsl:attribute name="Name">
              <xsl:value-of select="@name|@Name"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="@IsReadOnly|@isreadonly">
            <xsl:attribute name="ReadOnly">
              <xsl:value-of select="@IsReadOnly|@isreadonly"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="@PropertyPageName|@propertypagename">
            <xsl:attribute name="Category">
              <xsl:value-of select="@PropertyPageName|@propertypagename"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="@category|@Category">
            <xsl:attribute name="Subcategory">
              <xsl:value-of select="@category|@Category"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:choose>
           <xsl:when test="@helpcontext|@HelpContext">
            <xsl:attribute name="HelpContext">
              <xsl:value-of select="@helpcontext|@HelpContext"/>
            </xsl:attribute>
           </xsl:when>
           <xsl:otherwise>
            <xsl:attribute name="HelpContext">0</xsl:attribute>
           </xsl:otherwise>
          </xsl:choose>
          <xsl:if test="@helpfile|@HelpFile">
            <xsl:attribute name="HelpFile">
              <xsl:value-of select="@helpfile|@HelpFile"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="@helpurl|@HelpURL">
            <xsl:attribute name="HelpUrl">
              <xsl:value-of select="@helpurl|@HelpURL"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="@DisplayName|@displayname">
            <xsl:attribute name="DisplayName">
              <xsl:value-of select="@DisplayName|@displayname"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="@Description|@description">
            <xsl:attribute name="Description">
              <xsl:value-of select="@Description|@description"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:choose>
           <xsl:when test="@Delimiters|@delimiters">
            <xsl:attribute name="Separator">
              <xsl:value-of select="@Delimiters|@delimiters"/>
            </xsl:attribute>
           </xsl:when>
           <xsl:otherwise>
            <xsl:attribute name="Separator">;</xsl:attribute>
           </xsl:otherwise>
          </xsl:choose>
          <xsl:if test="transformCallback:CheckPropertyConvertValidity($CustomBuildRuleName, 'stringproperty', @name|@Name, '', 'inheritable', @Inheritable|@inheritable)" />
          <xsl:if test="@switch|@Switch">
            <xsl:attribute name="Switch">
              <xsl:value-of select="@switch|@Switch"/>
            </xsl:attribute>
          </xsl:if>
        </StringListProperty>
      </xsl:when>
      <xsl:otherwise>
        <StringProperty>
          <xsl:if test="@name|@Name">
            <xsl:attribute name="Name">
              <xsl:value-of select="@name|@Name"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="@IsReadOnly|@isreadonly">
            <xsl:attribute name="ReadOnly">
              <xsl:value-of select="@IsReadOnly|@isreadonly"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="@PropertyPageName|@propertypagename">
            <xsl:attribute name="Category">
              <xsl:value-of select="@PropertyPageName|@propertypagename"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="@category|@Category">
            <xsl:attribute name="Subcategory">
              <xsl:value-of select="@category|@Category"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:choose>
           <xsl:when test="@helpcontext|@HelpContext">
            <xsl:attribute name="HelpContext">
              <xsl:value-of select="@helpcontext|@HelpContext"/>
            </xsl:attribute>
           </xsl:when>
           <xsl:otherwise>
            <xsl:attribute name="HelpContext">0</xsl:attribute>
           </xsl:otherwise>
          </xsl:choose>
          <xsl:if test="@helpfile|@HelpFile">
            <xsl:attribute name="HelpFile">
              <xsl:value-of select="@helpfile|@HelpFile"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="@helpurl|@HelpURL">
            <xsl:attribute name="HelpUrl">
              <xsl:value-of select="@helpurl|@HelpURL"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="@DisplayName|@displayname">
            <xsl:attribute name="DisplayName">
              <xsl:value-of select="@DisplayName|@displayname"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="@Description|@description">
            <xsl:attribute name="Description">
              <xsl:value-of select="@Description|@description"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="@switch|@Switch">
            <xsl:attribute name="Switch">
              <xsl:value-of select="@switch|@Switch"/>
            </xsl:attribute>
          </xsl:if>
        </StringProperty>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'enumproperty']">
    <xsl:param name="CustomBuildRuleName" />
    <EnumProperty>
      <xsl:if test="@name|@Name">
        <xsl:attribute name="Name">
          <xsl:value-of select="@name|@Name"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="@IsReadOnly|@isreadonly">
        <xsl:attribute name="ReadOnly">
          <xsl:value-of select="@IsReadOnly|@isreadonly"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="@PropertyPageName|@propertypagename">
        <xsl:attribute name="Category">
          <xsl:value-of select="@PropertyPageName|@propertypagename"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="@category|@Category">
        <xsl:attribute name="Subcategory">
          <xsl:value-of select="@category|@Category"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:choose>
        <xsl:when test="@helpcontext|@HelpContext">
          <xsl:attribute name="HelpContext">
            <xsl:value-of select="@helpcontext|@HelpContext"/>
          </xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="HelpContext">0</xsl:attribute>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:if test="@helpfile|@HelpFile">
        <xsl:attribute name="HelpFile">
          <xsl:value-of select="@helpfile|@HelpFile"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="@helpurl|@HelpURL">
        <xsl:attribute name="HelpUrl">
          <xsl:value-of select="@helpurl|@HelpURL"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="@DisplayName|@displayname">
        <xsl:attribute name="DisplayName">
          <xsl:value-of select="@DisplayName|@displayname"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="@Description|@description">
        <xsl:attribute name="Description">
          <xsl:value-of select="@Description|@description"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates select="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'values']">
        <xsl:with-param name="CustomBuildRuleName" select="$CustomBuildRuleName" />
      </xsl:apply-templates>
    </EnumProperty>
  </xsl:template>

  <xsl:template match="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'values']">
    <xsl:param name="CustomBuildRuleName" />
    <xsl:apply-templates select="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'enumvalue']">
        <xsl:with-param name="CustomBuildRuleName" select="$CustomBuildRuleName" />
      </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'enumvalue']">
    <xsl:param name="CustomBuildRuleName" />
    <EnumValue>
      <xsl:if test="@value|@Value">
        <xsl:attribute name="Name">
          <xsl:value-of select="@value|@Value"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="@DisplayName|@displayname">
        <xsl:attribute name="DisplayName">
          <xsl:value-of select="@DisplayName|@displayname"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="@switch|@Switch">
        <xsl:attribute name="Switch">
          <xsl:value-of select="@switch|@Switch"/>
        </xsl:attribute>
      </xsl:if>
    </EnumValue>
  </xsl:template>
</xsl:stylesheet>
