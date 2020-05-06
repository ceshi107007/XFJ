*** Settings ***
Documentation                           该文档是搜索模块接口用例文档
Resource                                ../Common/Common.robot
Force Tags                              冒烟集-新福建APP     搜索相关接口（张进）
...                                     作者：黄羽

*** Variables ***
${SEARCHALL_URI}                        /searchAll          #检索某栏目及其子孙栏目的稿件接口
${HOTWORDS_URI}                         /hotWords           #热词搜索接口
${HOTCOLUMNS_URI}                       /hotColumns         #获取热门栏目接口
${RECOMMEND_URI}                        /recommendXys       #获取推荐翔宇号接口
${SITEID}                               1

*** Keywords ***
Search All
    [Documentation]                     检索某栏目及其子孙栏目的稿件
    [Arguments]                         ${columnid}
    ...                                 ${key}
    ...                                 ${articletype}
    ...                                 ${start}=${0}
    ...                                 ${count}=${20}
    ...                                 ${siteid}=${SITEID}
    Fapi Params Set                     columnId            ${columnid}
    ...                                 key                 ${key}
    ...                                 start               ${start}
    ...                                 count               ${count}
    ...                                 siteID              ${siteid}
    ...                                 articleType         ${articletype}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${SEARCHALL_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Hot Words
    [Documentation]                     获取热词搜索
    [Arguments]                         ${siteid}
    Fapi Params Set                     siteID              ${siteid}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${HOTWORDS_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Hot Columns
    [Documentation]                     获取热门栏目
    [Arguments]                         ${siteid}
    Fapi Params Set                     siteID              ${siteid}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${HOTCOLUMNS_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Recommend Xys
    [Documentation]                     获取推荐翔宇号
    [Arguments]                         ${siteid}
    ...                                 ${userid}
    Fapi Params Set                     siteID              ${siteid}
    ...                                 userId              ${userid}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${RECOMMEND_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}
