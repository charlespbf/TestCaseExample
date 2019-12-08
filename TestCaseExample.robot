*** Settings ***
Resource         ResourceBDD.robot    
Suite Teardown   Close Chrome

*** Test Cases ***
Scenario 01: Search product, add to cart and proceed to checkout
    Give page is My Store
    When Search Product
    Then Click on Found Product
    And Add Product to Cart
    And Go to Chekout