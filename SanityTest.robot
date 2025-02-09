*** Settings ***
Documentation           Robot Framework Demo
Library    Collections
Library    String
Library    JSONLibrary
Library    RequestsLibrary

*** Variables ***
${BASE_URL}       https://reqres.in


*** Test Cases ***
HTTP Test demo
    [Tags]    Demo
    [Documentation]   This test case demonstrates an HTTPS GET request using Robot Framework
    Create Session    session1    ${BASE_URL}
    ${endpoint}    Set Variable    /api/users?page=2
    ${response}=    GET On Session    session1   ${endpoint}
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    ${response.headers}