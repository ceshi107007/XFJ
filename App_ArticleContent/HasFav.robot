*** Settings ***
Documentation                           判断稿件是否收藏
Resource                                ../App_ArticleContent/FavCommon.robot
Library                                 Selenium2Library
Suite Setup                             Create Session Common
Suite TearDown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建App     稿件互动操作/判断稿件是否收藏（许雁良）
...                                     作者：张鹏

*** Test Case ***
稿件已收藏接口返回成功(稿件收藏成功后，互动状态回写等待时间为30S，在此只能验证接口是否通)
    Article Fav Api
#    Sleep                       5
    Article HasFav Api
#    Should Be Equal As Strings         ${app_data.value}   true
    Fapi Request Should Be Succeed

稿件未收藏接口返回flase
    Article FavCancel Api
#    Sleep                       5
    Article HasFav Api
#    Should Be Equal As Strings  ${app_data.value}           false
    Fapi Request Should Be Succeed
