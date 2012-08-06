//
//  BNRItem.m
//  RandomPossessions
//
//  Created by John McGovern on 7/30/12.
//  Copyright (c) 2012 John McGovern. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

-(void)dealloc
{
    NSLog(@"Destroyed: %@",self);
}

-(id)init
{
    return [self initWithItemName:@"Item" valueInDollars:0 serialNumber:@""];
}

-(id) initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber
{
    // Call the superclasses designated initializer
    self = [super init];
    
    // Did the superclass's designated initializer succeed?
    if (self)
    {
        // Give the instance variables inital values
        [self setItemName:name];
        [self setSerialNumber:sNumber];
        [self setValueInDollars:value];
        dateCreated = [[NSDate alloc] init];
    }
    // Return the address of the newly initialized object
    return self;
    
}

+(id)randomItems
{
    // Create an array of three adjectives
    NSArray *randomAdjectiveList = [NSArray arrayWithObjects:@"Fluffy",@"Rusty",@"Shiny", nil];
    
    // Create an array of three nouns
    NSArray *randomNounList = [NSArray arrayWithObjects:@"Bear",@"Spork",@"Mac", nil];
    
    /* Get the index of a random adjective/noun from the lsits
        Note: The % operator, called the modulo operator, gives
        you the remainder.  So adjectiveIndex is a random number
        from 0 to 2 inclusive. */
    NSInteger adjectiveIndex = rand() % [randomAdjectiveList count];
    NSInteger nounIndex = rand() % [randomNounList count];
    
    // Note that NSInteger is not an object, but a type definition
    // for "unsigned long" - so no * needed - JM
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",[randomAdjectiveList objectAtIndex:adjectiveIndex],[randomNounList objectAtIndex:nounIndex]];
    int randomValue = rand() % 100;
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                        '0' + rand() % 10,
                                        'A' + rand() % 26,
                                        '0' + rand() % 10,
                                        'A' + rand() % 26,
                                        '0' + rand() % 10
                                   ];
    
    
    BNRItem *newItem = [[self alloc] initWithItemName:randomName valueInDollars:randomValue serialNumber:randomSerialNumber];
    
    return newItem;
    
}

@synthesize itemName, containedItem, container, serialNumber, valueInDollars, dateCreated;
/* Changed to synthesize - JM
-(void)setItemName:(NSString *)str
{
    itemName=str;
    // and then changed to itemName = [str copy]; for safety
}
-(NSString *)itemName
{
    return itemName;
}


-(void)setSerialNumber:(NSString *)str
{
    serialNumber = str;
}
-(NSString *)serialNumber
{
    return serialNumber;
}

-(void)setValueInDollars:(int)i
{
    valueInDollars = i;
}
-(int)valueInDollars
{
    return valueInDollars;
}

-(NSDate *)dateCreated
{
    return dateCreated;
}
*/

/* @synthesize won't do because we need the setter to do additional work
    Good news is that this will just go ahead
    and overwrite the synthesized property */
-(void)setContainedItem:(BNRItem *)i
{
    containedItem = i;
    
    // When given an item to contain, the contained
    // item will be given a pointer to its container
    [i setContainer:self];
}

/*

-(BNRItem *)containedItem
{
    return containedItem;
}

-(void)setContainer:(BNRItem *)i
{
    container = i;
}

-(BNRItem *)container
{
    return container;
}

-(NSString *)description
{
    NSString *descriptionString =
    [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, Recorded On %@",
     itemName, serialNumber,valueInDollars, dateCreated];
    
    return descriptionString;
}

 */

@end
