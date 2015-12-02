//
//  ReaderViewModel.h
//  BoYue
//
//  Created by drouce on 15/11/26.
//  Copyright © 2015年 drouce. All rights reserved.
//

#import "BaseViewModel.h"

@interface ReaderViewModel : BaseViewModel

@property (nonatomic) NSInteger rowNumber;
- (NSURL *)iconForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
-(NSString *)docIdForRow:(NSInteger)row;
@end
