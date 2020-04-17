*** Settings ***
Documentation                           活动列表数据
Resource                                ../App_Activity/Activity_Common.robot
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     活动栏目/活动列表数据（丁希）
...                                     作者：张鹏

*** Variables ***
${UID}                                  666                 #账号不存在时
${UID0}                                 560                 #账号存在且参与过报名
${UID1}                                 584                 #账号存在但未参与过报名
${RESULT}                               0
${RESULT0}
${RESULT1}                              0
*** Keywords ***

*** Test Case ***
输入错误的账号id,接口返回为空
    My Activity List                    ${UID}
    Fapi Data Field Count Should Be     ${response_data.list}                   ${RESULT}

登录的账号参与过报名时，接口返回活动数据成功(因账号问题导致无法显示报名数据)
    My Activity List                    ${UID0}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed


登录的账号未参与过报名时，接口返回为空
    My Activity List                    ${UID0}
     Fapi Data Field Count Should Be    ${response_data.list}                   ${RESULT1}