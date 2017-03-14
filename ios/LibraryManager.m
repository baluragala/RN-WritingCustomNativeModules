//
//  LibraryManager.m
//  WritingCustomNativeModules
//
//  Created by MOKSHA on 14/03/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import "LibraryManager.h"

#import <React/RCTLog.h>

@import MobileCoreServices; 

@implementation LibraryManager

RCT_EXPORT_MODULE();


RCT_EXPORT_METHOD(selectImage)
{
  RCTLogInfo(@"Selecting image...");
  
  UIImagePickerController *picker = [[UIImagePickerController alloc]  init];
  
  picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
  picker.mediaTypes = @[(NSString *)kUTTypeImage];
  picker.modalPresentationStyle = UIModalPresentationCurrentContext;
  
  picker.delegate = self;
  
  UIViewController *root = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
  
  [root presentViewController:picker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker  didFinishPickingMediaWithInfo:(NSDictionary *)info
{
  NSString *fileName = [[[NSUUID UUID] UUIDString] stringByAppendingString:@".jpg"];
  NSString *path = [[NSTemporaryDirectory()stringByStandardizingPath]  stringByAppendingPathComponent:fileName];
  UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
  NSData *data = UIImageJPEGRepresentation(image, 0);
  [data writeToFile:path atomically:YES];
  NSURL *fileURL = [NSURL fileURLWithPath:path];
  NSString *filePath = [fileURL absoluteString];
  
  RCTLog(@"%@", filePath);
  
  [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
