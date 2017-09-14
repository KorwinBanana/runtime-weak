//
//  KWBlockExecutor.h
//  runtime如何实现weak属性
//
//  Created by korwin on 2017/9/14.
//  Copyright © 2017年 korwin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

typedef void(^voidBlock)(void);

@interface KWBlockExecutor : NSObject

- (id) initWithBlock:(voidBlock)block;

@end
