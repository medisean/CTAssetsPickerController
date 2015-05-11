//
//  NSBundle+CTAssetsPickerController.m
//  CTAssetsPickerDemo
//
//  Created by Miguel Cabeça on 25/11/14.
//  Copyright (c) 2014 Clement T. All rights reserved.
//

#import "NSBundle+CTAssetsPickerController.h"
#import "CTAssetsPickerController.h"

@implementation NSBundle (CTAssetsPickerController)

+ (NSBundle *)ctassetsPickerControllerBundle
{
    return [NSBundle bundleWithPath:[NSBundle ctassetsPickerControllerBundlePath]];
}

+ (NSString *)ctassetsPickerControllerBundlePath
{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *string = [def valueForKey:@"userLanguage"];
    
    if(string.length == 0){
        NSArray* languages = [def objectForKey:@"AppleLanguages"];
        NSString *current = [languages objectAtIndex:0];
        string = current;
    }
    
    NSString *bundlePath = [[NSBundle bundleForClass:[CTAssetsPickerController class]] pathForResource:@"CTAssetsPickerController" ofType:@"bundle"];
    NSString *languagePath = [NSString stringWithFormat:@"%@.lproj",string];
    NSString *totalPath = [bundlePath stringByAppendingPathComponent:languagePath];
    
    return totalPath;
    
    //return [[NSBundle bundleForClass:[CTAssetsPickerController class]] pathForResource:@"CTAssetsPickerController" ofType:@"bundle"];
}

@end
