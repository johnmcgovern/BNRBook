//
//  BNRItem.h
//  RandomPossessions
//
//  Created by John McGovern on 7/30/12.
//  Copyright (c) 2012 John McGovern. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject
{
    /* And this is now redundant because @synthesize will 
        create any vars that have not been created
    NSString *itemName;
    NSString *serialNumber;
    int valueInDollars;
    NSDate *dateCreated;

    BNRItem *containedItem;
    __weak BNRItem *container;
     */
}

+(id)randomItems;

-(NSDate *)dateCreated;

-(id)initWithItemName:(NSString *)name
       valueInDollars:(int)value
         serialNumber:(NSString *)sNumber;

// The long way - JM
/*-(void)setItemName:(NSString *)str;
-(NSString *)itemName;

-(void)setSerialNumber:(NSString *)str;
-(NSString *)serialNumber;

-(void)setValueInDollars:(int)i;
-(int)valueInDollars;

-(void)setContainedItem:(BNRItem *)i;
-(BNRItem *)containedItem;

-(void)setContainer:(BNRItem *)i;
-(BNRItem *)container;
*/

// Now with properties - JM
@property (nonatomic,strong) BNRItem *containedItem;
@property (nonatomic,weak) BNRItem *container;

@property (nonatomic,copy) NSString *itemName;
@property (nonatomic,copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic,strong) NSDate *dateCreated;



@end
