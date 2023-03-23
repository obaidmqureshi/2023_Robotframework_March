*** Settings ***
Library     Selenium2Library

*** Variables ***
${URL}                  https://www.visitdubai.com/en/register
${browser}              Chrome
${Country_Dropdown}     xpath://select[@id='Country']
${Country_value}        xpath://option[contains(text(),'India')]

*** Test Cases ***
TC1: Launch URL
    open browser  ${URL}    ${BROWSER}
    sleep   4
    click element       ${Country_Dropdown}

    log to console      dropdown list is opened
    sleep       5
   # mouse down          ${Country_value}
    click element       ${Country_value}
    log to console      Country selected successfully
    sleep       7


*** Keywords ***



