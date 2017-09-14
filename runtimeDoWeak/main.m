//
//  main.m
//  runtimeDoWeak
//
//  Created by korwin on 2017/9/14.
//  Copyright © 2017年 korwin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+KWRunAtDeallor.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSObject *sb = [[NSObject alloc]init];
        [sb KW_runAtDealloc:^{
            NSLog(@"正在销毁sb！！！");
        }];
    }
    return 0;
}
