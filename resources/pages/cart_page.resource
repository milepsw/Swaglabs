*** Keywords ***
Click checkout button
    common_keyword.Click element when ready  ${CHECKOUT.BUTTON}

Click continue shopping button
    common_keyword.Click element when ready  ${CONTINUE.SHOP.BUTTON}

Click remove product button
    [Arguments]     ${product_name}
    ${locator.remove.btn}=                              String.Replace string          ${CART.REMOVE.BUTTON}         {product_name}    ${product_name}
    common_keyword.Click element when ready  ${locator.remove.btn}

Click name of product
    [Arguments]     ${product_name}
    ${locator_product_name}=                            String.Replace string          ${PRODUCT.NAME.TEXT}         {product_name}    ${product_name}
    common_keyword.Click element when ready  ${locator_product_name}