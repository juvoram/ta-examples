#Rami Juvonen 2019

Documentation    To run DEMO:
    ...              robot --name Anime-Planet ap*.robot

*** Settings ***
Resource                resource.robot
Suite Setup             Browser Setup
Suite Teardown          Close Browser

*** Test Cases ***
Browse Anime
    Set Suite Variable  ${COLUMN}    //*[@id="menuRoot"]/li[1]/a
    Click Element       ${COLUMN}
    Title Should Be     Anime Recommendations | Anime-Planet

    # Data-driven tests to check items under column, input test data given to common template
    # Anime Seasons Charts (1st item in the column) not tested because it changes every season
    # -> not ideal for TA
    Select Click Check  //*[@id="menuRoot"]/li[1]/ul/li[2]/a    Watch Anime Online | Anime-Planet
    Select Click Check  //*[@id="menuRoot"]/li[1]/ul/li[3]/a    Anime Suggestions for You | Anime-Planet
    Select Click Check  //*[@id="menuRoot"]/li[1]/ul/li[4]/a    Browse All Anime | Anime-Planet
    Select Click Check  //*[@id="menuRoot"]/li[1]/ul/li[5]/a    Top Anime | Anime-Planet





