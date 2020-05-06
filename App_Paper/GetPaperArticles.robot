*** Settings ***
Documentation                           该文档是读报纸稿件列表接口用例文档
Resource                                ../App_Paper/PaperArticle_Common.robot
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     数字报（李昊）
...                                     作者：温怡春

*** Variables ***
${LAYOUTID}                             16 
${LAYOUTID0}                            100
${VERSION}                              1584806400000
${VERSION0}                             0
${RESULT0}                              []

*** Test Cases ***
读报纸稿件列表接口，返回数据成功
    Get Paper Articles                  ${layoutid}
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed
    Should Be Equal As Strings          ${response_data[0].version}             ${version}

报纸版面无数据，返回数据为空
    Get Paper Articles                  ${layoutid0}
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed
    Should Be Equal As Strings          ${response_data}                        ${result0}