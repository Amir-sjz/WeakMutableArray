//
//  ViewController.m
//  WeakArray
//
//  Created by chengZ on 2017/7/18.
//  Copyright © 2017年 chengZ. All rights reserved.
//

#import "ViewController.h"
#import "TestModel.h"
#import "WeakMutableArray.h"
#import "NSMutableArray+WeakReferences.h"

@interface ViewController ()
@property (nonatomic, strong) TestModel *testModel;
@property (nonatomic, strong) WeakMutableArray *weakMutableArray;

@property (nonatomic, strong) NSMutableArray *weak_MutableArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    
//    [self method1];
    [self method2];
    
}

- (void)method1 {
    self.testModel = [TestModel createModel];
    self.weak_MutableArray = [NSMutableArray mutableArrayUsingWeakReferences];
    [self.weak_MutableArray addObject:[TestModel new]];
    [self.weak_MutableArray addObject:self.testModel];
    [self performSelector:@selector(delayEvent1) withObject:nil afterDelay:0.5f];
}


- (void)method2 {
    self.testModel = [TestModel createModel];
    self.weakMutableArray = [WeakMutableArray new];
    [self.weakMutableArray addObject:[TestModel new]];
    [self.weakMutableArray addObject:self.testModel];
    [self performSelector:@selector(delayEvent2) withObject:nil afterDelay:0.5f];
}

- (void)delayEvent1 {
    NSLog(@"%ld", (long)self.weak_MutableArray.count);
    NSLog(@"%@", [self.weak_MutableArray objectAtIndex:0]);
    NSLog(@"%@", [self.weak_MutableArray objectAtIndex:1]);
    
    
    for (int count=0; count<self.weak_MutableArray.count; count++) {
        TestModel *model = self.weak_MutableArray[count];
        [model description];
    }
}

- (void)delayEvent2 {
    NSLog(@"%ld", (long)self.weakMutableArray.usableCount);
    NSLog(@"%ld", (long)self.weakMutableArray.allCount);
    NSLog(@"%@", [self.weakMutableArray objectAtWeakMutableArrayIndex:0]);
    NSLog(@"%@", [self.weakMutableArray objectAtWeakMutableArrayIndex:1]);
    
    
    NSArray *array = self.weakMutableArray.allObjects;
    for (int count=0; count<array.count; count++) {
        TestModel *model = array[count];
        [model description];
    }
    
}

@end
