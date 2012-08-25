<cfinvoke component="DirectoryTestSuite"   
          method="run"  
          directory="#expandPath('.')#"
		  componentPath=''   
          recurse="true"   
          returnvariable="results"/>  
<cfoutput>#results.getResultsOutput('html')#</cfoutput>   