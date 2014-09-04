//
//  UIView+DNAdditions.m
//  DaNotes
//
//  Created by Kunwar on 9/3/14.
//  Copyright (c) 2014 Kunwar. All rights reserved.
//

#import "UIView+DNAdditions.h"

@implementation UIView (DNAdditions)

- (void)showLayoutBorder
{
    self.layer.borderColor = [[UIColor redColor] CGColor];
    self.layer.borderWidth = 1.0f;
}


@end
