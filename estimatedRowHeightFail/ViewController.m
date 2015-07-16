//
//  ViewController.m
//  estimatedRowHeightFail
//
//  Created by Padraig O Cinneide on 2015-05-05.
//  Copyright (c) 2015 Supertop. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign) NSInteger numberOfRows;

@end

@implementation ViewController

- (IBAction)jumpToEnd:(id)sender {
    NSIndexPath *lastRow = [NSIndexPath indexPathForRow: self.numberOfRows-1 inSection:0];
    
    [self.tableView scrollToRowAtIndexPath:lastRow
                          atScrollPosition:UITableViewScrollPositionBottom
                                  animated:YES];
}

- (IBAction)jumpToTop:(id)sender {
    NSIndexPath *firstRow = [NSIndexPath indexPathForRow:0 inSection:0];
    
    [self.tableView scrollToRowAtIndexPath:firstRow
                          atScrollPosition:UITableViewScrollPositionTop
                                  animated:NO];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.numberOfRows = 1000;
    
    self.tableView.estimatedRowHeight = 200;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"plainCell"];
    
    cell.contentView.backgroundColor = [self randomColor];
    
    return cell;
}

#pragma Helpers


- (UIColor *)randomColor {
    CGFloat hue = ( arc4random_uniform(255) / 255.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random_uniform(255) / 255.0 );  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random_uniform(255) / 255.0 );  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];

    return color;
}

@end
