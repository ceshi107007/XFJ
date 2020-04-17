*** Settings ***
Documentation                           活动报名名单
Resource                                ../App_Activity/Activity_Common.robot
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     互动活动/活动报名名单（丁希）
...                                     作者：张鹏

*** Variables ***
${ID}                                   242                 #有报名信息的普通活动
${ID0}                                  125                 #无报名信息的普通活动
${ID1}                                  223                 #链接活动
${ID2}                                  88888               #活动Id不存在
${RESULT}                               zp1070071嗯嗯哒
${RESULT0}                              0
${RESULT1}                              0
${RESULT2}                              {}

*** Keywords ***

*** Test Case ***
查看有报名的活动，成功返回报名名单数据
    Get EntryList                       ${ID}
    Should Be Equal As Strings          ${response_data.list[0].name}           ${RESULT}

查看无报名的活动，返回数据为空
    Get EntryList                       ${ID0}
    Fapi Data Field Count Should Be     ${response_data.list}                   ${RESULT0}

查看链接活动，返回数据为空
    Get EntryList                       ${ID1}
    Fapi Data Field Count Should Be     ${response_data.list}                   ${RESULT1}

活动Id不存在时，返回数据为空
    Get EntryList                       ${ID2}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed
