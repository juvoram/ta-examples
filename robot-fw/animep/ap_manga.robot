#Rami Juvonen 2019

*** Settings ***
Resource               resource.robot
Suite Setup            Browser Setup
Suite Teardown         Close Browser

*** Test Cases ***
Browse Manga
    Set Suite Variable  ${COLUMN}    //*[@id="menuRoot"]/li[2]/a
    Click Element       ${COLUMN}
    Title Should Be     Manga and Recommendations | Anime-Planet

    # Data-driven tests to check items under column, input test data given to common template
    Select Click Check  //*[@id="menuRoot"]/li[2]/ul/li[1]/a    Manga Suggestions for You | Anime-Planet
    Select Click Check  //*[@id="menuRoot"]/li[2]/ul/li[2]/a    Browse All Manga | Anime-Planet
    Select Click Check  //*[@id="menuRoot"]/li[2]/ul/li[3]/a    Top Manga | Anime-Planet






