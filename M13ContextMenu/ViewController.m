//
//  ViewController.m
//  M13ContextMenu
//
//  Created by Brandon McQuilkin on 4/6/14.
//  Copyright (c) 2014 Brandon McQuilkin. All rights reserved.
//

#import "ViewController.h"
#import "M13ContextMenu.h"
#import "M13ContextMenuItemIOS7.h"

@interface ViewController () <M13ContextMenuDelegate>

@end

@implementation ViewController
{
    M13ContextMenu *menu;
    UILongPressGestureRecognizer *longPress;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Fix tab bar
    self.tabBarItem.selectedImage = [UIImage imageNamed:@"BasicIconSelected"];
    
    //Create the items
    M13ContextMenuItemIOS7 *bookmarkItem = [[M13ContextMenuItemIOS7 alloc] initWithUnselectedIcon:[UIImage imageNamed:@"BookmarkIcon"] selectedIcon:[UIImage imageNamed:@"BookmarkIconSelected"]];
    M13ContextMenuItemIOS7 *uploadItem = [[M13ContextMenuItemIOS7 alloc] initWithUnselectedIcon:[UIImage imageNamed:@"UploadIcon"] selectedIcon:[UIImage imageNamed:@"UploadIconSelected"]];
    M13ContextMenuItemIOS7 *trashIcon = [[M13ContextMenuItemIOS7 alloc] initWithUnselectedIcon:[UIImage imageNamed:@"TrashIcon"] selectedIcon:[UIImage imageNamed:@"TrashIconSelected"]];
	//Create the menu
    menu = [[M13ContextMenu alloc] initWithMenuItems:@[bookmarkItem, uploadItem, trashIcon]];
    menu.delegate = self;
    
    //Create the gesture recognizer
    longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:menu action:@selector(showMenuUponActivationOfGetsure:)];
    [_longPressView setUserInteractionEnabled:YES];
    [_longPressView addGestureRecognizer:longPress];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)contextMenu:(M13ContextMenu *)contextMenu atPoint:(CGPoint)point didSelectItemAtIndex:(NSInteger)index
{
    NSMutableString *string = [@"You selected the " mutableCopy];
    if (index == 0) {
        [string appendString:@"Bookmark Action."];
    } else if (index == 1) {
        [string appendString:@"Upload Action."];
    } else {
        [string appendString:@"Trash Action."];
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Action Selected" message:string delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

@end
