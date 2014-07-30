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

@property (weak, nonatomic) IBOutlet UIButton *transButton;
@end

@implementation DBLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    [self asynchronouslySetFontName];
    [self changeFont:self.label];
    [self changeFont:self.transButton];
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

-(void)changeFont:(UILabel *)label{
    //ボタンとラベルのsubclassに追加してあげてfont名をセットしてあげたらいいかも
    UIFont *currentFont = label.font;
    UIFont *newFont = [UIFont fontWithName:@"HiraMaruProN-W4" size:currentFont.pointSize];
    label.font = newFont;
}



@end
