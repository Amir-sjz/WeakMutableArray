//
//  NSMutableArray+WeakReferences.h
//  WeakArray
//
//  Created by chengZ on 2017/7/18.
//  Copyright © 2017年 chengZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (WeakReferences)
+ (id)mutableArrayUsingWeakReferences;
+ (id)mutableArrayUsingWeakReferencesWithCapacity:(NSUInteger)capacity;
@end
