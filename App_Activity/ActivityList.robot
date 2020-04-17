*** Settings ***
Documentation                           该文档是获取活动列表接口用例文档
Resource                                ../App_Activity/Activity_Common.robot
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     互动活动/活动列表接口（丁希）
...                                     作者：张鹏

*** Variables ***
${ID}                                   2
${ID0}                                  666
${RESULT0}
${RESULT1}
${RESULT2}                              0

*** Keywords ***

*** Test Cases ***
获取全部分类下的活动列表数据，接口返回成功
    Get Activity List
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed


获取子分类下的活动列表数据，接口返回成功
    Get Activity List                   ${ID}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed

当分类不存在时，接口返回为空
    Get Activity List                   ${ID0}
    Fapi Data Field Count Should Be     ${response_data.list}                   ${RESULT2}



