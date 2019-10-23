//
//  ZAProxy.m
//  ZATimer
//
//  Created by 张奥 on 2019/10/23.
//  Copyright © 2019 张奥. All rights reserved.
//

#import "ZAProxy.h"


@implementation ZAProxy

//-(instancetype)initWithTaget:(id)target{
//    _target = target;
//    return self;
//}
//
//+(instancetype)ZA_proxyWithTarget:(id)target{
//    return [[ZAProxy alloc] initWithTaget:target];
//}

- (void)forwardInvocation:(NSInvocation *)invocation{
    SEL sel = [invocation selector];
    if ([self.target respondsToSelector:sel]) {
        [invocation invokeWithTarget:self.target];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    return [self.target methodSignatureForSelector:sel];
}


- (BOOL)respondsToSelector:(SEL)aSelector{
    return [self.target respondsToSelector:aSelector];
}

@end
