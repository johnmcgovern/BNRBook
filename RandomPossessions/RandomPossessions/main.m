//
//  main.m
//  RandomPossessions
//
//  Created by John McGovern on 7/28/12.
//  Copyright (c) 2012 John McGovern. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {

        // Create a mutable array object, store its address in items variable
        //NSMutableArray *items = [[NSMutableArray alloc] init];
        
        // Send the message addObject: tp the NSMutableArray pointed to
        // by the variable items, passing a string each time.
        //[items addObject:@"One"];
        //[items addObject:@"Two"];
        //[items addObject:@"Three"];
        
        // Send anotehr message, insertObject:atIndex:, to that same array object
        //[items insertObject:@"Zero" atIndex:0];
        
        // For every item in the array as determined by sending count to items
        //for (int i=0; i<[items count]; i++) {
            // We get the ith object from the array and pass it as an argument to
            // NSLog, which implicitly send the description message to that object
        //    NSLog(@"%@", [items objectAtIndex:i]);
            
        //}
        
        //BNRItem *p = [[BNRItem alloc] initWithItemName:@"Red Sofa" valueInDollars:1001 serialNumber:@"A1B2C"];
        
        //NSLog(@"%@",p);
        
        // This creates a new NSString, "Red Sofa" and gives it to the BNRItem
        //[p setItemName:@"Red Sofa"];
        
        // This creates a new NSString, "A1B2C" and gives it to the BNR Item
        //[p setSerialNumber:@"A1B2C"];
        
        // We send the value 100 to be used as the valueInDollars of this BNRItem
        //[p setValueInDollars:100];
        
        
        //NSLog(@"%@ %@ %@ %d", [p itemName], [p dateCreated], [p serialNumber], [p valueInDollars]);
        
        
        //Remember, an NSLog with %@ as the toekn will print the dsecription of the corresponding argument
        //NSLog(@"%@", p);
        
        // Make 10 random items and stick them in an NSMutableArray items
        /*for (int i = 0; i < 10; i++)
        {
            BNRItem *p = [BNRItem randomItems];
            [items addObject:p];
        }
        */
         
        // NSLog all of the items in the items array
        /*for (int i = 0; i < [items count]; i++)
        {
            NSLog(@"%i: %@",i,[items objectAtIndex:i]);
        }
         */
        
        //for (BNRItem *item in items)
        //{
        //    NSLog(@"%@",item);
        //}
        
        BNRItem *backpack = [[BNRItem alloc] init];
        [backpack setItemName:@"Backpack"];
        //[items addObject:backpack];
        
        BNRItem *calculator = [[BNRItem alloc] init];
        [calculator setItemName:@"Calculator"];
        //[items addObject:calculator];
        
        [backpack setContainedItem:calculator];
        
        // Destroy the array pointed to by items
        //NSLog(@"Setting items to nil...");
        //items = nil;
        
        backpack = nil;
        
        NSLog(@"Container: %@", [calculator container]);
        
        calculator = nil;
    }
    return 0;
}

