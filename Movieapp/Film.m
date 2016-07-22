//
//  Film.m
//  Movieapp
//
//  Created by ilabadmin on 7/22/16.
//  Copyright (c) 2016 strathmore. All rights reserved.
//

#import "Film.h"

@implementation Film
@synthesize title=_title ,year=_year,imdbID=_imdbID,type=_type;
-(NSMutableArray *)films{
    
    if(!_films){
    
        _films= [[NSMutableArray alloc] init];
    }
    return _films;
}
-(instancetype) initWithAttributes:(NSDictionary *)attributes{


    self = [super init];
    if(self){
    
        self.title= [attributes objectForKey:kTitle];
        self.title= [attributes objectForKey:kType];
        self.title= [attributes objectForKey:kPoster];
        self.title= [attributes objectForKey:kYear];
        self.title= [attributes objectForKey:kImdbID];
    
    }
    return self;
}


@end
