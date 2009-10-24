//
//  CharlotteDemoAppDelegate.m
//  CharlotteDemo
//
//  Created by Darin Pope on 10/21/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "CharlotteDemoAppDelegate.h"
#import "JSON.h"

@implementation CharlotteDemoAppDelegate

@synthesize window;
@synthesize lblName;
@synthesize btnGetName;
@synthesize txtPlaceOfBirth;
@synthesize txtDateOfBirth;
@synthesize btnPostBirthInfo;
@synthesize lblBirthInfo;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
	[lblName release];
	[btnGetName release];
	[txtDateOfBirth release];
	[txtPlaceOfBirth release];
	[btnPostBirthInfo release];
	[lblBirthInfo release];
    [window release];
    [super dealloc];
}

-(IBAction)doGetName {
	NSString *url = @"http://spring-json-demoapp.appspot.com/hello.json";
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0f];
	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	NSString *jsonData = [[[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding] autorelease];
	NSDictionary *jsonDict = [jsonData JSONValue];
	[lblName setText:[NSString stringWithFormat:@"%@ %@",[jsonDict objectForKey:@"firstname"],[jsonDict objectForKey:@"secondname"]]];
}

-(IBAction)doPostBirthInfo {
	NSString *url = @"http://spring-json-demoapp.appspot.com/hello1.json";
	NSString *placeOfBirth = [txtPlaceOfBirth text];
	NSString *dateOfBirth = [txtDateOfBirth text];
	NSString *postString = [NSString stringWithFormat:@"placeofbirth=%@&birthday=%@",placeOfBirth,dateOfBirth];
	NSData *postData = [NSData dataWithBytes:[postString UTF8String] length:[postString length]];
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
	[request setHTTPMethod:@"POST"];
	[request setHTTPBody:postData];
	
	NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	NSString *jsonData = [[NSString alloc] initWithData:returnData encoding:NSASCIIStringEncoding];
	NSDictionary *jsonDict = [jsonData JSONValue];
	[jsonData release];
	[request release];
	NSDictionary *responseDict = [jsonDict objectForKey:@"command"];
	[lblBirthInfo setText:[NSString stringWithFormat:@"%@ - %@",[responseDict objectForKey:@"placeofbirth"],[responseDict objectForKey:@"birthday"]]];
}

#
# pragma mark UITextFieldDelegate
#

- (IBAction)textFieldDoneEditing:(id)sender {
	[sender resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)theTextField {
	[theTextField resignFirstResponder];
	return YES;
}


@end
