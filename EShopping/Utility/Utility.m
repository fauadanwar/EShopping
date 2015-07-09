//
//  Utility.m
//  EShopping
//
//  Created by FauadAnwar on 08/07/15.
//  Copyright (c) 2015 Fauad Anwar. All rights reserved.
//

#import "Utility.h"

@implementation Utility
+ (NSArray *)getArrayFromPlistFile:(NSString *)plistFileName
{
    NSString *plistFile;
    NSArray *plistArray;
    
    plistFile = [[NSBundle mainBundle] pathForResource:plistFileName ofType:@"plist"];
    plistArray = [[NSArray alloc] initWithContentsOfFile:plistFile];
    
    return plistArray;
}
@end
