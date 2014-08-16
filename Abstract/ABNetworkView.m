//
//  ABNetworkView.m
//  Abstract
//
//  Created by Jon Como on 8/16/14.
//  Copyright (c) 2014 Jon Como. All rights reserved.
//

#import "ABNetworkView.h"

@implementation ABNetworkView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    CGSize offset = CGSizeMake(rect.size.width/4, rect.size.height/4);
    
    [[UIColor blackColor] setFill];
    CGContextSetLineWidth(ref, 4);
    
    // Drawing code
    int x = 0, y = 0;
    int side = 0;
    for (int i = 0; i<16; i++){
        
        ABColumn *c = self.network.columns[i];
        if (c.isActive){
            [[UIColor redColor] setStroke];
        }else{
            [[UIColor blackColor] setStroke];
        }
        
        CGRect columnRect = CGRectMake(x, y, offset.width, offset.height);
        CGContextStrokeRect(ref, columnRect);
        
        
        side ++;
        x += offset.width;
        if (side >=  4){
            x = 0;
            y += offset.height;
            side = 0;
        }
    }
}

@end
