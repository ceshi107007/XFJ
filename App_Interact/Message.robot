*** Settings ***
Documentation                           该文档是获取系统消息接口用例文档
Resource                                ../App_Interact/InteractCommon.robot
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     系统消息（许雁良）
...                                     作者：黄羽

*** Variables ***
${SITEID}                               1
${SITEID1}                              2
${CURRENTPAGE}                          0                   #第一页
${CURRENTPAGE1}                         666                 #翻页数不存在
${CURRENTPAGE2}                         -1                  #翻页数错误的值
${STATUS}                               0
${RESULT}                               0
${RESULT1}                              []

*** Keywords ***

*** Test Case ***
输入正确的SITEID,接口返回第一页系统消息数据
    Message                             ${SITEID}
    ...                                 ${CURRENTPAGE}
    Fapi Status Should Be Succeed
    Fapi Status Should Be               ${STATUS}
    Fapi Data Field Count Should Not Be                     ${response_data.list}                   ${RESULT}

输入正确的SITEID,翻页数不存在接口返回数据为空
    Message                             ${SITEID}
    ...                                 ${CURRENTPAGE1}
    Fapi Status Should Be Succeed
    Fapi Data Field Count Should Be     ${response_data.list}                   ${RESULT}
    Should Be Equal As Strings          ${response_data.list}                   ${RESULT1}

输入错误的SITEID,接口返回系统消息数据为空
    Message                             ${SITEID1}
    ...                                 ${CURRENTPAGE}
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed
    Fapi Data Field Count Should Be     ${response_data.list}                   ${RESULT}
    Should Be Equal As Strings          ${response_data.list}                   ${RESULT1}