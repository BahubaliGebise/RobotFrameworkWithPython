*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    OperatingSystem
Resource        ../../configs/ResourceFile.robot


*** Keywords ***
Open Application
    [Arguments]    ${url}    ${browser}=chrome
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Close Application
    Close Browser

TestReport
    ${suite_name}    Get Variable Value    ${SUITE NAME}
    ${test_name}   Get Variable Value    ${TEST NAME}
    ${test_status}    Get Variable Value    ${TEST STATUS}
    ${error_message}   Run Keyword If    '${test_status}' == 'PASS'   Set Variable  None
    ${error_message}   Run Keyword If    '${test_status}' == 'FAIL'    Get Variable Value     ${TEST_MESSAGE}

Click On Element
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=10s
    Click Element    ${locator}

Enter Text
    [Arguments]    ${locator}    ${text}
    Wait Until Element Is Visible    ${locator}    timeout=10s
    Input Text    ${locator}    ${text}

Choose From Dropdown By Value
    [Arguments]    ${locator}    ${value}
    Wait Until Element Is Visible    ${locator}    timeout=10s
    Select From List By Value    ${locator}    ${value}

Choose From Dropdown By Label
    [Arguments]    ${locator}    ${label}
    Wait Until Element Is Visible    ${locator}    timeout=10s
    Select From List By Label    ${locator}    ${label}

Retrieve Text
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=10s
    ${text} =    Get Text    ${locator}
    RETURN    ${text}

Verify Element Is Visible
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=10s
    Element Should Be Visible    ${locator}

Verify Element Is Not Visible
    [Arguments]    ${locator}
    Wait Until Element Is Not Visible    ${locator}    timeout=10s
    Element Should Not Be Visible    ${locator}

Take Screenshot
    Capture Page Screenshot

Scroll To UI Element
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=10s
    Scroll Element Into View    ${locator}

Wait Until Clickable
    [Arguments]    ${locator}    ${timeout}=10s
    Wait Until Element Is Enabled    ${locator}    timeout=${timeout}

Wait Until Visible
    [Arguments]    ${locator}    ${timeout}=10s
    Wait Until Element Is Visible    ${locator}    timeout=${timeout}

Wait Until Disappears
    [Arguments]    ${locator}    ${timeout}=10s
    Wait Until Element Is Not Visible    ${locator}    timeout=${timeout}

Send Keys To Element
    [Arguments]    ${locator}    ${keys}
    Wait Until Element Is Visible    ${locator}    timeout=10s
    Press Keys    ${locator}    ${keys}

Hover Over Element
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=10s
    Mouse Over    ${locator}

Double Tap Element
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=10s
    Double Click Element    ${locator}

Drag And Drop UI Element
    [Arguments]    ${source}    ${target}
    Wait Until Element Is Visible    ${source}    timeout=10s
    Drag And Drop    ${source}    ${target}

Switch To IFrame
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=10s
    Select Frame    ${locator}

Return To Default Content
    Unselect Frame

Accept Pop-up Alert
    Handle Alert    accept

Dismiss Pop-up Alert
    Handle Alert    dismiss

Fetch Alert Message
    ${text} =    Handle Alert    text
    RETURN    ${text}

Check Page Title
    [Arguments]    ${title}
    Title Should Be    ${title}

Check Page URL
    [Arguments]    ${url}
    ${current_url} =    Get Location
    Should Be Equal As Strings    ${current_url}    ${url}
