*** Settings ***
Documentation                           该文档是获取评论列表数据接口用例文档
Resource                                ../APP_DISCUSS/Discuss_Common.robot
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     评论列表
...                                     作者：黄羽

*** Variables ***
${ROOTID}                               887                     #有评论数的稿件ID
${ROOTID1}                              6666                    #不存在的稿件ID
${PAGE}                                 0                       #第一页
${PAGE1}                                100                     #翻页数不存在
${RESULT}                               0
${RESULT1}                              []

*** Keywords ***

*** Test Cases ***
有评论数的稿件ID，正常获取评论列表数据
    Discuss View                        ${ROOTID}
    ...                                 ${PAGE}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed
    Fapi Data Field Count Should Not Be                     ${response_data.list}    ${RESULT}
    Should Be Equal As Strings          ${response_data.list[0].articleID}           ${ROOTID}

翻页数不存在，接口返回数据为空
    Discuss View                        ${ROOTID}
    ...                                 ${PAGE1}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed
    Fapi Data Field Count Should Be     ${response_data.list}                   ${RESULT}
    Should Be Equal As Strings          ${response_data.list}                   ${RESULT1}

稿件ID不存在，接口返回数据为空
    Discuss View                        ${ROOTID1}
    ...                                 ${PAGE}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed
    Fapi Data Field Count Should Be     ${response_data.list}                   ${RESULT}
    Should Be Equal As Strings          ${response_data.list}                   ${RESULT1}