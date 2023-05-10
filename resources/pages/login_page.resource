*** Keywords ***
Input username in username field
    [Arguments]    ${user_name}
    common_keyword.Input text in element when ready  ${LOGIN.USERNAME.TEXTBOX}  ${user_name}

Input password in password field
    [Arguments]    ${password}
    common_keyword.Input text in element when ready  ${LOGIN.PASSWORD.TEXTBOX}  ${password}

Click login button
    common_keyword.Click element when ready  ${LOGIN.LOGIN.BUTTON}

Check error login failed message
    SeleniumLibrary.Wait until element is visible   ${ERROR.LOGIN.MESSAGE}
    common_keyword.Click element when ready  ${ERROR.CROSS.BUTTON}

Check error locked out user message
    SeleniumLibrary.Wait until element is visible   ${LOCKED.USER.MESSAGE}
    common_keyword.Click element when ready  ${ERROR.CROSS.BUTTON}