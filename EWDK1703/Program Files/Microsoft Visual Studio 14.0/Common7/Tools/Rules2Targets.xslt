<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
      xmlns="http://schemas.microsoft.com/developer/msbuild/2003"
      xmlns:transformCallback="Microsoft.Cpp.Dev10.ConvertPropertyCallback"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl transformCallback"
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
    <ItemGroup>
      <PropertyPageSchema>
        <xsl:attribute name="Include">$(MSBuildThisFileDirectory)$(MSBuildThisFileName).xml</xsl:attribute>
      </PropertyPageSchema>
      <xsl:for-each select="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'custombuildrule']">
        <xsl:variable name="cbrname" select="translate(@name|@Name, '(){}[]- /\+#', '__________XX')"/>
        <AvailableItemName>
          <xsl:attribute name="Include"><xsl:value-of select="$cbrname"/></xsl:attribute>
          <Targets>_<xsl:value-of select="$cbrname"/></Targets>
        </AvailableItemName>
      </xsl:for-each>
    </ItemGroup>

      <xsl:for-each select="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'custombuildrule']">
        <xsl:variable name="cbrname" select="translate(@name|@Name, '(){}[]- /\+#', '__________XX')"/>
        <UsingTask TaskName="{$cbrname}" TaskFactory="XamlTaskFactory" AssemblyName="Microsoft.Build.Tasks.v4.0, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a">
          <Task>$(MSBuildThisFileDirectory)$(MSBuildThisFileName).xml</Task>
        </UsingTask>
      </xsl:for-each>
      <xsl:for-each select="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'custombuildrule']">
        <xsl:variable name="cbrname" select="translate(@name|@Name, '(){}[]- /\+#', '__________XX')"/>
        <Target Name="_{$cbrname}" BeforeTargets="$({$cbrname}BeforeTargets)" AfterTargets="$({$cbrname}AfterTargets)" Condition="'@({$cbrname})' != ''" DependsOnTargets="$({$cbrname}DependsOn);Compute{$cbrname}Output">
          <xsl:attribute name="Outputs">
            <xsl:choose>
              <xsl:when test="translate(@SupportsFileBatching|@supportsfilebatching, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'true'">@(<xsl:value-of select="$cbrname"/>-&gt;'%(Outputs)')</xsl:when>
              <xsl:when test="transformCallback:IsFileBatchingEnforcedByOutputs(translate(@Outputs|@outputs, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')) = 'true'">@(<xsl:value-of select="$cbrname"/>-&gt;Metadata('Outputs')-&gt;Distinct())</xsl:when>
              <xsl:otherwise>%(<xsl:value-of select="$cbrname"/>.Outputs)</xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
          <xsl:attribute name="Inputs">
            <xsl:choose>
              <xsl:when test="translate(@SupportsFileBatching|@supportsfilebatching, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'true'">@(<xsl:value-of select="$cbrname"/>);%(<xsl:value-of select="$cbrname"/>.AdditionalDependencies);$(MSBuildProjectFile)</xsl:when>
              <xsl:when test="transformCallback:IsFileBatchingEnforcedByOutputs(translate(@Outputs|@outputs, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')) = 'true'">@(<xsl:value-of select="$cbrname"/>);%(<xsl:value-of select="$cbrname"/>.AdditionalDependencies);$(MSBuildProjectFile)</xsl:when>
              <xsl:otherwise>%(<xsl:value-of select="$cbrname"/>.Identity);%(<xsl:value-of select="$cbrname"/>.AdditionalDependencies);$(MSBuildProjectFile)</xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
          <ItemGroup Condition="'@(SelectedFiles)' != ''">
            <xsl:element name="{$cbrname}"> <xsl:attribute name="Remove">@(<xsl:value-of select="$cbrname"/>)</xsl:attribute><xsl:attribute name="Condition">'%(Identity)' != '@(SelectedFiles)'</xsl:attribute></xsl:element>
          </ItemGroup>
          <ItemGroup>
            <xsl:element name="{$cbrname}_tlog"><xsl:attribute name="Include">%(<xsl:value-of select="$cbrname"/>.Outputs)</xsl:attribute><xsl:attribute name="Condition">'%(<xsl:value-of select="$cbrname"/>.Outputs)' != '' and '%(<xsl:value-of select="$cbrname"/>.ExcludedFromBuild)' != 'true'</xsl:attribute>
              <Source>@(<xsl:value-of select="$cbrname"/>, '|')</Source>
            </xsl:element>
          </ItemGroup>
          <Message Importance="High" Text="%({$cbrname}.ExecutionDescription)"/>
          <WriteLinesToFile><xsl:attribute name="Condition">'@(<xsl:value-of select="$cbrname"/>_tlog)' != '' and '%(<xsl:value-of select="$cbrname"/>_tlog.ExcludedFromBuild)' != 'true'</xsl:attribute><xsl:attribute name="File">$(TLogLocation)$(ProjectName).write.1u.tlog</xsl:attribute>
           <xsl:attribute name="Lines">^%(<xsl:value-of select="$cbrname"/>_tlog.Source);@(<xsl:value-of select="$cbrname"/>_tlog-&gt;'%(Fullpath)')</xsl:attribute><xsl:attribute name="Encoding">Unicode</xsl:attribute></WriteLinesToFile>
          <xsl:element name="{$cbrname}">
            <xsl:attribute name="Condition">'@(<xsl:value-of select="$cbrname"/>)' != '' and '%(<xsl:value-of select="$cbrname"/>.ExcludedFromBuild)' != 'true'</xsl:attribute>
            <xsl:attribute name="CommandLineTemplate">%(<xsl:value-of select="$cbrname"/>.CommandLineTemplate)</xsl:attribute>
            <xsl:apply-templates select="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'properties']">
              <xsl:with-param name="CustomBuildRuleName" select="$cbrname" />
            </xsl:apply-templates>
             <xsl:attribute name="AdditionalOptions">%(<xsl:value-of select="$cbrname"/>.AdditionalOptions)</xsl:attribute>
            <xsl:attribute name="Inputs">
              <xsl:choose>
                <xsl:when test="translate(@SupportsFileBatching|@supportsfilebatching, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'true'">@(<xsl:value-of select="$cbrname"/>)</xsl:when>
                <xsl:when test="transformCallback:IsFileBatchingEnforcedByOutputs(translate(@Outputs|@outputs, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')) = 'true'">@(<xsl:value-of select="$cbrname"/>)</xsl:when>
                <xsl:otherwise>%(<xsl:value-of select="$cbrname"/>.Identity)</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
          </xsl:element>
        </Target>

        <PropertyGroup>
          <ComputeLinkInputsTargets>
            $(ComputeLinkInputsTargets);
            Compute<xsl:value-of select="$cbrname" />Output;
          </ComputeLinkInputsTargets>
          <ComputeLibInputsTargets>
            $(ComputeLibInputsTargets);
            Compute<xsl:value-of select="$cbrname" />Output;
          </ComputeLibInputsTargets>
        </PropertyGroup>

        <Target Name="Compute{$cbrname}Output" Condition="'@({$cbrname})' != ''">

          <ItemGroup >
            <xsl:element name="{$cbrname}DirsToMake">
              <xsl:attribute name="Condition">'@(<xsl:value-of select="$cbrname"/>)' != '' and '%(<xsl:value-of select="$cbrname"/>.ExcludedFromBuild)' != 'true'</xsl:attribute>
              <xsl:attribute name="Include">%(<xsl:value-of select="$cbrname"/>.Outputs)</xsl:attribute>
            </xsl:element>
            <Link Include="%({$cbrname}DirsToMake.Identity)" Condition="'%(Extension)'=='.obj' or '%(Extension)'=='.res' or '%(Extension)'=='.rsc' or '%(Extension)'=='.lib'"/>
            <Lib Include="%({$cbrname}DirsToMake.Identity)" Condition="'%(Extension)'=='.obj' or '%(Extension)'=='.res' or '%(Extension)'=='.rsc' or '%(Extension)'=='.lib'"/>
            <ImpLib Include="%({$cbrname}DirsToMake.Identity)" Condition="'%(Extension)'=='.obj' or '%(Extension)'=='.res' or '%(Extension)'=='.rsc' or '%(Extension)'=='.lib'"/>
          </ItemGroup>

          <MakeDir Directories="@({$cbrname}DirsToMake->'%(RootDir)%(Directory)')" />

        </Target>
      </xsl:for-each>
    </Project>
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
      <xsl:attribute name="{@name|@Name}">%(<xsl:value-of select="$CustomBuildRuleName"/>.<xsl:value-of select="@name|@Name"/>)</xsl:attribute>
  </xsl:template>

  <xsl:template match="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'stringproperty']">
    <xsl:param name="CustomBuildRuleName" />
    <xsl:attribute name="{@name|@Name}">%(<xsl:value-of select="$CustomBuildRuleName"/>.<xsl:value-of select="@name|@Name"/>)</xsl:attribute>
  </xsl:template>

  <xsl:template match="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'integerproperty']">
    <xsl:param name="CustomBuildRuleName" />
    <xsl:attribute name="{@name|@Name}">%(<xsl:value-of select="$CustomBuildRuleName"/>.<xsl:value-of select="@name|@Name"/>)</xsl:attribute>
  </xsl:template>

  <xsl:template match="*[translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'enumproperty']">
    <xsl:param name="CustomBuildRuleName" />
    <xsl:attribute name="{@name|@Name}">%(<xsl:value-of select="$CustomBuildRuleName"/>.<xsl:value-of select="@name|@Name"/>)</xsl:attribute>
  </xsl:template>
</xsl:stylesheet>
