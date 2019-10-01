#Rami Juvonen 2019

*** Settings ***
Resource                resource.robot
Suite Setup             Browser Setup
Suite Teardown          Close Browser

*** Test Cases ***
Login to Members Area
    Set Selenium Speed  1
    Click Element       //*[@id="siteUser"]/div/a[2]
    Input Text          username    testuser
    Input Password      password    testuser
    Click Element       loginButton

Create Anime List
    Go To               ${BASE_URL}
    ${BOX_SEARCH}       Set Variable    //*[@id="siteSearch-input"]
    Click Element       ${BOX_SEARCH}
    Input Text          ${BOX_SEARCH}    Tonari no Totoro
    Submit Form
    Click Element       //*[@id="addToCustomList"]
    ${BOX_LIST_NAME}    Set Variable    //*[@id="list_name"]
    Wait Until Page Contains Element    ${BOX_LIST_NAME}
    Click Element       ${BOX_LIST_NAME}
    Input Text          ${BOX_LIST_NAME}    test
    Click Button        //*[@id="addItemToCustomList"]

Delete Anime List
    Go To               https://www.anime-planet.com/users/testuser/lists
    Click Element       //*[@id="customLists"]/div[1]/div/h4/div[2]/div/a[2]
    Handle Alert

Logout From Members Area
    Mouse Over          //*[@id="siteUser"]/div/a/img
    Click Element       //*[@id="siteUser"]/div/ul/li[9]/a
    Set Selenium Timeout  5
