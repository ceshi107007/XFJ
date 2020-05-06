*** Settings ***
Documentation                           该文档是获取我的收藏接口用例文档
Resource                                ../App_Interact/InteractCommon.robot
Resource                                ../App_ArticleContent/FavCommon.robot
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     我的收藏（张进）
...                                     作者：黄羽

*** Variables ***
${USERID}                               494                 #已收藏数据的USERID
${USERID1}                              583                 #未收藏数据的USERID
${PAGE}                                 0                   #第一页
${PAGE1}                                666                 #翻页数不存在
${RESULT}                               0
${RESULT1}                              []
${ARTICLEID}                            346

*** Keywords ***

*** Test Case ***
输入已收藏数据的USERID,接口返回第一页收藏数据（动态数据无法精确校验）
    My Fav                              ${USERID}
    ...                                 ${PAGE}
    Fapi Status Should Be Succeed
    Fapi Data Field Count Should Not Be                     ${response_data.list}                   ${RESULT}
    Article Fav Api
    Sleep                               3
    My Fav                              ${USERID}
    ...                                 ${PAGE}
    Fapi Status Should Be Succeed
#    Should Be Equal As Strings          ${response_data.list[0].articleID}     ${ARTICLEID}

输入已收藏数据的USERID,翻页数不存在接口返回数据为空
    My Fav                              ${USERID}
    ...                                 ${PAGE1}
    Fapi Status Should Be Succeed
    Fapi Data Field Count Should Be     ${response_data.list}                  ${RESULT}
    Should Be Equal As Strings          ${response_data.list}                  ${RESULT1}

输入未收藏数据的USERID，接口返回数据为空
    My Fav                              ${USERID1}
    ...                                 ${PAGE}
    Fapi Status Should Be Succeed
    Fapi Data Field Count Should Be     ${response_data.list}                  ${RESULT}
    Should Be Equal As Strings          ${response_data.list}                  ${RESULT1}