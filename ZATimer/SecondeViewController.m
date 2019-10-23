//
//  SecondeViewController.m
//  ZATimer
//
//  Created by 张奥 on 2019/10/23.
//  Copyright © 2019 张奥. All rights reserved.
//

#import "SecondeViewController.h"
#import "ZATimer.h"
#import "ZAProxy.h"

@interface SecondeViewController ()
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) ZAProxy *prox;

@end

@implementation SecondeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor redColor];

    //处理后的方法  不会循环引用
//    NSTimer *timer = [ZATimer scheduledTimerWithTimerInterval:1 target:self selector:@selector(startTimer) userInfo:nil repeats:YES];
    
//    __weak typeof(self) weakSelf = self;
//    [ZATimer scheduledTimerWithTimeInterval:1 repeats:YES block:^{
//        __strong typeof(weakSelf) strongSelf = weakSelf;
//        NSLog(@"123");
//    }];
    
    //不会循环引用
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"123");
//    }];
//    self.timer = timer;
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    //循环引用
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(startTimer) userInfo:nil repeats:YES];
//    self.timer = timer;
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    //不会循环引用
    //修饰
    __weak typeof(self) weakSelf = self;
    NSTimer *timer = [NSTimer timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.name = @"123";
        NSLog(@"%@",strongSelf.name);
    }];
    self.timer = timer;
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

-(void)startTimer{
    NSLog(@"123");
}

-(void)dealloc{
    NSLog(@"seconde====dealloc");
    [self.timer invalidate];
    self.timer = nil;
}
- (IBAction)clickButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
