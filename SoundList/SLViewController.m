//
//  SLViewController.m
//  SoundList
//
//  Created by Vladislav Korotnev on 3/25/13.
//  Copyright (c) 2013 Vladislav Korotnev. All rights reserved.
//

#import "SLViewController.h"
@interface UITableViewCell (soundcell)
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag;
@end
@implementation UITableViewCell (soundcell)

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    [self setBackgroundColor:[UIColor whiteColor]];
    [self.textLabel setBackgroundColor:[UIColor whiteColor]];
    [self.textLabel setTextColor:[UIColor blackColor]];
    [self setNeedsDisplay];
    
    [player release];
}

@end

@interface SLViewController ()

@end

@implementation SLViewController
static NSArray*addFiles = nil;

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *sets = [fm contentsOfDirectoryAtPath:DOCS error:nil];
    // Return the number of rows in the section.
    return ([sets count] == 0 ? [addFiles count] : [sets count]);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    NSFileManager *fm = [NSFileManager defaultManager];
    
    NSArray *sets = [fm contentsOfDirectoryAtPath:DOCS error:nil];
    if ([sets count] == 0){
        [cell.textLabel setText:addFiles[indexPath.row]];
        [cell.textLabel setTextAlignment:NSTextAlignmentCenter];
        [cell setUserInteractionEnabled:FALSE];
        [cell.textLabel setTextColor:[UIColor grayColor]];
    }
    else{
        [cell.textLabel setText:[sets objectAtIndex:(indexPath.row)]];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSURL*p = [NSURL URLWithString:[DOCS stringByAppendingPathComponent:[[tableView cellForRowAtIndexPath:indexPath]textLabel].text]];
    AVAudioPlayer*a = [[AVAudioPlayer alloc]initWithContentsOfURL:p error:nil];
       [tableView deselectRowAtIndexPath:indexPath animated:false];
    [[tableView cellForRowAtIndexPath:indexPath]setBackgroundColor:[UIColor blueColor]];
     [[tableView cellForRowAtIndexPath:indexPath].textLabel setBackgroundColor:[UIColor blueColor]];
    [[tableView cellForRowAtIndexPath:indexPath].textLabel setTextColor:[UIColor blackColor]];
 
    [a play];
    [a setDelegate:[tableView cellForRowAtIndexPath:indexPath]];
}

- (void)viewWillAppear:(BOOL)animated {
    addFiles =  @[@"Please add files using",@"iTunes file sharing",@"From your computer"];
    [self.myTable setDataSource:self];
    [self.myTable setDelegate:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_myTable release];
    [super dealloc];
}
@end
