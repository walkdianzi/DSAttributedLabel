//
//  AttributedLabelViewController.h
//  DSLabel
//
//  Created by YMY on 15/8/3.
//  Copyright (c) 2015年 dasheng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    labelTypeFontColor = 0,
    labelTypeAlignment = 1,
    labelTypeLineBreakMode = 2
}labelType;

@interface AttributedLabelViewController : UIViewController

@property(nonatomic, assign)NSInteger  labelType;
@end
