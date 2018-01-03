//
//  iToolbarViewController.m
//  iToolbar
//
//  Created by ericpinet on 12/29/2017.
//  Copyright (c) 2017 ericpinet. All rights reserved.
//

#import "iToolbarViewController.h"

#import "iToolbar.h"


@interface iToolbarViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *showButton;
@property (nonatomic, strong) iToolbar *toolbar;

@end

@implementation iToolbarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    // Toolbar setup
    _toolbar = [[iToolbar alloc] init];
    [_toolbar setParentNavbar:(iNavigationBar*)self.navigationController.navigationBar];
    [_toolbar setScollView:self.tableView];

    UIBarButtonItem *button1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                                                             target:self
                                                                             action:@selector(click:)];
    
    UIBarButtonItem *space1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                            target:self
                                                                            action:0];
    
    UIBarButtonItem *button2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                                                             target:self
                                                                             action:@selector(click:)];
    
    UIBarButtonItem *space2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                            target:self
                                                                            action:0];
    
    UIBarButtonItem *button3 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera
                                                                             target:self
                                                                             action:@selector(click:)];
    
    _toolbar.items = @[button1, space1, button2, space2, button3];
    
    /*
     // Adding a custome view insted of tool bar items.
     // Adding the custome view in iToolbar with setContentView.
     
     UIView *contentView = [[UIView alloc] init];
     [contentView setBackgroundColor:UIColor.brownColor];
     [_toolbar setContentView:contentView];
     */

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showButton:(UIBarButtonItem *)sender {
    
    // toggle the title of show button at Show/Hide
    if ([[_showButton title] isEqualToString: @"Show"]) {
        [_showButton setTitle:@"Hide"];
        // Show toolbar
        [_toolbar show:true];
    }
    else {
        [_showButton setTitle:@"Show"];
        // hide toolbar
        [_toolbar hide:true];
    }
}

- (void) click:(id)sender {
    NSLog(@"Click");
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // The number of sections is the same as the number of titles in the collation.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"MyCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 98.0;
}

@end
