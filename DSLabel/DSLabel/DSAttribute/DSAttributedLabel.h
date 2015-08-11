//
//  DSAttributedLabel.h
//  DSLabel
//
//  Created by YMY on 15/8/3.
//  Copyright (c) 2015年 dasheng. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum
{
    VerticalAlignmentTop = 0, // default
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
} VerticalAlignment;

typedef enum{
    
    LineTypeNone,//没有画线
    LineTypeUp ,// 上边画线
    LineTypeMiddle,//中间画线
    LineTypeDown,//下边画线
    
} LineType ;


@interface DSAttributedLabel : UILabel

@property (nonatomic) VerticalAlignment verticalAlignment;    //文字垂直（居中，顶部，底部）

@property (nonatomic,getter = getHeightTextContent)CGFloat     heightTextContent;//内容文本的高度（在自动布局时不管用）

@property (assign, nonatomic) LineType lineType;   //画线（多行时需要设置行间距才会准确）
@property (strong, nonatomic) UIColor *lineColor;  //线的颜色
@property (nonatomic, assign) CGFloat  lineHeight; //线的高度


//attributeText
@property (nonatomic,assign)  CGFloat     lineSpace;  //行间距

/**
 *  得到文本高度
 *
 *  @return 高度
 */
-(CGFloat)getHeightTextContent;
@end
