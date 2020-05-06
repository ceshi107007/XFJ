*** Settings ***
Documentation                           该文档是获取热门栏目接口用例文档
Resource                                ../App_Search/Search_Common.robot
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     热门栏目（张进）
...                                     作者：黄羽

*** Variables ***
${SITEID}                               1                   #正确的值
${SITEID1}                              0                   #错误的值
${NAME}                                 头条
${RESULT}                               0

*** Keywords ***

*** Test Case ***
输入正确的SITEID,获取热门栏目成功
    Hot Columns                         ${SITEID}
    Fapi Status Should Be Succeed
    Should Be Equal As Strings          ${response_data[0].columnName}          ${NAME}

输入错误的SITEID,接口返回热门栏目为空
    Hot Columns                         ${SITEID1}
    Fapi Status Should Be Succeed
    Fapi Data Field Count Should Be     ${response_data}    ${RESULT}