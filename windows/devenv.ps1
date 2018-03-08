# sets up dev env run as admin
#   Set-ExecutionPolicy Unrestricted

#choco
Set-ExecutionPolicy Unrestricted

Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco feature enable -n allowGlobalConfirmation
choco feature disable -n checksumFiles
choco feature enable -n allowEmptyChecksums


cinst -y chocolateygui 7zip javaruntime ccleaner dotnet4.5 nodejs  foxitreader everything irfanview irfanviewplugins

cinst -y vivaldi  vlc steam atom googlechrome


cinst -y spotify wget curl wox jbs  deluge boxstarter boxstarter.winconfig sysinternals


cinst -y hyper freecommander nexusfont jetbrainstoolbox
cinst -y boxstarter cmder lockhunter


cinst -y Microsoft-Windows-Subsystem-Linux --source windowsfeatures --limitoutput


cinst -y yarn xming spf13-vim webstorm visualstudiocode ultravnc sharemouse winsshd.install openssh robotofonts firacode



#delete the start menu spam for new users
rm C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\DefaultLayouts.xml

Disable-GameBarTips
Disable-UAC
Disable-BingSearch
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -DisableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar
Set-TaskbarOptions -Combine Never

Enable-MicrosoftUpdate
Install-WindowsUpdate -AcceptEula


Move-WindowsLibrary -libraryName "Downloads"   -newPath "D:\Downloads"


#Appx removal
Write-Host "***Removing all apps and provisioned appx packages for this machine except Store, Photos, and Calculator...***"
Get-AppxPackage -AllUsers | where-object {$_.name -notlike "*Store*" -and $_.name -notlike "*Windows.Photos*"} | Remove-AppxPackage -erroraction silentlycontinue
Get-AppxPackage -AllUsers | where-object  {$_.name -notlike "*Store*" -and $_.name -notlike "*Windows.Photos*"} | Remove-AppxPackage -erroraction silentlycontinue
Get-AppxProvisionedPackage -online | where-object  {$_.name -notlike "*Store*" -and $_.name -notlike "*Windows.Photos*"} | Remove-AppxProvisionedPackage -online -erroraction silentlycontinue

Write-Host "***Stopping and disabling diagnostics tracking services, Onesync service (syncs contacts, mail, etc, needed for OneDrive), various Xbox services, and Windows Media Player network sharing (you can turn this back on if you share your media libraries with WMP)...***"
Get-Scheduledtask "SmartScreenSpecific","Microsoft Compatibility Appraiser","Consolidator","KernelCeipTask","UsbCeip","Microsoft-Windows-DiskDiagnosticDataCollector", "GatherNetworkInfo","QueueReporting" -erroraction silentlycontinue | Disable-scheduledtask
Get-Service Diagtrack,OneSyncSvc,XblAuthManager,XblGameSave,XboxNetApiSvc,WMPNetworkSvc -erroraction silentlycontinue | stop-service -passthru | set-service -startuptype disabled




#Disabling Suggested Apps, Feedback, Lockscreen Spotlight, and File Explorer ads
#Start menu suggestions
Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /T REG_DWORD /V "SystemPaneSuggestionsEnabled" /D 0 /F
#Lockscreen suggestions, rotating pictures
Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /T REG_DWORD /V "SoftLandingEnabled" /D 0 /F
Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /T REG_DWORD /V "RotatingLockScreenEnabled" /D 0 /F
Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /T REG_DWORD /V "RotatingLockScreenOverlayEnabled" /D 0 /F
#Preinstalled apps, Minecraft Twitter etc all that - Enterprise only it seems
Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /T REG_DWORD /V "PreInstalledAppsEnabled" /D 0 /F
Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /T REG_DWORD /V "PreInstalledAppsEverEnabled" /D 0 /F
Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /T REG_DWORD /V "OEMPreInstalledAppsEnabled" /D 0 /F
#Stop MS shoehorning apps quietly into your profile
Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /T REG_DWORD /V "SilentInstalledAppsEnabled" /D 0 /F
Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /T REG_DWORD /V "ContentDeliveryAllowed" /D 0 /F
Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /T REG_DWORD /V "SubscribedContentEnabled" /D 0 /F
#Ads in File Explorer
Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /T REG_DWORD /V "ShowSyncProviderNotifications" /D 0 /F

#Disabling auto update and download of Windows Store Apps - enable if you are not using the store
#Reg Add "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /T REG_DWORD /V "AutoDownload" /D 2 /F

#Disabling Onedrive startup run user settings
Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /T REG_BINARY /V "OneDrive" /D 0300000021B9DEB396D7D001 /F

#Let websites provide local content by accessing language list
Reg Add "HKLM\Control Panel\International\User Profile" /T REG_DWORD /V "HttpAcceptLanguageOptOut" /D 1 /F

#Let apps share and sync non-explicitly paired wireless devices over uPnP
Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\LooselyCoupled" /T REG_SZ /V "Value" /D DENY /F

#Don't ask for feedback
Reg Add "HKLM\SOFTWARE\Microsoft\Siuf\Rules" /T REG_DWORD /V "NumberOfSIUFInPeriod" /D 0 /F
Reg Add "HKLM\SOFTWARE\Microsoft\Siuf\Rules" /T REG_DWORD /V "PeriodInNanoSeconds" /D 0 /F

#Stopping Cortana/Microsoft from getting to know you"
Reg Add "HKLM\SOFTWARE\Microsoft\Personalization\Settings" /T REG_DWORD /V "AcceptedPrivacyPolicy" /D 0 /F
Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" /T REG_DWORD /V "Enabled" /D 0 /F
Reg Add "HKLM\SOFTWARE\Microsoft\InputPersonalization" /T REG_DWORD /V "RestrictImplicitTextCollection" /D 1 /F
Reg Add "HKLM\SOFTWARE\Microsoft\InputPersonalization" /T REG_DWORD /V "RestrictImplicitInkCollection" /D 1 /F
Reg Add "HKLM\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" /T REG_DWORD /V "HarvestContacts" /D 0 /F
Reg Add "HKLM\SOFTWARE\Microsoft\Input\TIPC" /T REG_DWORD /V "Enabled" /D 0 /F

#Disabling Cortana and Bing search user settings"
Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /T REG_DWORD /V "CortanaEnabled" /D 0 /F
Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /T REG_DWORD /V "BingSearchEnabled" /D 0 /F
Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /T REG_DWORD /V "DeviceHistoryEnabled" /D 0 /F

#Below takes search bar off the taskbar, personal preference
#Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /T REG_DWORD /V "SearchboxTaskbarMode" /D 0 /F

#Stop Cortana from remembering history"
Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /T REG_DWORD /V "HistoryViewEnabled" /D 0 /F

 #/Application Compatibility
#Turn off Application Telemetry
Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /T REG_DWORD /V "AITEnable" /D 0 /F
#Turn off inventory collector
Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /T REG_DWORD /V "DisableInventory" /D 1 /F
#Turn off steps recorder
Reg Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /T REG_DWORD /V "DisableUAR" /D 1 /F

#/Cloud Content
#Do not show Windows Tips
Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /T REG_DWORD /V "DisableSoftLanding" /D 1 /F
#Turn off Consumer Experiences
Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /T REG_DWORD /V "DisableWindowsConsumerFeatures" /D 1 /F

#/Data Collection and Preview Builds
#Set Telemetry to basic (switches to 1:basic for W10Pro and lower, disabled altogether by disabling service anyways)
Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /T REG_DWORD /V "AllowTelemetry" /D 0 /F
#Disable pre-release features and settings
Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" /T REG_DWORD /V "EnableConfigFlighting" /D 0 /F
#Do not show feedback notifications
Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /T REG_DWORD /V "DoNotShowFeedbackNotifications" /D 1 /F

#/Delivery optimization
#Disable DO; set to 1 to allow DO over LAN only
Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /T REG_DWORD /V "DODownloadMode" /D 0 /F
#Non-GPO DO settings, may be redundant after previous.
#Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /T REG_DWORD /V "DownloadMode" /D 0 /F
#Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /T REG_DWORD /V "DODownloadMode" /D 0 /F

#/Location and Sensors
#Turn off location
Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /T REG_DWORD /V "DisableLocation" /D 1 /F
#Turn off Sensors
Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /T REG_DWORD /V "DisableSensors" /D 1 /F

#/Microsoft Edge
#Always send do not track
Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /T REG_DWORD /V "DoNotTrack" /D 1 /F

#/OneDrive
#Prevent usage of OneDrive
Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /T REG_DWORD /V "DisableFileSyncNGSC" /D 1 /F
Reg Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /T REG_DWORD /V "DisableFileSync" /D 1 /F

#/Search
#Disallow Cortana
Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /T REG_DWORD /V "AllowCortana" /D 0 /F
#Disallow Cortana on lock screen
Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /T REG_DWORD /V "AllowCortanaAboveLock" /D 0 /F
#Disallow web search from desktop search
Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /T REG_DWORD /V "DisableWebSearch" /D 1 /F
#Don't search the web or display web results in search
Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /T REG_DWORD /V "ConnectedSearchUseWeb" /D 0 /F

#/Store
#Turn off Automatic download/install of app updates - comment in if you aren't using the store
#Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /T REG_DWORD /V "AutoDownload" /D 2 /F

#Disable all apps from store, left disabled by default
#Reg Add "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /T REG_DWORD /V "DisableStoreApps" /D 1 /F

#Turn off Store, left disabled by default
#Reg Add "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /T REG_DWORD /V "RemoveWindowsStore" /D 1 /F

#/Sync your settings
#Do not sync (anything)
Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /T REG_DWORD /V "DisableSettingSync" /D 2 /F
#Disallow users to override this
Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /T REG_DWORD /V "DisableSettingSyncUserOverride" /D 1 /F

#--Non Local-GP Settings--
#Disabling advertising info and device metadata collection for this machine
Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /T REG_DWORD /V "Enabled" /D 0 /F
Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /V "PreventDeviceMetadataFromNetwork" /T REG_DWORD /D 1 /F

#Prevent apps on other devices from opening apps on this one
Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\SmartGlass" /T REG_DWORD /V "UserAuthPolicy " /D 0 /F

#Disable Malicious Software Removal Tool through WU, and CEIP.  Left MRT enabled by default.
#Reg Add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /T REG_DWORD /V "DontOfferThroughWUAU" /D 1 /F
Reg Add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /T REG_DWORD /V "CEIPEnable" /D 0 /F



#manual

cinst -y android-sdk battle.net  adobe-creative-cloud
wget https://entropy6.com/xmeters/downloads/XMetersSetup.exe
