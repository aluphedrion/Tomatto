//
//  Recipe.m
//  Tomatto
//
//  Created by bluezy on 30/03/13.
//  Copyright (c) 2013 bluezy. All rights reserved.
//

#import "Recipe.h"
#import "Ingredient.h"
@implementation Recipe

-(id)initWithNumberOfIngredients:(int)number{
    
    if ((self = [super init])){
        
        self.ingredients = [@[] mutableCopy];
        for (int i = 0; i < number; i++){
            
            Ingredient *ingredient = [[Ingredient alloc] init];
            [self.ingredients addObject:ingredient];
            
        }
    }
    return self;
}
@end
