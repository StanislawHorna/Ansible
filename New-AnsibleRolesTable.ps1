<#
    .SYNOPSIS
    Creates a Markdown table of Ansible roles with their descriptions and variables.
#>
$VARS_PATH = "defaults/main.yml"
$META_PATH = "meta/main.yml"
$META_DESCRIPTION_KW = "description:"
$ROLES_PATH = "roles"
$MAIN_TASK_PATH = "tasks/main.yml"

$Roles = Get-ChildItem "./$ROLES_PATH/" 
"| Role Name | Description | Variables |" | Out-File -FilePath "roles.md" 
"| --------- | ----------- | ---------- |" | Out-File -FilePath "roles.md" -Append
$Roles | ForEach-Object {
    try {
        $Vars = Get-Content -Path "$($_.FullName)/$VARS_PATH" -ErrorAction Ignore | ForEach-Object {
            $VarName = $_.Split(':')[0].Trim()
            if ($VarName -ne '') {
                $VarName
            }
        }
    }
    catch {
        $Vars = ""
    }

    $Description = $(
        Get-Content -Path "$($_.FullName)/$META_PATH" `
        | Select-String $META_DESCRIPTION_KW -Raw
    ).Replace($META_DESCRIPTION_KW, "").Trim()

    $MD_Vars = "- $($Vars -join "<br> - ")"
    if ($Vars -eq "" -or $Vars -eq $null) {
        $MD_Vars = ""
    }
    "[$($_.Name)](/$ROLES_PATH/$($_.Name)/$MAIN_TASK_PATH) | $Description | $MD_Vars |" | Out-File -FilePath "roles.md" -Append
}