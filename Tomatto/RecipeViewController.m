//
//  RecipeViewController.m
//  Tomatto
//
//  Created by bluezy on 04/04/13.
//  Copyright (c) 2013 bluezy. All rights reserved.
//

#import "RecipeViewController.h"
#import "QuantitiesTableViewController.h"
#import "NamesTableViewController.h"

@interface RecipeViewController (){
    
    QuantitiesTableViewController *quantitiesTable;
    NamesTableViewController *namesTable;
}

@property (nonatomic, weak) IBOutlet UITableView *quantitiesTableView;
@property (nonatomic, weak) IBOutlet UITableView *namesTableView;
@property (nonatomic, weak) IBOutlet UITextView *instructionTextView;
@end

@implementation RecipeViewController


- (void)viewDidLoad
{
    if (quantitiesTable == nil){
    
        quantitiesTable = [[QuantitiesTableViewController alloc] init];
        quantitiesTable.recipe = self.recipe;
    }
    if (namesTable == nil){
    
        namesTable = [[NamesTableViewController alloc] init];
        namesTable.recipe = self.recipe;
    
    }
    self.quantitiesTableView.delegate = quantitiesTable;
    self.quantitiesTableView.dataSource = quantitiesTable;
    self.namesTableView.delegate = namesTable;
    self.namesTableView.dataSource = namesTable;
    
    quantitiesTable.view = quantitiesTable.tableView;
    namesTable.view = namesTable.tableView;
    
    NSString *text = self.recipe.instrucciones;
    self.instructionTextView.text = text;
    [super viewDidLoad];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
