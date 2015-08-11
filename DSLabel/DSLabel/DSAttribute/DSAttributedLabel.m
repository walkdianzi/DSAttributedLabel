//
//  DSAttributedLabel.m
//  DSLabel
//
//  Created by YMY on 15/8/3.
//  Copyright (c) 2015年 dasheng. All rights reserved.
//

#import "DSAttributedLabel.h"

@interface DSAttributedLabel()

@property (nonatomic, strong) NSMutableAttributedString* mutableAttributedString;

@end

@implementation DSAttributedLabel

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.verticalAlignment = VerticalAlignmentMiddle;
    }
    return self;
}



- (CGFloat)getHeightTextContent{
    
    CGRect actualRect = [self textRectForBounds:self.bounds limitedToNumberOfLines:self.numberOfLines];
    _heightTextContent = actualRect.size.height;
    return _heightTextContent;
}

#pragma mark - Public

- (void)setText:(NSString *)text{
    
    [super setText:text];
    
    // self.attributedText = [[self class] mutableAttributedStringFromLabel:self];
    
    // Apply NIAttributedLabel-specific styles.
}

- (void)setVerticalAlignment:(VerticalAlignment)verticalAlignment {
    _verticalAlignment = verticalAlignment;
    [self setNeedsDisplay];
}

-(void)setLineSpace:(CGFloat)lineSpace{
    
    _lineSpace = lineSpace;
    
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.text.length)];
    
    self.attributedText = attributedString;
}

#pragma mark- label methon

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch (self.verticalAlignment) {
        case VerticalAlignmentTop:
            textRect.origin.y = bounds.origin.y;
            break;
        case VerticalAlignmentBottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            break;
        case VerticalAlignmentMiddle:
            // Fall through.
        default:
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
    }
    return textRect;
}


//绘制text到指定区域
- (void)drawTextInRect:(CGRect)rect{
    
    //默认的rect为label的bounds（默认原点都为（0，0））
    CGRect actualRect = [self textRectForBounds:rect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:actualRect];
    
    
    //得到当前文本的size，以一行算
    CGSize textSize = [[self text] sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[self font],NSFontAttributeName, nil]];
    
    
    //计算一共有几行
    NSInteger _textLineNumber = (actualRect.size.height+self.lineSpace)/(textSize.height+self.lineSpace);
    
    
    for (int i=0; i<_textLineNumber; i++) {
        CGFloat strikeWidth = actualRect.size.width;
        if (i==_textLineNumber-1) {
            strikeWidth = textSize.width - (_textLineNumber-1)*actualRect.size.width;
        }
        CGRect lineRect;
        CGFloat origin_x;
        CGFloat origin_y = 0.0;
        
        if ([self textAlignment] == NSTextAlignmentRight) {
            
            origin_x = actualRect.size.width - strikeWidth;
            
        } else if ([self textAlignment] == NSTextAlignmentCenter) {
            
            origin_x = (actualRect.size.width - strikeWidth)/2 ;
            
        } else {
            
            origin_x = 0;
        }
        
        
        /*以两个像素处理是直接贴边的*/
        if (self.lineType == LineTypeUp) {
            if (i==0) {
                origin_y =  2;
            }else{
                origin_y = i*textSize.height+i*self.lineSpace+2;
            }
        }
        
        if (self.lineType == LineTypeMiddle) {
            if (i==0) {
                origin_y =  textSize.height/2;
            }else{
                origin_y = i*textSize.height+i*self.lineSpace+textSize.height/2;
            }
        }
        
        if (self.lineType == LineTypeDown) {//下画线
            if (i==0) {
                origin_y =  textSize.height-2;
            }else{
                origin_y = i*textSize.height+i*self.lineSpace+textSize.height-2;
            }
        }
        
        lineRect = CGRectMake(origin_x , origin_y, strikeWidth, self.lineHeight?:0.5);
        
        if (self.lineType != LineTypeNone) {
            
            CGContextRef context = UIGraphicsGetCurrentContext();   //获取图形上下文
            
            //提取UIColor的rgba
            CGFloat R, G, B, A;
            UIColor *uiColor = self.lineColor;
            CGColorRef color = [uiColor CGColor];
            NSInteger numComponents = CGColorGetNumberOfComponents(color);
            
            if( numComponents == 4)
            {
                const CGFloat *components = CGColorGetComponents(color);
                R = components[0];
                G = components[1];
                B = components[2];
                A = components[3];
                
                CGContextSetRGBFillColor(context, R, G, B, A);   //创建和设置颜色。
            }
            
            //绘制线
            CGContextFillRect(context, lineRect);
        }
    }
}

@end
