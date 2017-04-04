#region Source: Startup.pss
#----------------------------------------------
#region Import Assemblies
#----------------------------------------------
[void][Reflection.Assembly]::Load('System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
[void][Reflection.Assembly]::Load('System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
[void][Reflection.Assembly]::Load('System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
[void][Reflection.Assembly]::Load('System.DirectoryServices, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
#endregion Import Assemblies

#Define a Param block to use custom parameters in the project
#Param ($CustomParameter)

function Main {
<#
    .SYNOPSIS
        The Main function starts the project application.
    
    .PARAMETER Commandline
        $Commandline contains the complete argument string passed to the script packager executable.
    
    .NOTES
        Use this function to initialize your script and to call GUI forms.
		
    .NOTES
        To get the console output in the Packager (Forms Engine) use: 
		$ConsoleOutput (Type: System.Collections.ArrayList)
#>
	Param ([String]$Commandline)
		
	#--------------------------------------------------------------------------
	#TODO: Add initialization script here (Load modules and check requirements)
	
	
	#--------------------------------------------------------------------------
	
	if((Show-MainForm_psf) -eq 'OK')
	{
		
	}
	
	$script:ExitCode = 0 #Set the exit code for the Packager
}







#endregion Source: Startup.pss

#region Source: Globals.ps1
	#--------------------------------------------
	# Declare Global Variables and Functions here
	#--------------------------------------------
	$Global_error = @{}
	
	
	#Sample function that provides the location of the script
	function Get-ScriptDirectory
	{
	<#
		.SYNOPSIS
			Get-ScriptDirectory returns the proper location of the script.
	
		.OUTPUTS
			System.String
		
		.NOTES
			Returns the correct path within a packaged executable.
	#>
		[OutputType([string])]
		param ()
		if ($null -ne $hostinvocation)
		{
			Split-Path $hostinvocation.MyCommand.path
		}
		else
		{
			Split-Path $script:MyInvocation.MyCommand.Path
		}
	}
	
	#Sample variable that provides the location of the script
	[string]$ScriptDirectory = Get-ScriptDirectory
	
	
	
#endregion Source: Globals.ps1

#region Source: MainForm.psf
function Show-MainForm_psf
{
	#----------------------------------------------
	#region Import the Assemblies
	#----------------------------------------------
	[void][reflection.assembly]::Load('System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	#endregion Import Assemblies

	#----------------------------------------------
	#region Generated Form Objects
	#----------------------------------------------
	[System.Windows.Forms.Application]::EnableVisualStyles()
	$MainForm = New-Object 'System.Windows.Forms.Form'
	$labelCredits = New-Object 'System.Windows.Forms.Label'
	$label1_button = New-Object 'System.Windows.Forms.Button'
	$CloseButton1 = New-Object 'System.Windows.Forms.Button'
	$groupbox1 = New-Object 'System.Windows.Forms.GroupBox'
	$labelViewAllProgramsInsta = New-Object 'System.Windows.Forms.Label'
	$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
	#endregion Generated Form Objects

	#----------------------------------------------
	# User Generated Script
	#----------------------------------------------
	
	$MainForm_Load={
		#TODO: Initialize Form Controls here
		
	}
	
	$label1_button_Click={
		#TODO: Place custom script here
		Show-programs_installed_psf
	}
	
	$CloseButton1_Click={
		#TODO: Place custom script here
		$MainForm.Close()
	}
	
	$labelCredits_Click={
		#TODO: Place custom script here
		Show-credits_pop_psf
	}
		# --End User Generated Script--
	#----------------------------------------------
	#region Generated Events
	#----------------------------------------------
	
	$Form_StateCorrection_Load=
	{
		#Correct the initial state of the form to prevent the .Net maximized form issue
		$MainForm.WindowState = $InitialFormWindowState
	}
	
	$Form_StoreValues_Closing=
	{
		#Store the control values
	}

	
	$Form_Cleanup_FormClosed=
	{
		#Remove all event handlers from the controls
		try
		{
			$labelCredits.remove_Click($labelCredits_Click)
			$label1_button.remove_Click($label1_button_Click)
			$CloseButton1.remove_Click($CloseButton1_Click)
			$MainForm.remove_Load($MainForm_Load)
			$MainForm.remove_Load($Form_StateCorrection_Load)
			$MainForm.remove_Closing($Form_StoreValues_Closing)
			$MainForm.remove_FormClosed($Form_Cleanup_FormClosed)
		}
		catch { Out-Null <# Prevent PSScriptAnalyzer warning #> }
	}
	#endregion Generated Events

	#----------------------------------------------
	#region Generated Form Code
	#----------------------------------------------
	$MainForm.SuspendLayout()
	$groupbox1.SuspendLayout()
	#
	# MainForm
	#
	$MainForm.Controls.Add($labelCredits)
	$MainForm.Controls.Add($label1_button)
	$MainForm.Controls.Add($CloseButton1)
	$MainForm.Controls.Add($groupbox1)
	$MainForm.AutoScaleDimensions = '6, 13'
	$MainForm.AutoScaleMode = 'Font'
	$MainForm.BackColor = 'ActiveBorder'
	$MainForm.ClientSize = '395, 249'
	$MainForm.Cursor = 'Default'
	$MainForm.FormBorderStyle = 'FixedDialog'
	$MainForm.MaximizeBox = $False
	$MainForm.Name = 'MainForm'
	$MainForm.StartPosition = 'CenterScreen'
	$MainForm.Text = 'Installed Programs Management'
	$MainForm.add_Load($MainForm_Load)
	#
	# labelCredits
	#
	$labelCredits.AutoSize = $True
	$labelCredits.Cursor = 'Hand'
	$labelCredits.Font = 'Corbel, 9.75pt, style=Bold'
	$labelCredits.ForeColor = 'Maroon'
	$labelCredits.Location = '251, 226'
	$labelCredits.Name = 'labelCredits'
	$labelCredits.Size = '52, 15'
	$labelCredits.TabIndex = 3
	$labelCredits.Text = 'Credits!'
	$labelCredits.add_Click($labelCredits_Click)
	#
	# label1_button
	#
	$label1_button.FlatAppearance.BorderSize = 0
	$label1_button.Location = '12, 222'
	$label1_button.Name = 'label1_button'
	$label1_button.Size = '152, 23'
	$label1_button.TabIndex = 1
	$label1_button.Text = 'View Installed Programs
'
	$label1_button.UseVisualStyleBackColor = $True
	$label1_button.add_Click($label1_button_Click)
	#
	# CloseButton1
	#
	$CloseButton1.Location = '170, 222'
	$CloseButton1.Name = 'CloseButton1'
	$CloseButton1.Size = '75, 23'
	$CloseButton1.TabIndex = 2
	$CloseButton1.Text = 'Close'
	$CloseButton1.UseVisualStyleBackColor = $True
	$CloseButton1.add_Click($CloseButton1_Click)
	#
	# groupbox1
	#
	$groupbox1.Controls.Add($labelViewAllProgramsInsta)
	$groupbox1.Location = '13, 13'
	$groupbox1.Name = 'groupbox1'
	$groupbox1.Size = '370, 203'
	$groupbox1.TabIndex = 0
	$groupbox1.TabStop = $False
	$groupbox1.Text = 'View Installed Programs'
	#
	# labelViewAllProgramsInsta
	#
	$labelViewAllProgramsInsta.ForeColor = 'ControlText'
	$labelViewAllProgramsInsta.Location = '6, 27'
	$labelViewAllProgramsInsta.Name = 'labelViewAllProgramsInsta'
	$labelViewAllProgramsInsta.Size = '358, 173'
	$labelViewAllProgramsInsta.TabIndex = 0
	$labelViewAllProgramsInsta.Text = 'View all programs installed on a local or remote computer(s).
Processing time depends upon total number of computers queried for.

This tool is specifically meant to run from a Domain Controller as it
depends on Active Directory architecture with full administrator rights.

The Computers in the domain should have PSRemoting enabled in 
order to run this tool against them.

This tools relies on Remote Registry Controls, please enable remote
registry from services menu or from the Group Policy for the required
computers in the Domain'
	$groupbox1.ResumeLayout()
	$MainForm.ResumeLayout()
	#endregion Generated Form Code

	#----------------------------------------------

	#Save the initial state of the form
	$InitialFormWindowState = $MainForm.WindowState
	#Init the OnLoad event to correct the initial state of the form
	$MainForm.add_Load($Form_StateCorrection_Load)
	#Clean up the control events
	$MainForm.add_FormClosed($Form_Cleanup_FormClosed)
	#Store the control values when form is closing
	$MainForm.add_Closing($Form_StoreValues_Closing)
	#Show the Form
	return $MainForm.ShowDialog()

}
#endregion Source: MainForm.psf

#region Source: programs_installed.psf
function Show-programs_installed_psf
{
	#----------------------------------------------
	#region Import the Assemblies
	#----------------------------------------------
	[void][reflection.assembly]::Load('System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	#endregion Import Assemblies

	#----------------------------------------------
	#region Generated Form Objects
	#----------------------------------------------
	[System.Windows.Forms.Application]::EnableVisualStyles()
	$formViewInstalledProgram = New-Object 'System.Windows.Forms.Form'
	$credits = New-Object 'System.Windows.Forms.Label'
	$groupbox2 = New-Object 'System.Windows.Forms.GroupBox'
	$SystemComponent_checkbox1 = New-Object 'System.Windows.Forms.CheckBox'
	$ParentDisplayName_checkbox1 = New-Object 'System.Windows.Forms.CheckBox'
	$ReleaseType_checkbox1 = New-Object 'System.Windows.Forms.CheckBox'
	$MinorUpgrade_checkbox1 = New-Object 'System.Windows.Forms.CheckBox'
	$InstallSource_checkbox1 = New-Object 'System.Windows.Forms.CheckBox'
	$version_checkbox1 = New-Object 'System.Windows.Forms.CheckBox'
	$InstallDate_checkbox1 = New-Object 'System.Windows.Forms.CheckBox'
	$labelInfoSelectedParamete = New-Object 'System.Windows.Forms.Label'
	$publisher_checkbox1 = New-Object 'System.Windows.Forms.CheckBox'
	$CloseButton1 = New-Object 'System.Windows.Forms.Button'
	$OKButton1 = New-Object 'System.Windows.Forms.Button'
	$labelEnterComputerNames = New-Object 'System.Windows.Forms.Label'
	$groupbox1 = New-Object 'System.Windows.Forms.GroupBox'
	$labelInCaseOfEnteringMult = New-Object 'System.Windows.Forms.Label'
	$ComputerNames = New-Object 'System.Windows.Forms.TextBox'
	$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
	#endregion Generated Form Objects

	#----------------------------------------------
	# User Generated Script
	#----------------------------------------------
	
	$formViewInstalledProgram_Load={
		#TODO: Initialize Form Controls here
		$ComputerNames.Text = $env:COMPUTERNAME
	}
	
	$CloseButton1_Click={
		$formViewInstalledProgram.Close()
	}
	
	$OKButton1_Click = {
		try
		{
			Function Get-RemoteProgram
			{
				[CmdletBinding(SupportsShouldProcess = $true)]
				param (
					[Parameter(ValueFromPipeline = $true,
							   ValueFromPipelineByPropertyName = $true,
							   Position = 0
					)]
					[string[]]$ComputerName,
					[Parameter(Position = 0)]
					[string[]]$Property,
					[switch]$ExcludeSimilar,
					[int]$SimilarWord
				)
				
				begin
				{
					$RegistryLocation = 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\',
					'SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\'
					$HashProperty = @{ }
					$SelectProperty = @('ProgramName', 'ComputerName')
					if ($Property)
					{
						$SelectProperty += $Property
					}
				}
				
				process
				{
					foreach ($Computer in $ComputerName)
					{
						$RegBase = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey([Microsoft.Win32.RegistryHive]::LocalMachine, $Computer)
						$RegistryLocation | ForEach-Object {
							$CurrentReg = $_
							if ($RegBase)
							{
								$CurrentRegKey = $RegBase.OpenSubKey($CurrentReg)
								if ($CurrentRegKey)
								{
									$CurrentRegKey.GetSubKeyNames() | ForEach-Object {
										if ($Property)
										{
											foreach ($CurrentProperty in $Property)
											{
												$HashProperty.$CurrentProperty = ($RegBase.OpenSubKey("$CurrentReg$_")).GetValue($CurrentProperty)
											}
										}
										$HashProperty.ComputerName = $Computer
										$HashProperty.ProgramName = ($DisplayName = ($RegBase.OpenSubKey("$CurrentReg$_")).GetValue('DisplayName'))
										if ($DisplayName)
										{
											New-Object -TypeName PSCustomObject -Property $HashProperty |
											Select-Object -Property $SelectProperty
										}
									}
								}
							}
						} | ForEach-Object -Begin {
							if ($SimilarWord)
							{
								$Regex = [regex]"(^(.+?\s){$SimilarWord}).*$|(.*)"
							}
							else
							{
								$Regex = [regex]"(^(.+?\s){3}).*$|(.*)"
							}
							[System.Collections.ArrayList]$Array = @()
						} -Process {
							if ($ExcludeSimilar)
							{
								$null = $Array.Add($_)
							}
							else
							{
								$_
							}
						} -End {
							if ($ExcludeSimilar)
							{
								$Array | Select-Object -Property *, @{
									name = 'GroupedName'
									expression = {
										($_.ProgramName -split $Regex)[1]
									}
								} |
								Group-Object -Property 'GroupedName' | ForEach-Object {
									$_.Group[0] | Select-Object -Property * -ExcludeProperty GroupedName
								}
							}
						}
					}
				}
			}
			
			#Main Execution Starts
			$CNames = $ComputerNames.Text -split ","
			$props = @()
			
			if ($publisher_checkbox1.Checked)
			{
				$props += "Publisher"
			}
			
			if ($InstallDate_checkbox1.Checked)
			{
				$props += "InstallDate"
			}
			
			if ($version_checkbox1.Checked)
			{
				$props += "DisplayVersion"
			}
			
			if ($InstallSource_checkbox1.Checked)
			{
				$props += "InstallSource"
			}
			
			if ($MinorUpgrade_checkbox1.Checked)
			{
				$props += "IsMinorUpgrade"
			}
			
			if ($ReleaseType_checkbox1.Checked)
			{
				$props += "ReleaseType"
			}
			
			if ($ParentDisplayName_checkbox1.Checked)
			{
				$props += "ParentDisplayName"
			}
			
			if ($SystemComponent_checkbox1.Checked)
			{
				$props += "SystemComponent"
			}
			
			if ($props.count -eq 0)
			{
				Get-RemoteProgram -ComputerName $CNames |
				Out-GridView -Title "Installed Program Details"
			}
			else
			{
				$properties = $props -join ","
				Get-RemoteProgram -ComputerName $CNames -Property $props |
				Out-GridView -Title "Install Program Details"
			}
			
		}
		Catch
		{
			$Global_error[0] = $_.Exception.Message
			$Global_error[1] = $_.Exception.StackTrace
			Show-error_psf
		}
	}
	
	#region Control Helper Functions
	function Update-ListBox
	{	
		param
		(
			[Parameter(Mandatory = $true)]
			[ValidateNotNull()]
			[System.Windows.Forms.ListBox]
			$ListBox,
			[Parameter(Mandatory = $true)]
			[ValidateNotNull()]
			$Items,
			[Parameter(Mandatory = $false)]
			[string]
			$DisplayMember,
			[switch]
			$Append
		)
		
		if (-not $Append)
		{
			$listBox.Items.Clear()
		}
		
		if ($Items -is [System.Windows.Forms.ListBox+ObjectCollection])
		{
			$listBox.Items.AddRange($Items)
		}
		elseif ($Items -is [Array])
		{
			$listBox.BeginUpdate()
			foreach ($obj in $Items)
			{
				$listBox.Items.Add($obj)
			}
			$listBox.EndUpdate()
		}
		else
		{
			$listBox.Items.Add($Items)
		}
		
		$listBox.DisplayMember = $DisplayMember
	}
	#endregion
	
	$credits_Click={
		#TODO: Place custom script here
		Show-credits_pop_psf
	}
		# --End User Generated Script--
	#----------------------------------------------
	#region Generated Events
	#----------------------------------------------
	
	$Form_StateCorrection_Load=
	{
		#Correct the initial state of the form to prevent the .Net maximized form issue
		$formViewInstalledProgram.WindowState = $InitialFormWindowState
	}
	
	$Form_StoreValues_Closing=
	{
		#Store the control values
		$script:programs_installed_SystemComponent_checkbox1 = $SystemComponent_checkbox1.Checked
		$script:programs_installed_ParentDisplayName_checkbox1 = $ParentDisplayName_checkbox1.Checked
		$script:programs_installed_ReleaseType_checkbox1 = $ReleaseType_checkbox1.Checked
		$script:programs_installed_MinorUpgrade_checkbox1 = $MinorUpgrade_checkbox1.Checked
		$script:programs_installed_InstallSource_checkbox1 = $InstallSource_checkbox1.Checked
		$script:programs_installed_version_checkbox1 = $version_checkbox1.Checked
		$script:programs_installed_InstallDate_checkbox1 = $InstallDate_checkbox1.Checked
		$script:programs_installed_publisher_checkbox1 = $publisher_checkbox1.Checked
		$script:programs_installed_ComputerNames = $ComputerNames.Text
	}

	
	$Form_Cleanup_FormClosed=
	{
		#Remove all event handlers from the controls
		try
		{
			$credits.remove_Click($credits_Click)
			$CloseButton1.remove_Click($CloseButton1_Click)
			$OKButton1.remove_Click($OKButton1_Click)
			$formViewInstalledProgram.remove_Load($formViewInstalledProgram_Load)
			$formViewInstalledProgram.remove_Load($Form_StateCorrection_Load)
			$formViewInstalledProgram.remove_Closing($Form_StoreValues_Closing)
			$formViewInstalledProgram.remove_FormClosed($Form_Cleanup_FormClosed)
		}
		catch { Out-Null <# Prevent PSScriptAnalyzer warning #> }
	}
	#endregion Generated Events

	#----------------------------------------------
	#region Generated Form Code
	#----------------------------------------------
	$formViewInstalledProgram.SuspendLayout()
	$groupbox2.SuspendLayout()
	$groupbox1.SuspendLayout()
	#
	# formViewInstalledProgram
	#
	$formViewInstalledProgram.Controls.Add($credits)
	$formViewInstalledProgram.Controls.Add($groupbox2)
	$formViewInstalledProgram.Controls.Add($CloseButton1)
	$formViewInstalledProgram.Controls.Add($OKButton1)
	$formViewInstalledProgram.Controls.Add($labelEnterComputerNames)
	$formViewInstalledProgram.Controls.Add($groupbox1)
	$formViewInstalledProgram.Controls.Add($ComputerNames)
	$formViewInstalledProgram.AutoScaleDimensions = '6, 13'
	$formViewInstalledProgram.AutoScaleMode = 'Font'
	$formViewInstalledProgram.BackColor = 'ActiveBorder'
	$formViewInstalledProgram.ClientSize = '451, 340'
	$formViewInstalledProgram.FormBorderStyle = 'FixedDialog'
	$formViewInstalledProgram.MaximizeBox = $False
	$formViewInstalledProgram.MinimizeBox = $False
	$formViewInstalledProgram.Name = 'formViewInstalledProgram'
	$formViewInstalledProgram.ShowInTaskbar = $False
	$formViewInstalledProgram.StartPosition = 'CenterParent'
	$formViewInstalledProgram.Text = 'View Installed Programs'
	$formViewInstalledProgram.add_Load($formViewInstalledProgram_Load)
	#
	# credits
	#
	$credits.AutoSize = $True
	$credits.Cursor = 'Hand'
	$credits.FlatStyle = 'Popup'
	$credits.Font = 'Corbel, 9.75pt, style=Bold'
	$credits.ForeColor = 'DarkRed'
	$credits.Location = '176, 314'
	$credits.Name = 'credits'
	$credits.Size = '52, 15'
	$credits.TabIndex = 7
	$credits.Text = 'Credits!'
	$credits.add_Click($credits_Click)
	#
	# groupbox2
	#
	$groupbox2.Controls.Add($SystemComponent_checkbox1)
	$groupbox2.Controls.Add($ParentDisplayName_checkbox1)
	$groupbox2.Controls.Add($ReleaseType_checkbox1)
	$groupbox2.Controls.Add($MinorUpgrade_checkbox1)
	$groupbox2.Controls.Add($InstallSource_checkbox1)
	$groupbox2.Controls.Add($version_checkbox1)
	$groupbox2.Controls.Add($InstallDate_checkbox1)
	$groupbox2.Controls.Add($labelInfoSelectedParamete)
	$groupbox2.Controls.Add($publisher_checkbox1)
	$groupbox2.Location = '13, 136'
	$groupbox2.Name = 'groupbox2'
	$groupbox2.Size = '432, 168'
	$groupbox2.TabIndex = 6
	$groupbox2.TabStop = $False
	$groupbox2.Text = 'Options'
	#
	# SystemComponent_checkbox1
	#
	$SystemComponent_checkbox1.Location = '274, 134'
	$SystemComponent_checkbox1.Name = 'SystemComponent_checkbox1'
	$SystemComponent_checkbox1.Size = '152, 24'
	$SystemComponent_checkbox1.TabIndex = 8
	$SystemComponent_checkbox1.Text = 'System Component'
	$SystemComponent_checkbox1.UseVisualStyleBackColor = $True
	#
	# ParentDisplayName_checkbox1
	#
	$ParentDisplayName_checkbox1.Location = '7, 134'
	$ParentDisplayName_checkbox1.Name = 'ParentDisplayName_checkbox1'
	$ParentDisplayName_checkbox1.Size = '204, 24'
	$ParentDisplayName_checkbox1.TabIndex = 7
	$ParentDisplayName_checkbox1.Text = 'Parent Display Name'
	$ParentDisplayName_checkbox1.UseVisualStyleBackColor = $True
	#
	# ReleaseType_checkbox1
	#
	$ReleaseType_checkbox1.Location = '274, 104'
	$ReleaseType_checkbox1.Name = 'ReleaseType_checkbox1'
	$ReleaseType_checkbox1.Size = '152, 24'
	$ReleaseType_checkbox1.TabIndex = 6
	$ReleaseType_checkbox1.Text = 'Program Release Type'
	$ReleaseType_checkbox1.UseVisualStyleBackColor = $True
	#
	# MinorUpgrade_checkbox1
	#
	$MinorUpgrade_checkbox1.Location = '7, 104'
	$MinorUpgrade_checkbox1.Name = 'MinorUpgrade_checkbox1'
	$MinorUpgrade_checkbox1.Size = '204, 24'
	$MinorUpgrade_checkbox1.TabIndex = 5
	$MinorUpgrade_checkbox1.Text = 'Minor Upgrade Check'
	$MinorUpgrade_checkbox1.UseVisualStyleBackColor = $True
	#
	# InstallSource_checkbox1
	#
	$InstallSource_checkbox1.Location = '274, 74'
	$InstallSource_checkbox1.Name = 'InstallSource_checkbox1'
	$InstallSource_checkbox1.Size = '152, 24'
	$InstallSource_checkbox1.TabIndex = 4
	$InstallSource_checkbox1.Text = 'Program File Location'
	$InstallSource_checkbox1.UseVisualStyleBackColor = $True
	#
	# version_checkbox1
	#
	$version_checkbox1.Location = '7, 74'
	$version_checkbox1.Name = 'version_checkbox1'
	$version_checkbox1.Size = '148, 24'
	$version_checkbox1.TabIndex = 3
	$version_checkbox1.Text = 'Program Version'
	$version_checkbox1.UseVisualStyleBackColor = $True
	#
	# InstallDate_checkbox1
	#
	$InstallDate_checkbox1.Location = '274, 44'
	$InstallDate_checkbox1.Name = 'InstallDate_checkbox1'
	$InstallDate_checkbox1.Size = '152, 24'
	$InstallDate_checkbox1.TabIndex = 2
	$InstallDate_checkbox1.Text = 'Program Install Date'
	$InstallDate_checkbox1.UseVisualStyleBackColor = $True
	#
	# labelInfoSelectedParamete
	#
	$labelInfoSelectedParamete.AutoSize = $True
	$labelInfoSelectedParamete.Location = '6, 16'
	$labelInfoSelectedParamete.Name = 'labelInfoSelectedParamete'
	$labelInfoSelectedParamete.Size = '282, 13'
	$labelInfoSelectedParamete.TabIndex = 1
	$labelInfoSelectedParamete.Text = 'Info: Selected parameters will be included in the final result'
	#
	# publisher_checkbox1
	#
	$publisher_checkbox1.Location = '7, 44'
	$publisher_checkbox1.Name = 'publisher_checkbox1'
	$publisher_checkbox1.Size = '204, 24'
	$publisher_checkbox1.TabIndex = 0
	$publisher_checkbox1.Text = 'Program Publisher'
	$publisher_checkbox1.UseVisualStyleBackColor = $True
	#
	# CloseButton1
	#
	$CloseButton1.Location = '92, 310'
	$CloseButton1.Name = 'CloseButton1'
	$CloseButton1.Size = '75, 23'
	$CloseButton1.TabIndex = 5
	$CloseButton1.Text = 'Close'
	$CloseButton1.UseVisualStyleBackColor = $True
	$CloseButton1.add_Click($CloseButton1_Click)
	#
	# OKButton1
	#
	$OKButton1.FlatAppearance.BorderSize = 0
	$OKButton1.Location = '11, 310'
	$OKButton1.Name = 'OKButton1'
	$OKButton1.Size = '75, 23'
	$OKButton1.TabIndex = 4
	$OKButton1.Text = 'OK'
	$OKButton1.UseVisualStyleBackColor = $True
	$OKButton1.add_Click($OKButton1_Click)
	#
	# labelEnterComputerNames
	#
	$labelEnterComputerNames.AutoSize = $True
	$labelEnterComputerNames.Location = '13, 74'
	$labelEnterComputerNames.Name = 'labelEnterComputerNames'
	$labelEnterComputerNames.Size = '125, 13'
	$labelEnterComputerNames.TabIndex = 3
	$labelEnterComputerNames.Text = 'Enter Computer Name(s):'
	#
	# groupbox1
	#
	$groupbox1.Controls.Add($labelInCaseOfEnteringMult)
	$groupbox1.AutoSize = $True
	$groupbox1.Location = '13, 12'
	$groupbox1.Name = 'groupbox1'
	$groupbox1.Size = '432, 49'
	$groupbox1.TabIndex = 2
	$groupbox1.TabStop = $False
	$groupbox1.Text = 'Help'
	#
	# labelInCaseOfEnteringMult
	#
	$labelInCaseOfEnteringMult.Location = '7, 20'
	$labelInCaseOfEnteringMult.Name = 'labelInCaseOfEnteringMult'
	$labelInCaseOfEnteringMult.Size = '419, 13'
	$labelInCaseOfEnteringMult.TabIndex = 0
	$labelInCaseOfEnteringMult.Text = 'In case of entering multiple computer names, please use comma seperated values
'
	#
	# ComputerNames
	#
	$ComputerNames.BackColor = 'ActiveCaption'
	$ComputerNames.Font = 'Cambria, 8.25pt, style=Bold'
	$ComputerNames.ForeColor = 'ActiveCaptionText'
	$ComputerNames.Location = '12, 96'
	$ComputerNames.Name = 'ComputerNames'
	$ComputerNames.Size = '433, 20'
	$ComputerNames.TabIndex = 1
	$groupbox1.ResumeLayout()
	$groupbox2.ResumeLayout()
	$formViewInstalledProgram.ResumeLayout()
	#endregion Generated Form Code

	#----------------------------------------------

	#Save the initial state of the form
	$InitialFormWindowState = $formViewInstalledProgram.WindowState
	#Init the OnLoad event to correct the initial state of the form
	$formViewInstalledProgram.add_Load($Form_StateCorrection_Load)
	#Clean up the control events
	$formViewInstalledProgram.add_FormClosed($Form_Cleanup_FormClosed)
	#Store the control values when form is closing
	$formViewInstalledProgram.add_Closing($Form_StoreValues_Closing)
	#Show the Form
	return $formViewInstalledProgram.ShowDialog()

}
#endregion Source: programs_installed.psf

#region Source: error.psf
function Show-error_psf
{
	#----------------------------------------------
	#region Import the Assemblies
	#----------------------------------------------
	[void][reflection.assembly]::Load('System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	#endregion Import Assemblies

	#----------------------------------------------
	#region Generated Form Objects
	#----------------------------------------------
	[System.Windows.Forms.Application]::EnableVisualStyles()
	$Error = New-Object 'System.Windows.Forms.Form'
	$label2 = New-Object 'System.Windows.Forms.Label'
	$label1 = New-Object 'System.Windows.Forms.Label'
	$OKbutton1 = New-Object 'System.Windows.Forms.Button'
	$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
	#endregion Generated Form Objects

	#----------------------------------------------
	# User Generated Script
	#----------------------------------------------
	
	$Error_Load={
		#TODO: Initialize Form Controls here
		$label1.Text = $Global_error[0]
		$label2.Text = $Global_error[1]
		
	}
	
	$OKbutton1_Click={
		#TODO: Place custom script here
		$Error.close()
	}
		# --End User Generated Script--
	#----------------------------------------------
	#region Generated Events
	#----------------------------------------------
	
	$Form_StateCorrection_Load=
	{
		#Correct the initial state of the form to prevent the .Net maximized form issue
		$Error.WindowState = $InitialFormWindowState
	}
	
	$Form_StoreValues_Closing=
	{
		#Store the control values
	}

	
	$Form_Cleanup_FormClosed=
	{
		#Remove all event handlers from the controls
		try
		{
			$OKbutton1.remove_Click($OKbutton1_Click)
			$Error.remove_Load($Error_Load)
			$Error.remove_Load($Form_StateCorrection_Load)
			$Error.remove_Closing($Form_StoreValues_Closing)
			$Error.remove_FormClosed($Form_Cleanup_FormClosed)
		}
		catch { Out-Null <# Prevent PSScriptAnalyzer warning #> }
	}
	#endregion Generated Events

	#----------------------------------------------
	#region Generated Form Code
	#----------------------------------------------
	$Error.SuspendLayout()
	#
	# Error
	#
	$Error.Controls.Add($label2)
	$Error.Controls.Add($label1)
	$Error.Controls.Add($OKbutton1)
	$Error.AutoScaleDimensions = '6, 13'
	$Error.AutoScaleMode = 'Font'
	$Error.AutoScroll = $True
	$Error.AutoSize = $True
	$Error.ClientSize = '541, 201'
	$Error.FormBorderStyle = 'FixedDialog'
	$Error.MaximizeBox = $False
	$Error.MinimizeBox = $False
	$Error.Name = 'Error'
	$Error.ShowInTaskbar = $False
	$Error.StartPosition = 'CenterScreen'
	$Error.Text = 'Error'
	$Error.add_Load($Error_Load)
	#
	# label2
	#
	$label2.AutoEllipsis = $True
	$label2.AutoSize = $True
	$label2.Location = '13, 47'
	$label2.Name = 'label2'
	$label2.Size = '35, 13'
	$label2.TabIndex = 2
	$label2.Text = 'label2'
	#
	# label1
	#
	$label1.AutoEllipsis = $True
	$label1.AutoSize = $True
	$label1.Location = '13, 13'
	$label1.Name = 'label1'
	$label1.Size = '35, 13'
	$label1.TabIndex = 1
	$label1.Text = 'label1'
	#
	# OKbutton1
	#
	$OKbutton1.Location = '12, 142'
	$OKbutton1.Name = 'OKbutton1'
	$OKbutton1.Size = '75, 23'
	$OKbutton1.TabIndex = 0
	$OKbutton1.Text = 'Ok'
	$OKbutton1.UseVisualStyleBackColor = $True
	$OKbutton1.add_Click($OKbutton1_Click)
	$Error.ResumeLayout()
	#endregion Generated Form Code

	#----------------------------------------------

	#Save the initial state of the form
	$InitialFormWindowState = $Error.WindowState
	#Init the OnLoad event to correct the initial state of the form
	$Error.add_Load($Form_StateCorrection_Load)
	#Clean up the control events
	$Error.add_FormClosed($Form_Cleanup_FormClosed)
	#Store the control values when form is closing
	$Error.add_Closing($Form_StoreValues_Closing)
	#Show the Form
	return $Error.ShowDialog()

}
#endregion Source: error.psf

#region Source: credits_pop.psf
function Show-credits_pop_psf
{
	#----------------------------------------------
	#region Import the Assemblies
	#----------------------------------------------
	[void][reflection.assembly]::Load('System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	#endregion Import Assemblies

	#----------------------------------------------
	#region Generated Form Objects
	#----------------------------------------------
	[System.Windows.Forms.Application]::EnableVisualStyles()
	$credits_pop = New-Object 'System.Windows.Forms.Form'
	$Closebutton1 = New-Object 'System.Windows.Forms.Button'
	$groupbox2 = New-Object 'System.Windows.Forms.GroupBox'
	$linklabelSocialtechnetmicroso = New-Object 'System.Windows.Forms.LinkLabel'
	$linklabelGetRemoteProgramps1 = New-Object 'System.Windows.Forms.LinkLabel'
	$labelTechNetProfile = New-Object 'System.Windows.Forms.Label'
	$labelModuleLink = New-Object 'System.Windows.Forms.Label'
	$labelMCCMVP = New-Object 'System.Windows.Forms.Label'
	$labelJaapBrasser = New-Object 'System.Windows.Forms.Label'
	$groupbox1 = New-Object 'System.Windows.Forms.GroupBox'
	$linklabelFacebookcomhaxonic = New-Object 'System.Windows.Forms.LinkLabel'
	$linklabelInlinkedincominneera = New-Object 'System.Windows.Forms.LinkLabel'
	$labelFacebook = New-Object 'System.Windows.Forms.Label'
	$labelLinkedIn = New-Object 'System.Windows.Forms.Label'
	$labelNEERAJSINGH = New-Object 'System.Windows.Forms.Label'
	$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
	#endregion Generated Form Objects

	#----------------------------------------------
	# User Generated Script
	#----------------------------------------------
	
	$credits_pop_Load={
		#TODO: Initialize Form Controls here
		
	}
	$linklabelInlinkedincominneera_LinkClicked=[System.Windows.Forms.LinkLabelLinkClickedEventHandler]{
	#Event Argument: $_ = [System.Windows.Forms.LinkLabelLinkClickedEventArgs]
		#TODO: Place custom script here
		Start-Process "https://in.linkedin.com/in/neerajsingh246"
	}
	
	$linklabelFacebookcomhaxonic_LinkClicked=[System.Windows.Forms.LinkLabelLinkClickedEventHandler]{
	#Event Argument: $_ = [System.Windows.Forms.LinkLabelLinkClickedEventArgs]
		#TODO: Place custom script here
		Start-Process "https://www.facebook.com/haxonic"
	}
	
	$linklabelGetRemoteProgramps1_LinkClicked=[System.Windows.Forms.LinkLabelLinkClickedEventHandler]{
	#Event Argument: $_ = [System.Windows.Forms.LinkLabelLinkClickedEventArgs]
		#TODO: Place custom script here
		Start-Process "https://gallery.technet.microsoft.com/scriptcenter/Get-RemoteProgram-Get-list-de9fd2b4"
	}
	
	$linklabelSocialtechnetmicroso_LinkClicked=[System.Windows.Forms.LinkLabelLinkClickedEventHandler]{
	#Event Argument: $_ = [System.Windows.Forms.LinkLabelLinkClickedEventArgs]
		#TODO: Place custom script here
		Start-Process "https://social.technet.microsoft.com/profile/jaap%20brasser/"
	}
	
	$Closebutton1_Click={
		#TODO: Place custom script here
		$credits_pop.close()
	}
		# --End User Generated Script--
	#----------------------------------------------
	#region Generated Events
	#----------------------------------------------
	
	$Form_StateCorrection_Load=
	{
		#Correct the initial state of the form to prevent the .Net maximized form issue
		$credits_pop.WindowState = $InitialFormWindowState
	}
	
	$Form_StoreValues_Closing=
	{
		#Store the control values
	}

	
	$Form_Cleanup_FormClosed=
	{
		#Remove all event handlers from the controls
		try
		{
			$Closebutton1.remove_Click($Closebutton1_Click)
			$linklabelSocialtechnetmicroso.remove_LinkClicked($linklabelSocialtechnetmicroso_LinkClicked)
			$linklabelGetRemoteProgramps1.remove_LinkClicked($linklabelGetRemoteProgramps1_LinkClicked)
			$linklabelFacebookcomhaxonic.remove_LinkClicked($linklabelFacebookcomhaxonic_LinkClicked)
			$linklabelInlinkedincominneera.remove_LinkClicked($linklabelInlinkedincominneera_LinkClicked)
			$credits_pop.remove_Load($credits_pop_Load)
			$credits_pop.remove_Load($Form_StateCorrection_Load)
			$credits_pop.remove_Closing($Form_StoreValues_Closing)
			$credits_pop.remove_FormClosed($Form_Cleanup_FormClosed)
		}
		catch { Out-Null <# Prevent PSScriptAnalyzer warning #> }
	}
	#endregion Generated Events

	#----------------------------------------------
	#region Generated Form Code
	#----------------------------------------------
	$credits_pop.SuspendLayout()
	$groupbox1.SuspendLayout()
	$groupbox2.SuspendLayout()
	#
	# credits_pop
	#
	$credits_pop.Controls.Add($Closebutton1)
	$credits_pop.Controls.Add($groupbox2)
	$credits_pop.Controls.Add($groupbox1)
	$credits_pop.AutoScaleDimensions = '6, 13'
	$credits_pop.AutoScaleMode = 'Font'
	$credits_pop.BackColor = 'ActiveBorder'
	$credits_pop.ClientSize = '422, 264'
	$credits_pop.ControlBox = $False
	$credits_pop.FormBorderStyle = 'FixedDialog'
	$credits_pop.Name = 'credits_pop'
	$credits_pop.ShowInTaskbar = $False
	$credits_pop.StartPosition = 'CenterParent'
	$credits_pop.Text = 'Credits'
	$credits_pop.add_Load($credits_pop_Load)
	#
	# Closebutton1
	#
	$Closebutton1.Location = '13, 234'
	$Closebutton1.Name = 'Closebutton1'
	$Closebutton1.Size = '75, 23'
	$Closebutton1.TabIndex = 2
	$Closebutton1.Text = 'Close'
	$Closebutton1.UseVisualStyleBackColor = $True
	$Closebutton1.add_Click($Closebutton1_Click)
	#
	# groupbox2
	#
	$groupbox2.Controls.Add($linklabelSocialtechnetmicroso)
	$groupbox2.Controls.Add($linklabelGetRemoteProgramps1)
	$groupbox2.Controls.Add($labelTechNetProfile)
	$groupbox2.Controls.Add($labelModuleLink)
	$groupbox2.Controls.Add($labelMCCMVP)
	$groupbox2.Controls.Add($labelJaapBrasser)
	$groupbox2.Location = '13, 120'
	$groupbox2.Name = 'groupbox2'
	$groupbox2.Size = '395, 107'
	$groupbox2.TabIndex = 1
	$groupbox2.TabStop = $False
	$groupbox2.Text = 'Powershell Module Credits'
	#
	# linklabelSocialtechnetmicroso
	#
	$linklabelSocialtechnetmicroso.LinkColor = 'Maroon'
	$linklabelSocialtechnetmicroso.Location = '102, 67'
	$linklabelSocialtechnetmicroso.Name = 'linklabelSocialtechnetmicroso'
	$linklabelSocialtechnetmicroso.Size = '287, 23'
	$linklabelSocialtechnetmicroso.TabIndex = 5
	$linklabelSocialtechnetmicroso.TabStop = $True
	$linklabelSocialtechnetmicroso.Text = 'social.technet.microsoft.com/profile/jaap%20brasser/'
	$linklabelSocialtechnetmicroso.add_LinkClicked($linklabelSocialtechnetmicroso_LinkClicked)
	#
	# linklabelGetRemoteProgramps1
	#
	$linklabelGetRemoteProgramps1.LinkColor = 'Maroon'
	$linklabelGetRemoteProgramps1.Location = '88, 50'
	$linklabelGetRemoteProgramps1.Name = 'linklabelGetRemoteProgramps1'
	$linklabelGetRemoteProgramps1.Size = '280, 17'
	$linklabelGetRemoteProgramps1.TabIndex = 4
	$linklabelGetRemoteProgramps1.TabStop = $True
	$linklabelGetRemoteProgramps1.Text = 'Get-RemoteProgram.ps1'
	$linklabelGetRemoteProgramps1.add_LinkClicked($linklabelGetRemoteProgramps1_LinkClicked)
	#
	# labelTechNetProfile
	#
	$labelTechNetProfile.AutoSize = $True
	$labelTechNetProfile.Font = 'Arial, 8.25pt, style=Bold'
	$labelTechNetProfile.Location = '6, 67'
	$labelTechNetProfile.Name = 'labelTechNetProfile'
	$labelTechNetProfile.Size = '99, 14'
	$labelTechNetProfile.TabIndex = 3
	$labelTechNetProfile.Text = 'TechNet Profile : '
	#
	# labelModuleLink
	#
	$labelModuleLink.AutoSize = $True
	$labelModuleLink.Font = 'Arial, 8.25pt, style=Bold'
	$labelModuleLink.Location = '7, 50'
	$labelModuleLink.Name = 'labelModuleLink'
	$labelModuleLink.Size = '84, 14'
	$labelModuleLink.TabIndex = 2
	$labelModuleLink.Text = 'Module Link : '
	#
	# labelMCCMVP
	#
	$labelMCCMVP.AutoSize = $True
	$labelMCCMVP.Location = '7, 33'
	$labelMCCMVP.Name = 'labelMCCMVP'
	$labelMCCMVP.Size = '59, 13'
	$labelMCCMVP.TabIndex = 1
	$labelMCCMVP.Text = 'MCC, MVP'
	#
	# labelJaapBrasser
	#
	$labelJaapBrasser.AutoSize = $True
	$labelJaapBrasser.Font = 'Microsoft Sans Serif, 8.25pt, style=Bold'
	$labelJaapBrasser.Location = '7, 20'
	$labelJaapBrasser.Name = 'labelJaapBrasser'
	$labelJaapBrasser.Size = '99, 13'
	$labelJaapBrasser.TabIndex = 0
	$labelJaapBrasser.Text = 'JAAP BRASSER'
	#
	# groupbox1
	#
	$groupbox1.Controls.Add($linklabelFacebookcomhaxonic)
	$groupbox1.Controls.Add($linklabelInlinkedincominneera)
	$groupbox1.Controls.Add($labelFacebook)
	$groupbox1.Controls.Add($labelLinkedIn)
	$groupbox1.Controls.Add($labelNEERAJSINGH)
	$groupbox1.Location = '13, 13'
	$groupbox1.Name = 'groupbox1'
	$groupbox1.Size = '395, 83'
	$groupbox1.TabIndex = 0
	$groupbox1.TabStop = $False
	$groupbox1.Text = 'UI and Executable Credits'
	#
	# linklabelFacebookcomhaxonic
	#
	$linklabelFacebookcomhaxonic.LinkColor = 'Maroon'
	$linklabelFacebookcomhaxonic.Location = '79, 55'
	$linklabelFacebookcomhaxonic.Name = 'linklabelFacebookcomhaxonic'
	$linklabelFacebookcomhaxonic.Size = '199, 23'
	$linklabelFacebookcomhaxonic.TabIndex = 4
	$linklabelFacebookcomhaxonic.TabStop = $True
	$linklabelFacebookcomhaxonic.Text = 'facebook.com/haxonic'
	$linklabelFacebookcomhaxonic.add_LinkClicked($linklabelFacebookcomhaxonic_LinkClicked)
	#
	# linklabelInlinkedincominneera
	#
	$linklabelInlinkedincominneera.LinkColor = 'Maroon'
	$linklabelInlinkedincominneera.Location = '74, 37'
	$linklabelInlinkedincominneera.Name = 'linklabelInlinkedincominneera'
	$linklabelInlinkedincominneera.Size = '238, 23'
	$linklabelInlinkedincominneera.TabIndex = 3
	$linklabelInlinkedincominneera.TabStop = $True
	$linklabelInlinkedincominneera.Text = 'in.linkedin.com/in/neerajsingh246'
	$linklabelInlinkedincominneera.add_LinkClicked($linklabelInlinkedincominneera_LinkClicked)
	#
	# labelFacebook
	#
	$labelFacebook.AutoSize = $True
	$labelFacebook.Font = 'Arial, 8.25pt, style=Bold'
	$labelFacebook.Location = '12, 55'
	$labelFacebook.Name = 'labelFacebook'
	$labelFacebook.Size = '66, 14'
	$labelFacebook.TabIndex = 2
	$labelFacebook.Text = 'Facebook :'
	#
	# labelLinkedIn
	#
	$labelLinkedIn.AutoSize = $True
	$labelLinkedIn.Font = 'Arial, 8.25pt, style=Bold'
	$labelLinkedIn.Location = '12, 37'
	$labelLinkedIn.Name = 'labelLinkedIn'
	$labelLinkedIn.Size = '61, 14'
	$labelLinkedIn.TabIndex = 1
	$labelLinkedIn.Text = 'LinkedIn :'
	#
	# labelNEERAJSINGH
	#
	$labelNEERAJSINGH.AutoSize = $True
	$labelNEERAJSINGH.Font = 'Microsoft Sans Serif, 8.25pt, style=Bold'
	$labelNEERAJSINGH.Location = '7, 20'
	$labelNEERAJSINGH.Name = 'labelNEERAJSINGH'
	$labelNEERAJSINGH.Size = '98, 13'
	$labelNEERAJSINGH.TabIndex = 0
	$labelNEERAJSINGH.Text = 'NEERAJ SINGH'
	$groupbox2.ResumeLayout()
	$groupbox1.ResumeLayout()
	$credits_pop.ResumeLayout()
	#endregion Generated Form Code

	#----------------------------------------------

	#Save the initial state of the form
	$InitialFormWindowState = $credits_pop.WindowState
	#Init the OnLoad event to correct the initial state of the form
	$credits_pop.add_Load($Form_StateCorrection_Load)
	#Clean up the control events
	$credits_pop.add_FormClosed($Form_Cleanup_FormClosed)
	#Store the control values when form is closing
	$credits_pop.add_Closing($Form_StoreValues_Closing)
	#Show the Form
	return $credits_pop.ShowDialog()

}
#endregion Source: credits_pop.psf

#Start the application
Main ($CommandLine)
