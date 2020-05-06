*** Settings ***
Documentation                           该文档是读数字报接口用例文档
Resource                                ../Common/Common.robot
#Force Tags                              冒烟集-新福建APP     数字报相关接口（李昊）
#...                                     作者：温怡春

*** Variables ***
${GETPAPERARTICLE_URI}                  /getPaperArticle
${GETPAPERS_URI}                        /getPapers
${GETPAPERARTICLES_URI}                 /getPaperArticles
${GETPAPERDATES_URI}                    /getPaperDates
${GETPAPERLAYOUTS_URI}                  /getPaperLayouts
${SEARCHALLPAPER_URI}                   /searchAllPaper

*** Keywords ***
Get Paper Article
    [Documentation]                     查看数字报稿件详情
    [Arguments]                         ${id}
    ...                                 ${SITEID}
    Fapi Params Set                     id                  ${id}
    ...                                 siteID              ${SITEID}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${GETPAPERARTICLE_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Get Papers
    [Documentation]                     读所有报刊列表
    [Arguments]                         ${SITEID}
    Fapi Params Set                     siteID              ${SITEID}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${GETPAPERS_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Get Paper Articles
    [Documentation]                     读报纸版面信息
    [Arguments]                         ${layoutid}
    Fapi Params Set                     id                  ${layoutid}
    ...                                 siteID              1
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${GETPAPERARTICLES_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Get Paper Dates
    [Documentation]                     读取某报纸下的期刊
    [Arguments]                         ${paperid}
    ...                                 ${count}
    Fapi Params Set                     id                  ${paperid}
    ...                                 count               ${count}
    ...                                 start               0
    ...                                 siteID              1
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${GETPAPERDATES_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Get Paper Layouts
    [Documentation]                     读取某期刊下的目录数据
    [Arguments]                         ${paperid}
    ...                                 ${date}
    Fapi Params Set                     id                  ${paperid}
    ...                                 date                ${date}
    ...                                 siteID              1
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${GETPAPERLAYOUTS_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Search All Paper
    [Documentation]                     检索报纸稿件
    [Arguments]                         ${key}
    Fapi Params Set                     key                 ${key}
    ...                                 count               20
    ...                                 start               0
    ...                                 siteID              1
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${SEARCHALLPAPER_URI} 
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}


