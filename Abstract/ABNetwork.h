//
//  ABNetwork.h
//  Abstract
//
//  Created by Jon Como on 8/15/14.
//  Copyright (c) 2014 Jon Como. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ABColumn.h"

@interface ABNetwork : NSObject

@property (nonatomic, strong) NSMutableArray *columns;

-(void)inputActiveColumn:(NSArray *)indeces;

@end
