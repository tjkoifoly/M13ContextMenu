//
//  M13ContextMenuItemIOS7.m
//  M13ContextMenu
//
//  Created by Brandon McQuilkin on 4/14/14.
//  Copyright (c) 2014 Brandon McQuilkin. All rights reserved.
//

#import "M13ContextMenuItemIOS7.h"

@interface M13ContextMenuItemIOS7 ()

@property (nonatomic, retain) UIImage *selectedIcon;
@property (nonatomic, retain) UIImage *unselectedIcon;

@end

@implementation M13ContextMenuItemIOS7

- (id)initWithUnselectedIcon:(UIImage *)unselected selectedIcon:(UIImage *)selected
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, self.baseSize.width, self.baseSize.height);
        self.bounds = self.frame;
        self.backgroundColor = [UIColor whiteColor].CGColor;
        self.cornerRadius = self.baseSize.width / 2.0;
        self.masksToBounds = YES;
        self.contentsScale = [UIScreen mainScreen].scale;
        _selectedIcon = selected;
        _unselectedIcon = unselected;
        _tintColor = [UIColor colorWithRed:0.02 green:0.47 blue:1.0 alpha:1.0];
        [self setHighlighted:NO];
    }
    return self;
}

- (id)initWithLayer:(id)layer
{
    self = [super initWithLayer:layer];
    if (self) {
        M13ContextMenuItemIOS7 *item = layer;
        _selectedIcon = item.selectedIcon;
        _unselectedIcon = item.unselectedIcon;
        _tintColor = item.tintColor;
        [self setHighlighted:item.highlighted];
    }
    return self;
}

- (void)drawInContext:(CGContextRef)ctx
{
    [super drawInContext:ctx];
    
    UIImage *image = self.highlighted ? _selectedIcon : _unselectedIcon;
    UIColor *color = self.highlighted ? [UIColor whiteColor] : _tintColor;
    image = [self tintedImage:image WithColor:color];
    
    CGRect rect = CGRectIntegral(CGRectInset(self.bounds, self.bounds.size.width * 0.2, self.bounds.size.height * 0.2));
    
    CGContextDrawImage(ctx, rect, image.CGImage);
}


#pragma mark - Overrides

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    if (self.highlighted) {
        self.backgroundColor = _tintColor.CGColor;
    } else {
        self.backgroundColor = [UIColor whiteColor].CGColor;
    }
    [self setNeedsDisplay];
}

- (UIImage *)tintedImage:(UIImage *)image WithColor:(UIColor *)color
{
    UIGraphicsBeginImageContext(image.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    
    // draw alpha-mask
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGContextDrawImage(context, rect, image.CGImage);
    
    // draw tint color, preserving alpha values of original image
    CGContextSetBlendMode(context, kCGBlendModeSourceIn);
    [color setFill];
    CGContextFillRect(context, rect);
    
    UIImage *coloredImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return coloredImage;
}

- (CGSize)baseSize
{
    return CGSizeMake(50, 50);
}

@end
