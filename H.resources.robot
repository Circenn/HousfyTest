#Este file es para declarar el browser y la pagina web que queremos abrir
Usamos variables para declarar los diferentes usuarios de la prueba y otros datos.

*** Variables ***

${Browser}        Chrome
${SiteUrl}        https://www.saucedemo.com/
${cart icon}      css:[data-test="shopping-cart-badge"]
${wanted number}    1

${firstname}      Circenn
${lastname}       Gomez
${poscode}        08015

${price tag}    css:[data-test="inventory-item-price"]
${price total}    css:[data-test="subtotal-label"]

${Delay}          5s
