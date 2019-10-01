#Rami Juvonen 2019

*** Settings ***
Documentation    Steps to run DEMO:
...              *1.* Get token from https://developer.spotify.com/console/get-browse-categories/
...              *2.* Copy-paste token to TOKEN variable (resource.robot)
...              *3.* Open Spotify app and select own albums.
...              *4.* Run "robot -i demo_phase_1 ."
...              *5.* Observe that PUT ALBUM TO LIBRARY TC fails (Spotify bug)
...              *6.* Verify from Spotify app that album was still added to library.
...              *7.* Run "robot -i demo_phase_2 ."
...              *8.* Verify from Spotify app that album was deleted from library.

Resource         resource.robot
Suite Setup      Set Headers    {"Authorization": "Bearer ${TOKEN}"}

*** Variables ***
${TEST_ALBUM}    Gaming Fantasy
${TEST_ARTIST}   Taylor Davis

*** Test Cases ***
GET CATEGORIES
    [Tags]       demo_phase_1
    Get Music Categories
    Print Response from Spotify
    Check that Spotify Returned OK status

GET ALBUM
    [Tags]       demo_phase_1
    Get Album  ${TEST_ALBUM}
    Print Response from Spotify
    Check that Spotify Returned OK Status
    Check that Artist is  ${TEST_ARTIST}
    Save Album ID

PUT ALBUM TO LIBRARY
    [Tags]       demo_phase_1
    # necessary dependency because Spofify internal album ID saved in GET ALBUM TC is needed
    Put Album Returned Earlier to Library
    Print Response from Spotify
    Check that Spotify Returned CREATED Status

DELETE ALBUM FROM LIBRARY
    [Tags]       demo_phase_2
    Delete Album Returned Earlier from Library
    Check that Spotify Returned OK Status



