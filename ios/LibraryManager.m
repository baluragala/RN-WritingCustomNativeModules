//
//  LibraryManager.m
//  WritingCustomNativeModules
//
//  Created by MOKSHA on 14/03/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import "LibraryManager.h"

#import "React/RCTLog.h"

@implementation LibraryManager

RCT_EXPORT_MODULE();


RCT_EXPORT_METHOD(selectImage)
{
  RCTLogInfo(@"Selecting image...");
}

@end
