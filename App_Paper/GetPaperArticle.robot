*** Settings ***
Documentation                           该文档是读数字报详细页面接口用例文档
Resource                                ../App_Paper/PaperArticle_Common.robot
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     数字报（李昊）
...                                     作者：温怡春

*** Variables ***
${ID}                                   136                 
${ID0}                                  12138               
${RESULT0}                              -1
${VERSION}                              1584806400000
${TITLE}                                建言“革除滥食野生动物的陋习”
${SITEID}                               1

*** Test Cases ***
数字报稿件存在时查看详情，接口返回数据成功
    Get Paper Article                   ${id}               ${SITEID}
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed
    Should Be Equal As Strings          ${response_data.version}                ${version}
    Should Be Equal As Strings          ${response_data.title}                  ${title}

数字报稿件不存在时查看详情，接口返回失败
    Get Paper Article                   ${id0}              ${SITEID}
    Fapi Status Should Be               ${result0}