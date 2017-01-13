//
//  MobToolsCRTLoggedInViewController.m
//  MobTools
//
//  Created by Aleksandr Movsesyan on 8/10/13.
//  Copyright (c) 2013 LinkedIn. All rights reserved.
//

#import "MobToolsCRTLoggedInViewController.h"

@interface MobToolsCRTLoggedInViewController ()
@property (weak, nonatomic) IBOutlet UITableView *warTableView;

@end

@implementation MobToolsCRTLoggedInViewController
@synthesize wars;
@synthesize myWars;
@synthesize numElements;

- (void)viewDidLoad {
    self.warTableView.delegate = self;
    self.warTableView.dataSource = self;
    self.warTableView.tableFooterView = [[UIView alloc] init];
    
    NSString *url = @"https://tools.corp.linkedin.com/apps/tools/lodestone/api/v1/util/deployable";
    NSData *jsonData = [[NSString stringWithContentsOfURL:[NSURL URLWithString:url] encoding:NSUTF8StringEncoding error: nil] dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *results = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:&error];
    if (! error) {
        self.wars = results;
        self.numElements = (NSInteger)[wars count];
    }else{
        self.numElements = 0;
    }
    
    NSString *url2 = [NSString stringWithFormat: @"%@%@%@", @"https://tools.corp.linkedin.com/apps/tools/lodestone/api/v1/util/owner/", self.username, @"/wars"];
    NSData *jsonData2 = [[NSString stringWithContentsOfURL:[NSURL URLWithString:url2] encoding:NSUTF8StringEncoding error: nil] dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error2 = nil;
    NSArray *results2 = [NSJSONSerialization JSONObjectWithData:jsonData2 options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:&error2];
    if (! error2) {
        self.myWars = results2;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return numElements;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.wars) {
        static NSString *cellIdentifier = @"IssueCell";
        
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        NSString *description;
        
        if (self.myWars && [indexPath row] < self.myWars.count) {
            description = self.myWars[[indexPath row]];
            
        } else {
            NSInteger index = [indexPath row] - self.myWars.count;
            NSArray *keys = [wars allKeys];
            for (;;index++) {
                if (![self.myWars containsObject:keys[index]]) {
                    break;
                }
            }
            description = keys[index];
        }
        
        [cell.textLabel setText:description];
        [cell.detailTextLabel setText:[NSString stringWithFormat:@"%@", [self.wars objectForKey:description]]];
        cell.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;        
        return cell;
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    MobToolsJiraIssueViewController *issuesViewController = [[MobToolsJiraIssueViewController alloc] init];
//    
//    NSError *error = nil;
//    NSString *url = [[[self.searchResults valueForKey:@"issues"] objectAtIndex:[indexPath row]] valueForKey:@"self"];
//    
//    NSData *jsonData = [[NSString stringWithContentsOfURL:[NSURL URLWithString:url] encoding:NSUTF8StringEncoding error: nil] dataUsingEncoding:NSUTF8StringEncoding];
//    NSDictionary *results = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:&error];
//    if (! error) {
//        issuesViewController.jiraIssue = results;
//        [self.navigationController pushViewController:issuesViewController animated:YES];
//    }
}

@end
