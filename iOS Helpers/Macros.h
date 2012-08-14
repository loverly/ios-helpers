//
//  Macros.h
//  Loverly
//
//  Created by Edmond Leung on 8/12/12.
//  Copyright (c) 2012 Edmond Leung. All rights reserved.
//

#ifndef Loverly_Macros_h
#define Loverly_Macros_h

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

#endif
