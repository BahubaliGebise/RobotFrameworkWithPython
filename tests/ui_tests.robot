*** Settings ***
Resource    ../resources/ui_keywords.robot
Resource    ../resources/variables.robot
Library    SeleniumLibrary

*** Test Cases ***
Verify Login Functionality
    [Teardown]   TestReport
    Open Application    ${MyEuroClear}    ${BROWSER}
    Enter Text    ${USERNAME_FIELD}    ${USERNAME}
    Enter Text    ${PASSWORD_FIELD}    ${PASSWORD}
    Click On Element    ${LOGIN_BUTTON}
    Close Application

