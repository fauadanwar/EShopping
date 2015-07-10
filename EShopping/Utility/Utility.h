//
//  Utility.h
//  EShopping
//
//  Created by FauadAnwar on 08/07/15.
//  Copyright (c) 2015 Fauad Anwar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject

/*!
    Parse plist file and retrive data in for mof NSArray.
 */
+ (NSArray *)getArrayFromPlistFile:(NSString *)plistFileName;

@end
