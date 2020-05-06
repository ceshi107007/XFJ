*** Settings ***
Documentation                           该文档是获取热词搜索接口用例文档
Resource                                ../App_Search/Search_Common.robot
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     热词搜索（张进）
...                                     作者：黄羽

*** Variables ***
${SITEID}                               1
${SITEID1}                              0
${WORDS}                                全国两会
${RESULT}                               0

*** Keywords ***

*** Test Case ***
输入正确的SITEID,获取热词搜索成功
    Hot Words                           ${SITEID}
    Fapi Status Should Be Succeed
    Fapi Data Field Count Should Not Be                     ${response_data.words}                  ${RESULT}
    Should Contain                      ${response_data.words}                  ${WORDS}

输入错误的SITEID,接口返回热词数据为空
    Hot Words                           ${SITEID1}
    Fapi Status Should Be Succeed
    Fapi Data Field Count Should Be     ${response_data.words}                  ${RESULT}
