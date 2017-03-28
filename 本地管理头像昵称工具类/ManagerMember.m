#import "ManagerMember.h"
@implementation ManagerMember

+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"result" : [MemberResult class]};
}


- (void)archive{
    [NSKeyedArchiver archiveRootObject:self toFile:[NSHomeDirectory() stringByAppendingString:@"/Documents/ManagerMember.data"]];
}

+ (instancetype)unarchive{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[NSHomeDirectory() stringByAppendingString:@"/Documents/ManagerMember.data"]];
}


+ (MemberData *)queryWithId:(NSString *)member_id{
    ManagerMember *model = [self unarchive];
    for (MemberResult *result in model.result) {
        if ([result.id isEqualToString:member_id]) {
            return result.data;
            break;
        }
    }
   //设置默认
    MemberData *data = [[MemberData alloc] init];
    data.nickname = member_id;
    data.icon = @"";
    data.timestamp = @"";
    return data;
}
//1490630565

+ (BOOL)AddMemberData:(MemberResult *)data{
    if ([data isKindOfClass:[MemberResult class]]) {
        ManagerMember *model = [self unarchive];
        if (model == nil) model = [[ManagerMember alloc] init];
        NSMutableArray<MemberResult *> *memberArr = [NSMutableArray arrayWithArray:model.result];
        BOOL flag = NO;
        for (int i = 0; i < memberArr.count; i ++) {
            if ([memberArr[i].id isEqualToString:data.id]) {
                if (![self beforetimestamp:memberArr[i].data.timestamp WithAftertimestamp:data.data.timestamp]) {
//                    memberArr[i].data.nickname
                    //更新头像和昵称
                    memberArr[i].data = data.data;
                    model.result = memberArr;
                    [model archive];
                    NSLog(@"需要更改");
                }
                flag = YES;
                break;
            }
        }
        if (!flag) {
            [memberArr addObject:data];
            model.result = memberArr;
            [model archive];
        }
        return YES;
    }else{
        NSLog(@"类型不匹配");
        //无法添加不是MemberResult类的对象
        return NO;
    }

}
//CGFloat time = [@"1490630565" doubleValue];
//NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
////实例化一个NSDateFormatter对象
//NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
////设定时间格式,这里可以设置成自己需要的格式
//[dateFormatter setDateFormat:@"yyyy.MM.dd HH:mm:ss z"];
//NSString * str1 = [dateFormatter stringFromDate: detaildate];

/**
 比较时间哪个比较靠后

 @param timestamp1 第一个时间
 @param timestamp2 第二个时间
 @return 如果第一个时间比较晚，则返回YES，否则返回NO
 */
+ (BOOL)beforetimestamp:(NSString *)timestamp1 WithAftertimestamp:(NSString *)timestamp2{
//    CGFloat time = [timestamp1 doubleValue];
//    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
//    //实例化一个NSDateFormatter对象
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    //设定时间格式,这里可以设置成自己需要的格式
//    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
//    NSString * str = [dateFormatter stringFromDate:detaildate];
//    
//    CGFloat time1 = [timestamp2 doubleValue];
//    NSDate *detaildate1=[NSDate dateWithTimeIntervalSince1970:time1];
//    //实例化一个NSDateFormatter对象
//    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
//    //设定时间格式,这里可以设置成自己需要的格式
//    [dateFormatter1 setDateFormat:@"yyyyMMddHHmmss"];
//    NSString * str1 = [dateFormatter stringFromDate:detaildate1];
////    NSLog(@"%@\n%@\n%@",str,str1,([str intValue] > [str1 intValue] ? @"yes" : @"no"));
//    NSLog(@"%d\n%d\n%@",[timestamp1 intValue],[timestamp2 intValue],([timestamp1 intValue] > [timestamp2 intValue] ? @"YES" : @"NO"));
    return [timestamp1 intValue] > [timestamp2 intValue] ? YES : NO;
}


@end

@implementation MemberResult

+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"data" : [MemberData class]};
}

- (instancetype)initWithId:(NSString *)id MemberData:(MemberData *)data{
    self = [super init];
    if (self) {
        self.id = id;
        self.data = data;
    }
    return self;
}

@end

@implementation MemberData

- (instancetype)initWithNickName:(NSString *)nickname icon:(NSString *)icon timestamp:(NSString *)timestamp{
    self = [super init];
    if (self) {
        self.nickname = nickname;
        self.icon = icon;
        self.timestamp = timestamp;
    }
    return self;
}

@end

