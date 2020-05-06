*** Settings ***
Documentation                           该文档是检索某栏目及其子孙栏目的稿件接口用例文档
Resource                                ../App_Search/Search_Common.robot
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     检索某栏目及其子孙栏目的稿件（张进）
...                                     作者：黄羽

*** Variables ***
${COLUMNID}                             0
${COLUMNID1}                            1                   #一级栏目（首页）
${COLUMNID2}                            5                   #二级栏目（头条）
${COLUMNID3}                            61                  #二级栏目（政情）
${COLUMNID4}                            100                 #三级栏目（屏山大院）
${COLUMNID5}                            124                 #四级栏目（于伟国）
${COLUMNID6}                            666                 #栏目不存在
${KEY}                                  福建                #正常关键字
${KEY1}                                 null                #非法关键字
${ARTICLETYPE}                          -1
${ARTICLETYPE1}                         3
${RESULT}                               0
${RESULT1}                              []

*** Keywords ***

*** Test Cases ***
获取所有栏目及其子栏目的所有稿件数据,接口返回查询结果
    Search All                          ${COLUMNID}
    ...                                 ${KEY}
    ...                                 ${ARTICLETYPE}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed
    Fapi Data Field Count Should Not Be                     ${response_data}    ${RESULT}
    ${json_data}                        Fapi Response Data
    ${str_data}                         Convert To String                       ${json_data}
    Should Contain                      ${str_data}         ${KEY}

获取所有栏目及其子栏目的专题稿件数据,接口返回查询结果
    Search All                          ${COLUMNID}
    ...                                 ${KEY}
    ...                                 ${ARTICLETYPE1}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed
    Fapi Data Field Count Should Not Be                     ${response_data}    ${RESULT}
    ${json_data}                        Fapi Response Data
    ${str_data}                         Convert To String                       ${json_data}
    Should Contain                      ${str_data}         ${KEY}
    Should Be Equal As Strings          ${response_data[0].articleType}         ${ARTICLETYPE1}

获取一级栏目（首页）及其子栏目的所有稿件数据,接口返回查询结果
    Search All                          ${COLUMNID1}
    ...                                 ${KEY}
    ...                                 ${ARTICLETYPE}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed
    Fapi Data Field Count Should Not Be                     ${response_data}    ${RESULT}
    ${json_data}                        Fapi Response Data
    ${str_data}                         Convert To String                       ${json_data}
    Should Contain                      ${str_data}         ${KEY}

获取不存在子栏目的二级栏目（头条）的所有稿件数据，接口返回查询结果
    Search All                          ${COLUMNID2}
    ...                                 ${KEY}
    ...                                 ${ARTICLETYPE}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed
    Fapi Data Field Count Should Not Be                     ${response_data}    ${RESULT}
    ${json_data}                        Fapi Response Data
    ${str_data}                         Convert To String                       ${json_data}
    Should Contain                      ${str_data}         ${KEY}

获取二级栏目（政情）及其子栏目的所有稿件数据，接口返回查询结果
    Search All                          ${COLUMNID3}
    ...                                 ${KEY}
    ...                                 ${ARTICLETYPE}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed
    Fapi Data Field Count Should Not Be                     ${response_data}    ${RESULT}
    ${json_data}                        Fapi Response Data
    ${str_data}                         Convert To String                       ${json_data}
    Should Contain                      ${str_data}         ${KEY}

获取三级栏目（屏山大院）及其子栏目的所有稿件数据，接口返回查询结果
    Search All                          ${COLUMNID4}
    ...                                 ${KEY}
    ...                                 ${ARTICLETYPE}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed
    Fapi Data Field Count Should Not Be                     ${response_data}    ${RESULT}
    Should Contain                      ${response_data[0].title}               ${KEY}
    ${json_data}                        Fapi Response Data
    ${str_data}                         Convert To String                       ${json_data}
    Should Contain                      ${str_data}         ${KEY}

获取四级栏目（于伟国）的所有稿件数据，接口返回查询结果
    Search All                          ${COLUMNID5}
    ...                                 ${KEY}
    ...                                 ${ARTICLETYPE}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed
    Fapi Data Field Count Should Not Be                     ${response_data}    ${RESULT}
    ${json_data}                        Fapi Response Data
    ${str_data}                         Convert To String                       ${json_data}
    Should Contain                      ${str_data}         ${KEY}

测试不存在栏目ID，接口返回查询结果为空
    Search All                          ${COLUMNID6}
    ...                                 ${KEY}
    ...                                 ${ARTICLETYPE}
    Fapi Data Field Count Should Be     ${response_data}    ${RESULT}
    Should Be Equal As Strings          ${response_data}    ${RESULT1}

输入非法关键字，接口返回查询结果为空
    Search All                          ${COLUMNID}
    ...                                 ${KEY1}
    ...                                 ${ARTICLETYPE}
    Fapi Data Field Count Should Be     ${response_data}    ${RESULT}
    Should Be Equal As Strings          ${response_data}    ${RESULT1}