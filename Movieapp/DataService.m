//
//  DataService.m
//  Movieapp
//
//  Created by ilabadmin on 7/25/16.
//  Copyright (c) 2016 strathmore. All rights reserved.
//

#import "DataService.h"
#import "Film.h"

@implementation DataService
@synthesize delegate=_delegate;

-(NSMutableArray *) selectFromJson:(NSString *)searchParam{
    NSMutableArray *masterList = [[NSMutableArray alloc] init];
    NSString *s_json = [self getJsonDataString:searchParam];
    NSError __autoreleasing **error = nil;
    
    if ([self getSimpleJSON:s_json]) {
        NSDictionary *s_dict = [NSJSONSerialization JSONObjectWithData:[self getSimpleJSON:s_json] options:kNilOptions error:error];
        
        NSArray *searchResult = [s_dict objectForKeyedSubscript:@"Search"];
        
        if ([searchResult count] > 0) {
            for (NSDictionary *movie in searchResult) {
                
                    Film * i_film = [[Film alloc] initWithAttributes:movie];
                    
                    [masterList addObject:i_film];
                    
                }
            
            }
        }
        
    
    
    return masterList;
}

-(NSString *)getJsonDataString:(NSString *)urlParam{
    NSString *jsonString = @"";
    
    //    http://www.omdbapi.com/?
    NSString *url = [DataService baseAPIUrl];
    
    
    //    s=star%20wars
    
    url = [url stringByAppendingString:urlParam];
    
    //   url =  http://www.omdbapi.com/?s=star wars
    NSURL *jsonUrl = [NSURL URLWithString:[DataService encodeURIComponent:url]];
    
    //    jsonUrl = http://www.omdbapi.com/?s=star%20wars
    
    delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    if (connection == nil) {
        connection = [AppDelegate initiateURLConnection:jsonUrl];
    }
    
    NSError *error = nil;
    jsonString= [NSString stringWithContentsOfURL:jsonUrl encoding:NSUTF8StringEncoding error:&error];
    
    
    return jsonString;
    
}


- (NSData*) getSimpleJSON: (NSString *) jsonString{
    
    return  [jsonString dataUsingEncoding:NSUTF8StringEncoding];
}

+(NSString *)baseAPIUrl{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    
    return [infoDictionary objectForKey:kBaseAPIUrl];
    
}

+ (NSString *)encodeURIComponent:(NSString *)string
{
    NSString *s = [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return s;
}

+ (NSString *)decodeURIComponent:(NSString *)string
{
    NSString *s = [string stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return s;
}

@end
