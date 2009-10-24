//
//  CharlotteDemoAppDelegate.h
//  CharlotteDemo
//
//  Created by Darin Pope on 10/21/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CharlotteDemoAppDelegate : NSObject <UIApplicationDelegate,UITextFieldDelegate> {
    IBOutlet UIWindow *window;
	IBOutlet UILabel *lblName;
	IBOutlet UIButton *btnGetName;
	IBOutlet UITextField *txtPlaceOfBirth;
	IBOutlet UITextField *txtDateOfBirth;
	IBOutlet UIButton *btnPostBirthInfo;
	IBOutlet UILabel *lblBirthInfo;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) UILabel *lblName;
@property (nonatomic, retain) UIButton *btnGetName;
@property (nonatomic, retain) UITextField *txtPlaceOfBirth;
@property (nonatomic, retain) UITextField *txtDateOfBirth;
@property (nonatomic, retain) UIButton *btnPostBirthInfo;
@property (nonatomic, retain) UILabel *lblBirthInfo;

-(IBAction)doGetName;
-(IBAction)doPostBirthInfo;

@end

