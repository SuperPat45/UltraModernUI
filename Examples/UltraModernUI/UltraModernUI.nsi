; o----------------------------------------o
; | NSIS Ultra-Modern User Interface 2.0b4 |
; (----------------------------------------)
; | Installer script.                      |
; | Written by SyperPat                    |
; o----------------------------------------o

;--------------------------------
;General

  !define /date NOW "%Y-%m-%d"
  !define NAME "UltraModernUI"

  ; For language file selection
  !define VER_MAJOR 3
  !define VER_MINOR 03
  !define VER_REV_STR ""

  !if "${NSIS_VERSION}" != "v${VER_MAJOR}.${VER_MINOR}${VER_REV_STR}"
    !error "VER_MAJOR, VER_MINOR and VER_REV_STR defines does not match the current NSIS version: ${NSIS_VERSION}"
  !endif

  !define UMUI_VERSION "2.0b4"
  !define UMUI_VERBUILD "2.0_${NOW}"

  !define /date VERIPV "200.%Y.%m.%d"
  VIProductVersion "${VERIPV}"
  VIAddVersionKey ProductName "Ultra-Modern User Interface for NSIS (Nullsoft Scriptable Install System) version 3 x86 edition."
  VIAddVersionKey ProductVersion "${UMUI_VERSION}"
  VIAddVersionKey Comments "A new User Interface for NSIS with a style like the most recent installers. This package also include some plugins used by UMUI to extend the possibilities of NSIS."
  VIAddVersionKey LegalTrademarks "UltraModernUI is released under the zlib/libpng license: http://nsis.sf.net/License"
  VIAddVersionKey LegalCopyright "Copyright � 2005-2018 SuperPat"
  VIAddVersionKey FileDescription "Ultra-Modern User Interface for NSIS (Nullsoft Scriptable Install System) version 3 x86 edition."
  VIAddVersionKey FileVersion "${UMUI_VERBUILD}"


;--------------------------------
;Configuration

  ; The name of the installer
  Name "NSIS Ultra-Modern User Interface ${UMUI_VERSION}"

  ; The file to write
  OutFile "UltraModernUI_${UMUI_VERSION}.exe"

  ;Generate unicode installer
  Unicode True

  SetCompressor /FINAL /SOLID lzma

  ;Windows vista compatibility
  RequestExecutionLevel admin

  BrandingText "$(^NameDA)"

  ;Default installation folder
  InstallDir "$PROGRAMFILES\NSIS"


;--------------------------------
;Include UltraModernUI between others

  !include "UMUI.nsh"

  !include "Sections.nsh"


;--------------------------------
;Interface Settings

  !define UMUI_SKIN "blue"

  !define UMUI_USE_INSTALLOPTIONSEX

  !define MUI_ABORTWARNING
  !define MUI_UNABORTWARNING

  !define UMUI_PAGEBGIMAGE
  !define UMUI_UNPAGEBGIMAGE

  !define UMUI_USE_ALTERNATE_PAGE ; For Welcome finish abort pages
  !define UMUI_USE_UNALTERNATE_PAGE

  !define MUI_COMPONENTSPAGE_SMALLDESC

  !define UMUI_DEFAULT_SHELLVARCONTEXT all

  !define UMUI_ENABLE_DESCRIPTION_TEXT

;--------------------------------
;Registry Settings

  !define UMUI_PARAMS_REGISTRY_ROOT HKLM
  !define UMUI_PARAMS_REGISTRY_KEY "Software\NSIS"

  !define UMUI_LANGUAGE_REGISTRY_VALUENAME "UMUI_InstallerLanguage"
  !define UMUI_SHELLVARCONTEXT_REGISTRY_VALUENAME "UMUI_ShellVarContext"

  !define UMUI_UNINSTALLPATH_REGISTRY_VALUENAME "UMUI_UninstallPath"
  !define UMUI_UNINSTALL_FULLPATH "$INSTDIR\UninstallUMUI.exe"
  !define UMUI_INSTALLERFULLPATH_REGISTRY_VALUENAME "UMUI_InstallPath"

  !define UMUI_VERSION_REGISTRY_VALUENAME "UMUI_Version"
  !define UMUI_VERBUILD_REGISTRY_VALUENAME "UMUI_VerBuild"

  !define UMUI_PREUNINSTALL_FUNCTION preuninstall_function

  InstallDirRegKey ${UMUI_PARAMS_REGISTRY_ROOT} "${UMUI_PARAMS_REGISTRY_KEY}" ""

;--------------------------------
;Reserve Files

  !insertmacro MUI_RESERVEFILE_INSTALLOPTIONS


;--------------------------------
;Pages

  Var STARTMENU_FOLDER


  !insertmacro UMUI_PAGE_MULTILANGUAGE

    !define UMUI_MAINTENANCEPAGE_MODIFY
    !define UMUI_MAINTENANCEPAGE_REPAIR
    !define UMUI_MAINTENANCEPAGE_REMOVE
    !define UMUI_MAINTENANCEPAGE_CONTINUE_SETUP
  !insertmacro UMUI_PAGE_MAINTENANCE

    !define UMUI_UPDATEPAGE_REMOVE
    !define UMUI_UPDATEPAGE_CONTINUE_SETUP
  !insertmacro UMUI_PAGE_UPDATE

    !define UMUI_WELCOMEPAGE_ALTERNATIVETEXT
  !insertmacro MUI_PAGE_WELCOME

    !define MUI_LICENSEPAGE_CHECKBOX
  !insertmacro MUI_PAGE_LICENSE "${NSISDIR}\Docs\UltraModernUI\License.txt"

    !define UMUI_INFORMATIONPAGE_USE_RICHTEXTFORMAT
  !insertmacro UMUI_PAGE_INFORMATION "${NSISDIR}\Docs\UltraModernUI\ReadMe.rtf"

    !define UMUI_SETUPTYPEPAGE_MINIMAL "$(UMUI_TEXT_SETUPTYPE_MINIMAL_TITLE)"
    !define UMUI_SETUPTYPEPAGE_STANDARD "$(UMUI_TEXT_SETUPTYPE_STANDARD_TITLE)"
    !define UMUI_SETUPTYPEPAGE_COMPLETE "$(UMUI_TEXT_SETUPTYPE_COMPLETE_TITLE)"
    !define UMUI_SETUPTYPEPAGE_DEFAULTCHOICE ${UMUI_COMPLETE}
    !define UMUI_SETUPTYPEPAGE_REGISTRY_VALUENAME "UMUI_SetupType"
  !insertmacro UMUI_PAGE_SETUPTYPE

    !define UMUI_COMPONENTSPAGE_INSTTYPE_REGISTRY_VALUENAME "UMUI_InstType"
    !define UMUI_COMPONENTSPAGE_REGISTRY_VALUENAME "UMUI_Components"
  !insertmacro MUI_PAGE_COMPONENTS

    !define UMUI_ALTERNATIVESTARTMENUPAGE_SETSHELLVARCONTEXT
    !define UMUI_ALTERNATIVESTARTMENUPAGE_USE_TREEVIEW
    !define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "UMUI_StartMenuFolder"
    !define MUI_STARTMENUPAGE_DEFAULTFOLDER "NSIS\Contrib"
  !insertmacro UMUI_PAGE_ALTERNATIVESTARTMENU Application $STARTMENU_FOLDER

    !define UMUI_CONFIRMPAGE_TEXTBOX confirm_function
  !insertmacro UMUI_PAGE_CONFIRM

  !insertmacro MUI_PAGE_INSTFILES

    !define MUI_FINISHPAGE_SHOWREADME "${NSISDIR}\Docs\UltraModernUI\Readme.html"
    !define MUI_FINISHPAGE_LINK "UltraModernUI Home Page"
    !define MUI_FINISHPAGE_LINK_LOCATION "http://ultramodernui.sourceforge.net/"
  !insertmacro MUI_PAGE_FINISH

    !define UMUI_ABORTPAGE_LINK "UltraModernUI Home Page"
    !define UMUI_ABORTPAGE_LINK_LOCATION "http://ultramodernui.sourceforge.net/"
  !insertmacro UMUI_PAGE_ABORT


  !insertmacro UMUI_UNPAGE_MULTILANGUAGE

    !define UMUI_MAINTENANCEPAGE_MODIFY
    !define UMUI_MAINTENANCEPAGE_REPAIR
    !define UMUI_MAINTENANCEPAGE_REMOVE
    !define UMUI_MAINTENANCEPAGE_CONTINUE_SETUP
  !insertmacro UMUI_UNPAGE_MAINTENANCE

  !insertmacro MUI_UNPAGE_WELCOME

  !insertmacro MUI_UNPAGE_CONFIRM

  !insertmacro MUI_UNPAGE_INSTFILES

    !define MUI_FINISHPAGE_LINK "UltraModernUI Home Page"
    !define MUI_FINISHPAGE_LINK_LOCATION "http://ultramodernui.sourceforge.net/"
  !insertmacro MUI_UNPAGE_FINISH

    !define UMUI_ABORTPAGE_LINK "UltraModernUI Home Page"
    !define UMUI_ABORTPAGE_LINK_LOCATION "http://ultramodernui.sourceforge.net/"
  !insertmacro UMUI_UNPAGE_ABORT


;--------------------------------
;Languages

; first language is the default language if the system language is not in this list
  !insertmacro MUI_LANGUAGE "English"

; Other UMUI translated languages
  !insertmacro MUI_LANGUAGE "Bulgarian"
  !insertmacro MUI_LANGUAGE "Czech"
  !insertmacro MUI_LANGUAGE "French"
  !insertmacro MUI_LANGUAGE "German"
  !insertmacro MUI_LANGUAGE "Greek"
  !insertmacro MUI_LANGUAGE "Hungarian"
  !insertmacro MUI_LANGUAGE "Italian"
  !insertmacro MUI_LANGUAGE "Japanese"
  !insertmacro MUI_LANGUAGE "Lithuanian"
  !insertmacro MUI_LANGUAGE "Polish"
  !insertmacro MUI_LANGUAGE "Russian"
  !insertmacro MUI_LANGUAGE "Slovenian"
  !insertmacro MUI_LANGUAGE "Spanish"
  !insertmacro MUI_LANGUAGE "Turkish"
; Other UMUI partially translated language
  !insertmacro MUI_LANGUAGE "PortugueseBR"

; Other untranslated languages but usable even so.
/*
  !insertmacro MUI_LANGUAGE "SpanishInternational"
  !insertmacro MUI_LANGUAGE "SimpChinese"
  !insertmacro MUI_LANGUAGE "TradChinese"
  !insertmacro MUI_LANGUAGE "Korean"
  !insertmacro MUI_LANGUAGE "Dutch"
  !insertmacro MUI_LANGUAGE "Danish"
  !insertmacro MUI_LANGUAGE "Swedish"
  !insertmacro MUI_LANGUAGE "Norwegian"
  !insertmacro MUI_LANGUAGE "NorwegianNynorsk"
  !insertmacro MUI_LANGUAGE "Finnish"
  !insertmacro MUI_LANGUAGE "Portuguese"
  !insertmacro MUI_LANGUAGE "Ukrainian"
  !insertmacro MUI_LANGUAGE "Slovak"
  !insertmacro MUI_LANGUAGE "Croatian"
  !insertmacro MUI_LANGUAGE "Thai"
  !insertmacro MUI_LANGUAGE "Romanian"
  !insertmacro MUI_LANGUAGE "Latvian"
  !insertmacro MUI_LANGUAGE "Macedonian"
  !insertmacro MUI_LANGUAGE "Estonian"
  !insertmacro MUI_LANGUAGE "Serbian"
  !insertmacro MUI_LANGUAGE "SerbianLatin"
  !insertmacro MUI_LANGUAGE "Arabic"
  !insertmacro MUI_LANGUAGE "Farsi"
  !insertmacro MUI_LANGUAGE "Hebrew"
  !insertmacro MUI_LANGUAGE "Indonesian"
  !insertmacro MUI_LANGUAGE "Mongolian"
  !insertmacro MUI_LANGUAGE "Luxembourgish"
  !insertmacro MUI_LANGUAGE "Albanian"
  !insertmacro MUI_LANGUAGE "Breton"
  !insertmacro MUI_LANGUAGE "Belarusian"
  !insertmacro MUI_LANGUAGE "Icelandic"
  !insertmacro MUI_LANGUAGE "Malay"
  !insertmacro MUI_LANGUAGE "Bosnian"
  !insertmacro MUI_LANGUAGE "Kurdish"
  !insertmacro MUI_LANGUAGE "Irish"
  !insertmacro MUI_LANGUAGE "Uzbek"
  !insertmacro MUI_LANGUAGE "Galician"
  !insertmacro MUI_LANGUAGE "Afrikaans"
  !insertmacro MUI_LANGUAGE "Catalan"
  !insertmacro MUI_LANGUAGE "Esperanto"
  !insertmacro MUI_LANGUAGE "Asturian"
  !insertmacro MUI_LANGUAGE "Basque"
  !insertmacro MUI_LANGUAGE "Pashto"
  !insertmacro MUI_LANGUAGE "ScotsGaelic"
  !insertmacro MUI_LANGUAGE "Vietnamese"
  !insertmacro MUI_LANGUAGE "Welsh"
  !insertmacro MUI_LANGUAGE "Corsican"
  !insertmacro MUI_LANGUAGE "Tatar"

; Other unicode only untranslated languages but usable even so.
  !insertmacro MUI_LANGUAGE "Georgian"
  !insertmacro MUI_LANGUAGE "Armenian"
*/

;--------------------------------
;Installer Types

InstType "$(UMUI_TEXT_SETUPTYPE_MINIMAL_TITLE)"
InstType "$(UMUI_TEXT_SETUPTYPE_STANDARD_TITLE)"
InstType "$(UMUI_TEXT_SETUPTYPE_COMPLETE_TITLE)"


;--------------------------------
;Installer Sections

Section "$(^NameDA)" SecUMUI

  SetDetailsPrint textonly
  DetailPrint "Installing UltraModernUI..."
  SetDetailsPrint listonly

  SectionIn RO

  SectionIn 1 2 3

  SetOutPath "$INSTDIR\Contrib\UltraModernUI\"
  File "..\..\Contrib\UltraModernUI\UMUI.nsh"
  SetOutPath "$INSTDIR\Contrib\UltraModernUI\Ini"
  File "..\..\Contrib\UltraModernUI\Ini\*.ini"
  SetOutPath "$INSTDIR\Contrib\UltraModernUI\Language files\"
  File "..\..\Contrib\UltraModernUI\Language files\*.nsh"

  SetOutPath "$INSTDIR\Contrib\UltraModernUI\Skins\"
  File "..\..\Contrib\UltraModernUI\Skins\blue.nsh"
  File "..\..\Contrib\UltraModernUI\Skins\blue2.nsh"
  SetOutPath "$INSTDIR\Contrib\UltraModernUI\Skins\blue\"
  File "..\..\Contrib\UltraModernUI\Skins\blue\*.bmp"

  SetOutPath "$INSTDIR\Docs\UltraModernUI\"
  File "..\..\Docs\UltraModernUI\*.*"
  SetOutPath "$INSTDIR\Docs\UltraModernUI\images\"
  File "..\..\Docs\UltraModernUI\images\*.png"
  File "..\..\Docs\UltraModernUI\images\*.gif"

  SetOutPath "$INSTDIR\Examples\UltraModernUI\"
  File "*.nsi"
  File "*.ini"
  File "*.txt"

  SetOutPath "$INSTDIR\Contrib\UIs\UltraModernUI\"
  File "..\..\Contrib\UIs\UltraModernUI\*.exe"

  SetOutPath "$INSTDIR\Contrib\Graphics\UltraModernUI\"
  File "..\..\Contrib\Graphics\UltraModernUI\*.*"

  SetOutPath "$INSTDIR\Include\"
  File "..\..\Include\UMUI.nsh"
  File "..\..\Include\MUIEx.nsh"

  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
     SetOutPath "$SMPROGRAMS\$STARTMENU_FOLDER\"
     CreateShortCut "$SMPROGRAMS\$STARTMENU_FOLDER\UltraModernUI Readme.lnk" "$INSTDIR\Docs\UltraModernUI\Readme.html"
     CreateShortCut "$SMPROGRAMS\$STARTMENU_FOLDER\Uninstall UltraModernUI.lnk" "$INSTDIR\UninstallUMUI.exe"
  !insertmacro MUI_STARTMENU_WRITE_END

  ;Create uninstaller
  WriteUninstaller "$INSTDIR\UninstallUMUI.exe"

  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "DisplayName" "$(^Name)"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "DisplayIcon" "$INSTDIR\UninstallUMUI.exe,0"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "UninstallString" "$INSTDIR\UninstallUMUI.exe"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "Publisher" "SuperPat"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "HelpLink" "http://ultramodernui.sourceforge.net/"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "URLInfoAbout" "http://ultramodernui.sourceforge.net/"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "URLUpdateInfo" "http://ultramodernui.sourceforge.net/"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "ModifyPath" '"$INSTDIR\UninstallUMUI.exe" /modify'
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "DisplayVersion" "${UMUI_VERSION}"

SectionEnd

Section "Skins for UltraModernUI" SecSkins

  SetDetailsPrint textonly
  DetailPrint "Installing UltraModernUI | Skins..."
  SetDetailsPrint listonly

  SectionIn 2 3

  SetOutPath "$INSTDIR\Contrib\UltraModernUI\Skins\"
  File "..\..\Contrib\UltraModernUI\Skins\brown.nsh"
  File "..\..\Contrib\UltraModernUI\Skins\brown2.nsh"
  SetOutPath "$INSTDIR\Contrib\UltraModernUI\Skins\brown\"
  File "..\..\Contrib\UltraModernUI\Skins\brown\*.bmp"

  SetOutPath "$INSTDIR\Contrib\UltraModernUI\Skins\"
  File "..\..\Contrib\UltraModernUI\Skins\darkgreen.nsh"
  File "..\..\Contrib\UltraModernUI\Skins\darkgreen2.nsh"
  SetOutPath "$INSTDIR\Contrib\UltraModernUI\Skins\darkgreen\"
  File "..\..\Contrib\UltraModernUI\Skins\darkgreen\*.bmp"

  SetOutPath "$INSTDIR\Contrib\UltraModernUI\Skins\"
  File "..\..\Contrib\UltraModernUI\Skins\gray.nsh"
  File "..\..\Contrib\UltraModernUI\Skins\gray2.nsh"
  SetOutPath "$INSTDIR\Contrib\UltraModernUI\Skins\gray\"
  File "..\..\Contrib\UltraModernUI\Skins\gray\*.bmp"

  SetOutPath "$INSTDIR\Contrib\UltraModernUI\Skins\"
  File "..\..\Contrib\UltraModernUI\Skins\green.nsh"
  File "..\..\Contrib\UltraModernUI\Skins\green2.nsh"
  SetOutPath "$INSTDIR\Contrib\UltraModernUI\Skins\green\"
  File "..\..\Contrib\UltraModernUI\Skins\green\*.bmp"

  SetOutPath "$INSTDIR\Contrib\UltraModernUI\Skins\"
  File "..\..\Contrib\UltraModernUI\Skins\purple.nsh"
  File "..\..\Contrib\UltraModernUI\Skins\purple2.nsh"
  SetOutPath "$INSTDIR\Contrib\UltraModernUI\Skins\purple\"
  File "..\..\Contrib\UltraModernUI\Skins\purple\*.bmp"

  SetOutPath "$INSTDIR\Contrib\UltraModernUI\Skins\"
  File "..\..\Contrib\UltraModernUI\Skins\red.nsh"
  File "..\..\Contrib\UltraModernUI\Skins\red2.nsh"
  SetOutPath "$INSTDIR\Contrib\UltraModernUI\Skins\red\"
  File "..\..\Contrib\UltraModernUI\Skins\red\*.bmp"

  SetOutPath "$INSTDIR\Contrib\UltraModernUI\Skins\"
  File "..\..\Contrib\UltraModernUI\Skins\SoftBlue.nsh"
  SetOutPath "$INSTDIR\Contrib\UltraModernUI\Skins\SoftBlue\"
  File "..\..\Contrib\UltraModernUI\Skins\SoftBlue\*.bmp"

  SetOutPath "$INSTDIR\Contrib\UltraModernUI\Skins\"
  File "..\..\Contrib\UltraModernUI\Skins\SoftBrown.nsh"
  SetOutPath "$INSTDIR\Contrib\UltraModernUI\Skins\SoftBrown\"
  File "..\..\Contrib\UltraModernUI\Skins\SoftBrown\*.bmp"

  SetOutPath "$INSTDIR\Contrib\UltraModernUI\Skins\"
  File "..\..\Contrib\UltraModernUI\Skins\SoftGray.nsh"
  SetOutPath "$INSTDIR\Contrib\UltraModernUI\Skins\SoftGray\"
  File "..\..\Contrib\UltraModernUI\Skins\SoftGray\*.bmp"

  SetOutPath "$INSTDIR\Contrib\UltraModernUI\Skins\"
  File "..\..\Contrib\UltraModernUI\Skins\SoftGreen.nsh"
  SetOutPath "$INSTDIR\Contrib\UltraModernUI\Skins\SoftGreen\"
  File "..\..\Contrib\UltraModernUI\Skins\SoftGreen\*.bmp"

  SetOutPath "$INSTDIR\Contrib\UltraModernUI\Skins\"
  File "..\..\Contrib\UltraModernUI\Skins\SoftPurple.nsh"
  SetOutPath "$INSTDIR\Contrib\UltraModernUI\Skins\SoftPurple\"
  File "..\..\Contrib\UltraModernUI\Skins\SoftPurple\*.bmp"

  SetOutPath "$INSTDIR\Contrib\UltraModernUI\Skins\"
  File "..\..\Contrib\UltraModernUI\Skins\SoftRed.nsh"
  SetOutPath "$INSTDIR\Contrib\UltraModernUI\Skins\SoftRed\"
  File "..\..\Contrib\UltraModernUI\Skins\SoftRed\*.bmp"

SectionEnd

Section "BackGround Skins for UltraModernUI" SecBGSkins

  SetDetailsPrint textonly
  DetailPrint "Installing UltraModernUI | BackGround Skins..."
  SetDetailsPrint listonly

  SectionIn 2 3

  SetOutPath "$INSTDIR\Contrib\UltraModernUI\BGSkins\"
  File "..\..\Contrib\UltraModernUI\BGSkins\blue.nsh"
  File "..\..\Contrib\UltraModernUI\BGSkins\blue2.nsh"
  SetOutPath "$INSTDIR\Contrib\UltraModernUI\BGSkins\blue\"
  File "..\..\Contrib\UltraModernUI\BGSkins\blue\*.bmp"

  SetOutPath "$INSTDIR\Contrib\UltraModernUI\BGSkins\"
  File "..\..\Contrib\UltraModernUI\BGSkins\brown.nsh"
  File "..\..\Contrib\UltraModernUI\BGSkins\brown2.nsh"
  SetOutPath "$INSTDIR\Contrib\UltraModernUI\BGSkins\brown\"
  File "..\..\Contrib\UltraModernUI\BGSkins\brown\*.bmp"

  SetOutPath "$INSTDIR\Contrib\UltraModernUI\BGSkins\"
  File "..\..\Contrib\UltraModernUI\BGSkins\darkgreen.nsh"
  File "..\..\Contrib\UltraModernUI\BGSkins\darkgreen2.nsh"
  SetOutPath "$INSTDIR\Contrib\UltraModernUI\BGSkins\darkgreen\"
  File "..\..\Contrib\UltraModernUI\BGSkins\darkgreen\*.bmp"

  SetOutPath "$INSTDIR\Contrib\UltraModernUI\BGSkins\"
  File "..\..\Contrib\UltraModernUI\BGSkins\gray.nsh"
  File "..\..\Contrib\UltraModernUI\BGSkins\gray2.nsh"
  SetOutPath "$INSTDIR\Contrib\UltraModernUI\BGSkins\gray\"
  File "..\..\Contrib\UltraModernUI\BGSkins\gray\*.bmp"

  SetOutPath "$INSTDIR\Contrib\UltraModernUI\BGSkins\"
  File "..\..\Contrib\UltraModernUI\BGSkins\green.nsh"
  File "..\..\Contrib\UltraModernUI\BGSkins\green2.nsh"
  SetOutPath "$INSTDIR\Contrib\UltraModernUI\BGSkins\green\"
  File "..\..\Contrib\UltraModernUI\BGSkins\green\*.bmp"

  SetOutPath "$INSTDIR\Contrib\UltraModernUI\BGSkins\"
  File "..\..\Contrib\UltraModernUI\BGSkins\purple.nsh"
  File "..\..\Contrib\UltraModernUI\BGSkins\purple2.nsh"
  SetOutPath "$INSTDIR\Contrib\UltraModernUI\BGSkins\purple\"
  File "..\..\Contrib\UltraModernUI\BGSkins\purple\*.bmp"

  SetOutPath "$INSTDIR\Contrib\UltraModernUI\BGSkins\"
  File "..\..\Contrib\UltraModernUI\BGSkins\red.nsh"
  File "..\..\Contrib\UltraModernUI\BGSkins\red2.nsh"
  SetOutPath "$INSTDIR\Contrib\UltraModernUI\BGSkins\red\"
  File "..\..\Contrib\UltraModernUI\BGSkins\red\*.bmp"

  SetOutPath "$INSTDIR\Contrib\UltraModernUI\BGSkins\"
  File "..\..\Contrib\UltraModernUI\BGSkins\SoftBlue.nsh"
  SetOutPath "$INSTDIR\Contrib\UltraModernUI\BGSkins\SoftBlue\"
  File "..\..\Contrib\UltraModernUI\BGSkins\SoftBlue\*.bmp"

  SetOutPath "$INSTDIR\Contrib\UltraModernUI\BGSkins\"
  File "..\..\Contrib\UltraModernUI\BGSkins\SoftBrown.nsh"
  SetOutPath "$INSTDIR\Contrib\UltraModernUI\BGSkins\SoftBrown\"
  File "..\..\Contrib\UltraModernUI\BGSkins\SoftBrown\*.bmp"

  SetOutPath "$INSTDIR\Contrib\UltraModernUI\BGSkins\"
  File "..\..\Contrib\UltraModernUI\BGSkins\SoftGray.nsh"
  SetOutPath "$INSTDIR\Contrib\UltraModernUI\BGSkins\SoftGray\"
  File "..\..\Contrib\UltraModernUI\BGSkins\SoftGray\*.bmp"

  SetOutPath "$INSTDIR\Contrib\UltraModernUI\BGSkins\"
  File "..\..\Contrib\UltraModernUI\BGSkins\SoftGreen.nsh"
  SetOutPath "$INSTDIR\Contrib\UltraModernUI\BGSkins\SoftGreen\"
  File "..\..\Contrib\UltraModernUI\BGSkins\SoftGreen\*.bmp"

  SetOutPath "$INSTDIR\Contrib\UltraModernUI\BGSkins\"
  File "..\..\Contrib\UltraModernUI\BGSkins\SoftPurple.nsh"
  SetOutPath "$INSTDIR\Contrib\UltraModernUI\BGSkins\SoftPurple\"
  File "..\..\Contrib\UltraModernUI\BGSkins\SoftPurple\*.bmp"

  SetOutPath "$INSTDIR\Contrib\UltraModernUI\BGSkins\"
  File "..\..\Contrib\UltraModernUI\BGSkins\SoftRed.nsh"
  SetOutPath "$INSTDIR\Contrib\UltraModernUI\BGSkins\SoftRed\"
  File "..\..\Contrib\UltraModernUI\BGSkins\SoftRed\*.bmp"

SectionEnd


SectionGroup /e "Plugins" SecGroupPlugins

  Section "SkinnedControls plugin version 1.4" SecSkinnedControls

    SetDetailsPrint textonly
    DetailPrint "Installing UltraModernUI | Plugins | SkinnedControls..."
    SetDetailsPrint listonly

    SectionIn RO

    SectionIn 1 2 3

    SetOutPath $INSTDIR\Plugins\x86-ansi
    File "..\..\Plugins\x86-ansi\SkinnedControls.dll"

    SetOutPath $INSTDIR\Plugins\x86-unicode
    File "..\..\Plugins\x86-unicode\SkinnedControls.dll"

    SetOutPath $INSTDIR\Examples\SkinnedControls
    File "..\SkinnedControls\*.nsi"

    SetOutPath $INSTDIR\Contrib\SkinnedControls\skins
    File "..\..\Contrib\SkinnedControls\skins\*.bmp"

    SetOutPath $INSTDIR\Contrib\UIs
    File "..\..\Contrib\UIs\modern_sb.exe"
    File "..\..\Contrib\UIs\default_sb.exe"

    SetOutPath $INSTDIR\Docs\SkinnedControls
    File "..\..\Docs\SkinnedControls\*.*"
    SetOutPath "$INSTDIR\Docs\SkinnedControls\images\"
    File "..\..\Docs\SkinnedControls\images\*.png"
    File "..\..\Docs\SkinnedControls\images\*.gif"

    !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
       SetOutPath "$SMPROGRAMS\$STARTMENU_FOLDER\"

       CreateShortCut "$SMPROGRAMS\$STARTMENU_FOLDER\SkinnedControls Readme.lnk" "$INSTDIR\Docs\SkinnedControls\Readme.html"
    !insertmacro MUI_STARTMENU_WRITE_END

  SectionEnd

  Section "SkinnedControls plugin Sources Code" SecSkinnedControlsSources

    SetDetailsPrint textonly
    DetailPrint "Installing UltraModernUI | Plugins | SkinnedControls Soucres Code..."
    SetDetailsPrint listonly

    SectionIn 3

    SetOutPath $INSTDIR\Contrib\SkinnedControls
    File "..\..\Contrib\SkinnedControls\*.h"
    File "..\..\Contrib\SkinnedControls\*.c"
    File "..\..\Contrib\SkinnedControls\SkinnedControls.sln"
    File "..\..\Contrib\SkinnedControls\SkinnedControls.vcproj"
    SetOutPath $INSTDIR\Contrib\SkinnedControls\coolsb
    File "..\..\Contrib\SkinnedControls\coolsb\*.h"
    File "..\..\Contrib\SkinnedControls\coolsb\*.c"
    File "..\..\Contrib\SkinnedControls\coolsb\detours.lib"
    File "..\..\Contrib\SkinnedControls\coolsb\coolsb.vcproj"

  SectionEnd


  Section "InstallOptionsEx plugin version 2.4.5 beta 3" SecInstallOptionsEx

    SetDetailsPrint textonly
    DetailPrint "Installing UltraModernUI | Plugins | InstallOptionsEx..."
    SetDetailsPrint listonly

    SectionIn 2 3

    SetOutPath $INSTDIR\Plugins\x86-ansi
    File "..\..\Plugins\x86-ansi\InstallOptionsEx.dll"

    SetOutPath $INSTDIR\Plugins\x86-unicode
    File "..\..\Plugins\x86-unicode\InstallOptionsEx.dll"

    SetOutPath $INSTDIR\Examples\InstallOptionsEx
    File "..\InstallOptionsEx\*.nsi"
    File "..\InstallOptionsEx\*.ini"

    SetOutPath $INSTDIR\Docs\InstallOptionsEx
    File "..\..\Docs\InstallOptionsEx\*.*"

    !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
      SetOutPath "$SMPROGRAMS\$STARTMENU_FOLDER\Contrib\"
      CreateShortCut "$SMPROGRAMS\$STARTMENU_FOLDER\Contrib\InstallOptionsEx Readme.lnk" "$INSTDIR\Docs\InstallOptionsEx\Readme.html"
    !insertmacro MUI_STARTMENU_WRITE_END

  SectionEnd

  Section "InstallOptionsEx plugin Sources Code" SecInstallOptionsExSources

    SetDetailsPrint textonly
    DetailPrint "Installing UltraModernUI | Plugins | InstallOptionsEx Soucres Code..."
    SetDetailsPrint listonly

    SectionIn 3

    SetOutPath $INSTDIR\Contrib\InstallOptionsEx
    File "..\..\Contrib\InstallOptionsEx\*.cpp"
    File "..\..\Contrib\InstallOptionsEx\*.c"
    File "..\..\Contrib\InstallOptionsEx\*.h"
    File "..\..\Contrib\InstallOptionsEx\ioptdll.rc"
    File "..\..\Contrib\InstallOptionsEx\io.sln"
    File "..\..\Contrib\InstallOptionsEx\io.vcproj"
    SetOutPath $INSTDIR\Contrib\InstallOptionsEx\Controls
    File "..\..\Contrib\InstallOptionsEx\Controls\*.h"

  SectionEnd


  Section "nsArray plugin version 1.1.1.7" SecnsArray

    SetDetailsPrint textonly
    DetailPrint "Installing UltraModernUI | Plugins | nsArray..."
    SetDetailsPrint listonly

    SectionIn 2 3

    SetOutPath $INSTDIR\Plugins\x86-ansi
    File "..\..\Plugins\x86-ansi\nsArray.dll"

    SetOutPath $INSTDIR\Plugins\x86-unicode
    File "..\..\Plugins\x86-unicode\nsArray.dll"

    SetOutPath $INSTDIR\Include
    File "..\..\Include\nsArray.nsh"

    SetOutPath $INSTDIR\Docs\nsArray
    File "..\..\Docs\nsArray\*.*"

    SetOutPath $INSTDIR\Examples\nsArray
    File "..\nsArray\*.nsi"

    !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
      SetOutPath "$SMPROGRAMS\$STARTMENU_FOLDER\"
      CreateShortCut "$SMPROGRAMS\$STARTMENU_FOLDER\nsArray Readme.lnk" "$INSTDIR\Docs\nsArray\Readme.txt"
    !insertmacro MUI_STARTMENU_WRITE_END

  SectionEnd

  Section "nsArray plugin Sources Code" SecnsArraySources

    SetDetailsPrint textonly
    DetailPrint "Installing UltraModernUI | Plugins | nsArray Soucres Code..."
    SetDetailsPrint listonly

    SectionIn 3

    SetOutPath $INSTDIR\Contrib\nsArray
    File "..\..\Contrib\nsArray\*.*"

  SectionEnd

SectionGroupEnd


Section "Updated Languages Files from NSIS ${NSIS_VERSION}" SecNSISLanguagesFiles

  SetDetailsPrint textonly
  DetailPrint "Installing Updated Languages Files from NSIS ${NSIS_VERSION}..."
  SetDetailsPrint listonly

  SectionIn 3

  SetOutPath "$INSTDIR\Contrib\Language files"
  File "..\..\Contrib\Language files\*.nsh"

  SetOutPath "$INSTDIR\Contrib\Language files"
  File "..\..\Contrib\Language files\*.nlf"

SectionEnd

;--------------------------------
;Uninstall Section(s)

!macro removeUMUIfiles

  ;uninstall SkinnedControls Plugin
  Delete "$INSTDIR\Plugins\x86-ansi\SkinnedControls.dll"
  Delete "$INSTDIR\Plugins\x86-unicode\SkinnedControls.dll"
  Delete "$INSTDIR\Contrib\UIs\modern_sb.exe"
  Delete "$INSTDIR\Contrib\UIs\default_sb.exe"
  RMDir /r "$INSTDIR\Contrib\SkinnedControls"
  Delete "$INSTDIR\Docs\SkinnedControls\*.*"
  RMDir "$INSTDIR\Docs\SkinnedControls"
  Delete "$INSTDIR\Examples\SkinnedControls\*.nsi"
  RMDir "$INSTDIR\Examples\SkinnedControls"

  ;uninstall InstallOptionsEx Plugin
  Delete "$INSTDIR\Plugins\x86-ansi\InstallOptionsEx.dll"
  Delete "$INSTDIR\Plugins\x86-unicode\InstallOptionsEx.dll"
  RMDir /r "$INSTDIR\Contrib\InstallOptionsEx"
  Delete "$INSTDIR\Docs\InstallOptionsEx\*.*"
  RMDir "$INSTDIR\Docs\InstallOptionsEx"
  Delete "$INSTDIR\Examples\InstallOptionsEx\*.*"
  RMDir "$INSTDIR\Examples\InstallOptionsEx"

  ;uninstall nsArray Plugin
  Delete "$INSTDIR\Plugins\x86-ansi\nsArray.dll"
  Delete "$INSTDIR\Plugins\x86-unicode\nsArray.dll"
  Delete "$INSTDIR\Include\nsArray.nsh"
  Delete "$INSTDIR\Contrib\nsArray\*.*"
  RMDir "$INSTDIR\Contrib\nsArray"
  Delete "$INSTDIR\Docs\nsArray\*.*"
  RMDir "$INSTDIR\Docs\nsArray"
  Delete "$INSTDIR\Examples\nsArray\*.nsi"
  RMDir "$INSTDIR\Examples\nsArray"

  ;uninstall NSISArray Plugin
  IfFileExists $INSTDIR\Plugins\NSISArray.dll "" noNSISArray
    Delete "$INSTDIR\Plugins\NSISArray*.dll"
    Delete "$INSTDIR\Include\NSISArray.nsh"
    Delete "$INSTDIR\Contrib\NSISArray\*.*"
    RMDir "$INSTDIR\Contrib\NSISArray"
    Delete "$INSTDIR\Docs\NSISArray\*.*"
    RMDir "$INSTDIR\Docs\NSISArray"
    Delete "$INSTDIR\Examples\NSISArray\*.nsi"
    RMDir "$INSTDIR\Examples\NSISArray"
    Delete "$SMPROGRAMS\$STARTMENU_FOLDER\NSISArray Readme.lnk"
  noNSISArray:

  Delete "$INSTDIR\Include\UMUI.nsh"
  Delete "$INSTDIR\Include\MUIEx.nsh"
  RMDir "$INSTDIR\Include"

  Delete "$INSTDIR\Contrib\UltraModernUI\Ini\AdditionalTasks.ini"
  Delete "$INSTDIR\Contrib\UltraModernUI\Ini\AlternateWelcomeFinishAbort.ini"
  Delete "$INSTDIR\Contrib\UltraModernUI\Ini\AlternateWelcomeFinishAbortImage.ini"
  Delete "$INSTDIR\Contrib\UltraModernUI\Ini\AlternativeStartMenu.ini"
  Delete "$INSTDIR\Contrib\UltraModernUI\Ini\AlternativeStartMenuApplication.ini"
  Delete "$INSTDIR\Contrib\UltraModernUI\Ini\Confirm.ini"
  Delete "$INSTDIR\Contrib\UltraModernUI\Ini\Information.ini"
  Delete "$INSTDIR\Contrib\UltraModernUI\Ini\ioSpecial.ini"
  Delete "$INSTDIR\Contrib\UltraModernUI\Ini\Maintenance.ini"
  Delete "$INSTDIR\Contrib\UltraModernUI\Ini\MaintenanceSetupType.ini"
  Delete "$INSTDIR\Contrib\UltraModernUI\Ini\MaintenanceUpdateSetupType.ini"
  Delete "$INSTDIR\Contrib\UltraModernUI\Ini\SerialNumber.ini"
  Delete "$INSTDIR\Contrib\UltraModernUI\Ini\WelcomeFinishAbort.ini"
  Delete "$INSTDIR\Contrib\UltraModernUI\Ini\WelcomeFinishAbortImage.ini"
  RMDir "$INSTDIR\Contrib\UltraModernUI\Ini"

  RMDir /r "$INSTDIR\Contrib\UltraModernUI\BGSkins\blue"
  RMDir /r "$INSTDIR\Contrib\UltraModernUI\BGSkins\brown"
  RMDir /r "$INSTDIR\Contrib\UltraModernUI\BGSkins\darkgreen"
  RMDir /r "$INSTDIR\Contrib\UltraModernUI\BGSkins\gray"
  RMDir /r "$INSTDIR\Contrib\UltraModernUI\BGSkins\green"
  RMDir /r "$INSTDIR\Contrib\UltraModernUI\BGSkins\purple"
  RMDir /r "$INSTDIR\Contrib\UltraModernUI\BGSkins\red"
  RMDir /r "$INSTDIR\Contrib\UltraModernUI\BGSkins\SoftBlue"
  RMDir /r "$INSTDIR\Contrib\UltraModernUI\BGSkins\SoftBrown"
  RMDir /r "$INSTDIR\Contrib\UltraModernUI\BGSkins\SoftGray"
  RMDir /r "$INSTDIR\Contrib\UltraModernUI\BGSkins\SoftGreen"
  RMDir /r "$INSTDIR\Contrib\UltraModernUI\BGSkins\SoftPurple"
  RMDir /r "$INSTDIR\Contrib\UltraModernUI\BGSkins\SoftRed"
  Delete "$INSTDIR\Contrib\UltraModernUI\BGSkins\blue2.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\BGSkins\blue.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\BGSkins\brown2.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\BGSkins\brown.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\BGSkins\darkgreen2.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\BGSkins\darkgreen.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\BGSkins\gray2.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\BGSkins\gray.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\BGSkins\green2.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\BGSkins\green.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\BGSkins\purple2.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\BGSkins\purple.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\BGSkins\red2.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\BGSkins\red.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\BGSkins\SoftBlue.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\BGSkins\SoftBrown.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\BGSkins\SoftGray.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\BGSkins\SoftGreen.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\BGSkins\SoftPurple.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\BGSkins\SoftRed.nsh"
  RMDir "$INSTDIR\Contrib\UltraModernUI\BGSkins"

  RMDir /r "$INSTDIR\Contrib\UltraModernUI\Skins\blue"
  RMDir /r "$INSTDIR\Contrib\UltraModernUI\Skins\brown"
  RMDir /r "$INSTDIR\Contrib\UltraModernUI\Skins\darkgreen"
  RMDir /r "$INSTDIR\Contrib\UltraModernUI\Skins\gray"
  RMDir /r "$INSTDIR\Contrib\UltraModernUI\Skins\green"
  RMDir /r "$INSTDIR\Contrib\UltraModernUI\Skins\purple"
  RMDir /r "$INSTDIR\Contrib\UltraModernUI\Skins\red"
  RMDir /r "$INSTDIR\Contrib\UltraModernUI\Skins\SoftBlue"
  RMDir /r "$INSTDIR\Contrib\UltraModernUI\Skins\SoftBrown"
  RMDir /r "$INSTDIR\Contrib\UltraModernUI\Skins\SoftGray"
  RMDir /r "$INSTDIR\Contrib\UltraModernUI\Skins\SoftGreen"
  RMDir /r "$INSTDIR\Contrib\UltraModernUI\Skins\SoftPurple"
  RMDir /r "$INSTDIR\Contrib\UltraModernUI\Skins\SoftRed"
  Delete "$INSTDIR\Contrib\UltraModernUI\Skins\blue2.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\Skins\blue.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\Skins\brown2.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\Skins\brown.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\Skins\darkgreen2.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\Skins\darkgreen.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\Skins\gray2.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\Skins\gray.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\Skins\green2.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\Skins\green.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\Skins\purple2.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\Skins\purple.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\Skins\red2.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\Skins\red.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\Skins\SoftBlue.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\Skins\SoftBrown.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\Skins\SoftGray.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\Skins\SoftGreen.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\Skins\SoftPurple.nsh"
  Delete "$INSTDIR\Contrib\UltraModernUI\Skins\SoftRed.nsh"
  RMDir "$INSTDIR\Contrib\UltraModernUI\Skins"

  RMDir /r "$INSTDIR\Contrib\UltraModernUI\Language files"

  Delete "$INSTDIR\Contrib\UltraModernUI\UMUI.nsh"
  RMDir "$INSTDIR\Contrib\UltraModernUI\"
  RMDir "$INSTDIR\Contrib"

  RMDir /r "$INSTDIR\Docs\UltraModernUI\"
  RMDir "$INSTDIR\Docs"

  RMDir /r "$INSTDIR\Examples\UltraModernUI\"
  RMDir "$INSTDIR\Examples"

  Delete "$INSTDIR\Contrib\UIs\UltraModernUI\modern_bigdesc.exe"
  Delete "$INSTDIR\Contrib\UIs\UltraModernUI\modern_headerbgimage.exe"
  Delete "$INSTDIR\Contrib\UIs\UltraModernUI\modern_sb.exe"
  Delete "$INSTDIR\Contrib\UIs\UltraModernUI\UltraModern.exe"
  Delete "$INSTDIR\Contrib\UIs\UltraModernUI\UltraModern_bigdesc.exe"
  Delete "$INSTDIR\Contrib\UIs\UltraModernUI\UltraModern_nodesc.exe"
  Delete "$INSTDIR\Contrib\UIs\UltraModernUI\UltraModern_noleftimage.exe"
  Delete "$INSTDIR\Contrib\UIs\UltraModernUI\UltraModern_sb.exe"
  Delete "$INSTDIR\Contrib\UIs\UltraModernUI\UltraModern_small.exe"
  Delete "$INSTDIR\Contrib\UIs\UltraModernUI\UltraModern_small_sb.exe"
  Delete "$INSTDIR\Contrib\UIs\UltraModernUI\UltraModern_smalldesc.exe"
  RMDir "$INSTDIR\Contrib\UIs\UltraModernUI\"
  RMDir "$INSTDIR\Contrib\UIs"

  Delete "$INSTDIR\Contrib\Graphics\UltraModernUI\Complete.bmp"
  Delete "$INSTDIR\Contrib\Graphics\UltraModernUI\CompleteEx.bmp"
  Delete "$INSTDIR\Contrib\Graphics\UltraModernUI\Continue.bmp"
  Delete "$INSTDIR\Contrib\Graphics\UltraModernUI\ContinueEx.bmp"
  Delete "$INSTDIR\Contrib\Graphics\UltraModernUI\Custom.bmp"
  Delete "$INSTDIR\Contrib\Graphics\UltraModernUI\CustomEx.bmp"
  Delete "$INSTDIR\Contrib\Graphics\UltraModernUI\HeaderBG.bmp"
  Delete "$INSTDIR\Contrib\Graphics\UltraModernUI\Minimal.bmp"
  Delete "$INSTDIR\Contrib\Graphics\UltraModernUI\MinimalEx.bmp"
  Delete "$INSTDIR\Contrib\Graphics\UltraModernUI\Modify.bmp"
  Delete "$INSTDIR\Contrib\Graphics\UltraModernUI\ModifyEx.bmp"
  Delete "$INSTDIR\Contrib\Graphics\UltraModernUI\Remove.bmp"
  Delete "$INSTDIR\Contrib\Graphics\UltraModernUI\RemoveEx.bmp"
  Delete "$INSTDIR\Contrib\Graphics\UltraModernUI\Repair.bmp"
  Delete "$INSTDIR\Contrib\Graphics\UltraModernUI\RepairEx.bmp"
  Delete "$INSTDIR\Contrib\Graphics\UltraModernUI\Standard.bmp"
  Delete "$INSTDIR\Contrib\Graphics\UltraModernUI\StandardEx.bmp"
  Delete "$INSTDIR\Contrib\Graphics\UltraModernUI\Icon2.ico"
  Delete "$INSTDIR\Contrib\Graphics\UltraModernUI\Icon.ico"
  Delete "$INSTDIR\Contrib\Graphics\UltraModernUI\install.ico"
  Delete "$INSTDIR\Contrib\Graphics\UltraModernUI\installEx.ico"
  Delete "$INSTDIR\Contrib\Graphics\UltraModernUI\UnIcon2.ico"
  Delete "$INSTDIR\Contrib\Graphics\UltraModernUI\UnIcon.ico"
  Delete "$INSTDIR\Contrib\Graphics\UltraModernUI\uninstall.ico"
  RMDir "$INSTDIR\Contrib\Graphics\UltraModernUI\"
  RMDir "$INSTDIR\Contrib\Graphics"

  Delete "$INSTDIR\UninstallUMUI.exe"

!macroend

Section Uninstall

  SetDetailsPrint textonly
  DetailPrint "Uninstalling UltraModernUI..."
  SetDetailsPrint listonly

  !insertmacro removeUMUIfiles

  RMDir "$INSTDIR"

  !insertmacro MUI_STARTMENU_GETFOLDER Application $STARTMENU_FOLDER

  Delete "$SMPROGRAMS\$STARTMENU_FOLDER\UltraModernUI Readme.lnk"
  Delete "$SMPROGRAMS\$STARTMENU_FOLDER\SkinnedControls Readme.lnk"
  Delete "$SMPROGRAMS\$STARTMENU_FOLDER\nsArray Readme.lnk"
  Delete "$SMPROGRAMS\$STARTMENU_FOLDER\InstallOptionsEx Readme.lnk"
  Delete "$SMPROGRAMS\$STARTMENU_FOLDER\Uninstall UltraModernUI.lnk"
  Delete "$SMPROGRAMS\$STARTMENU_FOLDER\..\Uninstall UltraModernUI.lnk"
  RMDir "$SMPROGRAMS\$STARTMENU_FOLDER"
  RMDir "$SMPROGRAMS\$STARTMENU_FOLDER\.."

  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}"

  DeleteRegValue ${UMUI_PARAMS_REGISTRY_ROOT} "${UMUI_PARAMS_REGISTRY_KEY}" "${UMUI_SHELLVARCONTEXT_REGISTRY_VALUENAME}"
  DeleteRegValue ${UMUI_PARAMS_REGISTRY_ROOT} "${UMUI_PARAMS_REGISTRY_KEY}" "${UMUI_LANGUAGE_REGISTRY_VALUENAME}"
  DeleteRegValue ${UMUI_PARAMS_REGISTRY_ROOT} "${UMUI_PARAMS_REGISTRY_KEY}" "UMUI_SetupType" ;"${UMUI_SETUPTYPEPAGE_REGISTRY_VALUENAME}"
  DeleteRegValue ${UMUI_PARAMS_REGISTRY_ROOT} "${UMUI_PARAMS_REGISTRY_KEY}" "UMUI_InstType" ;"${UMUI_COMPONENTSPAGE_INSTTYPE_REGISTRY_VALUENAME}"
  DeleteRegValue ${UMUI_PARAMS_REGISTRY_ROOT} "${UMUI_PARAMS_REGISTRY_KEY}" "UMUI_Components" ;"${UMUI_COMPONENTSPAGE_REGISTRY_VALUENAME}"
  DeleteRegValue ${UMUI_PARAMS_REGISTRY_ROOT} "${UMUI_PARAMS_REGISTRY_KEY}" "${MUI_STARTMENUPAGE_Application_REGISTRY_VALUENAME}" ;"${MUI_STARTMENUPAGE_REGISTRY_VALUENAME}" this define was removed after the inclusion of the (ALTERNATIVE)STARTMENU_PAGE
  DeleteRegValue ${UMUI_PARAMS_REGISTRY_ROOT} "${UMUI_PARAMS_REGISTRY_KEY}" "${UMUI_VERSION_REGISTRY_VALUENAME}"
  DeleteRegValue ${UMUI_PARAMS_REGISTRY_ROOT} "${UMUI_PARAMS_REGISTRY_KEY}" "${UMUI_VERBUILD_REGISTRY_VALUENAME}"
  DeleteRegValue ${UMUI_PARAMS_REGISTRY_ROOT} "${UMUI_PARAMS_REGISTRY_KEY}" "${UMUI_INSTALLERFULLPATH_REGISTRY_VALUENAME}"
  DeleteRegValue ${UMUI_PARAMS_REGISTRY_ROOT} "${UMUI_PARAMS_REGISTRY_KEY}" "${UMUI_UNINSTALLPATH_REGISTRY_VALUENAME}"

  DeleteRegKey /ifempty ${UMUI_PARAMS_REGISTRY_ROOT} "${UMUI_PARAMS_REGISTRY_KEY}"

SectionEnd


;--------------------------------
;Installer Sections Declaration dans Description

!insertmacro UMUI_DECLARECOMPONENTS_BEGIN
  !insertmacro UMUI_COMPONENT SecUMUI
  !insertmacro UMUI_COMPONENT SecSkins
  !insertmacro UMUI_COMPONENT SecBGSkins
  !insertmacro UMUI_COMPONENT SecSkinnedControls
  !insertmacro UMUI_COMPONENT SecSkinnedControlsSources
  !insertmacro UMUI_COMPONENT SecInstallOptionsEx
  !insertmacro UMUI_COMPONENT SecInstallOptionsExSources
  !insertmacro UMUI_COMPONENT SecnsArray
  !insertmacro UMUI_COMPONENT SecnsArraySources
  !insertmacro UMUI_COMPONENT SecNSISLanguagesFiles
!insertmacro UMUI_DECLARECOMPONENTS_END

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SecUMUI} "The Utra-Modern User Interface for NSIS."
  !insertmacro MUI_DESCRIPTION_TEXT ${SecSkins} "A lot of skins for the Utra-Modern User Interface."
  !insertmacro MUI_DESCRIPTION_TEXT ${SecBGSkins} "A lot of background skins for the Utra-Modern User Interface."
  !insertmacro MUI_DESCRIPTION_TEXT ${SecGroupPlugins} "Install very useful NSIS plugins used by UltraModernUI to extend the possibilities of NSIS."
  !insertmacro MUI_DESCRIPTION_TEXT ${SecSkinnedControls} "This NSIS plugin, writing by SuperPat, allow you to skin all buttons and scrollbars of your installer.$\n$\rIt's used by default with the UltraModern style."
  !insertmacro MUI_DESCRIPTION_TEXT ${SecSkinnedControlsSources} "The Sources code of the SkinnedControls plugin."
  !insertmacro MUI_DESCRIPTION_TEXT ${SecInstallOptionsEx} "This NSIS plugin, writing by deguix and SuperPat is an expanded version of the original InstallOptions plugin containing a lot of new features.$\nThis plugin is supported natively by UltraModernUI."
  !insertmacro MUI_DESCRIPTION_TEXT ${SecInstallOptionsExSources} "The Sources code of the InstallOptionsEx plugin."
  !insertmacro MUI_DESCRIPTION_TEXT ${SecnsArray} "This NSIS plugin, writing by Afrow UK, add the support of the array in NSIS. It comes with plenty of functions for managing your arrays.$\nThis plugin is used with the AlternativeStartMenu and MultiLanguages pages of UltraModernUI."
  !insertmacro MUI_DESCRIPTION_TEXT ${SecnsArraySources} "The Sources code of the nsArray plugin."
  !insertmacro MUI_DESCRIPTION_TEXT ${SecNSISLanguagesFiles} "Update the NSIS language files of your installation by those of the version ${NSIS_VERSION} of NSIS.$\nThese language files contain a lot of translation fix and add the lastest translated languages."
!insertmacro MUI_FUNCTION_DESCRIPTION_END


;--------------------------------
; Pages functions

!macro confirm_addline section

  SectionGetFlags ${Sec${section}} $1
  IntOp $1 $1 & ${SF_SELECTED}
  IntCmp $1 ${SF_SELECTED} 0 n${section} n${section}
    SectionGetText ${Sec${section}} $1
    !insertmacro UMUI_CONFIRMPAGE_TEXTBOX_ADDLINE "    - $1"
  n${section}:

!macroend

Function confirm_function

  !insertmacro UMUI_CONFIRMPAGE_TEXTBOX_ADDLINE "$(UMUI_TEXT_INSTCONFIRM_TEXTBOX_DESTINATION_LOCATION)"
  !insertmacro UMUI_CONFIRMPAGE_TEXTBOX_ADDLINE "      $INSTDIR"
  !insertmacro UMUI_CONFIRMPAGE_TEXTBOX_ADDLINE ""

  ;Only if StartMenu Folder is selected
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application

    !insertmacro UMUI_CONFIRMPAGE_TEXTBOX_ADDLINE "$(UMUI_TEXT_INSTCONFIRM_TEXTBOX_START_MENU_FOLDER)"
    !insertmacro UMUI_CONFIRMPAGE_TEXTBOX_ADDLINE "      $STARTMENU_FOLDER"
    !insertmacro UMUI_CONFIRMPAGE_TEXTBOX_ADDLINE ""

    ;ShellVarContext
    !insertmacro UMUI_CONFIRMPAGE_TEXTBOX_ADDLINE "$(UMUI_TEXT_SHELL_VAR_CONTEXT)"
    !insertmacro UMUI_GETSHELLVARCONTEXT
    Pop $1
    StrCmp $1 "all" 0 current
      !insertmacro UMUI_CONFIRMPAGE_TEXTBOX_ADDLINE "      $(UMUI_TEXT_SHELL_VAR_CONTEXT_FOR_ALL_USERS)"
      Goto endsvc
    current:
      !insertmacro UMUI_CONFIRMPAGE_TEXTBOX_ADDLINE "      $(UMUI_TEXT_SHELL_VAR_CONTEXT_ONLY_FOR_CURRENT_USER)"
    endsvc:
    !insertmacro UMUI_CONFIRMPAGE_TEXTBOX_ADDLINE ""

  !insertmacro MUI_STARTMENU_WRITE_END


  ;For the setuptype page
  !insertmacro UMUI_CONFIRMPAGE_TEXTBOX_ADDLINE "$(UMUI_TEXT_SETUPTYPE_TITLE):"
  !insertmacro UMUI_GET_CHOOSEN_SETUP_TYPE_TEXT
  Pop $R0
  !insertmacro UMUI_CONFIRMPAGE_TEXTBOX_ADDLINE "      $R0"
  !insertmacro UMUI_CONFIRMPAGE_TEXTBOX_ADDLINE ""


  !insertmacro UMUI_CONFIRMPAGE_TEXTBOX_ADDLINE "$(UMUI_TEXT_INSTCONFIRM_TEXTBOX_COMPNENTS)"

  !insertmacro confirm_addline UMUI
  !insertmacro confirm_addline Skins
  !insertmacro confirm_addline BGSkins
  !insertmacro confirm_addline SkinnedControls
  !insertmacro confirm_addline SkinnedControlsSources
  !insertmacro confirm_addline InstallOptionsEx
  !insertmacro confirm_addline InstallOptionsExSources
  !insertmacro confirm_addline nsArray
  !insertmacro confirm_addline nsArraySources
  !insertmacro confirm_addline NSISLanguagesFiles

FunctionEnd


Function preuninstall_function

  SetDetailsPrint textonly
  DetailPrint "Uninstalling UltraModernUI..."
  SetDetailsPrint none

  !insertmacro removeUMUIfiles

  RMDir "$INSTDIR"
  
  !insertmacro MUI_STARTMENU_GETFOLDER Application $STARTMENU_FOLDER

  Delete "$SMPROGRAMS\$STARTMENU_FOLDER\UltraModernUI Readme.lnk"
  Delete "$SMPROGRAMS\$STARTMENU_FOLDER\SkinnedControls Readme.lnk"
  Delete "$SMPROGRAMS\$STARTMENU_FOLDER\nsArray Readme.lnk"
  Delete "$SMPROGRAMS\$STARTMENU_FOLDER\InstallOptionsEx Readme.lnk"
  Delete "$SMPROGRAMS\$STARTMENU_FOLDER\Uninstall UltraModernUI.lnk"
  Delete "$SMPROGRAMS\$STARTMENU_FOLDER\..\Uninstall UltraModernUI.lnk"
  RMDir "$SMPROGRAMS\$STARTMENU_FOLDER"
  RMDir "$SMPROGRAMS\$STARTMENU_FOLDER\.."

  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}"

  DeleteRegValue ${UMUI_PARAMS_REGISTRY_ROOT} "${UMUI_PARAMS_REGISTRY_KEY}" "${UMUI_SHELLVARCONTEXT_REGISTRY_VALUENAME}"
  DeleteRegValue ${UMUI_PARAMS_REGISTRY_ROOT} "${UMUI_PARAMS_REGISTRY_KEY}" "${UMUI_LANGUAGE_REGISTRY_VALUENAME}"
  DeleteRegValue ${UMUI_PARAMS_REGISTRY_ROOT} "${UMUI_PARAMS_REGISTRY_KEY}" "UMUI_SetupType" ;"${UMUI_SETUPTYPEPAGE_REGISTRY_VALUENAME}"
  DeleteRegValue ${UMUI_PARAMS_REGISTRY_ROOT} "${UMUI_PARAMS_REGISTRY_KEY}" "UMUI_InstType" ;"${UMUI_COMPONENTSPAGE_INSTTYPE_REGISTRY_VALUENAME}"
  DeleteRegValue ${UMUI_PARAMS_REGISTRY_ROOT} "${UMUI_PARAMS_REGISTRY_KEY}" "UMUI_Components" ;"${UMUI_COMPONENTSPAGE_REGISTRY_VALUENAME}"
  DeleteRegValue ${UMUI_PARAMS_REGISTRY_ROOT} "${UMUI_PARAMS_REGISTRY_KEY}" "${MUI_STARTMENUPAGE_Application_REGISTRY_VALUENAME}" ;"${MUI_STARTMENUPAGE_REGISTRY_VALUENAME}" this define was removed after the inclusion of the (ALTERNATIVE)STARTMENU_PAGE
  DeleteRegValue ${UMUI_PARAMS_REGISTRY_ROOT} "${UMUI_PARAMS_REGISTRY_KEY}" "${UMUI_VERSION_REGISTRY_VALUENAME}"
  DeleteRegValue ${UMUI_PARAMS_REGISTRY_ROOT} "${UMUI_PARAMS_REGISTRY_KEY}" "${UMUI_VERBUILD_REGISTRY_VALUENAME}"
  DeleteRegValue ${UMUI_PARAMS_REGISTRY_ROOT} "${UMUI_PARAMS_REGISTRY_KEY}" "${UMUI_INSTALLERFULLPATH_REGISTRY_VALUENAME}"
  DeleteRegValue ${UMUI_PARAMS_REGISTRY_ROOT} "${UMUI_PARAMS_REGISTRY_KEY}" "${UMUI_UNINSTALLPATH_REGISTRY_VALUENAME}"

FunctionEnd


;--------------------------------
;Init Functions

Function .onInit

  !insertmacro UMUI_MULTILANG_GET

  ; Check NSIS Version
  ReadRegDword $0 HKLM Software\NSIS "VersionMajor"
  IfErrors errorNSIS 0
    ReadRegDword $1 HKLM Software\NSIS "VersionMinor"
    IfErrors errorNSIS 0
      StrCmp $0 3 okNSIS 0

        errorNSIS:
          MessageBox MB_OK|MB_ICONSTOP "NSIS 3 is not installed on your computer.$\r$\nPlease, install NSIS (http://nsis.sourceforge.net) and then re-execute this install.$\n$\rThis install will stop."
          Quit

  okNSIS:
  ClearErrors

  IntCmp $1 0 okNSISMin 0 okNSISMin
    MessageBox MB_OK|MB_ICONSTOP "Your version of NSIS is not compatible with UltraModernUI.$\r$\nPlease, update NSIS (http://nsis.sourceforge.net) and then re-execute this install.$\n$\rThis install will stop."
    Quit
  okNSISMin:
  ClearErrors

  ; ReadOnly Unselect if NSIS != VER_MAJOR && NSIS >= VER_MINOR
  IntCmp $0 ${VER_MAJOR} 0 unselectROlangFiles unselectROlangFiles
  IntCmp $1 ${VER_MINOR} unselectROlangFiles end1 unselectROlangFiles
  unselectROlangFiles:
    !insertmacro UnSelectSection ${SecNSISLanguagesFiles}
    SectionGetFlags ${SecNSISLanguagesFiles} $2
    IntOp $2 $2 | ${SF_RO}
    SectionSetFlags ${SecNSISLanguagesFiles} $2
    !insertmacro ClearSectionInInstType ${SecNSISLanguagesFiles} 4 ;4 complete
  end1:
  ClearErrors

FunctionEnd

Function un.onInit

  !insertmacro UMUI_MULTILANG_GET

FunctionEnd