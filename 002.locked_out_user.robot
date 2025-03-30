*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
Library    String

Resource    H.resources.robot

*** Variables ***
${userid}        locked_out_user
${password}      secret_sauce


*** Test Cases ***

#TEST TO CHECK LOCKED OUT USER ERROR

Navigate to main page
    Open Browser    ${SiteUrl}    ${Browser}

Test user login fails
    Enter username
    Enter password  
    Click login button
    Check Error exists


*** Keywords ***

Enter username
    Input Text    css:[data-test="username"]    ${userid}

Enter password
    Input Password    css:[data-test="password"]    ${password}

Click login button
    Click Button    css:[data-test="login-button"]

Check Error exists
    Wait Until Element Is Visible   css:[data-test="error"]

Check Error type
    Element Should Contain    css:[data-test="error"]    "has been locked out"