*** Settings ***
Documentation                           取消收藏
Resource                                ../App_ArticleContent/FavCommon.robot
Suite Setup                             Create Session Common
Suite TearDown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建App     稿件互动操作/取消收藏（许雁良）
...                                     作者：张鹏

*** Variables ***
${ARTICLEID}                            2049

*** Test Case ***
稿件未收藏时取消收藏操作，接口依旧返回成功
    Article FavCancel Api               ${ARTICLEID}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed

#当稿件ID为空时取消收藏操作，接口返回异常
#    Article FavCancel Api              ${EMPTY}
#    Fapi Response Code  500

稿件已收藏时取消收藏操作，接口返回成功
    Article Fav Api
    Article FavCancel Api
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed

稿件重复取消收藏，接口依旧返回成功
    Article Fav Api
    Article FavCancel Api
    Article FavCancel Api
#    Should Be Equal As Strings         ${app_data.value}   true
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed





