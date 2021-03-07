using namespace System
using namespace System.Collections.Generic

function Get-AppxArray{
	[CmdletBinding(
		defaultParameterSetName="set1",
		PositionalBinding=$true
		)]
	[Outputtype([String])]

	Param(
		# Parameter help description
		[Parameter(
			ParameterSetName="set1",
			Mandatory=$true,
			Position=0,
			ValueFromPipeline=$true,
			ValueFromPipelineByPropertyName=$true
			)]
		[String[]]
		$app,

		[Parameter(
			ParameterSetName="set1",
			Position=1,
			ValueFromPipeline=$true,
			ValueFromPipelineByPropertyName=$true
		)]
		[String[]]
		$appx
	)

	Begin{
        Write-Host "ファンクション開始："
		[void](New-Variable -Name tmpStr)
        [void](New-Variable -Name tmpAppStr)
        $tmpAppStr = New-Object List[String]
        [void](Get-AppxPackage | foreach {$appx += $_})
	}
	Process{
		    if($appx -contains $app){
			    [void]($tmpAppStr.add($app))
           #     $tmpStr = $app
           #    return $tmpStr
		    }
	}
	End{
       Write-Host {ファンクション終了： レコード数：　} $tmpAppStr.Count
       return $tmpAppStr
	}
}