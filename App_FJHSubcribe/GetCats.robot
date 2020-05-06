*** Settings ***
Documentation                           获取翔宇号全部分类接口
Resource                                ../App_FJHSubcribe/SubcribeCommon.robot
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建App     获取翔宇号全部分类接口/互动订阅(林升)
...                                     作者：张鹏

*** Variables ***
${RESULT}                               本地

*** Keywords ***



*** Test Cases ***
查看翔宇号全部分类
    Get Cats
    Should Be Equal As Strings          ${response_data[0].catName}             ${RESULT}
