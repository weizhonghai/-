@class MemberData;
@class MemberResult;
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ManagerMember : NSObject

/**
 获取本地一共有多少组缓存的头像和昵称
 */
@property (nonatomic, strong) NSArray <MemberResult *> *result;


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
 通过id查询对应的会员信息

 @param member_id 通过id存储的头像昵称信息
 @return 返回头像昵称对象
 */
+ (MemberData *)queryWithId:(NSString *)member_id;

/**
 添加一条需要本地存储的头像昵称对象

 @param data 头像昵称对象
 @return 返回成功或者失败
 */
+ (BOOL)AddMemberData:(MemberResult *)data;

@end

@interface MemberResult : NSObject

/**
 通过id来筛选出自己所需要的头像和昵称对象
 */
@property (nonatomic, copy) NSString *id;

/**
 头像和昵称对象
 */
@property (nonatomic, strong) MemberData *data;

- (instancetype)initWithId:(NSString *)id MemberData:(MemberData *)data;

@end

@interface MemberData : NSObject

- (instancetype)initWithNickName:(NSString *)nickname icon:(NSString *)icon timestamp:(NSString *)timestamp;
/**
 昵称
 */
@property (nonatomic, copy) NSString *nickname;

/**
 头像
 */
@property (nonatomic, copy) NSString *icon;

/**
 最后一次更新的时间戳
 */
@property (nonatomic, copy) NSString *timestamp;

@end

