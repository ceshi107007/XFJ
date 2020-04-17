*** Settings ***
Documentation                           该文档是获取活动详情接口用例文档
Resource                                ../App_Activity/Activity_Common.robot
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     互动活动/活动详情接口（丁希）
...                                     作者：张鹏

*** Variables ***
${ID0}                                  66666
${ID1}                                  242
${ID2}                                  223
${RESULT0}                              ${EMPTY}

*** Keywords ***


*** Test Cases ***
活动资源不存在时，接口正常响应但返回数据为空
    Get Activity Detail                 ${ID0}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed

活动资源存在查看普通活动详情，接口返回该活动内的数据
    Get Activity Detail                 ${ID1}
    Should Be Equal As Strings          ${response_data.fileId}                 ${ID1}

活动资源存在查看链接活动详情，接口返回
    Get Activity Detail                 ${ID2}
    Should Be Equal As Strings          ${response_data.fileId}                 ${ID2}