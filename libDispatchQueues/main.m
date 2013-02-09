//
//  main.m
//  libDispatchQueues
//
//  Created by Nikolai Ruhe on 09.02.13.
//  Copyright (c) 2013 Nikolai Ruhe. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

	@autoreleasepool {
		NSLog(@"startup on main thread: %s", [NSThread isMainThread] ? "YES" : "NO");

		// commit a block to a background queue
		dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

			// continuously send blocks to the main queue
			while (YES) {
				dispatch_sync(dispatch_get_main_queue(), ^{
					NSLog(@"dispatch on main thread: %s", [NSThread isMainThread] ? "YES" : "NO");
				});
				sleep(1);
			}
		});

		// process main queue
		dispatch_main();
	}
    return 0;
}

