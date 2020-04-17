*** Settings ***
Documentation                           该文档是获取稿件列表模块接口用例文档
Resource                                ../Common/Common.robot
Force Tags                              冒烟集-新福建APP     稿件列表相关接口（丁希）
...                                     作者：张鹏

*** Variables ***
${GETARTICLES_URI}                      /getArticles        #栏目稿件列表
${SITEID}                               1


*** Keywords ***
Get Articles
    [Documentation]                     获取栏目稿件列表接口
    [Arguments]                         ${columnid}
    ...                                 ${siteid}=${SITEID}
    Fapi Params Set                     columnId            ${columnid}
    ...                                 siteId              ${siteid}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${GETARTICLES_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}