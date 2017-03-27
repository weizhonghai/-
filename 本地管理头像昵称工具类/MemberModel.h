//101--环信用户注册失败
//102--环信聊天室创建失败
//103--网易直播室创建失败
//104--环信用户昵称修改失败
//105--删除环信聊天室失败
//106--删除网易直播室失败
//107--直播室创建失败，主播认证中
//108--直播室创建失败，主播认证失败
//109--直播室创建失败，用户未认证主播


@class MemberResult;
#import <Foundation/Foundation.h>

@interface MemberModel : NSObject

/**
 状态  0为失败   1为成功
 */
@property (nonatomic, assign) long Status;

/**
 结果(处理成功返回处理结果，失败返回错误信息)
 */
@property (nonatomic, strong) MemberResult *Result;

/**
 归档
 */
- (void)archive;

/**
 解归档

 @return 返回会员信息对象
 */
+ (instancetype)unarchive;

/**
 判断是否登录  主要用于判断本地是否缓存会员信息

 @return 返回BOOL类型
 */
+ (BOOL)isLogin;

/**
 退出登录  并且删除本地缓存的会员信息
 */
+ (void)exit;

@end

@interface MemberResult : NSObject

/**
 用户手机号
 */
@property (nonatomic, copy) NSString *User_Tel;

/**
 用户余额
 */
@property (nonatomic, copy) NSString *User_Balance;

/**
 用户真实姓名
 */
@property (nonatomic, copy) NSString *User_Actual_Name;

/**
 用户积分
 */
@property (nonatomic, copy) NSString *User_Integral;

/**
 用户性别
 */
@property (nonatomic, copy) NSString *User_Sex;

/**
 用户Email
 */
@property (nonatomic, copy) NSString *User_Email;

/**
 用户ＩＤ
 */
@property (nonatomic, copy) NSString *User_Id;

/**
 用户名
 */
@property (nonatomic, copy) NSString *User_Name;

/**
 用户昵称
 */
@property (nonatomic, copy) NSString *User_Nick_Name;

/**
 用户状态（0停用 1启用）
 */
@property (nonatomic, copy) NSString *User_Status;

/**
 用户认证（0未认证 1已认证 2认证中 3认证失败）
 */
@property (nonatomic, copy) NSString *User_Approve;

/**
 用户身份证号    如果当前字段不为空 则当前用户已经实名认证
 */
@property (nonatomic, copy) NSString *User_Number;

/**
 用户注册时间
 */
@property (nonatomic, copy) NSString *User_Add_Time;

/**
 用户等级
 */
@property (nonatomic, copy) NSString *User_Level;

/**
 用户上次登录时间
 */
@property (nonatomic, copy) NSString *User_Login_Time;

/**
 用户地址
 */
@property (nonatomic, copy) NSString *User_Address;

/**
 用户年龄
 */
@property (nonatomic, copy) NSString *User_Age;

/**
 用户头像
 */
@property (nonatomic, copy) NSString *User_Avatar;

/**
 用户个性签名
 */
@property (nonatomic, copy) NSString *User_Signature;

/**
 直播室封面
 */
@property (nonatomic, copy) NSString *User_Live;

/**
 用户密码
 */
@property (nonatomic, copy) NSString *User_PassWord;

/**
 主播等级
 */
@property (nonatomic, copy) NSString *Anchor_Level;

/**
 是否是主播（0不是 1是）
 */
@property (nonatomic, copy) NSString *Is_Anchor;

/**
 是否有公会（0没有 1有）
 */
@property (nonatomic, copy) NSString *Is_Guild;

/**
 点赞数
 */
@property (nonatomic, copy) NSString *Praise;
@end

