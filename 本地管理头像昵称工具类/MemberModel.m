#import "MemberModel.h"
@implementation MemberModel

+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"Result" : [MemberResult class]};
}
- (void)archive{
    [NSKeyedArchiver archiveRootObject:self toFile:[NSHomeDirectory() stringByAppendingString:@"/Documents/menber.plist"]];
}
+ (instancetype)unarchive{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[NSHomeDirectory() stringByAppendingString:@"/Documents/menber.plist"]];
}

+ (BOOL)isLogin{
    NSFileManager *fm = [NSFileManager defaultManager];
    if ([fm fileExistsAtPath:[NSHomeDirectory() stringByAppendingString:@"/Documents/menber.plist"]]) {
        return YES;
    }else{
        return NO;
    }
}

+ (void)exit{
    NSFileManager *fm = [NSFileManager defaultManager];
    NSError *error;
    [fm removeItemAtPath:[NSHomeDirectory() stringByAppendingString:@"/Documents/menber.plist"] error:&error];
}
@end

@implementation MemberResult


@end

