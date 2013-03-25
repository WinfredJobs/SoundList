//
//  SLViewController.h
//  SoundList
//
//  Created by Vladislav Korotnev on 3/25/13.
//  Copyright (c) 2013 Vladislav Korotnev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#define DOCS [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
@interface SLViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,AVAudioPlayerDelegate>
@property (retain, nonatomic) IBOutlet UITableView *myTable;

@end
