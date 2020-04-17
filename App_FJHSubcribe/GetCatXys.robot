*** Settings ***
Documentation                           获取翔宇号字分类接口
Resource                                ../App_FJHSubcribe/SubcribeCommon.robot
Force Tags                              冒烟集-新福建App     获取翔宇号字分类接口/互动订阅(林升)
...                                     作者：张鹏
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions

*** Variables ***
${ID0}                                  101
${ID1}                                  666
${RESULT0}
${RESULT1}                              0

*** Keywords ***

*** Test Cases ***
查看翔宇号子分类列表数据，接口返回成功
    Get Cat Xys                         ${ID0}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed

子分类不存在时，查看翔宇号子分类列表数据，接口返回为空
    Get Cat Xys                         ${ID1}
    Fapi Data Field Count Should Be     ${response_data.xys}                    ${RESULT1}

