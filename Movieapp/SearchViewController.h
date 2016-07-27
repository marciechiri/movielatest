//
//  SearchViewController.h
//  Movieapp
//
//  Created by ilabadmin on 7/21/16.
//  Copyright (c) 2016 strathmore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataService.h"

@interface SearchViewController : UIViewController
{
    NSString *noResultText;
    
}


@property(weak,nonatomic)IBOutlet UISearchBar *searchBar;

@property(weak,nonatomic)IBOutlet UITableView *myTableview;

@property(strong,nonatomic) NSMutableArray *masterFilmList;

@end
