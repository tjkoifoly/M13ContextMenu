//
//  M13ContextMenuItemIOS7.h
//  M13ContextMenu
//
//  Created by Brandon McQuilkin on 4/14/14.
//  Copyright (c) 2014 Brandon McQuilkin. All rights reserved.
//

#import "M13ContextMenu.h"

@interface M13ContextMenuItemIOS7 : M13ContextMenuItem

/**@name Initalization*/
/**
Initalize a menu item with the given icons.

@param unselected The icon to display when the menu item is unselected.
@param selected   The icon to display when the menu item is selected.

@return A new menu item.
*/
- (id)initWithUnselectedIcon:(UIImage *)unselected selectedIcon:(UIImage *)selected;
/**
 The tint color of the item.
 */
@property (nonatomic, retain) UIColor *tintColor;

@end
