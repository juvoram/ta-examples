#Rami Juvonen 2019

*** Settings ***
Library           REST    https://api.spotify.com/v1
Library           String

*** Variables ***
${TOKEN}          BQA5ZbdEU-uGFvc39m7A5UlDPP9kWm9n3kFn0kW4sUDWv90mbnB1aMY5Kc6l-NXpRpaPFLbBLZ_uqYfAIYocHbtDAoovksjyKmfXWXH2ps5cquESmR2_mq_9f-aM5UA3rzNRA4fWqW90pRxpuOR-K714QJ2QNQC6QDHYVf9P8PrQ2l7sN1LnpbcpilOawGkQSV6Xd9xqeVTzCCGv8DKw8y4H1rtdapK0K9DdfUgoiRwOPoCQ4za-YPqUmkZ7V2Z6tY5XB9k5o1Mm0uzfaEz_b1u47ik-hEdwy10

*** Keywords ***
Get Music Categories
    Get           browse/categories

Get Album
    [ARGUMENTS]   ${album_name}
    ${album_name} =    Replace String    ${album_name}    ${SPACE}    %20
    ${NAME_ENDPOINT}    Set Variable    empty
    ${NAME_ENDPOINT} =    Catenate    SEPARATOR=    search?q=%22    ${album_name}    %22&type=album
    Get           ${NAME_ENDPOINT}

Put Album Returned Earlier to Library
    Put           ${ID_ENDPOINT}

Delete Album Returned Earlier from Library
    #endpoint hardcoded for demo purposes, to allow running phase 2 separately
    #in real usage would be replaced by ${ID_ENDPOINT}
    Delete        me/albums?ids=6UPtrUpu6OatglZPxLTwAr

Print Response from Spotify
    Output        response body

Check that Spotify Returned OK Status
    Integer       response status    200

Check that Spotify Returned CREATED Status
    Integer       response status    201

Check that Artist is
    [Arguments]   ${artist_name}
    String        $.albums.items[0].artists[0].name   ${artist_name}

Save Album ID
    ${ALBUM_ID}   Set Variable     empty
    ${ALBUM_ID} =    Output    $.albums.items[0].id
    ${ALBUM_ID} =    Catenate    SEPARATOR=    me/albums?ids=    ${ALBUM_ID}
    Set Suite Variable    ${ID_ENDPOINT}    ${ALBUM_ID}

