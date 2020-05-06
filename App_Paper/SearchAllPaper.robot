*** Settings ***
Documentation                           该文档是检索报纸稿件接口用例文档
Resource                                ../App_Paper/PaperArticle_Common.robot
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     数字报（李昊）
...                                     作者：温怡春

*** Variables ***                       
${FILEID}                               124
${FILEID0}                              141
${RESULT0}                              []
${KEY}                                  世界水日
${KEY0}                                 王小明
${KEY1}                                 "治病根，拔穷根"
${KEY2}                                 2020
${KEY3}                                 CEO

*** Test Cases ***
输入中文关键字，返回搜索结果
    Search All Paper                    ${key}
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed
    Should Be Equal As Strings          ${response_data[0].fileId}              ${fileid}

无对应的稿件，返回搜索结果为空
    Search All Paper                    ${key0}
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed
    Should Be Equal As Strings          ${response_data}                        ${RESULT0}

输入带标题符号的关键字，返回搜索结果
    Search All Paper                    ${key1}
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed
    Should Be Equal As Strings          ${response_data[0].fileId}              ${fileid0}

输入数字关键字，返回搜索结果
    Search All Paper                    ${key2}
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed

输入英文关键字，返回搜索结果
    Search All Paper                    ${key3}
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed


