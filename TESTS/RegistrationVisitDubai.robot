*** Settings ***
Library     Selenium2Library
Library     Test




*** Variables ***
${URL}                  https://www.visitdubai.com/en
${browser}              Chrome
${Login_link}           Link:Login
${UN_textfield}         xpath://input[@id='Username']
${lOGIN_LINK}           Link:lOGIN
${Register_link}        Link:Register
${Firstname_textbox}    xpath://input[@id='Firstname']
${Lastname_textbox}     xpath://input[@id='Lastname']
${Register_password}    xpath://input[@id='Password']
${Register_confirmPassword}     xpath://input[@id='Confirm password']
${Register_Email}       xpath://input[@id='Email']
${Register_Country}     xpath://select[@id='Country']
${Register_button}      xpath://button[contains(text(),'Register')]
${Firstname_Data}       JAMIESON
${Lastname_Data}        WILCOX
${Password_Data}        TESTuno@123
${Confirmpwd_Data}      TESTuno@123\
${Email_Data}           Jamieson.Wilcox@fairmaint.com
${Country_Dropdown}     xpath://select[@id='Country']
${Country_value}        xpath://option[contains(text(),'India')]
*** Test Cases ***

TESTCASE2_1_Open the Website and verify title
    OPEN BROWSER   ${URL}   ${browser}
    maximize browser window
    log to console      Home page is displayed successfully!!!!
    title should be     Visit Dubai - Official Tourism Board in Dubai
    log to console      title displayed correctly!!!!


    sleep  4

TESTCASE2_2 CLICK ON LOGIN LINK TO OPEN LOGIN/REGISTRATION PAGE
    CLICK LINK  ${LOGIN_LINK}
    sleep  4
    LOG TO CONSOLE      Login page is displayed successfully!!!!!
    title should be     Login | Visit Dubai
    log to console      Login page title verified successfully!!!
    sleep  4
TESTCASE2_3 Click on Register Link
    CLICK LINK  ${Register_link}
    sleep  4
    log to console      Registration page displayed successfully!!!
    title should be     Register | Create an Account on Visit Dubai
    log to console      Registeration page title verified successfully!!!
TestCASE2_4 Verify the contents of the Registration page
    page should contain     First name*
    page should contain     Last name*
    page should contain     password*
    page should contain     Confirm password*
    page should contain     Email*
    page should contain     Country*
    log to console          All labels verified successfully!!!!
    sleep  4
    PAGE SHOULD NOT CONTAIN  TESTING MESSAGE
    log to console           Negative verification test pass!!!
TESTCASE2_5 Register page elements
    page should contain element     ${Firstname_textbox}
    page should contain element     ${Lastname_textbox}
    page should contain element     ${Register_password}
    page should contain element     ${Register_confirmPassword}
    PAGE SHOULD CONTAIN ELEMENT     ${register_email}
    PAGE SHOULD CONTAIN ELEMENT     ${Register_Country}
    page should contain element     ${Register_button}
    sleep  5
    log to console  Register elements are displayed, test case 2_5 passed !!!!!!
TESTCASE2_6 Field value entry
    input text       ${Firstname_textbox}        ${Firstname_Data}
    sleep       3
    input text       ${Lastname_textbox}         ${Lastname_Data}
    #input text        ${Register_Email}}          ${Email_Data}
    #textfield should contain        ${Register_Country} `       ${Country_Data}
     log to console     Field values are entered correctly!!!!
     sleep      4

TESTCASE2_7 Country dropdown field read the list
    #select from list by value        ${Country_Data}        India
    click element       ${Country_Dropdown}
    log to console      dropdown list is opened
    sleep       3
    #mouse down          ${Country_value}
    click element       ${Country_value}
    log to console      Country selected successfully + "${Country_value}"
    sleep       23

TESTCASE2_8 Verify Validation messages for no entries
    click button        ${Register_button}
    #Note there is a CAPTCHA check box that should be manually clicked
    LOG TO CONSOLE      BUTTON CLICKED SUCCESSFULLy!!!!!
    sleep       5
    page should contain     Please enter your firstname
    page should contain     Please enter your last name
    page should contain     Please enter password
    page should contain     Please enter email adderss
    page should contain     Please select country
    sleep       3
    log to console          Validation messages displayed successfully!!!!!!
*** Keywords ***
