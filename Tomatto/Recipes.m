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
    NSMutableArray *recipe2;
    NSMutableArray *recipe3;
    NSMutableArray *recipe4;
    NSMutableArray *recipe5;
}

-(id)init{
    
    if ((self = [super init])){
        
        
        if (recipe5 == nil){
            recipe5 = [NSMutableArray arrayWithCapacity:2];
        }
        if (recipe4 == nil){
            recipe4 = [NSMutableArray arrayWithCapacity:2];
        }
        if (recipe6 == nil){
        recipe6 = [NSMutableArray arrayWithCapacity:2];
        }
        if (recipe15 == nil){
        recipe15 = [NSMutableArray arrayWithCapacity:2];
        }
        if (recipe1 == nil){
        recipe1 = [NSMutableArray arrayWithCapacity:2];
        }
        if (recipe2 == nil){
        recipe2 = [NSMutableArray arrayWithCapacity:2];
        }
        if (recipe3 == nil){
            recipe3 = [NSMutableArray arrayWithCapacity:2];
        }
        
        [self init5];
        [self init4];
        [self init3];
        [self init2];
        [self init6];
        [self init15];
        [self init1];
        
        self.recipes = @{@6: recipe6,
                         @15: recipe15,
                         @1 :recipe1,
                         @2 :recipe2,
                         @3 :recipe3,
                         @4 :recipe4,
                         @5 :recipe5};
        
        
    }
    return self;
}

-(void)init1{
    
    Recipe *number1 = [[Recipe alloc] initWithNumberOfIngredients:3];
    number1.title = @"Batido de frutos rojos y avena";
    number1.instrucciones = @"Se ponen todos los ingredientes a la batidora y se bate hasta que quede fino.";
    Ingredient *ingredient = number1.ingredients[0];
    ingredient.quantity = @"1 vaso";
    ingredient.name = @"leche de avena";
    Ingredient *ingredient2 = number1.ingredients[1];
    ingredient2.quantity = @"2 cucharas";
    ingredient2.name = @"frutos rojos";
    Ingredient *ingredient3 = number1.ingredients[2];
    ingredient3.quantity = @"Al gusto";
    ingredient3.name = @"azúcar moreno";
    [recipe1 addObject:number1];
    
}

-(void)init2{
    
    Recipe *number2 = [[Recipe alloc] initWithNumberOfIngredients:1];
    number2.title = @"Leche de avena";
    number2.instrucciones = @"Colocar unos 2,5 litros de agua en una olla y hervirla, cuando esté en ebullición agregarle 6 cucharadas de avena. Cuando entre en ebullición nuevamente (más o menos 1 minuto), apagarla y así estara pronta para beberla, si se quiere se puede colar para sacarle los grumos, es un gran alimento.";
    Ingredient *ingredient = number2.ingredients[0];
    ingredient.quantity = @"6 cucharas";
    ingredient.name = @"avena";
    [recipe2 addObject:number2];
    
}

-(void)init3{
    
    Recipe *number3 = [[Recipe alloc] initWithNumberOfIngredients:1];
    number3.title = @"Leche de almendras";
    number3.instrucciones = @"En una batidora (yo uso tipo 'americana' de jarra) batimos  el agua y las almendras crudas peladas durante unos 3 min aprox. Colamos el líquido  con un colador de tela . ¡Ya tenemos nuestra leche de almendra sana, natural, económica y sin aditivos! Embotellar y guardar en la nevera, nos durará 4-5 días fresca. Agitar la leche antes de usar. Con la pasta que nos quedará de colar la leche (okara) podemos preparar hamburguesas, salsas, purés, bizcochos, etc y la podemos congelar para cuando la necesitemos.";
    Ingredient *ingredient = number3.ingredients[0];
    ingredient.name = @"almendras";
    ingredient.quantity = @"100 grs.";
    [recipe3 addObject:number3];
    
}

-(void)init4{
    
    Recipe *number4 = [[Recipe alloc] initWithNumberOfIngredients:7];
    number4.title = @"Hamburguesas de arroz, almendras y verduras";
    number4.instrucciones = @"Cocer el arroz con el agua. Esperar que se atempere. En un bol poner el arroz, la zanahoria, la cebolla,las aceitunas troceadas, las almendras,  que antes habremos picado, y mezclamos bien. En una sartén ponemos un chorro generoso de aceite y lo vamos calentando. De mientras, hacemos las hamburgesas y las pasamos por el pan rallado y a la sartén. Cuando esten doradas, las ponemos en papel absorbente y ya las podemos comer calientes.";
    Ingredient *ingredient = number4.ingredients[0];
    ingredient.name = @"arroz";
    ingredient.quantity = @"2 tazas";
    Ingredient *ingredient2 = number4.ingredients[1];
    ingredient2.name = @"zanahoria";
    ingredient2.quantity = @"1 rallada";
    Ingredient *ingredient3 = number4.ingredients[2];
    ingredient3.name = @"cebolla";
    ingredient3.quantity = @"1 pieza";
    Ingredient *ingredient4 = number4.ingredients[3];
    ingredient4.name = @"almendras";
    ingredient4.quantity = @"1 puñado";
    Ingredient *ingredient5 = number4.ingredients[4];
    ingredient5.name = @"aceitunas";
    ingredient5.quantity = @"Al gusto";
    Ingredient *ingredient6 = number4.ingredients[5];
    ingredient6.name = @"pan rallado";
    ingredient6.quantity = @"1 plato";
    Ingredient *ingredient7 = number4.ingredients[6];
    ingredient7.name = @"aceite";
    ingredient7.quantity = @"Al gusto";
    [recipe4 addObject:number4];

}

-(void)init5{
    
    Recipe *number5 = [[Recipe alloc] initWithNumberOfIngredients:12];
    number5.title = @"Berenjenas rellenas";
    number5.instrucciones = @"Lavar las berenjenas, cortar el tallo, partir longitudinalmente por la mitad y hacerles unos cortes. Colocar las mitades (con el corte hacia arriba) sobre una placa de horno, introducir al horno precalentado y hornear durante algunos minutos, hasta que la pulpa se pueda desprender fácilmente de la pieal. Vaciar las berenjenas ayudándose de una cuchara, pero procurando dejar 2-3 mm. de pulpa sobre la piel, ya que la piel de la berenjena es muy fina. Trocear la pulpa y ponerla aparte. Sumergir los tomates unos instantes en agua hirviendo, para poder pelarlos mejor. Pelar y trocear la cebolla y los ajos. Lavar al calabacín y los pimientos, partir en dos los pimientos, eliminar las pepitas y cortar trozos más bien pequeños. Cortar el calabacín a rodajas y después a tiras. Calentar el aceite en una sartén honda y freír primero la cebollas y los ajos, hasta que empiecen a tomar color, añadir los trozos de calabacín y pimientos y seguir friendo unos minutos más, incorporar la pulpa de berenjena y seguir friendo. Pelar y trocear los tomates y añadir también la verdura. Salpimentar, rociar con jerez (opcional) y dejar cocer a fuego lento durante 5 minutos. Mientras, cortar las aceitunas a rodajitas y añadir junto con cucharadas de pan rallado a la masa del relleno. Rellenar las mitades de berenjena con la masa y colocarlas encima de una placa de horno previamente engrasada. Mezclar el pan rallado restante con la almendra molida y el perejil y espolvorear con ello las berenjenas. Rociar con un poco de aceite y hornear durante unos 15 - 20 minutos (hasta que la superficie empiece a tostarse) a 200 grados";
    Ingredient *ingredient = number5.ingredients[0];
    ingredient.name = @"berenjena";
    ingredient.quantity = @"4 piezas";
    Ingredient *ingredient2 = number5.ingredients[1];
    ingredient2.name = @"aceite";
    ingredient2.quantity = @"6 cucharas";
    Ingredient *ingredient3 = number5.ingredients[2];
    ingredient3.name = @"cebolla";
    ingredient3.quantity = @"1 pieza";
    Ingredient *ingredient4 = number5.ingredients[3];
    ingredient4.name = @"ajo";
    ingredient4.quantity = @"2 dientes";
    Ingredient *ingredient5 = number5.ingredients[4];
    ingredient5.name = @"tomate";
    ingredient5.quantity = @"4 piezas";
    Ingredient *ingredient6 = number5.ingredients[5];
    ingredient6.name = @"calabacín";
    ingredient6.quantity = @"1 pieza";
    Ingredient *ingredient7 = number5.ingredients[6];
    ingredient7.name = @"pimiento verde";
    ingredient7.quantity = @"1 pieza";
    Ingredient *ingredient8 = number5.ingredients[7];
    ingredient8.name = @"pimiento rojo";
    ingredient8.quantity = @"1 pieza";
    Ingredient *ingredient9 = number5.ingredients[8];
    ingredient9.name = @"aceitunas";
    ingredient9.quantity = @"100 grs.";
    Ingredient *ingredient10 = number5.ingredients[9];
    ingredient10.name = @"pan rallado";
    ingredient10.quantity = @"7 cucharas";
    Ingredient *ingredient11 = number5.ingredients[10];
    ingredient11.name = @"almendras";
    ingredient11.quantity = @"1 puñado";
    Ingredient *ingredient12 = number5.ingredients[11];
    ingredient12.name = @"perejil";
    ingredient12.quantity = @"1 cuchara";
    [recipe5 addObject:number5];
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
