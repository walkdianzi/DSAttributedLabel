//
//  OnmasonryViewController.h
//  DSLabel
//
//  Created by YMY on 15/8/8.
//  Copyright (c) 2015年 dasheng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    dsLabelTypeLine = 0,
    dsLabelTypeSpace = 1,
    dsLabelTypeAttrFont = 2
}dsLabelType;

@interface OnmasonryViewController : UIViewController

@property(nonatomic, assign)dsLabelType  type;

@end
