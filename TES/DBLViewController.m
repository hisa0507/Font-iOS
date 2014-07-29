//
//  DBLViewController.m
//  TES
//
//  Created by hangai on 2014/07/29.
//  Copyright (c) 2014年 doublw inc. All rights reserved.
//

#import "DBLViewController.h"
#import <CoreText/CoreText.h>

@interface DBLViewController ()
@property (strong, nonatomic) IBOutlet UILabel *label;

@end

@implementation DBLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self asynchronouslySetFontName];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    self.label.font = [UIFont fontWithName:@"HiraMaruProN-W4" size:40.0f];
//    self.label.font = [UIFont fontWithName:@"HiraMaruProN-W4" size:40.0f];
//    [self.label setFont:[UIFont fontWithName:@"HiraMaruProN-W4" size:40.0f]];
//    self.label.font = [UIFont fontNamesForFamilyName:@"Hiragino Maru Gothic ProN"];
//    self.label.font = [UIFont fontWithName:@"HiraKakuProN-W3" size:40.0f];
    self.label.hidden = NO;
//    [self.view addSubview:self.label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)asynchronouslySetFontName
{
    NSString* fontName = @"HiraMaruProN-W4";
	UIFont* aFont = [UIFont fontWithName:fontName size:12.];
    // If the font is already downloaded
	if (aFont && ([aFont.fontName compare:fontName] == NSOrderedSame || [aFont.familyName compare:fontName] == NSOrderedSame)) {
        // Go ahead and display the sample text.
		return;
	}
	
    // Create a dictionary with the font's PostScript name.
	NSMutableDictionary *attrs = [NSMutableDictionary dictionaryWithObjectsAndKeys:fontName, kCTFontNameAttribute, nil];
    
    // Create a new font descriptor reference from the attributes dictionary.
	CTFontDescriptorRef desc = CTFontDescriptorCreateWithAttributes((__bridge CFDictionaryRef)attrs);
    
    NSMutableArray *descs = [NSMutableArray arrayWithCapacity:0];
    [descs addObject:(__bridge id)desc];
    CFRelease(desc);
    
	__block BOOL errorDuringDownload = NO;
	
	// Start processing the font descriptor..
    // This function returns immediately, but can potentially take long time to process.
    // The progress is notified via the callback block of CTFontDescriptorProgressHandler type.
    // See CTFontDescriptor.h for the list of progress states and keys for progressParameter dictionary.
    CTFontDescriptorMatchFontDescriptorsWithProgressHandler( (__bridge CFArrayRef)descs, NULL,  ^(CTFontDescriptorMatchingState state, CFDictionaryRef progressParameter) {
        
		//NSLog( @"state %d - %@", state, progressParameter);
		
		double progressValue = [[(__bridge NSDictionary *)progressParameter objectForKey:(id)kCTFontDescriptorMatchingPercentage] doubleValue];
		
		if (state == kCTFontDescriptorMatchingDidBegin) {
			dispatch_async( dispatch_get_main_queue(), ^ {
                // Show an activity indicator
				
				NSLog(@"Begin Matching");
			});
		} else if (state == kCTFontDescriptorMatchingDidFinish) {
			dispatch_async( dispatch_get_main_queue(), ^ {
                // Remove the activity indicator
				
                // Log the font URL in the console
				CTFontRef fontRef = CTFontCreateWithName((__bridge CFStringRef)fontName, 0., NULL);
                CFStringRef fontURL = CTFontCopyAttribute(fontRef, kCTFontURLAttribute);
				NSLog(@"%@", (__bridge NSURL*)(fontURL));
                CFRelease(fontURL);
				CFRelease(fontRef);
                
				if (!errorDuringDownload) {
					NSLog(@"%@ downloaded", fontName);
				}
                UIFont *font = [UIFont fontWithName:fontName size:1.0f];
                if (font) {
//                    [self.label setFont:[UIFont fontWithName:@"HiraMaruProN-W4" size:40.0f]];
                    [[UILabel appearance] setFont:[UIFont fontWithName:@"HiraMaruProN-W4" size:40.0f]];
                    [self viewDidLoad];
                }
			});
		} else if (state == kCTFontDescriptorMatchingWillBeginDownloading) {
			dispatch_async( dispatch_get_main_queue(), ^ {
                // Show a progress bar
				NSLog(@"Begin Downloading");
			});
		} else if (state == kCTFontDescriptorMatchingDidFinishDownloading) {
			dispatch_async( dispatch_get_main_queue(), ^ {
                // Remove the progress bar
				NSLog(@"Finish downloading");
			});
		} else if (state == kCTFontDescriptorMatchingDownloading) {
			dispatch_async( dispatch_get_main_queue(), ^ {
                // Use the progress bar to indicate the progress of the downloading
				NSLog(@"Downloading %.0f%% complete", progressValue);
			});
		} else if (state == kCTFontDescriptorMatchingDidFailWithError) {
            // An error has occurred.
            // Get the error message
            
		}
        
		return (bool)YES;
	});
    
}

@end
