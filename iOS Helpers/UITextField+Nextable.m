//
//  UITextField+Nextable.m
//  Loverly
//
//  Created by Edmond Leung on 8/12/12.
//  Copyright (c) 2012 Edmond Leung. All rights reserved.
//

#import <objc/runtime.h>

#import "UITextField+Nextable.h"

static char defaultHashKey;

@implementation UITextField (Nextable)

- (UIControl *)nextControl {
  return objc_getAssociatedObject(self, &defaultHashKey);
}

- (void)setNextControl:(UIControl *)nextControl {
  if ([nextControl isKindOfClass:[UITextField class]] ||
      [nextControl isKindOfClass:[UITextView class]]) {
    self.returnKeyType = UIReturnKeyNext;
  }
  
  objc_setAssociatedObject(self, &defaultHashKey, nextControl,
                           OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
