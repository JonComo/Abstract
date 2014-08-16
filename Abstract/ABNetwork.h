//
//  ABNetwork.h
//  Abstract
//
//  Created by Jon Como on 8/15/14.
//  Copyright (c) 2014 Jon Como. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ABColumn.h"

@class ABNetworkView;

@interface ABNetwork : NSObject

@property (nonatomic, strong) NSMutableArray *columns;
@property (nonatomic, weak) ABNetworkView *view;

-(void)inputActiveColumn:(NSArray *)indeces;
-(NSArray *)activeColumns;

@end
