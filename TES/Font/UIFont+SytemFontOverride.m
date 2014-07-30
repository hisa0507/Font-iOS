//
//  UIFont+SytemFontOverride.m
//  TES
//
//  Created by hangai on 2014/07/30.
//  Copyright (c) 2014年 doublw inc. All rights reserved.
//

#import "UIFont+SytemFontOverride.h"

@implementation UIFont (SytemFontOverride)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

+ (UIFont *)boldSystemFontOfSize:(CGFloat)fontSize {
    if ([UIFont fontWithName:@"HiraMaruProN-W4" size:fontSize]) {
        return [UIFont fontWithName:@"HiraMaruProN-W4" size:fontSize];
    }else{
        return [UIFont fontWithName:@"HiraKakuProN-W3" size:fontSize];
    }
    
}

+ (UIFont *)systemFontOfSize:(CGFloat)fontSize {
    if ([UIFont fontWithName:@"HiraMaruProN-W4" size:fontSize]) {
        return [UIFont fontWithName:@"HiraMaruProN-W4" size:fontSize];
    }else{
        return [UIFont fontWithName:@"HiraKakuProN-W3" size:fontSize];
    }
}

#pragma clang diagnostic pop


@end
