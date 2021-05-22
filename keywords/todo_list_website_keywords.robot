*** Settings ***
Resource    ../resources/imports.robot

*** Keywords ***
Assert to-do-task '${element}' should be display '${expeted}'
    ${actual}   get text   ${element}
    should be equal as strings    ${actual}     ${expeted}