;NSIS Ultra Modern User Interface
;Information Page Example Script
;Written by SuperPat

;--------------------------------
;General

  ;Generate unicode installer
  Unicode True
  
  ;Name and file
  Name "UltraModernUI Test"
  OutFile "Information.exe"

  ;Default installation folder
  InstallDir "$DESKTOP\UltraModernUI Test"
  
  ;Get installation folder from registry if available
  InstallDirRegKey HKCU "Software\UltraModernUI Test" ""

  ;Request application privileges for Windows Vista
  RequestExecutionLevel user

;--------------------------------
;Include Modern UI

  !include "UMUI.nsh"

;--------------------------------
;Interface Settings

  !define MUI_ABORTWARNING

  !define UMUI_USE_INSTALLOPTIONSEX
  
  !define UMUI_SKIN "SoftBrown"
  
  !define UMUI_PAGEBGIMAGE
  !define UMUI_UNPAGEBGIMAGE

;--------------------------------
;Pages

  !insertmacro UMUI_PAGE_MULTILANGUAGE

  !insertmacro MUI_PAGE_LICENSE "${NSISDIR}\Docs\UltraModernUI\License.txt"
  
;  A first multi-language TXT information page:
;  The * will be replaced by the language code
;  "information1033.txt" for english "information1036.txt" for french.
;  Optional "information.txt" for untranslated language files (if "informationXXXX.txt" not found)
  !insertmacro UMUI_PAGE_INFORMATION "information*.txt"
  
;  An other english only RTF information page (InstallOptionsEx only)
  !define UMUI_INFORMATIONPAGE_USE_RICHTEXTFORMAT
  !insertmacro UMUI_PAGE_INFORMATION "${NSISDIR}\Docs\UltraModernUI\ReadMe.rtf"

  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
  
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES
  
;--------------------------------
;Languages
 
  !insertmacro MUI_LANGUAGE "English"  
  !insertmacro MUI_LANGUAGE "French"
  !insertmacro MUI_LANGUAGE "Hungarian"
  !insertmacro MUI_LANGUAGE "Czech"
  !insertmacro MUI_LANGUAGE "Japanese"
  !insertmacro MUI_LANGUAGE "Polish"

;--------------------------------
;Installer Sections

Section "Dummy Section" SecDummy

  SetOutPath "$INSTDIR"
  
  ;ADD YOUR OWN FILES HERE...
  
  ;Store installation folder
  WriteRegStr HKCU "Software\Modern UI Test" "" $INSTDIR
  
  ;Create uninstaller
  WriteUninstaller "$INSTDIR\Uninstall.exe"

SectionEnd

;--------------------------------
;Uninstaller Section

Section "Uninstall"

  ;ADD YOUR OWN FILES HERE...

  Delete "$INSTDIR\Uninstall.exe"

  RMDir "$INSTDIR"

  DeleteRegKey /ifempty HKCU "Software\Modern UI Test"

SectionEnd


;--------------------------------
;Installer Functions

Function .onInit
  !insertmacro UMUI_MULTILANG_GET
FunctionEnd

;--------------------------------
;Uninstaller Functions

Function un.onInit
  !insertmacro UMUI_MULTILANG_GET
FunctionEnd