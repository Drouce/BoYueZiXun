//
//  SubReaderViewController.h
//  BoYue
//
//  Created by drouce on 15/11/27.
//  Copyright © 2015年 drouce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubReaderViewModel.h"

@interface SubReaderViewController : UIViewController

-(instancetype)initWithDocId:(NSString *)docId;
@property (nonatomic, strong) NSString  *docId;


@property (nonatomic, strong) SubReaderViewModel *subReaderVM;


@end
