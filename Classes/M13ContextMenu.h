//
//  M13ContextMenu.h
//  M13ContextMenu
//
//  Created by Brandon McQuilkin on 4/13/14.
//  Copyright (c) 2014 Brandon McQuilkin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class M13ContextMenu;
@class M13ContextMenuItem;

@protocol  M13ContextMenuDelegate <NSObject>

/**
 Determines wether or not the context menu should show.
 
 @param contextMenu The context menu that wants to display
 @param point       The point at which the context menu wants to display in the coordinate space of the view containing the gesture.
 
 @return Whether or not the context menu should show.
 */
- (BOOL)shouldShowContextMenu:(M13ContextMenu *)contextMenu atPoint:(CGPoint)point;
/**
 Lets the delegate know that the menu selected a given menu item.
 
 @param contextMenu The context menu that selected an item.
 @param point       The location of the menu.
 @param index       The index of the selected menu item.
 */
- (void)contextMenu:(M13ContextMenu *)contextMenu atPoint:(CGPoint)point didSelectItemAtIndex:(NSInteger)index;

@end

@interface M13ContextMenu : UIView

/**@name Initalization*/
/**
 Initalize the context menu with a set of menu items.

 @param menuItems An array of the menu items to populate the context menu with.
 
 @note The menu items will be expanded to 125% of their base size when selected. If the item contains an image, it should be 125% larger than the base size.

 @return A new context menu.
*/
- (id)initWithMenuItems:(NSArray *)menuItems;

/**@name Actions*/
/**
 The menu's delegate
 */
@property (nonatomic, retain) id<M13ContextMenuDelegate> delegate;
/**
 The selector to set the gesture recognizer's target to, to display the menu upon gesture activation.
 
 @param gestureRecognizer The gesture recognizer that activated to display the menu.
 */
- (void)showMenuUponActivationOfGetsure:(UIGestureRecognizer *)gestureRecognizer;

/**@name Appearance*/
/**
 The radius of the circle that marks the menu origination point.
 */
@property (nonatomic, assign) CGFloat originationCircleRadius;
/**
 The width of the stroke around the circle that marks the menu origination point.
 */
@property (nonatomic, assign) CGFloat originationCircleStrokeWidth;
/**
 The color of the stroke around the circle that marks the menu origination point.
 */
@property (nonatomic, retain) UIColor *originationCircleStrokeColor;

@end

@interface M13ContextMenuItem : CALayer
/**
 Wether or not item is highlighted. The item should draw diffrently in the two diffrent states.
 */
@property (nonatomic, assign) BOOL highlighted;
/**
 The base size of the item.
 
 @return The size of the item.
 */
- (CGSize)baseSize;

@end
