//
//  ELTextFieldDelegate.m
//  Loverly
//
//  Created by Edmond Leung on 8/12/12.
//  Copyright (c) 2012 Edmond Leung. All rights reserved.
//

#import "ELTextFieldDelegate.h"
#import "UITextField+Nextable.h"

@interface ELTextFieldDelegate ()

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) UITextField *activeTextField;

@end

@implementation ELTextFieldDelegate

@synthesize scrollView;

- (id)init {
  self = [super init];
  if (self) {
    [self registerForKeyboardNotifications];
  }
  return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  BOOL didResign;
  
  if (!(didResign = [textField resignFirstResponder])) return NO;
  
  dispatch_async(dispatch_get_current_queue(),
                 ^ {
                   if ([textField.nextControl isKindOfClass:[UIButton class]]) {
                     [textField.nextControl
                      sendActionsForControlEvents:UIControlEventTouchUpInside];
                   } else {
                     [textField.nextControl becomeFirstResponder];
                   }
                 });
  
  return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
  self.activeTextField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
  self.activeTextField = nil;
}

- (void)registerForKeyboardNotifications {
  [[NSNotificationCenter defaultCenter]
   addObserver:self
   selector:@selector(keyboardWasShown:)
   name:UIKeyboardDidShowNotification object:nil];
  
  [[NSNotificationCenter defaultCenter]
   addObserver:self
   selector:@selector(keyboardWillBeHidden:)
   name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWasShown:(NSNotification*)notification {
  NSDictionary* info;
  CGSize kbSize;
  CGRect aRect;
  CGPoint scrollPoint;
  
  info = [notification userInfo];
  kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey]
            CGRectValue].size;
  
  UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
  self.scrollView.contentInset = contentInsets;
  self.scrollView.scrollIndicatorInsets = contentInsets;
  
  aRect = self.scrollView.frame;
  aRect.size.height -= kbSize.height;
  if (!CGRectContainsPoint(aRect, self.activeTextField.frame.origin) ) {
    scrollPoint =
      CGPointMake(0.0,
                  self.activeTextField.frame.origin.y -
                  (aRect.size.height - self.activeTextField.bounds.size.height)
                  / 2.0);
    [scrollView setContentOffset:scrollPoint animated:YES];
  }
}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification {
  self.scrollView.contentInset = UIEdgeInsetsZero;
  self.scrollView.scrollIndicatorInsets = UIEdgeInsetsZero;
}

@end
