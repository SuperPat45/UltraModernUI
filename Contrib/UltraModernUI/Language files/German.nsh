;NSIS Modern User Interface - Language File
;Compatible with UltraModernUI 2.0 beta 1

;Language: Brazilian Portuguese (1031)
;By Tobias <tm2006@users.sourceforge.net>

;--------------------------------

!ifdef UMUI_CONFIRMPAGE
  ${LangFileString} UMUI_TEXT_INSTCONFIRM_SUBTITLE "Setup hat die benötigten Informationen gesammelt und ist bereit, $(^NameDA) zu installieren."
  ${LangFileString} UMUI_TEXT_INSTCONFIRM_TITLE "Installation bestätigen"
  ${LangFileString} UMUI_TEXT_INSTCONFIRM_TEXT_TOP "Setup ist bereit, $(^NameDA) auf Ihrem Computer zu installieren.$\r$\nFalls Sie Ihre Installationseinstellungen noch überprüfen oder ändern möchten, klicken Sie auf Zurück. Klicken Sie auf Weiter, um die Installation zu beginnen. $_CLICK"
!endif 

!ifdef UMUI_UNCONFIRMPAGE
  ${LangFileString} UMUI_UNTEXT_INSTCONFIRM_SUBTITLE "O Assistente terminou de reunir informações e está pronto para instalar $(^NameDA)."
  ${LangFileString} UMUI_UNTEXT_INSTCONFIRM_TITLE "Confirmar a desinstalação"
  ${LangFileString} UMUI_UNTEXT_INSTCONFIRM_TEXT_TOP "O Assistente está pronto para desinstalar $(^NameDA) em seu computador.$\r$\nSe quiser rever ou mudar quaisquer configurações da desinstalação, clique em Voltar. Clique em Avançar para iniciar a desinstalação."
!endif 

!ifdef UMUI_CONFIRMPAGE | UMUI_UNCONFIRMPAGE
  ${LangFileString} UMUI_TEXT_INSTCONFIRM_TEXTBOX_TITLE "Derzeitige konfiguration:"
  ${LangFileString} UMUI_TEXT_INSTCONFIRM_TEXTBOX_DESTINATION_LOCATION "Zielort:"
  ${LangFileString} UMUI_TEXT_INSTCONFIRM_TEXTBOX_START_MENU_FOLDER "Startmenü-ordner:"
!endif 


!ifdef UMUI_ABORTPAGE
  ${LangFileString} UMUI_TEXT_ABORT_INFO_TITLE "Beenden des $(^NameDA) Setup-Assistenten"
  ${LangFileString} UMUI_TEXT_ABORT_INFO_TEXT "Der Assistent wurde unterbrochen, bevor $(^NameDA) komplett installiert werden konnte.$\r$\n$\r$\nUm das Programm zu einem späteren Zeitpunkt zu installieren, führen Sie dieses Setup bitte erneut aus.$\r$\n$\r$\n$\r$\n$\r$\nKlicken Sie auf $(^CloseBtn), um den Installationsassistenten zu schließen."
!endif 

!ifdef UMUI_UNABORTPAGE
  ${LangFileString} UMUI_UNTEXT_ABORT_INFO_TITLE "Beenden des Deinstallationsassistenten für $(^NameDA)"
  ${LangFileString} UMUI_UNTEXT_ABORT_INFO_TEXT "Der Assistent wurde unterbrochen, bevor $(^NameDA) komplett deinstalliert werden konnte.$\r$\n$\r$\nUm das Programm zu einem späteren Zeitpunkt zu deinstallieren, führen Sie dieses Setup bitte erneut aus.$\r$\n$\r$\n$\r$\n$\r$\nKlicken Sie auf $(^CloseBtn), um den Deinstallationsassistenten zu schließen."
!endif 
