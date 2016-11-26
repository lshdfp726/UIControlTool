//
//  UITextField+textfieldDidChange.h
//  RACAPI
//
//  Created by 刘松洪 on 2016/11/25.
//  Copyright © 2016年 刘松洪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (textfieldDidChange)

- (void)didChange:(void(^)(id))change;

@end
