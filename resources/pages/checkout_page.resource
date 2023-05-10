*** Keywords ***
Input firstname in checkout page
    [Arguments]    ${first_name}
    common_keyword.Input text in element when ready  ${INPUT.FIRSTNAME.TEXTBOX}  ${first_name}

Input lastname in checkout page
    [Arguments]    ${last_name}
    common_keyword.Input text in element when ready  ${INPUT.LASTNAME.TEXTBOX}  ${last_name}

Input postcode in checkout page
    [Arguments]    ${post_code}
    common_keyword.Input text in element when ready  ${INPUT.POSTCODE.TEXTBOX}  ${post_code}

Click continue button in checkout page
    common_keyword.Click element when ready  ${CONTINUE.BUTTON}

Check name of product
    [Arguments]   ${product_name}  
    ${locator.product_name}=                       String.Replace string               ${PRODUCT.NAME.TEXT}      {product_name}    ${product_name}
    SeleniumLibrary.Wait until element is visible                                      ${locator.product_name}

Check vat and price is calculate correctly
    [Arguments]    ${vat.percentage}    ${actual.price}
    #Get subtotal price
    ${subtotal.price}                              SeleniumLibrary.Get text            ${SUBTOTAL.TEXT}
    ${subtotal.price}                              BuiltIn.Set variable                ${subtotal.price}[13:]
    BuiltIn.Convert to number                                                          ${subtotal.price}
    Builtin.Log to console                         Subtotal on web: ${subtotal.price}
    #Get vat price
    ${vat.price}                                   SeleniumLibrary.Get text            ${VAT.TEXT}
    ${vat.price}                                   BuiltIn.Set variable                ${vat.price}[6:]
    BuiltIn.Convert to number                                                          ${vat.price}
    Builtin.Log to console                         Vat on web: ${vat.price}
    #Get total price
    ${total.price}                                 SeleniumLibrary.Get text            ${TOTAL.TEXT}
    ${total.price}                                 BuiltIn.Set variable                ${total.price}[8:]
    BuiltIn.Convert to number                                                          ${total.price}
    Builtin.Log to console                         Total on web: ${total.price}
    #Calculate vat is correctly
    ${expected.vat.price}                          BuiltIn.Evaluate                    (${subtotal.price} * ${vat.percentage}) / 100
    ${expected.vat.price}                          BuiltIn.Convert to number           ${expected.vat.price}    2
    Builtin.Log to console                         Expected Vat: ${expected.vat.price}
    BuiltIn.Should be equal as numbers                                                 ${expected.vat.price}    ${vat.price}
    #Calculate total price is correctly
    ${expected.total.price}                        BuiltIn.Evaluate                    ${expected.vat.price} + ${subtotal.price}
    ${expected.total.price}                        BuiltIn.Convert to number           ${expected.total.price}    2
    Builtin.Log to console                         Expected Total: ${expected.total.price}
    BuiltIn.Should be equal as numbers                                                 ${expected.total.price}  ${actual.price}

Click finish button
    common_keyword.Click element when ready  ${FINISH.BUTTON}

Check order is complete
    SeleniumLibrary.Wait until element is visible                                      ${ORDER.COMPLETE.TEXT}
    SeleniumLibrary.Wait until element is visible                                      ${ORDER.COMPLETE.DETAIL.TEXT}

Click back home button
    common_keyword.Click element when ready  ${BACK.HOME.BUTTON}