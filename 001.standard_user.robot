*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
Library    String

Resource    H.resources.robot

*** Variables ***
${userid}        standard_user
${password}      secret_sauce


*** Test Cases ***

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

Navigate to Overview page
    Navigate to Overview page

Check order and Finish
    Check order
    Finish order
    

*** Keywords ***

Enter username
    Input Text    css:[data-test="username"]    ${userid}

Enter password
    Input Password    css:[data-test="password"]    ${password}

Click login button
    Click Button    css:[data-test="login-button"]

Add to cart item
    Click Button    css:[data-test="add-to-cart-sauce-labs-backpack"]

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

Navigate to Overview page
    Click Button    css:[data-test="continue"]

Check order
    Wait Until Element Is Visible    css:[data-test="inventory-item"]

# Convert item price - Esto es para convertir los precios en numeros para poder compararlos. Al tener texto en ello no estoy seguro como hacerlo. Pero aqui esta mi intento
#     Wait Until Element Is Visible    ${price tag}  10s
#     ${price_text}  Get Text  ${price tag}
#     Log To Console  Extracted price: ${price_text}
#     ${clean_price}  Replace String  ${price_text}  $  ${EMPTY}
#     ${clean_price}  Strip String  ${clean_price}
#     ${price item}  Convert To Number  ${clean_price}
#     Log To Console  Converted price: ${price item}

# Convert total price
#     Wait Until Element Is Visible    ${price total}  10s
#     ${price total_text}  Get Text  ${price total}
#     Log To Console  Extracted price: ${price total_text}
#     ${clean_total price}  Replace String Using Regexp  ${price total_text}    [^0-9.]  ${EMPTY}
#     ${clean_final price}  Strip String  ${clean_total price}
#     ${price}  Convert To Number  ${clean_final price}
#     Log To Console  Converted price: ${price}    

# Check Price Total  
#     Wait Until Element Is Visible    ${price tag}
#     ${price_label}    Get Text    ${price tag}
#     Should Be Equal As Strings    ${price_label}    ${price total}

Finish order
    Click Button    css:[data-test="finish"]