//
//  NSObject+KWRunAtDeallor.m
//  runtime如何实现weak属性
//
//  Created by korwin on 2017/9/14.
//  Copyright © 2017年 korwin. All rights reserved.
//

#import "NSObject+KWRunAtDeallor.h"
#import "KWBlockExecutor.h"

@implementation NSObject (KWRunAtDeallor)

-(void)KW_runAtDealloc:(voidBlock)block
{
    if (block) {
        KWBlockExecutor *executor = [[KWBlockExecutor alloc]initWithBlock:block];
        
        objc_setAssociatedObject(self,
                                 runAtDeallocBlockKey,
                                 executor,
                                 OBJC_ASSOCIATION_RETAIN);    }
}

@end
