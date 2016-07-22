//
//  SearchViewController.h
//  Movieapp
//
//  Created by ilabadmin on 7/21/16.
//  Copyright (c) 2016 strathmore. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController

@property(weak,nonatomic)IBOutlet UISearchBar *Seachbar;

@property(weak,nonatomic)IBOutlet UITableView *myTableview;

@property(strong,nonatomic) NSMutableArray *masterfilmlist;

@end
