//
//  UIButton+XPButton.m
//  XPUIButton
//
//  Created by ZXP on 19-1-10.
//  Copyright (c) 2014年 ZXP. All rights reserved.
//

#import "UIButton+XPButton.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

static const NSString * topNameKey;
static const NSString * rightNameKey;
static const NSString * bottomNameKey;
static const NSString * leftNameKey;
static const void *parameterKey = &parameterKey;

@implementation UIButton (XPButton)
@dynamic parameterObjet;

-(void)setParameterObjet:(id)parameterObjet{
    objc_setAssociatedObject(self, parameterKey, parameterObjet, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(id)parameterObjet{
    return objc_getAssociatedObject(self, parameterKey);
}

-(void) animationScreenTitle{
    CGSize sizeR;
    NSInteger wideJ;
    
    sizeR = [self.titleLabel.text boundingRectWithSize:CGSizeMake(10000, 40) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.titleLabel.font} context:nil].size;
    wideJ = sizeR.width - self.titleLabel.frame.size.width;
    if (wideJ>0) {
        self.titleLabel.text = [NSString stringWithFormat:@"%@              ",self.titleLabel.text];
        [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(timerS:) userInfo:nil repeats:YES];
    }
}
-(void)timerS:(NSTimer *)timer {
    NSString *st1 = [self.titleLabel.text substringWithRange:NSMakeRange(0, 1)];
    NSString *st2 = [self.titleLabel.text substringFromIndex:1];
    self.titleLabel.text = [NSString stringWithFormat:@"%@%@",st2,st1];
}

- (void)verticalCenterImageAndTitle:(CGFloat)spacing
{
    // get the size of the elements here for readability
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    
    // lower the text and push it left to center it
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, - (imageSize.height + spacing/2), 0.0);
    
    // the text width might have changed (in case it was shortened before due to
    // lack of space and isn't anymore now), so we get the frame size again
    titleSize = self.titleLabel.frame.size;
    NSString *text = self.titleLabel.text;
    CGRect rect = [text boundingRectWithSize:CGSizeMake(self.frame.size.width, self.frame.size.height) options:NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:self.titleLabel.font} context:nil];
    // raise the image and push it right to center it
    self.imageEdgeInsets = UIEdgeInsetsMake(- (titleSize.height + spacing/2), 0.0, 0.0, - rect.size.width);
}

- (void)verticalCenterImageAndTitle
{
    const int DEFAULT_SPACING = 6.0f;
    [self verticalCenterImageAndTitle:DEFAULT_SPACING];
}


- (void)horizontalCenterTitleAndImage:(CGFloat)spacing
{
    // get the size of the elements here for readability
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    
    // lower the text and push it left to center it
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, 0.0, imageSize.width + spacing/2);
    
    // the text width might have changed (in case it was shortened before due to
    // lack of space and isn't anymore now), so we get the frame size again
    NSString *text = self.titleLabel.text;
    CGRect rect = [text boundingRectWithSize:CGSizeMake(self.frame.size.width, self.frame.size.height) options:NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:self.titleLabel.font} context:nil];
    titleSize = rect.size;
    
    // raise the image and push it right to center it
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, titleSize.width + spacing/2, 0.0, - titleSize.width);
}

- (void)horizontalCenterTitleAndImage
{
    const int DEFAULT_SPACING = 6.0f;
    [self horizontalCenterTitleAndImage:DEFAULT_SPACING];
}


- (void)horizontalCenterImageAndTitle:(CGFloat)spacing;
{
    // get the size of the elements here for readability
    //    CGSize imageSize = self.imageView.frame.size;
    //    CGSize titleSize = self.titleLabel.frame.size;
    
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0,  0.0, 0.0,  - spacing/2);
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, - spacing/2, 0.0, 0.0);
}

- (void)horizontalCenterImageAndTitle;
{
    const int DEFAULT_SPACING = 6.0f;
    [self horizontalCenterImageAndTitle:DEFAULT_SPACING];
}


- (void)horizontalCenterTitleAndImageLeft:(CGFloat)spacing
{
    // get the size of the elements here for readability
    //    CGSize imageSize = self.imageView.frame.size;
    //    CGSize titleSize = self.titleLabel.frame.size;
    
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, - spacing, 0.0, 0.0);
}

- (void)horizontalCenterTitleAndImageLeft
{
    const int DEFAULT_SPACING = 6.0f;
    [self horizontalCenterTitleAndImageLeft:DEFAULT_SPACING];
}


- (void)horizontalCenterTitleAndImageRight:(CGFloat)spacing
{
    // get the size of the elements here for readability
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    
    // lower the text and push it left to center it
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, 0.0, 0.0);
    
    // the text width might have changed (in case it was shortened before due to
    // lack of space and isn't anymore now), so we get the frame size again
    NSString *text = self.titleLabel.text;
    CGRect rect = [text boundingRectWithSize:CGSizeMake(self.frame.size.width, self.frame.size.height) options:NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:self.titleLabel.font} context:nil];
    titleSize = rect.size;
    
    // raise the image and push it right to center it
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, titleSize.width + imageSize.width + spacing, 0.0, - titleSize.width);
}

- (void)horizontalCenterTitleAndImageRight
{
    const int DEFAULT_SPACING = 6.0f;
    [self horizontalCenterTitleAndImageRight:DEFAULT_SPACING];
}

- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left
{
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

/**
 返回增加范围后的结果
 
 @return return value description
 */
- (CGRect) enlargedRect
{
    NSNumber* topEdge = objc_getAssociatedObject(self, &topNameKey);
    NSNumber* rightEdge = objc_getAssociatedObject(self, &rightNameKey);
    NSNumber* bottomEdge = objc_getAssociatedObject(self, &bottomNameKey);
    NSNumber* leftEdge = objc_getAssociatedObject(self, &leftNameKey);
    if (topEdge && rightEdge && bottomEdge && leftEdge)
    {
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                          self.bounds.origin.y - topEdge.floatValue,
                          self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    }
    else
    {
        return self.bounds;
    }
}

- (UIView*) hitTest:(CGPoint) point withEvent:(UIEvent*) event
{
    CGRect rect = [self enlargedRect];//获得了获得新范围的CGRect
    
    if (CGRectEqualToRect(rect, self.bounds))  //如果没有增加点击范围就调用super 看看点击范围是不是在父控件上
    {
        return [super hitTest:point withEvent:event];
    }
    //如果触摸点为在增加后的范围内就返回此view为触摸点
    return CGRectContainsPoint(rect, point) ? self : nil;
}

@end
