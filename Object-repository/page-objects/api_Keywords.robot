*** Settings ***
Library    RequestsLibrary
Library    Collections

Resource        ../../configs/ResourceFile.robot

*** Variables ***
${TEST_DATA_FILE}    ${EXECDIR}/testdata/TestData.xlsx
${BASE_URL}          https://Euroclear.com

*** Keywords ***

Read API Test Data
    ${data}     Read API Test Data
    Set Test Variable    ${TEST_DATA}    ${data}

Perform API Request
    [Arguments]    ${test_data}
    ${method}     Set Variable    ${test_data['Method']}
    ${url}        Set Variable    ${test_data['URL']}
    ${headers}    Set Variable    ${test_data['Headers']}
    ${payload}    Set Variable    ${test_data['Payload']}

    ${session}    Create Session    mysession    ${BASE_URL}

    ${response}    Run Keyword If    '${method}' == 'GET'
    ...    GET On Session    mysession    ${url}    headers=${headers}

    ${response}    Run Keyword If    '${method}' == 'POST'
    ...    POST On Session    mysession    ${url}    json=${payload}    headers=${headers}

    ${response}    Run Keyword If    '${method}' == 'PUT'
    ...    PUT On Session    mysession    ${url}    json=${payload}    headers=${headers}

    ${response}    Run Keyword If    '${method}' == 'DELETE'
    ...    DELETE On Session    mysession    ${url}    headers=${headers}

    Should Be Equal As Strings    ${response.status_code}    ${test_data['Expected_Status']}
    Log    Response: ${response.json()}

