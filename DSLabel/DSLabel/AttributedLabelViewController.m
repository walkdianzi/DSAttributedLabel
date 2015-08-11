//
//  AttributedLabelViewController.m
//  DSLabel
//
//  Created by YMY on 15/8/3.
//  Copyright (c) 2015年 dasheng. All rights reserved.
//

#import "AttributedLabelViewController.h"
#import "DSAttributedLabel.h"

@implementation AttributedLabelViewController

-(void)viewDidLoad{
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (self.labelType == labelTypeFontColor) {
        [self showFontColort];
    }else if(self.labelType == labelTypeAlignment){
        [self showAlignment];
    }else if (self.labelType == labelTypeLineBreakMode){
        [self showLineBreakMode];
    }
    
}

-(void)showFontColort{
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, self.view.frame.size.width-20, 20)];
    label1.textColor = [UIColor blackColor];                    //设置字体颜色
    label1.font = [UIFont fontWithName:@"Helvetica" size:18];   //设置字体大小
    label1.text = @"i am lable1";
    label1.shadowColor = [UIColor colorWithRed:255.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:1]; //设置阴影的透明度和颜色
    label1.shadowOffset = CGSizeMake(2.0f, 2.0f); //设置阴影的倾斜度，正数是往右往下
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width-20, 20)];
    label2.textColor = [UIColor blackColor];
    label2.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    label2.text = @"i am lable2";
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(10, 130, self.view.frame.size.width-20, 20)];
    label3.textColor = [UIColor blackColor];
    label3.font = [UIFont fontWithName:@"Helvetica-BoldOblique" size:18];
    label3.text = @"i am lable3";
    
    [self.view addSubview:label1];
    [self.view addSubview:label2];
    [self.view addSubview:label3];
    
    
    
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(10, 160, self.view.frame.size.width-20, 40)];
    label4.textColor = [UIColor blackColor];
    label4.text = @"i am lable4 i am lable4i am lable4i am lable4i am lable4i am lable4i am lable4";
    label4.adjustsFontSizeToFitWidth = YES;   //设置字体大小适应label宽度
    label4.baselineAdjustment = UIBaselineAdjustmentAlignCenters;  //中间对齐
    [self.view addSubview:label4];

    UILabel *label5 = [[UILabel alloc] initWithFrame:CGRectMake(10, 160, self.view.frame.size.width-20, 40)];
    label5.textColor = [UIColor blackColor];
    label5.text = @"i am lable4 i am lable4i am lable4i am lable4i am lable4i am lable4i am lable5";
    label5.adjustsFontSizeToFitWidth = YES;   //设置字体大小适应label宽度
    label5.baselineAdjustment = UIBaselineAdjustmentNone;  //文本最低端与中线对齐
    [self.view addSubview:label5];
    
    UILabel *label6 = [[UILabel alloc] initWithFrame:CGRectMake(10, 160, self.view.frame.size.width-20, 40)];
    label6.textColor = [UIColor blackColor];
    label6.text = @"i am lable4 i am lable4i am lable4i am lable4i am lable4i am lable4i am lable6";
    label6.adjustsFontSizeToFitWidth = YES;   //设置字体大小适应label宽度
    label6.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;  //文本最上端与中线对齐
    [self.view addSubview:label6];
}

-(void)showAlignment{
    
    float setOffY = 100;
    DSAttributedLabel *labelVer = [[DSAttributedLabel alloc] initWithFrame:CGRectMake(10, setOffY, self.view.frame.size.width-20, 100)];
    labelVer.backgroundColor = [UIColor redColor];
    labelVer.textColor = [UIColor blackColor];
    labelVer.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    labelVer.textAlignment = NSTextAlignmentLeft;
    labelVer.verticalAlignment = VerticalAlignmentTop;
    labelVer.numberOfLines = 0;
    labelVer.text = @"i am lable1 NSTextAlignmentNatural fsdljdj  dlsjflsdfk lkjdsf sdlfj";
    [self.view addSubview:labelVer];
    UIView *lineVer = [[UIView alloc] initWithFrame:CGRectMake(0, setOffY + labelVer.heightTextContent, self.view.frame.size.width, 0.5)];
    lineVer.backgroundColor = [UIColor blueColor];
    [self.view addSubview:lineVer];
    
    
    setOffY+=100+10;
    DSAttributedLabel *label1 = [[DSAttributedLabel alloc] initWithFrame:CGRectMake(10, setOffY, self.view.frame.size.width-20, 100)];
    label1.backgroundColor = [UIColor redColor];
    label1.textColor = [UIColor blackColor];
    label1.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    label1.textAlignment = NSTextAlignmentLeft;
    label1.verticalAlignment = VerticalAlignmentBottom;
    label1.numberOfLines = 0;
    label1.text = @"i am lable1 NSTextAlignmentNatural fsdljdj  dlsjflsdfk lkjdsf sdlfj";
    [self.view addSubview:label1];
    
    
    
    setOffY+=100+10;
    
    DSAttributedLabel *labelVer2 = [[DSAttributedLabel alloc] initWithFrame:CGRectMake(10, setOffY, self.view.frame.size.width-20, 100)];
    labelVer2.backgroundColor = [UIColor redColor];
    labelVer2.textColor = [UIColor blackColor];
    labelVer2.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    labelVer2.textAlignment = NSTextAlignmentLeft;
    labelVer2.verticalAlignment = VerticalAlignmentMiddle;
    labelVer2.numberOfLines = 0;
    labelVer2.text = @"i am lable1 NSTextAlignmentNatural fsdljdj  dlsjflsdfk lkjdsf sdlfj";
    labelVer2.lineSpace = 5;
    [self.view addSubview:labelVer2];
    UIView *lineVer2 = [[UIView alloc] initWithFrame:CGRectMake(0, setOffY + labelVer2.heightTextContent, self.view.frame.size.width, 0.5)];
    lineVer2.backgroundColor = [UIColor blueColor];
    [self.view addSubview:lineVer2];

}

-(void)showLineBreakMode{
    
    //以单词为单位换行
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width-20, 100)];
    label1.backgroundColor = [UIColor redColor];
    label1.textColor = [UIColor blackColor];
    label1.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    label1.textAlignment = NSTextAlignmentLeft;
    label1.lineBreakMode = NSLineBreakByWordWrapping;
    label1.numberOfLines = 0;
    label1.text = @"以单词为单位换行 i am lable1 NSTextAlignmentNatural i am lable1 NSTextAlignmentNatural";
    [self.view addSubview:label1];
    
    //以单词为单位截断
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 210, self.view.frame.size.width-20, 100)];
    label2.backgroundColor = [UIColor redColor];
    label2.textColor = [UIColor blackColor];
    label2.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    label2.textAlignment = NSTextAlignmentLeft;
    label2.lineBreakMode = NSLineBreakByWordWrapping;
    label2.text = @"以单词为单位截断 i am lable1 NSTextAlignmentNatural i am lable1 NSTextAlignmentNatural";
    [self.view addSubview:label2];
    
    //以字符为单位换行（字符为单位截断）
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(10, 320, self.view.frame.size.width-20, 100)];
    label3.backgroundColor = [UIColor redColor];
    label3.textColor = [UIColor blackColor];
    label3.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    label3.textAlignment = NSTextAlignmentLeft;
    label3.lineBreakMode = NSLineBreakByCharWrapping;
    label3.numberOfLines = 0;
    label3.text = @"以字符为单位 i am lable1 NSTextAlignmentNatural i amlable1 NSTextAlignmentNatural";
    [self.view addSubview:label3];
    
    //以单词为单位换行（字符为单位截断）
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(10, 430, self.view.frame.size.width-20, 100)];
    label4.backgroundColor = [UIColor redColor];
    label4.textColor = [UIColor blackColor];
    label4.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    label4.textAlignment = NSTextAlignmentLeft;
    label4.lineBreakMode = NSLineBreakByClipping;
    label4.numberOfLines = 0;
    label4.text = @"以单词为单位 i am lable1 NSTextAlignmentNatural i amlable1 NSTextAlignmentNatural";
    [self.view addSubview:label4];
}

@end
