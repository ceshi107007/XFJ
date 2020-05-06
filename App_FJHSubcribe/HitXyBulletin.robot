*** Settings ***
Documentation                           翔宇号打榜
Resource                                ../App_FJHSubcribe/SubcribeCommon.robot
Force Tags                              冒烟集-新福建App     翔宇号打榜/翔宇号（林升）
...                                     作者：张鹏
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions


*** Variables ***
${NEW_USERID}                           ${EMPTY}
${NEW_XYID}                             123456789
${RESULT}                               3

*** Keywords ***


*** Test Cases ***
已登录账号且打榜的翔宇号存在，接口返回操作成功
    Hit Xy Bulletin
    Log                                 ${response_data}
    Fapi Data Field Count Should Be     ${response_data}                        ${RESULT}


未登录账号且打榜的翔宇号存在，接口返回操作成功
    Sleep                               1
    Hit Xy Bulletin                     ${NEW_USERID}
    Fapi Data Field Count Should Be     ${response_data}                        ${RESULT}

已登录账号但打榜的翔宇号不存在，接口返回操作成功
    Sleep                               1
    Hit Xy Bulletin                     ${USERID}
    ...                                 ${NEW_XYID}
    Fapi Data Field Count Should Be     ${response_data}                        ${RESULT}
