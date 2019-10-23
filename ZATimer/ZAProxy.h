//
//  ZAProxy.h
//  ZATimer
//
//  Created by 张奥 on 2019/10/23.
//  Copyright © 2019 张奥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZAProxy : NSProxy
+(instancetype)ZA_proxyWithTarget:(id)target;
@property (nonatomic, weak) id target;
@end
