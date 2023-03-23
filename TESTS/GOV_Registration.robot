*** Settings ***
Library                 Selenium2Library
Library                 FakerLibrary

*** Variables ***
${URL}                           https://www.apprenticeshipindia.gov.in/
${Register_Link}                 //app-header/div[@id='scrollup']/div[1]/section[1]/div[1]/nav[1]/div[1]/div[1]/div[1]/div[1]/ul[1]/li[7]/div[1]/span[1]/button[1]
${browser}                       chrome
${DBT_FAQ_Button}                xpath://span[contains(text(),'DBT FAQ')]
${PMNAM_Reg_Button}              xpath://app-header/div[@id='scrollup']/div[1]/section[1]/div[1]/nav[1]/div[1]/div[1]/div[1]/div[1]/ul[1]/li[2]/a[1]/button[1]
${APPERENT_mela_Button}          xpath://app-header/div[@id='scrollup']/div[1]/section[1]/div[1]/nav[1]/div[1]/div[1]/div[1]/div[1]/ul[1]/li[3]/a[1]/button[1]
${Candidate/login/reg_Button}   xpath://app-header/div[@id='scrollup']/div[1]/section[1]/div[1]/nav[1]/div[1]/div[1]/div[1]/div[1]/ul[1]/li[4]/a[1]/button[1]/span[1]
${TECH_support_Button}           xpath://app-header/div[@id='scrollup']/div[1]/section[1]/div[1]/nav[1]/div[1]/div[1]/div[1]/div[1]/ul[1]/li[5]/a[1]/button[1]/span[1]
${Login_Button}                  xpath://button[contains(text(),'Login')]
${Register_Button}               xpath://app-header/div[@id='scrollup']/div[1]/section[1]/div[1]/nav[1]/div[1]/div[1]/div[1]/div[1]/ul[1]/li[7]/div[1]/span[1]/button[1]
${Reports_Button}                xpath://button[contains(text(),'Reports')]
${Reg_List}=                     get list
${Login_as_Candidate_radio_btn}         xpath://app-header/div[@id='scrollup']/section[1]/div[1]/app-candidate-login[1]/section[2]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/form[1]/div[1]/input[1]
${Register_as_Candidate_radio_btn}      xpath://label[contains(text(),'Register as a candidate')]
${Enter_your_EmailID_texbox}            xpath://app-header/div[@id='scrollup']/section[1]/div[1]/app-candidate-login[1]/section[2]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/form[1]/div[1]/input[1]
${Register_btn_Cndidate_Reg}             xpath://app-header/div[@id='scrollup']/section[1]/div[1]/app-candidate-login[1]/section[2]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/form[1]/button[1]
${send_reactivation_link_reg}            xpath://a[contains(text(),'Resend activation link ?')]
${mobile_no_txtbox_Reg}                  xpath://app-header/div[@id='scrollup']/section[1]/div[1]/app-candidate-login[1]/section[2]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/form[1]/div[1]/input[1]
${EmailID_txtbox_Reg}                    xpath://app-header/div[@id='scrollup']/section[1]/div[1]/app-candidate-login[1]/section[2]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/form[1]/div[2]/input[1]
${OTP_submitbtn_reg}                     xpath=//button[contains(text(),'Submit')]
${OTP_textbox_reg}                       xpath=//app-header/div[@id='scrollup']/section[1]/div[1]/app-candidate-login[1]/section[2]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/form[1]/div[2]/input[1]
*** Test Cases ***
TC1: Open Website and verify page title
    open browser        ${URL}      ${browser}
    sleep               3
    log to console      Successfully opened the website!!!!!
    maximize browser window
    log title
TC2: GET THE COUNT OF ALL LINKS ON THE DEFAULT PAGE
    ${Get_all_Links}=               get element count       xpath://a
    log to console                  ${Get_all_Links}
TC3: Verify the links from the header in the default page
    page should contain element     ${DBT_FAQ_Button}
    PAGE SHOULD CONTAIN ELEMENT     ${PMNAM_Reg_Button}
    page should contain element     ${APPERENT_mela_Button}
    page should contain element     ${Candidate/login/reg_Button}
    page should contain element     ${TECH_support_Button}
    page should contain element     ${Login_Button}
    page should contain element     ${Register_Button}
    PAGE SHOULD CONTAIN ELEMENT     ${Reports_Button}
    log to console                  Page link verification successfully!!!!!
    sleep                           3


#TC4: VERIFY the REGISTER DROPDOWN list content
 #   click element                   ${Register_Button}
  #  sleep                           3
   # @{Reg_List}=                    get list items      ${Register_Button}
    #${Listlabel}=                   get selected list label  ${Register_Button}
   # sleep                           3
    #log to console                  TC3 is successfully completed!!!!
TC4: Candidate login/Registration form elements verification
    click element                   ${Candidate/login/reg_Button}
    sleep                           3
    page should contain element     ${Login_as_Candidate_radio_btn}
    page should contain element     ${Register_as_Candidate_radio_btn}
    page should contain element     ${enter_your_emailid_texbox}
    page should contain element     ${mobile_no_txtbox_Reg}
    page should contain element     ${Register_btn_Cndidate_Reg}
    page should contain element     ${send_reactivation_link_reg}
    sleep                           3

TC5: CAndidate registration form click and form element verification
    click element                   ${Register_as_Candidate_radio_btn}
    sleep                           4
    log to console                  Candidate Registration page displayed successfully!!!!!
    page should contain element     ${MOBILE_NO_TXTBOX_REG}
    page should contain element     ${Enter_your_EmailID_texbox}
    page should contain element     ${Register_btn_Cndidate_Reg}
    sleep                           3

TC6: Candidate registration form field/textbox validation
     click element                  ${Register_btn_cndidate_reg}
     page should contain            Mobile number is required
     page should contain            Email ID is required
     page should contain            Please fill required fields!
     sleep                          3
     #${Mob_no_invalid}=             length should be    7
     #log to console                 ${Mob_no_invalid}
     input text                     ${MOBILE_NO_TXTBOX_REG}     99123
     input text                     ${EmailID_txtbox_Reg}       test#aja.com
     sleep                          2
     page should contain            Minimum length 10
     page should contain            Please enter valid Email ID
     sleep                          2
TC7: Register with valid data using faker
    ${Mobile_no_data_reg}           FakerLibrary.Phone Number
    input text                      ${mobile_no_txtbox_Reg}     ${Mobile_no_data_reg}
    sleep                           2
    log to console                  ${Mobile_no_data_reg}
    ${Emailid_data_reg}             FakerLibrary.Email
    input text                      ${EmailID_txtbox_Reg}       ${Emailid_data_reg}
    log to console                  ${Emailid_data_reg}
    sleep                           12

TC8: Verification of OTP page to complete registration Part1
    input text                      ${mobile_no_txtbox_Reg}         +919988991121
    sleep                           2
    click element                   ${Register_btn_Cndidate_Reg}
    sleep                           3
    page should contain             Please enter the OTP received on your registered Mobile Number/E-mail
    page should contain             OTP is required
    page should contain             Resend OTP
    page should contain element     ${OTP_submitbtn_reg}
    sleep                           4
TC9: Verification of OTP page to complete registration Part2
    ${OTP_code_invalid}             FakerLibrary.Random Int
    input text                      ${OTP_textbox_reg}        ${OTP_code_invalid}
    log to console                  ${OTP_code_invalid}
    sleep                           3
    click element                   ${OTP_submitbtn_reg}
    page should contain             Minimum length 6
    sleep                           4
    input text                      ${OTP_textbox_reg}         ${819191}
    click element                   ${otp_submitbtn_reg}
    page should contain             Invalid OTP.
TC10: 


*** Keywords ***
