#import "Tweak.h"

%hook SBSoundController
	- (void)_ringerStateChanged:(id)arg1 {
		if (kEnabled) {
			[self performSelector:@selector(resetCount:) withObject:nil afterDelay:kSetDelay];
			switchCount++;
			if (switchCount == kSetCount) {
				switchCount = 0;
				pid_t pid;
				int status;
				const char* args[] = {"killall", "-SEGV", "SpringBoard", NULL};
				posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
				waitpid(pid, &status, WEXITED);
			}
		}
	}
	%new
	- (void)resetCount:(id)sender {
		switchCount = 0;
	}
%end

%ctor {
	HBPreferences *file = [[HBPreferences alloc] initWithIdentifier:@"fun.tylerd3v.switchmode"];
	kEnabled = [([file objectForKey:@"kEnabled"] ?: @(NO)) boolValue];
	kSetCount = [([file objectForKey:@"kSetCount"] ?: @(5)) intValue];
	kSetDelay = [([file objectForKey:@"kSetDelay"] ?: @(3)) intValue];
}