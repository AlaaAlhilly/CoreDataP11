//
//  Students+Add.m
//  CoreDataP1
//
//  Created by Hamid on 6/28/15.
//  Copyright (c) 2015 HuxTek. All rights reserved.
//

#import "Students+Add.h"
#import "AppDelegate.h"

@implementation Students (Add)

+ (Students *)addStudentInfoFromDictionary:(NSDictionary *)studentInfo
{
    AppDelegate *appDelegate= (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    Students *studentEntity = nil;
    NSString *studentId=studentInfo[@"studentId" ];
    NSFetchRequest *request=[NSFetchRequest fetchRequestWithEntityName:@"Students"];
    request.predicate=[NSPredicate predicateWithFormat:@"studentId = %@",studentId];
    NSError *error;
    NSArray *matches=[context executeFetchRequest:request error:&error];
    
    if(!matches || error || [matches count]>1)
    {
        
    }
    else if([matches count])
    {
        studentInfo= [matches firstObject];
    }
    else
    {
        studentEntity = [NSEntityDescription insertNewObjectForEntityForName:@"Students" inManagedObjectContext:context];
        studentEntity.studentId = [studentInfo valueForKey:@"studentId"];
        studentEntity.name  = [studentInfo valueForKey:@"name"];
        studentEntity.lastName = [studentInfo valueForKey:@"lastName"];
        
        NSError *error;
        if([context save:&error])
        {
            NSLog(@"Couldn't Save: %@",[error localizedDescription]);
        }
    }
    //Create a new Object
        return studentEntity;
}
+(NSDictionary *) createObjectFromEntity:(Students *)studentInfo
{
    NSMutableDictionary *tempDict=[[NSMutableDictionary alloc]init];
    tempDict[@"studentId"]=studentInfo.studentId;
    tempDict[@"name"]=studentInfo.name;
    tempDict[@"lastName"]=studentInfo.lastName;
    return tempDict;
}
+ (NSArray *) searchStudentByName:(NSString *)name lastname:(NSString *)lastname
{
    AppDelegate *appDelegate= (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSFetchRequest *request=[NSFetchRequest fetchRequestWithEntityName:@"Students"];
    request.predicate=[NSPredicate predicateWithFormat:@"name == %@ AND lastName== %@",name,lastname];
    NSError *error;
    NSArray *fetchedObjects=[context executeFetchRequest:request error:&error];
    NSMutableArray *result=[[NSMutableArray alloc]init];
    for(Students *studentEntity in fetchedObjects)
    {
        [result addObject:[self createObjectFromEntity:studentEntity]];
    }
    return result;
}

@end
