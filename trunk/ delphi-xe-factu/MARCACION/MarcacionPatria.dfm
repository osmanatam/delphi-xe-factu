﻿	<Project xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
		<PropertyGroup>
			<ProjectGuid>{41D6E190-C6BF-424B-83CF-185259D9553A}</ProjectGuid>
			<MainSource>MarcacionPatria.dpr</MainSource>
			<ProjectVersion>12.3</ProjectVersion>
			<Base>True</Base>
			<Config Condition="'$(Config)'==''">Debug</Config>
			<Platform>Win32</Platform>
			<AppType>Application</AppType>
			<FrameworkType>VCL</FrameworkType>
			<DCC_DCCCompiler>DCC32</DCC_DCCCompiler>
		</PropertyGroup>
		<PropertyGroup Condition="'$(Config)'=='Base' or '$(Base)'!=''">
			<Base>true</Base>
		</PropertyGroup>
		<PropertyGroup Condition="'$(Config)'=='Debug' or '$(Cfg_1)'!=''">
			<Cfg_1>true</Cfg_1>
			<CfgParent>Base</CfgParent>
			<Base>true</Base>
		</PropertyGroup>
		<PropertyGroup Condition="'$(Config)'=='Release' or '$(Cfg_2)'!=''">
			<Cfg_2>true</Cfg_2>
			<CfgParent>Base</CfgParent>
			<Base>true</Base>
		</PropertyGroup>
		<PropertyGroup Condition="'$(Base)'!=''">
			<DCC_ImageBase>00400000</DCC_ImageBase>
			<DCC_DcuOutput>.\$(Config)\$(Platform)</DCC_DcuOutput>
			<DCC_UnitAlias>WinTypes=Windows;WinProcs=Windows;DbiTypes=BDE;DbiProcs=BDE;$(DCC_UnitAlias)</DCC_UnitAlias>
			<DCC_ExeOutput>.\$(Config)\$(Platform)</DCC_ExeOutput>
			<DCC_E>false</DCC_E>
			<DCC_N>false</DCC_N>
			<DCC_S>false</DCC_S>
			<DCC_F>false</DCC_F>
			<DCC_K>false</DCC_K>
		</PropertyGroup>
		<PropertyGroup Condition="'$(Cfg_1)'!=''">
			<DCC_Define>DEBUG;$(DCC_Define)</DCC_Define>
			<DCC_Optimize>false</DCC_Optimize>
			<DCC_GenerateStackFrames>true</DCC_GenerateStackFrames>
		</PropertyGroup>
		<PropertyGroup Condition="'$(Cfg_2)'!=''">
			<DCC_LocalDebugSymbols>false</DCC_LocalDebugSymbols>
			<DCC_Define>RELEASE;$(DCC_Define)</DCC_Define>
			<DCC_SymbolReferenceInfo>0</DCC_SymbolReferenceInfo>
			<DCC_DebugInformation>false</DCC_DebugInformation>
		</PropertyGroup>
		<ItemGroup>
			<DelphiCompile Include="MarcacionPatria.dpr">
				<MainSource>MainSource</MainSource>
			</DelphiCompile>
			<DCCReference Include="Marcacion.pas">
				<Form>frmPrincipal</Form>
			</DCCReference>
			<BuildConfiguration Include="Release">
				<Key>Cfg_2</Key>
				<CfgParent>Base</CfgParent>
			</BuildConfiguration>
			<BuildConfiguration Include="Base">
				<Key>Base</Key>
			</BuildConfiguration>
			<BuildConfiguration Include="Debug">
				<Key>Cfg_1</Key>
				<CfgParent>Base</CfgParent>
			</BuildConfiguration>
		</ItemGroup>
		<Import Condition="Exists('$(BDS)\Bin\CodeGear.Delphi.Targets')" Project="$(BDS)\Bin\CodeGear.Delphi.Targets"/>
		<Import Condition="Exists('$(APPDATA)\Embarcadero\$(BDSAPPDATABASEDIR)\$(PRODUCTVERSION)\UserTools.proj')" Project="$(APPDATA)\Embarcadero\$(BDSAPPDATABASEDIR)\$(PRODUCTVERSION)\UserTools.proj"/>
		<ProjectExtensions>
			<Borland.Personality>Delphi.Personality.12</Borland.Personality>
			<Borland.ProjectType/>
			<BorlandProject>
				<Delphi.Personality>
					<VersionInfo>
						<VersionInfo Name="IncludeVerInfo">False</VersionInfo>
						<VersionInfo Name="AutoIncBuild">False</VersionInfo>
						<VersionInfo Name="MajorVer">1</VersionInfo>
						<VersionInfo Name="MinorVer">0</VersionInfo>
						<VersionInfo Name="Release">0</VersionInfo>
						<VersionInfo Name="Build">0</VersionInfo>
						<VersionInfo Name="Debug">False</VersionInfo>
						<VersionInfo Name="PreRelease">False</VersionInfo>
						<VersionInfo Name="Special">False</VersionInfo>
						<VersionInfo Name="Private">False</VersionInfo>
						<VersionInfo Name="DLL">False</VersionInfo>
						<VersionInfo Name="Locale">3082</VersionInfo>
						<VersionInfo Name="CodePage">1252</VersionInfo>
					</VersionInfo>
					<VersionInfoKeys>
						<VersionInfoKeys Name="CompanyName"/>
						<VersionInfoKeys Name="FileDescription"/>
						<VersionInfoKeys Name="FileVersion">1.0.0.0</VersionInfoKeys>
						<VersionInfoKeys Name="InternalName"/>
						<VersionInfoKeys Name="LegalCopyright"/>
						<VersionInfoKeys Name="LegalTrademarks"/>
						<VersionInfoKeys Name="OriginalFilename"/>
						<VersionInfoKeys Name="ProductName"/>
						<VersionInfoKeys Name="ProductVersion">1.0.0.0</VersionInfoKeys>
						<VersionInfoKeys Name="Comments"/>
					</VersionInfoKeys>
					<Source>
						<Source Name="MainSource">MarcacionPatria.dpr</Source>
					</Source>
				</Delphi.Personality>
				<Platforms>
					<Platform value="Win32">True</Platform>
				</Platforms>
			</BorlandProject>
			<ProjectFileVersion>12</ProjectFileVersion>
		</ProjectExtensions>
	</Project>
