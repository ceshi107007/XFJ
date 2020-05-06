*** Settings ***
Documentation                           此文档用是推荐模块内容列表接口的公共文档
Resource                                ../Common/Common.robot
*** Variables ***
${MODULE_VIEW_URL}                      /moduleView
${ID}                                   126

*** Keywords ***
Get Module View
    [Documentation]                     入参参数只填写必填参数
    [Arguments]                         ${id}=${ID}
    Fapi Params Set                     id                  ${id}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${MODULE_VIEW_URL}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}