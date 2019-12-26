#import <Foundation/Foundation.h>
#import <Cephei/HBPreferences.h>
#import <UIKit/UIControl.h>
#import <UIKit/UIKit.h>
#import <spawn.h>

static bool kEnabled = false;
static int kSetCount = 5;
static int kSetDelay = 3;
static int switchCount = 0;

@interface SBSoundController : NSObject
	- (void)resetCount:(id)sender;
@end