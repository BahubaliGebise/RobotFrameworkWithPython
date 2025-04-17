*** Variables ***
${BROWSER}    edge
${MyEuroClear}    https://my.euroclear.com/users/en/login.html
${USERNAME}    testuser
${PASSWORD}    testpass

${LOGIN_BUTTON}    xpath=//button/span[text()="Log in"]
${USERNAME_FIELD}    xpath=//input[@id="username"]
${PASSWORD_FIELD}    xpath=//input[@id='password']