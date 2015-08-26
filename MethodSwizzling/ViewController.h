//
//  ViewController.h
//  MethodSwizzling
//
//  Created by RexMa on 15/8/26.
//  Copyright (c) 2015年 RexMa. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NewMethod;

@interface ViewController : UIViewController

+ (void)replaceMethod;
- (void)oldMethodRunning;

@end

