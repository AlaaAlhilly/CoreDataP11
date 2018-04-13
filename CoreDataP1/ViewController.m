//
//  ViewController.m
//  CoreDataP1
//
//  Created by Hamid on 6/28/15.
//  Copyright (c) 2015 HuxTek. All rights reserved.
//

#import "ViewController.h"
#import "Students+Add.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *lastnameField;
@property (weak, nonatomic) IBOutlet UITextField *studentIdField;
@property (weak, nonatomic) IBOutlet UITextView *outPutTextView;

@end

@implementation ViewController
- (IBAction)searchName:(UIButton *)sender
{
    self.outPutTextView.text = [Students searchStudentByName:self.nameField.text lastname:self.lastnameField.text].description;
}

- (IBAction)addToDatabase:(UIButton *)sender
{
    NSDictionary *studentInfo = @{@"name": self.nameField.text,
                                  @"lastName": self.lastnameField.text,
                                  @"studentId": self.studentIdField.text};
    
    self.outPutTextView.text = [Students addStudentInfoFromDictionary:studentInfo].description;
}

@end
