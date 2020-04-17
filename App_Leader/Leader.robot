*** Settings ***
Documentation                           人物详情
Resource                                ../App_Leader/LeaderCommon.robot
Force Tags                              冒烟集-新福建App     人物详情/人物（张进）
...                                     作者：张鹏
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions

*** Variables ***
${ID0}                                  18
${ID1}                                  123
${RESULT}                               于伟国
${STATUS}                               -1

*** Keywords ***


*** Test Cases ***
查看的人物详情存在时，接口返回相关信息
    Leader                              ${ID0}
    Should Be Equal As Strings          ${response_data.name}                   ${RESULT}

查看的人物详情存在时，接口为空，状态码为-1
    Leader                              ${ID1}
    Fapi Status Should Be               ${STATUS}
