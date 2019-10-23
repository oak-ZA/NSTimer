//
//  ZATimer.h
//  ZATimer
//
//  Created by 张奥 on 2019/10/23.
//  Copyright © 2019 张奥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZATimer : NSObject
+(NSTimer*)scheduledTimerWithTimerInterval:(NSTimeInterval)time target:(id)target selector:(SEL)selector userInfo:(id)userInfo repeats:(BOOL)repeats;
+(NSTimer*)scheduledTimerWithTimeInterval:(NSTimeInterval)time repeats:(BOOL)repeats block:(void(^)(void))complete;
@end
