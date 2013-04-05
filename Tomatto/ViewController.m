//
//  ViewController.m
//  Tomatto
//
//  Created by bluezy on 26/03/13.
//  Copyright (c) 2013 bluezy. All rights reserved.
//

#import "ViewController.h"
#import "ButtonCell.h"
#import "InstructionsView.h"
#import "Ingredients.h"
#import "Ingredient.h"
#import "Recipe.h"
#import "RecipesViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *selectedIngredientNames;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *searchButton;
@property (nonatomic, strong) Ingredients *ingredientsBook;
@property (nonatomic, strong) Recipes *recipes;

-(IBAction)searchRecipe:(id)sender;

@end

@implementation ViewController{

    NSMutableArray *selectedRecipesIndexSet;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    
    if ((self = [super initWithCoder:aDecoder])){
        
        selectedRecipesIndexSet = [NSMutableArray arrayWithCapacity:20];
        self.selectedIngredientNames = [@[] mutableCopy];
        self.ingredientsBook = [[Ingredients alloc] init];
        self.recipes = [[Recipes alloc] init];
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.collectionView.allowsMultipleSelection = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)searchRecipe:(id)sender{
    
    selectedRecipesIndexSet = [self findRecipesIndexSet];
    if (selectedRecipesIndexSet == nil){
        [self showAlertIngredients];
    } else {
        [self performSegueWithIdentifier:@"Recipes" sender:nil];
    }
}

-(void)showAlertIngredients{
    
    UIAlertView *ingredientAlertView = [[UIAlertView alloc] initWithTitle:@"Te faltan ingredientes" message:@"Pregúntale a tu vecina/o algún ingrediente más" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [ingredientAlertView show];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"Recipes"]){
        
        RecipesViewController *viewController = segue.destinationViewController;
        viewController.recipes = self.recipes;
        
        NSMutableArray *selectedRecipes = [self parseSelectedIndexes:selectedRecipesIndexSet];
        viewController.selectedRecipes = selectedRecipes;
        NSString *title;
        if (selectedRecipes.count == 1){
            title = @"Receta encontrada";
        } else {
            title = @"Recetas encontradas";
        }
        viewController.title = [NSString stringWithFormat:@"%d %@", [selectedRecipes count], title];
    }
}

-(NSMutableArray *)parseSelectedIndexes:(NSArray *)selectedIndexes{
    NSMutableArray *parsedResults = [NSMutableArray arrayWithCapacity:20];
    for (NSNumber *key in selectedIndexes){
        NSMutableArray *container = [self.recipes.recipes objectForKey:key];
        for (Recipe *testRecipe in container){
            [parsedResults addObject:testRecipe];
        }
    }
    return parsedResults;
}
#pragma mark - Algoritmo indices
-(NSMutableArray *)findRecipesIndexSet{
    
    NSMutableArray *indexSets = [NSMutableArray arrayWithCapacity:20];
    for (NSNumber *recipeKey in self.recipes.recipes){
        NSMutableArray *container = [self.recipes.recipes objectForKey:recipeKey];
        
        for (Recipe *recipe in container){
    
            NSMutableArray *testArray = [self produceTestArray:recipe.ingredients];
            
            if ([testArray count] >= [recipe.ingredients count]){
                
                NSSet *indexSet = [self.recipes.recipes keysOfEntriesPassingTest:^BOOL(NSNumber *key, NSMutableArray *obj, BOOL *stop) {
                    return obj == container;
                }];
                [indexSets addObject:indexSet];
                
            }
            
        }
    }
    NSMutableArray *recipesIndexes = [self parseIndexSets:indexSets];
    if (recipesIndexes.count == 0){
        return nil;
    }
    return recipesIndexes;
}
-(NSMutableArray *)produceTestArray:(NSArray *)ingredients{
    
    NSMutableArray *testArray = [NSMutableArray arrayWithCapacity:20];
    
    for (int i = 0; i < [ingredients count]; i++){
        
        Ingredient *testIngredient = [ingredients objectAtIndex:i];
        for (NSString *name in self.selectedIngredientNames){
            if ([testIngredient.name isEqualToString:name]){
                [testArray addObject:@1];
                
            }
        }
    }
    
    return testArray;
}
-(NSMutableArray *)parseIndexSets:(NSArray *)indexSets{
    
    NSMutableArray *parsedIndexSets = [NSMutableArray arrayWithCapacity:20];
    
    for (NSSet *set in indexSets){
        NSArray *test = [set allObjects];
        for (NSNumber *num in test){
            [parsedIndexSets addObject:num];
        }
    }
    return parsedIndexSets;
}

#pragma mark - UICollectionView Data Source

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [self.ingredientsBook.names count];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ButtonCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ButtonCell" forIndexPath:indexPath];
    
    NSString *title = self.ingredientsBook.names[indexPath.row];
    
    cell.label.text = title;
    
    return cell;
    
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    InstructionsView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Instructions" forIndexPath:indexPath];
    return headerView;
}

#pragma mark - UICollectionViewDelegate

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    self.searchButton.enabled = YES;
    
    ButtonCell *cell = (ButtonCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.label.textColor = [UIColor blueColor];
    
    NSString *name = self.ingredientsBook.names[indexPath.row];
    [self.selectedIngredientNames addObject:name];
    
    
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    self.searchButton.enabled = ([[collectionView indexPathsForSelectedItems] count] > 0);
    
    ButtonCell *cell = (ButtonCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor blackColor];
    cell.label.textColor = [UIColor whiteColor];
    
    NSString *name = self.ingredientsBook.names[indexPath.row];
    [self.selectedIngredientNames removeObject:name];
    
    
    
}
@end
