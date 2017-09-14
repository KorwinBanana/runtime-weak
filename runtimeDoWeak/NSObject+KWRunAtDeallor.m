//
//  NSObject+KWRunAtDeallor.m
//  runtime如何实现weak属性
//
//  Created by korwin on 2017/9/14.
//  Copyright © 2017年 korwin. All rights reserved.
//

#import "NSObject+KWRunAtDeallor.h"
#import <objc/runtime.h>

const void *runAtDeallocBlockKey = &runAtDeallocBlockKey;

@implementation NSObject (KWRunAtDeallor)

- (NSHashTable *)KW_deallocExecutors {
    
    NSHashTable *table = objc_getAssociatedObject(self,runAtDeallocBlockKey);
    
    if (!table) {
        table = [NSHashTable hashTableWithOptions:NSPointerFunctionsStrongMemory];
        objc_setAssociatedObject(self, runAtDeallocBlockKey, table, OBJC_ASSOCIATION_RETAIN);
    }
    
    return table;
}

- (void)KW_runAtDealloc:(voidBlock)block {
    if (block) {
        KWBlockExecutor *executor = [[KWBlockExecutor alloc] initWithBlock:block];
        
        @synchronized (self) {
            [[self KW_deallocExecutors] addObject:executor];
        }
    }
}


@end
