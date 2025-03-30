*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
Library    String

Resource    H.resources.robot

*** Variables ***
${userid}        performance_glitch_user
${password}      secret_sauce


*** Test Cases ***

#TEST TOO CHECK PAGE LOAD TIME

Navigate to main page
    Open Browser    ${SiteUrl}    ${Browser}

Test user login
    Enter user info 


*** Keywords ***

Enter user info
    ${start_time}=    Get Time    epoch
    Input Text    css:[data-test="username"]    ${userid}
    Input Password    css:[data-test="password"]    ${password}
    Click Button    css:[data-test="login-button"]
    Wait Until Location Is    https://www.saucedemo.com/inventory.html    timeout=10
    ${end_time}=    Get Time    epoch

    ${responde_time}=    Evaluate    ${end_time} - ${start_time}
    Log To Console    Respond time: ${responde_time} seconds

    Should Be True    ${responde_time} < ${timeout}