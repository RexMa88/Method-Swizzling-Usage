//
//  ViewController.m
//  MethodSwizzling
//
//  Created by RexMa on 15/8/26.
//  Copyright (c) 2015年 RexMa. All rights reserved.
//

#import "ViewController.h"
#import "NewMethod.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //Class Method
        [self replaceMethod];
    });
}

+ (void)replaceMethod{
    Method oldMethodOne = class_getInstanceMethod([self class], @selector(oldMethodRunning));
    Method newMethodOne = class_getInstanceMethod([NewMethod class], @selector(newMethodRunning));
    
    method_setImplementation(oldMethodOne, method_getImplementation(newMethodOne));
}

- (void)oldMethodRunning{
    NSLog(@"The old Method is running");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self oldMethodRunning];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
