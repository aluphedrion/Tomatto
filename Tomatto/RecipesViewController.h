//
//  RecipesViewController.h
//  Tomatto
//
//  Created by bluezy on 04/04/13.
//  Copyright (c) 2013 bluezy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipes.h"

@interface RecipesViewController : UITableViewController

@property (nonatomic, strong) Recipes *recipes;
@property (nonatomic, strong) NSMutableArray *selectedRecipes;

@end
