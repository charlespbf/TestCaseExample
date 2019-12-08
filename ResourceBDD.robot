*** Settings ***
Library     SeleniumLibrary

*** Variable ***
${BROWSER}              Chrome
${URL}                  http://www.automationpractice.com 
${SEARCH}               id=search_query_top
${SEARCH_BUTTON}        name=submit_search
${SEARCH_PRODUCT}       css=div.right-block > h5 > a.product-name
${FOUND_PRODUCT}        Blouse
${PRODUCT}              Blouse
${BOTAO_CART}           name=Submit
${PRODUCT_LINK}         xpath=//*[@id="center_column"]/ul/li/div/div[1]/div/a[1]/img
${CHECKOUT_BUTTON}      xpath=/html/body/div/div[1]/header/div[3]/div/div/div[4]/div[1]/div[2]/div[4]/a
${ITEM_ADD}             xpath=//*[@id="layer_cart"]/div[1]/div[2]/h2/span[2]
${END_CHECKOUT}         xpath=//*[@id="center_column"]/p[2]/a[1]/span

*** Keywords ***
Give page is My Store
    Acess HOME at My Store

Title Should Be My Store  
    Title Should Be My Store 

When Search Product
    Search Product "${PRODUCT}"
 
Check Search Result
    Check Result

Then Click on Found Product
     Click on Found Product

And Add Product to Cart
    Add Product to Cart

And Go to Chekout
    Go to Chekout

#### STEPS    
Acess HOME at My Store
    Open Browser    ${URL}  ${BROWSER}
    Title Should Be     My Store

Search Product "${PRODUCT}"
    Input Text      ${SEARCH}    ${PRODUCT}
    Click Element   ${SEARCH_BUTTON}

Check Result
    Wait Until Element Is Visible  ${SEARCH_PRODUCT}
    Page Should Contain  ${FOUND_PRODUCT}

Click on Found Product
    Click Element   ${PRODUCT_LINK}

Add Product to Cart
    Click Element    ${BOTAO_CART}

Go to Chekout
    Wait Until Element Is Visible  ${ITEM_ADD}
    Click Element    ${CHECKOUT_BUTTON} 
    Click Element    ${END_CHECKOUT} 

Close Chrome
    Close Browser 