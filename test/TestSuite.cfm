<cfinvoke component="DirectoryTestSuite"   
          method="run"  
          directory="#expandPath('.')#"
		  componentPath='hoth.test'   
          recurse="true"   
          returnvariable="results"/>  
<cfoutput>#results.getResultsOutput('html')#</cfoutput>   