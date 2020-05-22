*** Settings ***
Documentation                           该文档是获取推荐翔宇号接口用例文档
Resource                                ../App_Search/Search_Common.robot
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     推荐翔宇号（张进）
...                                     作者：黄羽

*** Variables ***
${SITEID}                               1
${SITEID1}                              2
${USERID}                               494                 #已关注订阅号的用户ID
${USERID1}                              583                 #未关注订阅号的用户ID
#${TOPIC}                                福建交警
${ISFOLLOW}                             1
${ISFOLLOW1}                            0
${RESULT}                               0
${RESULT1}                              []

*** Keywords ***

*** Test Case ***
输入正确的SITEID,获取推荐翔宇号成功，已关注订阅号的用户返回已关注
    Recommend Xys                       ${SITEID}
    ...                                 ${USERID}
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed
    Should Be Equal As Strings          ${response_data[0].isFollow}            ${ISFOLLOW}

输入正确的SITEID,获取推荐翔宇号成功，未关注订阅号的用户返回未关注(动态值)
    Recommend Xys                       ${SITEID}
    ...                                 ${USERID1}
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed

输入错误的SITEID,接口返回推荐翔宇号为空
    Recommend Xys                       ${SITEID1}
    ...                                 ${USERID}
    Fapi Status Should Be Succeed
    Fapi Data Field Count Should Be     ${response_data}    ${RESULT}
    Should Be Equal As Strings          ${response_data}    ${RESULT1}
