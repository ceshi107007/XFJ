*** Settings ***
Documentation                           稿件收藏
Resource                                ../App_ArticleContent/FavCommon.robot
Suite Setup                             Create Session Common
Suite TearDown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     稿件互动操作/收藏（许雁良）
...                                     作者：张鹏

*** Variables ***
${TRUE}                                 true

*** Test Case ***
稿件未收藏时收藏，接口返回成功
    Article Fav Api
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed
#    Should Be Equal As Strings          ${app_data.value}           ${TRUE}

稿件已收藏时再次收藏，接口依旧返回成功
    Article Fav Api
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed

稿件Id为空时进行收藏，接口返回异常
    Article Fav Api                     ${EMPTY}
    Fapi Response Code


