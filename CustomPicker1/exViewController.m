//
//  exViewController.m
//  CustomPicker1
//
//  Created by jjf on 4/21/10.
//  Copyright (c) 2010 johnscode.com. All rights reserved.
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

#import "exViewController.h"


@interface exViewController ()


@end

@implementation exViewController

@synthesize picker;



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  
  values = [[NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],
           [NSNumber numberWithInt:3],[NSNumber numberWithInt:4],[NSNumber numberWithInt:5],
             [NSNumber numberWithInt:6],[NSNumber numberWithInt:7],[NSNumber numberWithInt:8],nil] retain];
  names = [[NSArray arrayWithObjects:@"Object 1",@"Object 2",@"Object 3",@"Object 4",
           @"Object 5",nil] retain];
}

#pragma mark -
#pragma mark UIPickerViewDelegate

- (UIView *)pickerView:(UIPickerView *)pickerView
						viewForRow:(NSInteger)row
					forComponent:(NSInteger)component reusingView:(UIView *)view
{
	UIView *v=[[UIView alloc]
             initWithFrame:CGRectMake(0,0,
                                      [self pickerView:pickerView widthForComponent:component],
                                      [self pickerView:pickerView rowHeightForComponent:component])];
	[v setOpaque:TRUE];
	[v setBackgroundColor:[UIColor whiteColor]];
	UILabel *lbl=nil;
    lbl= [[UILabel alloc]
          initWithFrame:CGRectMake(8,0,
                                   [self pickerView:pickerView widthForComponent:component]-16,
                                   [self pickerView:pickerView rowHeightForComponent:component])];
	[lbl setTextAlignment:UITextAlignmentCenter];
  [lbl setBackgroundColor:[UIColor clearColor]];
	NSString *ret=@"";
  int number=0;
	switch (component) {
		case 0:
			ret=[names objectAtIndex:row];
			break;
		case 1:
      number=[(NSNumber*)[values objectAtIndex:row] intValue];
      
      if (number>5) {
        [v setBackgroundColor:[UIColor redColor]];
      } else if (number>2) {
        [v setBackgroundColor:[UIColor orangeColor]];
      } else {
        [v setBackgroundColor:[UIColor yellowColor]];
      }
      ret = [NSString stringWithFormat:@"%d",number];
			break;
	}
	[lbl setText:ret];
	[lbl setFont:[UIFont boldSystemFontOfSize:18]];
	[v addSubview:lbl];
	return v;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {

}


- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
	float ret=50;
	switch (component) {
		case 0:
			ret=90;
			break;
		default:
			break;
	}
	return ret;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
	return 35;
}

#pragma mark -
#pragma mark UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	switch (component) {
		case 0:
			return names.count;
		case 1:
			return values.count;
		default:
			return 1;
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc {
  [names release];
  [values release];
  [super dealloc];
}

@end
