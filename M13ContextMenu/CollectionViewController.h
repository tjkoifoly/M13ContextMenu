//
//  CollectionViewController.h
//  M13ContextMenu
//
//  Created by Brandon McQuilkin on 4/14/14.
//  Copyright (c) 2014 Brandon McQuilkin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewController : UICollectionViewController

@end

@interface BasicCell : UICollectionViewCell

@property (nonatomic, retain) IBOutlet UILabel *textLabel;

@end
