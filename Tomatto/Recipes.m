//
//  Recipes.m
//  Tomatto
//
//  Created by bluezy on 30/03/13.
//  Copyright (c) 2013 bluezy. All rights reserved.
//

#import "Recipes.h"
#import "Recipe.h"
#import "Ingredient.h"


@implementation Recipes{
    
    NSMutableArray *recipe6;
    NSMutableArray *recipe15;
    NSMutableArray *recipe1;
}

-(id)init{
    
    if ((self = [super init])){
        
        
        recipe6 = [NSMutableArray arrayWithCapacity:20];
        recipe15 = [NSMutableArray arrayWithCapacity:20];
        recipe1 = [NSMutableArray arrayWithCapacity:20];
        
        [self init6];
        [self init15];
        
        
        self.recipes = @{@6: recipe6,
                         @15: recipe15, @1 :recipe1};
        
        
    }
    return self;
}

-(void)init6{
    
    Recipe *number6 = [[Recipe alloc] initWithNumberOfIngredients:2];
    number6.title = @"AliOli";
    number6.instrucciones = @"En el vaso de la batidora hechar todos los ingredientes. Se pueden añadir más o menos ajos según lo picante que se desee. Poner la batidora apagada en el fondo del vaso, entonces prenderla y no levantarla hasta que empieze a montar. Añadir sal a gusto";
    Ingredient *ingredient = [number6.ingredients objectAtIndex:0];
    ingredient.quantity = @"1 vaso";
    ingredient.name = @"aceite";
    Ingredient *ingredient2 = [number6. ingredients objectAtIndex:1];
    ingredient2.quantity = @"3 dientes";
    ingredient2.name = @"ajo";
    [recipe6 addObject:number6];
    
}


-(void)init15{
    
    Recipe *number15 = [[Recipe alloc] initWithNumberOfIngredients:2];
    number15.title = @"Sojanesa";
    number15.instrucciones = @"En el vaso de la batidora hechar todos los ingredientes. Poner la batidora apagada en el fondo del vaso. Una vez se ha ligado la mezcla en el fondo, moved la batidora poco a poco, para que ligue el aceite que hay en la superficie del vaso. Añadir sal a gusto.";
    Ingredient *ingredient = [number15.ingredients objectAtIndex:0];
    ingredient.quantity = @"1/3 vaso";
    ingredient.name = @"leche de soja";
    Ingredient *ingredient2 = [number15.ingredients objectAtIndex:1];
    ingredient2.quantity = @"1 vaso";
    ingredient2.name = @"aceite";
    [recipe15 addObject:number15];
    
}



@end
