<cfcomponent output="false">
	<cfset this.name = "Hoth Tests_" & hash(getCurrentTemplatePath())>
	
	<!--- Simplify access to the base path for our test application --->
	<cfset variables.basePath = getDirectoryFromPath(getCurrentTemplatePath()).ReplaceFirst("([^\\\/]+[\\\/]){1}$", "").ReplaceFirst("([^\\\/]+[\\\/]){1}$", "") />
	
	<!--- Setup mappings required by libraries used for testing --->
	<cfset this.mappings = {
		 '/mockbox' = variables.basepath & 'test/mockbox/mockbox'
		,'/mxunit' = variables.basepath & 'test/mxunit'
		,'/Hoth' = variables.basepath
	} />
	
</cfcomponent>