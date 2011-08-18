<!---
	Aaron Greenlee
	http://aarongreenlee.com/

	This work is licensed under a Creative Commons Attribution-Share-Alike 3.0
	Unported License.

	// Original Info -----------------------------------------------------------
	Author			: Aaron Greenlee
	Created      	: 10/01/2010

--->
<cfcomponent output="false">
	<cfset this.mappings['/test'] = getDirectoryFromPath(getCurrentTemplatePath()) />
	<cfset this.mappings['/mockbox'] = this.mappings['/test'] & 'mockbox/mockbox' />
	
	<cfset this.name = "Hoth Tests_" & hash(getCurrentTemplatePath())>
	
</cfcomponent>