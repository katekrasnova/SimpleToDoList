//
//  PickerViewHelper.h
//  SecureDataStorageApp
//
//  Created by Екатерина Краснова on 21.01.16.
//  Copyright © 2016 Kate Krasnova. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickerViewHelper : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

-(void)setArray:(NSArray *)incoming;

-(void)addItemToArray:(NSObject *)thing;

-(NSObject *)getItemFromArray:(NSUInteger)index;

@end
