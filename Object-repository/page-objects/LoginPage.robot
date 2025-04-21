*** Settings ***
Resource        ../../configs/ResourceFile.robot

*** Keywords ***
user launch browser
  Open Application    ${MyEuroClear}    ${BROWSER}

user provide username and password
   Enter Text    ${USERNAME_FIELD}    ${USERNAME}
   Enter Text    ${PASSWORD_FIELD}    ${PASSWORD}

user click on Login button
   Click On Element    ${LOGIN_BUTTON}
   Close Application

