//
//  NSDate+DNAdditions.m
//  DaNotes
//
//  Created by Kunwar on 9/3/14.
//  Copyright (c) 2014 Kunwar. All rights reserved.
//

#import "NSDate+DNAdditions.h"

@implementation NSDate (DNAdditions)

- (NSDate *)dateByAddingOffset:(NSInteger)offset
{
    return [self dateByAddingTimeInterval:60*60*24*offset];
}


@end
