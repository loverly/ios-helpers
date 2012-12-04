//
//  Macros.h
//  Loverly
//
//  Created by Edmond Leung on 8/12/12.
//  Copyright (c) 2012 Edmond Leung. All rights reserved.
//

#ifndef Loverly_Macros_h
#define Loverly_Macros_h

#define kConnectionError 10061

#define LLAlert(title, message) { \
  UIAlertView *__alert = \
    [[UIAlertView alloc] initWithTitle:title \
                               message:message \
                              delegate:nil \
                     cancelButtonTitle: \
                       NSLocalizedString(@"Dismiss", @"Dismiss button text") \
                     otherButtonTitles:nil]; \
  [__alert show]; \
}

#define LLConnectionAlert() { \
  NSString *title; \
  NSString *message; \
  \
  title = NSLocalizedString(@"No Internet Connetion", \
                            @"No internet connection alert title"); \
  message = \
    NSLocalizedString(@"An internet connection is required to continue.", \
                      @"No Internet Connection alert message"); \
  \
  LLAlert(title, message); \
}

#define UIColorFromRGB(rgbValue) \
  [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                  green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
                   blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define UIColorFromRGBWithAlpha(rgbValue, a) \
  [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                  green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
                   blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]


#endif
