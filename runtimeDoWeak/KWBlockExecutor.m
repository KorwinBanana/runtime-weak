//
//  KWBlockExecutor.m
//  runtime如何实现weak属性
//
//  Created by korwin on 2017/9/14.
//  Copyright © 2017年 korwin. All rights reserved.
//

#import "KWBlockExecutor.h"

@interface KWBlockExecutor () {
    voidBlock _block;
}
@end

@implementation KWBlockExecutor

- (id)initWithBlock:(voidBlock)aBlock
{
    self = [super init];
    if (self) {
        _block = [aBlock copy];
    }
    return self;
}

- (void)dealloc
{
    _block ? _block():nil;
}

@end
