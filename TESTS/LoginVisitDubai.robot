*** Settings ***
Library     Selenium2Library




*** Variables ***
${URL}           https://www.visitdubai.com/en
${browser}      Chrome
${Login_link}   Link:Login
${Username}     id:Username
${UN_Value}     Ahmed.mdqureshi@gmail.com
${Password}     id:Password
${PWD_Value}    User@123
${LoginBtn}     xpath://button[contains(text(),'Login')]
${Recaptcha}    class:recaptcha-checkbox-border


*** Test Cases ***
TESTCASE1_1_Open the Website and verify title
    OPEN BROWSER   ${URL}   ${browser}
    maximize browser window
    get title       log     get title
    log to console  Home page is displayed successfully!!!!
    sleep  4
TESTCASE1_2_CLick on Login Link
    click link  ${Login_link}
    sleep  5
    get title
    log to console  The Login page is displayed successfully !!!!!!!!
TESTCASE1_3_Enter Test data for UN and Pwd
    input text  ${Username}     ${UN_Value}
    input text  ${Password}     ${PWD_Value}
    sleep  6
    LOG TO CONSOLE  We have successfully entered the UN and Password!!!!!!
    sleep  6
    #Manually click on the recapthca check box to proceed further

TESTCASE1_4_Click Submit and verify page is
    click button  ${LoginBtn}
    sleep  5
    log to console  Successfully logged in to the application


*** Keywords ***


