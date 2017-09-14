//
//  NSObject+KWRunAtDeallor.h
//  runtime如何实现weak属性
//
//  Created by korwin on 2017/9/14.
//  Copyright © 2017年 korwin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KWBlockExecutor.h"

const void *runAtDeallocBlockKey = &runAtDeallocBlockKey;

@interface NSObject (KWRunAtDeallor)

-(void)KW_runAtDealloc:(voidBlock)block;

@end
