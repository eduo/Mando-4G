//
//  SecondViewController.m
//  Mando4G_TabBar
//
//  Created by Xavier Romero on 15/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"
#import "Mando4GFunc.h"

@implementation SecondViewController

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (IBAction)boto_Power:(id)sender {
}

- (IBAction)boto_Menu:(id)sender {
    UInt8 buf[] = CMD_MENU;
    NSString *textSortida = (NSString*) sendCommand(buf);
}

- (IBAction)boto_Salir:(id)sender {
    UInt8 buf[] = "K|24";
    NSString *textSortida = (NSString*) sendCommand(buf);
}

- (IBAction)boto_Ok:(id)sender {
    UInt8 buf[] = "K|23";
    NSString *textSortida = (NSString*) sendCommand(buf);
}

- (IBAction)boto_Config:(id)sender {
    UInt8 buf[] = "K|3";
    NSString *textSortida = (NSString*) sendCommand(buf);
}

- (IBAction)boto_Info:(id)sender {
    UInt8 buf[] = "K|2";
    NSString *textSortida = (NSString*) sendCommand(buf);
}
@end
