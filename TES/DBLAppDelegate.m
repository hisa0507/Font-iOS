//
//  DBLAppDelegate.m
//  TES
//
//  Created by hangai on 2014/07/29.
//  Copyright (c) 2014年 doublw inc. All rights reserved.
//

#import "DBLAppDelegate.h"
#import <CoreText/CoreText.h>

@implementation DBLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
//    [self asynchronouslySetFontName];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//- (void)asynchronouslySetFontName
//{
//    NSString* fontName = @"HiraMaruProN-W4";
//	UIFont* aFont = [UIFont fontWithName:fontName size:12.];
//    // If the font is already downloaded
//	if (aFont && ([aFont.fontName compare:fontName] == NSOrderedSame || [aFont.familyName compare:fontName] == NSOrderedSame)) {
//        // Go ahead and display the sample text.
//		return;
//	}
//	
//    // Create a dictionary with the font's PostScript name.
//	NSMutableDictionary *attrs = [NSMutableDictionary dictionaryWithObjectsAndKeys:fontName, kCTFontNameAttribute, nil];
//    
//    // Create a new font descriptor reference from the attributes dictionary.
//	CTFontDescriptorRef desc = CTFontDescriptorCreateWithAttributes((__bridge CFDictionaryRef)attrs);
//    
//    NSMutableArray *descs = [NSMutableArray arrayWithCapacity:0];
//    [descs addObject:(__bridge id)desc];
//    CFRelease(desc);
//    
//	__block BOOL errorDuringDownload = NO;
//	
//	// Start processing the font descriptor..
//    // This function returns immediately, but can potentially take long time to process.
//    // The progress is notified via the callback block of CTFontDescriptorProgressHandler type.
//    // See CTFontDescriptor.h for the list of progress states and keys for progressParameter dictionary.
//    CTFontDescriptorMatchFontDescriptorsWithProgressHandler( (__bridge CFArrayRef)descs, NULL,  ^(CTFontDescriptorMatchingState state, CFDictionaryRef progressParameter) {
//        
//		//NSLog( @"state %d - %@", state, progressParameter);
//		
//		double progressValue = [[(__bridge NSDictionary *)progressParameter objectForKey:(id)kCTFontDescriptorMatchingPercentage] doubleValue];
//		
//		if (state == kCTFontDescriptorMatchingDidBegin) {
//			dispatch_async( dispatch_get_main_queue(), ^ {
//                // Show an activity indicator
//				
//				NSLog(@"Begin Matching");
//			});
//		} else if (state == kCTFontDescriptorMatchingDidFinish) {
//			dispatch_async( dispatch_get_main_queue(), ^ {
//                // Remove the activity indicator
//				
//                // Log the font URL in the console
//				CTFontRef fontRef = CTFontCreateWithName((__bridge CFStringRef)fontName, 0., NULL);
//                CFStringRef fontURL = CTFontCopyAttribute(fontRef, kCTFontURLAttribute);
//				NSLog(@"%@", (__bridge NSURL*)(fontURL));
//                CFRelease(fontURL);
//				CFRelease(fontRef);
//                
//				if (!errorDuringDownload) {
//					NSLog(@"%@ downloaded", fontName);
//				}
//                UIFont *font = [UIFont fontWithName:fontName size:1.0f];
//                if (font) {
////                    if ([self.delegate respondsToSelector:@selector(fontDownloaderDidFinish:fontName:)]) {
////                        [self.delegate fontDownloaderDidFinish:self fontName:fontName];
//                    
////                    }
//                }
//			});
//		} else if (state == kCTFontDescriptorMatchingWillBeginDownloading) {
//			dispatch_async( dispatch_get_main_queue(), ^ {
//                // Show a progress bar
//				NSLog(@"Begin Downloading");
//			});
//		} else if (state == kCTFontDescriptorMatchingDidFinishDownloading) {
//			dispatch_async( dispatch_get_main_queue(), ^ {
//                // Remove the progress bar
//				NSLog(@"Finish downloading");
//			});
//		} else if (state == kCTFontDescriptorMatchingDownloading) {
//			dispatch_async( dispatch_get_main_queue(), ^ {
//                // Use the progress bar to indicate the progress of the downloading
//				NSLog(@"Downloading %.0f%% complete", progressValue);
//			});
//		} else if (state == kCTFontDescriptorMatchingDidFailWithError) {
//            // An error has occurred.
//            // Get the error message
//
//		}
//        
//		return (bool)YES;
//	});
//    
//}

@end
