//
//  LocalManagement.m
//  本地管理头像昵称工具类
//
//  Created by 海神 on 2017/3/27.
//  Copyright © 2017年 海神. All rights reserved.
//

#import "LocalManagement.h"

@implementation LocalManagement


- (void)archive{
    [NSKeyedArchiver archiveRootObject:self toFile:[NSHomeDirectory() stringByAppendingString:@"/Documents/menber.plist"]];
}
+ (instancetype)unarchive{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[NSHomeDirectory() stringByAppendingString:@"/Documents/menber.plist"]];
}


@end
