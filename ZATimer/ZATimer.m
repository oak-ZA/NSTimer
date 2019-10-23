//
//  ZATimer.m
//  ZATimer
//
//  Created by 张奥 on 2019/10/23.
//  Copyright © 2019 张奥. All rights reserved.
//

#import "ZATimer.h"
#import "ZAProxy.h"
@interface ZATimer()
@property (nonatomic, weak) id target;
@property(nonatomic, assign) SEL selector;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, copy) void(^completeBock)(void);
@end
@implementation ZATimer

+(NSTimer*)scheduledTimerWithTimerInterval:(NSTimeInterval)time target:(id)target selector:(SEL)selector userInfo:(id)userInfo repeats:(BOOL)repeats{
    
    ZATimer *obj = [[ZATimer alloc] init];
    obj.target = target;
    obj.selector = selector;
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:time target:obj selector:@selector(excuteTimer:) userInfo:userInfo repeats:repeats];
    obj.timer = timer;
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    return timer;
}

+(NSTimer*)scheduledTimerWithTimeInterval:(NSTimeInterval)time repeats:(BOOL)repeats block:(void(^)(void))complete{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:time repeats:repeats block:^(NSTimer * _Nonnull timer) {
        if (complete) {
            complete();
        }
    }];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    return timer;
}

-(void)excuteTimer:(id)timer{
    [self.target performSelector:self.selector withObject:timer];
}

-(void)stopTimer{
    [self.timer invalidate];
    self.timer = nil;
}

-(void)dealloc{
    [self stopTimer];
}

@end
