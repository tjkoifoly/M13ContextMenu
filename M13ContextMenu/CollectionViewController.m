//
//  CollectionViewController.m
//  M13ContextMenu
//
//  Created by Brandon McQuilkin on 4/14/14.
//  Copyright (c) 2014 Brandon McQuilkin. All rights reserved.
//

#import "CollectionViewController.h"
#import "M13ContextMenu.h"
#import "M13ContextMenuItemIOS7.h"

@interface CollectionViewController () <M13ContextMenuDelegate>

@end

@implementation CollectionViewController
{
    M13ContextMenu *menu;
    UILongPressGestureRecognizer *longPress;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Fix tab bar
    self.tabBarItem.selectedImage = [UIImage imageNamed:@"CollectionIconSelected"];
    
    //Create the items
    M13ContextMenuItemIOS7 *bookmarkItem = [[M13ContextMenuItemIOS7 alloc] initWithUnselectedIcon:[UIImage imageNamed:@"BookmarkIcon"] selectedIcon:[UIImage imageNamed:@"BookmarkIconSelected"]];
    M13ContextMenuItemIOS7 *uploadItem = [[M13ContextMenuItemIOS7 alloc] initWithUnselectedIcon:[UIImage imageNamed:@"UploadIcon"] selectedIcon:[UIImage imageNamed:@"UploadIconSelected"]];
    M13ContextMenuItemIOS7 *trashIcon = [[M13ContextMenuItemIOS7 alloc] initWithUnselectedIcon:[UIImage imageNamed:@"TrashIcon"] selectedIcon:[UIImage imageNamed:@"TrashIconSelected"]];
	//Create the menu
    menu = [[M13ContextMenu alloc] initWithMenuItems:@[bookmarkItem, uploadItem, trashIcon]];
    menu.delegate = self;
    
    //Create the gesture recognizer
    longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:menu action:@selector(showMenuUponActivationOfGetsure:)];
    [self.collectionView addGestureRecognizer:longPress];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BasicCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BasicCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%li", indexPath.row];
    
    return cell;
}

- (BOOL)shouldShowContextMenu:(M13ContextMenu *)contextMenu atPoint:(CGPoint)point
{
    //If there is a cell, then the menu should activate.
    NSIndexPath* indexPath = [self.collectionView indexPathForItemAtPoint:point];
    UICollectionViewCell* cell = [self.collectionView cellForItemAtIndexPath:indexPath];
    
    return cell != nil;
}

- (void)contextMenu:(M13ContextMenu *)contextMenu atPoint:(CGPoint)point didSelectItemAtIndex:(NSInteger)index
{
    NSIndexPath* indexPath = [self.collectionView indexPathForItemAtPoint:point];
    
    NSMutableString *string = [@"You selected the " mutableCopy];
    if (index == 0) {
        [string appendString:@"Bookmark Action."];
    } else if (index == 1) {
        [string appendString:@"Upload Action."];
    } else {
        [string appendString:@"Trash Action."];
    }
    
    [string appendFormat:@" For cell at index: %li.", indexPath.row];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Action Selected" message:string delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

@end

@implementation BasicCell



@end
