//
//  LPCLabel.m
//  LPCTool
//
//  Created by 李沛池 on 2018/11/29.
//

#import "LPCLabel.h"

@implementation LPCLabel

- (instancetype)init
{
    if (self = [super init]) {
        _textInsets = UIEdgeInsetsZero;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _textInsets = UIEdgeInsetsZero;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _textInsets = UIEdgeInsetsZero;
    }
    return self;
}

- (void)drawTextInRect:(CGRect)rect
{
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, _textInsets)];
}

- (void)setAttributedTextWithLineSpacing:(CGFloat)lineSpacing withString:(NSString *)string
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [paragraphStyle setAlignment:self.textAlignment];
    self.attributedText = [[NSAttributedString alloc]initWithString:string attributes:@{NSParagraphStyleAttributeName:paragraphStyle}];
}

@end
