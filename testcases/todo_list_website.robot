*** Settings ***
Resource            ../keywords/todo_list_website_keywords.robot
Suite Setup         Open browser    ${url}    ${BROWSER}
Suite Teardown      Close browser

*** Test Cases ***
Test add item web with thai
    Given Click Link    Add Item
    And Input Text    id=new-task    ทดสอบภาษาไทย
    When Click Element    //button
    Then Click Link    To-Do Tasks
    And Assert to-do-task 'id=text-1' should be display 'ทดสอบภาษาไทย'

Test add item web with eng
    Given Click Link    Add Item
    And Input Text    id=new-task    Test English
    When Click Element    //button
    Then Click Link    To-Do Tasks
    And Assert to-do-task 'id=text-2' should be display 'Test English'

Test add item web with spacial char
    Given Click Link    Add Item
    And Input Text    id=new-task    !@#$%
    When Click Element    //button
    Then Click Link    To-Do Tasks
    And Assert to-do-task 'id=text-3' should be display '!@#$%'

Test delete todo list
    Given Click Link    To-Do Tasks
    When Click Element    //button[@id='1']
    Then Assert to-do-task 'id=text-1' should be display 'Test English'
    And Assert to-do-task 'id=text-2' should be display '!@#$%'

Test todo list
    Given Click Link    To-Do Tasks
    When Click Element    id=text-2
    Then Assert to-do-task 'id=text-1' should be display 'Test English'
    And Click Link    Completed
    And Assert to-do-task '//*[@id='completed-tasks']//li//span' should be display 'done!@#$%'

Test delete completed tesk
    Given Click Link    To-Do Tasks
    And Click Element    id=text-1
    And Click Link    Completed
    When Click Element    //button[@id='1']
    Then Assert to-do-task '//*[@id='completed-tasks']//li//span' should be display 'doneTest English'