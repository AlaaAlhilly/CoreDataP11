//
//  Students.h
//  
//
//  Created by Hamid on 6/28/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Students : NSManagedObject

@property (nonatomic, retain) NSString * studentId;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * lastName;

@end
