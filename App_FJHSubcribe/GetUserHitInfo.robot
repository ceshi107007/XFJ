*** Settings ***
Documentation                           获取翔宇号全部分类接口
Resource                                ../App_FJHSubcribe/SubcribeCommon.robot
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建App     获取当天打榜信息接口/互动订阅(林升)
...                                     作者：张鹏


*** Variables ***
${ID0}                                  57
${ID1}                                  666
${RESULT}                               福建交警

*** Keywords ***


*** Test Cases ***
当查看的福建号存在时，返回榜单信息
    Get User Hit Info                   ${ID0}
    Should Be Equal As Strings          ${response_data.topic}                  ${RESULT}


当查看的福建号不存在时，还是返回榜单信息（动态值）
    Get User Hit Info                   ${ID1}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed