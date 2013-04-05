//
//  RecipesViewController.m
//  Tomatto
//
//  Created by bluezy on 04/04/13.
//  Copyright (c) 2013 bluezy. All rights reserved.
//

#import "RecipesViewController.h"
#import "ParRecipeCell.h"
#import "ImparRecipeCell.h"
#import "Recipe.h"
#import "Ingredient.h"
#import "RecipeViewController.h"

@interface RecipesViewController ()

@end

@implementation RecipesViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"Recipe"]){
        RecipeViewController *viewController = segue.destinationViewController;
        Recipe *recipe = (Recipe *)sender;
        viewController.title = recipe.title;
        viewController.recipe = recipe;
    }
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.selectedRecipes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *FirstCellIdentifier = @"ImparRecipeCell";
    static NSString *SecondCellIdentifier = @"ParRecipeCell";
    
    Recipe *recipe = [self.selectedRecipes objectAtIndex:indexPath.row];
    
    NSString *title = recipe.title;
    
    NSMutableArray *ingredientsArray = [NSMutableArray arrayWithCapacity:20];
    for (Ingredient *test in recipe.ingredients){
        [ingredientsArray addObject:test.name];
    }
    NSString *ingredients = [ingredientsArray componentsJoinedByString:@", "];
    
    if (indexPath.row % 2 == 0){
        ImparRecipeCell *cell = [tableView dequeueReusableCellWithIdentifier:FirstCellIdentifier forIndexPath:indexPath];
        cell.title.text = title;
        cell.subTitle.text = ingredients;
        return cell;
    } else {
        ParRecipeCell *cell = [tableView dequeueReusableCellWithIdentifier:SecondCellIdentifier forIndexPath:indexPath];
        cell.title.text = title;
        cell.subTitle.text = ingredients;
        cell.backgroundColor = [UIColor blackColor];
        return cell;
    }

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row % 2 == 1){
        cell.backgroundColor = [UIColor blackColor];
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Recipe *recipe = [self.selectedRecipes objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"Recipe" sender:recipe];

}

@end
