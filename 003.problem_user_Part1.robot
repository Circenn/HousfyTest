*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
Library    String

Resource    H.resources.robot

*** Variables ***
${userid}        problem_user
${password}      secret_sauce


*** Test Cases ***

#Test to check if every item can be added to the shopping cart

Navigate to main page
    Open Browser    ${SiteUrl}    ${Browser}

Test user login
    Enter username
    Enter password

Navigate to item galery    
    Click login button

Add item to shopping cart
    Add to cart item
    Check cart items quantity

*** Keywords ***

Enter username
    Input Text    css:[data-test="username"]    ${userid}

Enter password
    Input Password    css:[data-test="password"]    ${password}

Click login button
    Click Button    css:[data-test="login-button"]

Add to cart item
    Click Button    css:[data-test="add-to-cart-sauce-labs-backpack"]
    Sleep    5s
    Click Button    css:[data-test="add-to-cart-sauce-labs-bike-light"]
    Sleep    5s
    Click Button    css:[data-test="add-to-cart-sauce-labs-bolt-t-shirt"]
    Sleep    5s
    Click Button    css:[data-test="add-to-cart-sauce-labs-fleece-jacket"]
    Sleep    5s    
    Click Button    css:[data-test="add-to-cart-sauce-labs-onesie"]
    Sleep    5s
    Click Button    css:[data-test="add-to-cart-test.allthethings()-t-shirt-(red)"]
    Sleep    5s

Check cart items quantity
    Wait Until Element Is Visible    ${cart icon}
    ${cart number}=    Get Text    ${cart icon}
    Should Be Equal As Numbers    ${cart number}    ${wanted number error}

