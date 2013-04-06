//
//  Ingredients.m
//  Tomatto
//
//  Created by bluezy on 30/03/13.
//  Copyright (c) 2013 bluezy. All rights reserved.
//

#import "Ingredients.h"

@implementation Ingredients

-(id)init{
    
    if ((self = [super init])){
        
        self.names = @[@"ajo", @"aceite", @"leche de soja", @"leche de avena", @"frutos rojos", @"azúcar moreno", @"avena", @"almendras", @"arroz", @"zanahoria", @"cebolla", @"aceitunas", @"pan rallado", @"tomate", @"pimiento rojo", @"pimiento verde", @"calabacín", @"berenjena", @"perejil"];

    }
    return self;
}

@end
