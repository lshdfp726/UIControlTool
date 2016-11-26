//
//  UITextField+textfieldDidChange.m
//  RACAPI
//
//  Created by 刘松洪 on 2016/11/25.
//  Copyright © 2016年 刘松洪. All rights reserved.
//

#import "UITextField+textfieldDidChange.h"


static NSString const *didChangeKey = @"DidChange";


@implementation UITextField (textfieldDidChange)

- (void)didChange:(void(^)(id))change {
     objc_setAssociatedObject(self, (__bridge const void *)(didChangeKey), change, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(UITextFieldDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)UITextFieldDidChange:(NSNotification *)not {
    void(^change)(id) = objc_getAssociatedObject(self, (__bridge const void *)(didChangeKey));
    change(not.object);
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}

@end
