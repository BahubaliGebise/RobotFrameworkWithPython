*** Settings ***
Resource    ../configs/ResourceFile.robot


*** Test Cases ***
Verify Login Functionality
    [Teardown]   TestReport
    Open Application    ${MyEuroClear}    ${BROWSER}
    Enter Text    ${USERNAME_FIELD}    ${USERNAME}
    Enter Text    ${PASSWORD_FIELD}    ${PASSWORD}
    Click On Element    ${LOGIN_BUTTON}
    Close Application

Verify Login functionality with BDD format
    [Teardown]      TestReport
    Given user launch browser
    When user provide username and password
    Then user click on Login button