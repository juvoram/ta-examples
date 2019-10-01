#Rami Juvonen 2019

*** Settings ***
Library             SeleniumLibrary

*** Variables ***
${BROWSER}          googlechrome
${BASE_URL}         https://www.anime-planet.com

*** Keywords ***
Browser Setup
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window

Select Click Check
    [Arguments]        ${TARGET}    ${TITLE}
    Mouse Over         ${COLUMN}
    Click Element      ${TARGET}
    Title Should Be    ${TITLE}
    Click Element      ${COLUMN}





