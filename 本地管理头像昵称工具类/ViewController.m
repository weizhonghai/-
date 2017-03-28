//
//  ViewController.m
//  本地管理头像昵称工具类
//
//  Created by 海神 on 2017/3/27.
//  Copyright © 2017年 海神. All rights reserved.
//

#import "ViewController.h"
#import "ManagerMember.h"
@interface ViewController ()

@end

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
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    ManagerMember *model = [ManagerMember unarchive];
//    [model archive];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor blackColor];
    [btn addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btn:(UIButton *)sender{
    MemberData *data = [ManagerMember queryWithId:@"13545768888"];
    NSLog(@"%@\n%@\n%@",data.timestamp,data.icon,data.nickname);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    MemberData *data = [[MemberData alloc] initWithNickName:@"黎明11" icon:@"cxddx" timestamp:@"1490630567"];
    MemberResult *model = [[MemberResult alloc] initWithId:@"13545768888" MemberData:data];

    [ManagerMember AddMemberData:model];
    NSLog(@"%@",NSHomeDirectory());
}

////    1490630565
//    CGFloat time = [@"1490630565" doubleValue];
//    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
//    //实例化一个NSDateFormatter对象
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    //设定时间格式,这里可以设置成自己需要的格式
//    [dateFormatter setDateFormat:@"yyyy.MM.dd HH:mm:ss z"];
//    NSString * str1 = [dateFormatter stringFromDate: detaildate];
//    NSLog(@"%@",str1);



@end
