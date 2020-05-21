*** Settings ***
Documentation                           该文档是读数字报报刊列表接口用例文档
Resource                                ../App_Paper/PaperArticle_Common.robot
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     数字报（李昊）
...                                     作者：温怡春

*** Variables ***
${SITEID}                               1                
${SITEID0}                              100               
${VERSION0}                             0
${RESULT0}                              -1
${NAME}                                 福建日报

*** Test Cases ***
报刊列表接口返回数据成功
    Get Papers                          ${SITEID}
    Fapi Status Should Be Succeed
    Should Be Equal As Strings          ${response_data.papers[0].name}     ${name}

报刊列表接口返回数据为空
    Get Papers                          ${SITEID0}
    Fapi Status Should Be Succeed
    Should Be Equal As Strings          ${response_data.version}            ${version0}