*** Settings ***
Documentation                           该文档是获取APP消息推送一览接口用例文档
Resource                                ../App_Interact/InteractCommon.robot
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     APP消息推送一览（许雁良）
...                                     作者：黄羽

*** Variables ***
${SITEID}                               1
${SITEID1}                              0
${CURRENTPAGE}                          0                   #第一页
${CURRENTPAGE1}                         666                 #翻页数不存在
${CURRENTPAGE2}                         -1                  #翻页数错误的值
${STATUS}                               0
${STATUS1}                              -1
${RESULT}                               0
${RESULT1}                              []

*** Keywords ***

*** Test Case ***
输入正确的SITEID,接口返回第一页推送数据
    Get Apppushmessage                  ${SITEID}
    ...                                 ${CURRENTPAGE}
    Fapi Status Should Be Succeed
    Fapi Status Should Be               ${STATUS}
    Fapi Data Field Count Should Not Be                     ${response_data}    ${RESULT}

输入正确的SITEID,翻页数不存在接口返回数据为空
    Get Apppushmessage                  ${SITEID}
    ...                                 ${CURRENTPAGE1}
    Fapi Status Should Be Succeed
    Fapi Data Field Count Should Be     ${response_data}    ${RESULT}
    Should Be Equal As Strings          ${response_data}    ${RESULT1}

输入正确的SITEID,翻页数错误接口为空,状态码为-1
    Get Apppushmessage                  ${SITEID}
    ...                                 ${CURRENTPAGE2}
    Fapi Request Should Be Succeed
    Fapi Status Should Be               ${STATUS1}

输入错误的SITEID,接口返回第一页推送数据为空
    Get Apppushmessage                  ${SITEID1}
    ...                                 ${CURRENTPAGE}
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed
    Fapi Data Field Count Should Be     ${response_data}    ${RESULT}
    Should Be Equal As Strings          ${response_data}    ${RESULT1}