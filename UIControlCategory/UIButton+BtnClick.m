//
//  UIButton+BtnClick.m
//  RACAPI
//
//  Created by 刘松洪 on 2016/11/25.
//  Copyright © 2016年 刘松洪. All rights reserved.
//

#import "UIButton+BtnClick.h"

static const void *BtnKey = &BtnKey;
@implementation UIButton (BtnClick)

- (void)obersverEvents:(UIControlEvents)event withBlock:(void (^)(id))sender {
    UIControlEvents events = event;
    if (!events) {
        return;
    }
     objc_setAssociatedObject(self, BtnKey, sender, OBJC_ASSOCIATION_RETAIN);
    [self addTarget:self action:@selector(BtnAction:) forControlEvents:events];
}

- (void)BtnAction:(id)sender {
     void(^btnAction)(id) = objc_getAssociatedObject(self, BtnKey);
     btnAction(sender);
}

@end
