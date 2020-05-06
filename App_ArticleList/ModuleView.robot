*** Settings ***
Documentation                           此文档用于验证推荐模块内容列表接口
Resource                                ../App_ArticleList/ModuleViewCommon.robot
Suite Setup                             Create Session Common
Suite TearDown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建App     推荐模块内容列表接口验证（李昊）
...                                     作者：张鹏

*** Variables ***
${ID0}                                   66666
${RESULT}                               于伟国
${RESULT0}                              -1

*** Test Cases ***
输入的自定义推荐模块存在时,接口返回推荐列表数据
    Get Module View
    Should Be Equal As Strings          ${response_data.list[0].cmiName}          ${RESULT}

输入的自定义推荐模块不存在时，接口返回异常
    Get Module View                     ${ID0}
    Fapi Status Should Be               ${RESULT0}