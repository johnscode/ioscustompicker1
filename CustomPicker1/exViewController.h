//
//  exViewController.h
//  CustomPicker1
//
//  Created by jjf on 4/21/10.
//  Copyright (c) 2013 johnscode.com. All rights reserved.
//
/*
 Copyright 2010 John J. Fowler
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import <UIKit/UIKit.h>

@interface exViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate> {
  
  @private
  NSArray *names;
  NSArray *values;
}

@property (nonatomic,retain) IBOutlet UIPickerView *picker;



@end
