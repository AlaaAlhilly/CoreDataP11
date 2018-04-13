//
//  Students+Add.h
//  CoreDataP1
//
//  Created by Hamid on 6/28/15.
//  Copyright (c) 2015 HuxTek. All rights reserved.
//

#import "Students.h"

@interface Students (Add)
+ (Students *)addStudentInfoFromDictionary:(NSDictionary *)studentInfo;
+ (NSArray *) searchStudentByName:(NSString *)name lastname:(NSString *)lastname;
@end
