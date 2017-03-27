//
//  LocalManagement.h
//  本地管理头像昵称工具类
//
//  Created by 海神 on 2017/3/27.
//  Copyright © 2017年 海神. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Model;
@interface LocalManagement : NSObject
/**
 初步设定这个这个类大概有以下几种方法可以回调
 
 1.首先可以通过id返回头像、昵称、最后更新时间
 2.可以向内部添加对应类
 {
 @{@"id":@{  @"头像":@"头像地址或者直接存图片",
 @"昵称":@"昵称",
 @"最后存入时间":@""}}
 }
 可以用归档解归档的方式来处理
 
 */

/**
归档
*/
- (void)archive;

/**
 解归档
 
 @return 返回会员信息对象
 */
+ (instancetype)unarchive;

@property (nonatomic, strong) NSArray <Model *> *ModelList;

@end



/**
 @[@{@"用户id":@{@"icon":@"",@"timestamp":@"",@"nickname":@""}},@{@"用户id":@{@"icon":@"",@"timestamp":@"",@"nickname":@""}}]
 */
@interface Model : NSObject

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *timestamp;

@property (nonatomic, copy) NSString *nickname;

@end















