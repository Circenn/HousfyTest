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

#TEST TO CHECK LAST NAME FORM ERROR

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

Navigate to shopping cart
     Navigate to shopping cart
     Check item added

Navigate to Checkout page
    Click checkout button

Add Your Information Data    
    Enter personal data
    

*** Keywords ***

Enter username
    Input Text    css:[data-test="username"]    ${userid}

Enter password
    Input Password    css:[data-test="password"]    ${password}

Click login button
    Click Button    css:[data-test="login-button"]

Add to cart item
    Click Button    css:[data-test="add-to-cart-sauce-labs-backpack"]
    Sleep    1s

Check cart items quantity
    Wait Until Element Is Visible    ${cart icon}
    ${cart number}=    Get Text    ${cart icon}
    Should Be Equal As Numbers    ${cart number}    ${wanted number}

Check item added
    Wait Until Element Is Visible    css:[data-test="inventory-item"]

Navigate to shopping cart
    Click Link    css:[data-test="shopping-cart-link"]

Click checkout button
    Click Button    css:[data-test="checkout"]

Enter personal data
    Input Text    css:[data-test="firstName"]    ${firstname}
    Input Text    css:[data-test="lastName"]    ${lastname}
    Input Text    css:[data-test="postalCode"]    ${poscode}

    Should Be Equal   css:[data-test="firstName"]    ${firstname}
    Should Be Equal    css:[data-test="lastName"]    ${lastname}
    Should Be Equal    css:[data-test="postalCode"]    ${poscode}