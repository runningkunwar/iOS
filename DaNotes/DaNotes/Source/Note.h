//
//  Note.h
//  DaNotes
//
//  Created by Kunwar on 9/3/14.
//  Copyright (c) 2014 Kunwar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Note : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * text;

@end
