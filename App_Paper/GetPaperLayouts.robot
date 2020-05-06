*** Settings ***
Documentation                           该文档是读取期刊下的目录数据接口用例文档
Resource                                ../App_Paper/PaperArticle_Common.robot
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     数字报（李昊）
...                                     作者：温怡春

*** Variables ***
${PAPERID}                              1
${PAPERID0}                             100  
${DATE}                                 20200322
${VERSION}                              1584806400000
${VERSION0}                             0
${LAYOUTS}                              []

*** Test Cases ***
读取期刊下的目录数据，返回数据成功
    Get Paper Layouts                   ${paperid}
    ...                                 ${date}
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed
    Should Be Equal As Strings          ${response_data.version}             ${version}
    Should Be Equal As Strings          ${response_data.date}                ${date}

期刊目录下此日期无数据，返回数据为空
    Get Paper Layouts                   ${paperid0}
    ...                                 ${date}
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed
    Should Be Equal As Strings          ${response_data.version}                ${version0}
    Should Be Equal As Strings          ${response_data.layouts}                ${layouts}