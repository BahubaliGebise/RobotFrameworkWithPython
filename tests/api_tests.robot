*** Settings ***
Library    RequestsLibrary
Library    Collections

Resource    ../configs/ResourceFile.robot

Test Setup    Read API Test Data

*** Test Cases ***

API Test - TC001
    ${test_case_data}    Get From Dictionary    ${TEST_DATA}    TC001
    Perform API Request    ${test_case_data}

API Test - TC002
    ${test_case_data}    Get From Dictionary    ${TEST_DATA}    TC002
    Perform API Request    ${test_case_data}

