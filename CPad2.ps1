# �V�X�e���A�v����ێ�����ꍇ�́A���̒l�� "1" �ɕύX���ĉ������
$keepSysApps = 0

# �CPad Customize Tool����g�p������́A���̒l�� "1" �ɕύX���ĉ������
# ���K�� about ���J���ē��e���m�F���ĉ������
$instCusTool = 0


# ���������͏ڂ������ȊO�͕ҏW���Ȃ��ŉ������



Set-Item env:Path "$env:Path;$(Convert-Path .\assets\DebugBridge\);"
Clear-Host
adb start-server | Out-Null
adb devices
Read-Host "CPad2���ڑ�����Ă�����Enter�������đ��s���ĉ������"
Clear-Host
Write-Output "�ڍאݒ�̕ύX��..."
adb shell settings put system accelerometer_rotation 0
adb shell settings put global stay_on_while_plugged_in 7
adb shell pm clear com.android.settings | Out-Null
adb shell am start -n com.android.settings/.ChooseLockGeneric | Out-Null
adb shell input tap 160 120
adb shell settings put secure install_non_market_apps 1
adb install -r .\assets\iWnnIME_oldskin_2.apk | Out-Null
Clear-Host
adb shell am start com.android.settings/.wifi.WifiSettings | Out-Null
adb shell input tap 1240 120
Read-Host "Wi-Fi�ɐڑ�������Enter�������đ��s���ĉ������"
Clear-Host
adb shell am start -n com.android.settings/.applications.ManageApplications | Out-Null
if ($instCusTool -Eq 0) {
    Write-Output "Dcha�n�̃A�v�����폜��..."
    adb shell am force-stop jp.co.benesse.dcha.dchaservice
    adb shell pm uninstall --user 0 jp.co.benesse.dcha.dchaservice | Out-Null
    adb shell am force-stop jp.co.benesse.dcha.systemsettings
    adb shell pm uninstall --user 0 jp.co.benesse.dcha.systemsettings | Out-Null
    adb shell am force-stop jp.co.benesse.dcha.databox
    adb shell pm uninstall --user 0 jp.co.benesse.dcha.databox | Out-Null
    adb shell am force-stop jp.co.benesse.dcha.setupwizard
    adb shell pm uninstall --user 0 jp.co.benesse.dcha.setupwizard | Out-Null
    Write-Output "��I�t���C���A�b�v�f�[�g��̃A���C���X�g�[����..."
    adb shell am force-stop com.panasonic.sanyo.ts.firmwareupdate
    adb shell pm uninstall --user 0 com.panasonic.sanyo.ts.firmwareupdate | Out-Null
    Write-Output "�AOSS��̃A���C���X�g�[����..."
    adb shell am force-stop jp.buffalo.aoss
    adb shell pm uninstall --user 0 jp.buffalo.aoss | Out-Null
}
if ($keepSysApps -Eq 1) {
Write-Output "��u���E�U��̃A���C���X�g�[����..."
    adb shell am force-stop com.android.browser
    adb shell pm uninstall --user 0 com.android.browser | Out-Null
} else {
    Write-Output "�W���A�v���̃A���C���X�g�[����..."
    adb shell am force-stop com.android.quicksearchbox
    adb shell pm uninstall --user 0 com.android.quicksearchbox | Out-Null
    adb shell am force-stop com.android.browser
    adb shell pm uninstall --user 0 com.android.browser | Out-Null
    adb shell am force-stop com.android.soundrecorder
    adb shell pm uninstall --user 0 com.android.soundrecorder | Out-Null
    adb shell am force-stop com.android.contacts
    adb shell pm uninstall --user 0 com.android.contacts | Out-Null
    adb shell am force-stop com.android.camera2
    adb shell pm uninstall --user 0 com.android.camera2 | Out-Null
    adb shell am force-stop com.android.calendar
    adb shell pm uninstall --user 0 com.android.calendar | Out-Null
    adb shell am force-stop com.android.gallery3d
    adb shell pm uninstall --user 0 com.android.gallery3d | Out-Null
    adb shell am force-stop com.android.music
    adb shell pm uninstall --user 0 com.android.music | Out-Null
    adb shell am force-stop com.android.deskclock
    adb shell pm uninstall --user 0 com.android.deskclock | Out-Null
}
Clear-Host
Write-Output "�Google�A�J�E���g�}�l�[�W���[��̃C���X�g�[����..."
adb install .\assets\GoogleLoginService_22.apk | Out-Null
Write-Output "�Google�T�[�r�X�t���[�����[�N��̃C���X�g�[����..."
adb install .\assets\GoogleServicesFramework_19.apk | Out-Null
adb shell pm grant com.google.android.gsf android.permission.DUMP
adb shell pm grant com.google.android.gsf android.permission.INTERACT_ACROSS_USERS
adb shell pm grant com.google.android.gsf android.permission.READ_LOGS
adb shell pm grant com.google.android.gsf android.permission.WRITE_SECURE_SETTINGS
Write-Output "�Google Play �J���҃T�[�r�X��̃C���X�g�[����..."
adb install .\assets\GmsCore_214816006.apk | Out-Null
adb shell pm grant com.google.android.gms android.permission.INTERACT_ACROSS_USERS
adb shell pm grant com.google.android.gms android.permission.PACKAGE_USAGE_STATS
adb shell pm grant com.google.android.gms android.permission.GET_APP_OPS_STATS
adb shell pm grant com.google.android.gms android.permission.READ_LOGS
adb shell dpm set-active-admin --user 0 com.google.android.gms/.mdm.receivers.MdmDeviceAdminReceiver | Out-Null
Write-Output "�Google Play �X�g�A��̃C���X�g�[����..."
adb install .\assets\Phonesky_82791610.apk | Out-Null
adb shell pm grant com.android.vending android.permission.PACKAGE_USAGE_STATS
adb shell pm grant com.android.vending android.permission.BATTERY_STATS
adb shell pm grant com.android.vending android.permission.DUMP
adb shell pm grant com.android.vending android.permission.GET_APP_OPS_STATS
adb shell pm grant com.android.vending android.permission.INTERACT_ACROSS_USERS
adb shell pm grant com.android.vending android.permission.WRITE_SECURE_SETTINGS
Write-Output "Google�A�J�E���g�ւ̃��O�C���Z�b�V�����𗧂��グ�Ă��܂�..."
adb shell am start com.android.settings/.accounts.AddAccountSettings | Out-Null
Clear-Host
Write-Output "���O�C����Enter�������čċN�����ĉ������"
Read-Host "���̓X�L�b�v���鎖���\�ł��"
adb reboot
Clear-Host
Read-Host "�N��������Enter�������đ��s���ĉ������"
Clear-Host
adb shell am start -n com.android.settings/.applications.ManageApplications | Out-Null
Write-Output "�Nova Launcher��̃C���X�g�[����..."
adb install .\assets\NovaLauncher_62019.apk | Out-Null
adb shell pm grant com.teslacoilsw.launcher android.permission.WRITE_SECURE_SETTINGS
adb shell appwidget grantbind --user 0 --package com.teslacoilsw.launcher
adb shell dpm set-active-admin --user 0 com.teslacoilsw.launcher/.NovaDeviceAdminReceiver | Out-Null
if ($(Test-Path .\assets\NovaLauncherPrime_2019.apk) -Eq "True") {
    Write-Output "�Nova Launcher Prime��̃C���X�g�[����..."
    adb install .\assets\NovaLauncherPrime_2019.apk | Out-Null
}
Write-Output "������`���[��̃A���C���X�g�[����..."
adb shell am force-stop --user 0 com.android.launcher
adb shell pm uninstall --user 0  com.android.launcher | Out-Null
Write-Output "��ǎ���̃C���X�g�[����..."
adb install .\assets\GoogleWallpapers_169416333.apk | Out-Null
adb shell dpm set-active-admin --user 0 com.google.android.gms/.auth.managed.admin.DeviceAdminReceiver | Out-Null
Write-Output "�Android System WebView��̃A�b�v�f�[�g��..."
adb install -r .\assets\WebViewGoogle_457708200.apk | Out-Null
Write-Output "�Chrome��̃C���X�g�[����..."
adb install .\assets\Chrome_457708210.apk | Out-Null
Write-Output "�YouTube��̃C���X�g�[����..."
adb install .\assets\YouTube_1523705280.apk | Out-Null
Write-Output "�Files by Google��̃C���X�g�[����..."
adb install .\assets\Files_381346.apk | Out-Null
adb shell pm grant com.google.android.apps.nbu.files android.permission.PACKAGE_USAGE_STATS
Clear-Host
Write-Output "��A�v���X�g�A��̃C���X�g�[����..."
adb install .\assets\OtherSources\Amazon_App.apk | Out-Null
adb shell pm grant com.amazon.venezia android.permission.READ_LOGS
adb shell pm grant com.amazon.venezia android.permission.PACKAGE_USAGE_STATS
Clear-Host
if ($keepSysApps -Eq 1) {
    Write-Output "Google�̑�փA�v�����C���X�g�[������ɂͤ"
    [STRING]$instGApps = Read-Host '"yes"�Ɠ��͂���Enter�������ĉ������'
}
Clear-Host
if (($instGApps -Eq "yes") -Or ($keepSysApps -Eq 0)) {
    $keepSysApps = 0
    Write-Output "�Google��̃C���X�g�[����..."    
    adb install .\assets\Options\Velvet_301110166.apk | Out-Null
    adb shell pm grant com.google.android.googlequicksearchbox android.permission.PACKAGE_USAGE_STATS
    Write-Output "��A������̃C���X�g�[����..."
    adb install .\assets\Options\GoogleContacts_2232480.apk | Out-Null
    Write-Output "��J������̃C���X�g�[����..."
    adb install .\assets\Options\GoogleCamera_27010130.apk | Out-Null
    Write-Output "��J�����_�[��̃C���X�g�[����..."
    adb install .\assets\Options\CalendarGoogle_2017053514.apk | Out-Null
    Write-Output "��t�H�g��̃C���X�g�[����..."
    adb install .\assets\Options\Photos_41798810.apk | Out-Null
    Write-Output "�YouTube Music��̃C���X�g�[����..."
    adb install .\assets\Options\YouTubeMusic_46052230.apk | Out-Null
    Write-Output "����v��̃C���X�g�[����..."
    adb install .\assets\Options\GoogleClock_62101012.apk | Out-Null
    Write-Output "��d�죂̃C���X�g�[����..."
    adb install .\assets\Options\CalculatorGoogle_74100312.apk | Out-Null
}
Clear-Host
Write-Output "Nova Launcher�̐ݒ��ύX��..."
if (($keepSysApps -Eq 1) -And ($(adb devices -l) -Like "*TAB-A03-BR*")) {
    adb push .\assets\Sys_BR.novabackup /sdcard/Download/ | Out-Null
} elseif (($keepSysApps -Eq 0) -And ($(adb devices -l) -Like "*TAB-A03-BR*")) {
    adb push .\assets\Cus_BR.novabackup /sdcard/Download/ | Out-Null | Out-Null
} elseif ($keepSysApps -Eq 1) {
    adb push .\assets\Sys.novabackup /sdcard/Download/ | Out-Null
} elseif ($keepSysApps -Eq 0) {
    adb push .\assets\Cus.novabackup /sdcard/Download/ | Out-Null
}
adb shell am start -n com.teslacoilsw.launcher/.preferences.SettingsActivity | Out-Null
Sleep 1
adb shell input tap 30 620
adb shell input tap 30 180
adb shell input tap 415 455
adb shell input tap 1140 100
adb shell input tap 1140 100
adb shell input tap 250 260
adb shell input tap 480 350
adb shell input tap 480 160
adb shell input tap 860 440
Sleep 1
adb shell am force-stop com.teslacoilsw.launcher
adb shell am start -n com.teslacoilsw.launcher/.preferences.SettingsActivity | Out-Null
Sleep 1
adb shell input tap 30 620
adb shell input tap 30 180
adb shell input tap 415 455
adb shell input tap 480 160
adb shell input tap 860 440
adb shell rm /sdcard/Download/*.novabackup
if ($instCusTool -Eq 1) {
    Start-Process https://ctabwiki.nerrog.net/?%E3%83%81%E3%83%A3%E3%83%AC%E3%83%B3%E3%82%B8%E3%83%91%E3%83%83%E3%83%89%E7%B7%8F%E5%90%88%E3%82%AB%E3%82%B9%E3%82%BF%E3%83%9E%E3%82%A4%E3%82%BA%E3%83%84%E3%83%BC%E3%83%AB
    Write-Output "�CPad Customize Tool���DL&�C���X�g�[����..."
    Invoke-WebRequest -Uri https://raw.githubusercontent.com/Kobold831/Server/main/CPadCustomizeTool_Update.xml -OutFile .\assets\Options\CPadCustomizeTool_Update.xml
    $code = [XML](Get-Content .\assets\Options\CPadCustomizeTool_Update.xml)
    $ver = $code.update.versionCode
    $url = $code.update.url
    Invoke-WebRequest $url -OutFile .\assets\Options\CPadCustomizeTool_$ver.apk | Out-Null
    adb install .\assets\Options\CPadCustomizeTool_$ver.apk | Out-Null
    adb shell pm grant com.saradabar.cpadcustomizetool android.permission.WRITE_SECURE_SETTINGS
    adb shell dpm set-device-owner com.saradabar.cpadcustomizetool/.Receiver.AdministratorReceiver | Out-Null
}
Write-Output "���̑����X�̐ݒ�𕜌���..."
adb shell settings put global stay_on_while_plugged_in 0
adb shell settings put system accelerometer_rotation 1
adb shell am start -n com.google.android.apps.wallpaper/.picker.CategoryPickerActivity | Out-Null
Clear-Host
Write-Output "�S�Ă̏������������܂����I"
Write-Output "��͕ǎ���ݒ肵�ďI���ł��I"
Write-Output ""
$end = Read-Host "Enter�ŏI��"
if ($end -Eq "reboot") {
    adb reboot
} elseif ($end -Eq "recovery") {
    adb reboot recovery
} elseif ($end -Eq "abandon") {
    # Require: DchaSystemSettings
    # If you execute this, CPad2 will be really unusable.
    adb shell settings put system dcha_state 1
    adb shell am start -n jp.co.benesse.dcha.systemsettings/.AbandonSettingActivity
}
adb kill-server
Clear-Host
exit 0