*** Settings ***
Documentation                           该文档是获取栏目模块接口用例文档
Resource                                ../App_ArticleList/Article_Common.robot
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     栏目接口/列表页稿件阅读数接口（李昊）
...                                     作者：张鹏


*** Variables ***
${ID0}                                  2005
${ID1}                                  8888
${RESULT}                               找不到相关稿件

*** Keywords ***

*** Test Cases ***
当输入的稿件id存在时，接口返回改稿件的实时点击数
    Get Article Counts                  ${ID0}
    Should Be Equal As Strings          ${response_data.fileId}                 ${ID0}

当输入的稿件id存在时，接口返回改稿件的实时点击数
    Get Article Counts                  ${ID1}
    Should Be Equal As Strings          ${response_data.errorInfo}              ${RESULT}