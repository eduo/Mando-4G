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
    UInt8 buf[] = CMD_POWER;
    NSString *textSortida = (NSString*) sendCommand(buf);
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

- (IBAction)boto_Up:(id)sender {
    UInt8 buf[] = CMD_UP;
    NSString *textSortida = (NSString*) sendCommand(buf);
}

- (IBAction)boto_Down:(id)sender {
    UInt8 buf[] = CMD_DOWN;
    NSString *textSortida = (NSString*) sendCommand(buf);
}

- (IBAction)boto_Left:(id)sender {
    UInt8 buf[] = CMD_LEFT;
    NSString *textSortida = (NSString*) sendCommand(buf);
}

- (IBAction)boto_Right:(id)sender {
    UInt8 buf[] = CMD_RIGHT;
    NSString *textSortida = (NSString*) sendCommand(buf);
}

- (IBAction)boto_Opera:(id)sender {
    UInt8 buf[] = CMD_OPERA;
    NSString *textSortida = (NSString*) sendCommand(buf);
}

- (IBAction)boto_Usb:(id)sender {
    UInt8 buf[] = CMD_USB;
    NSString *textSortida = (NSString*) sendCommand(buf);
}

- (IBAction)boto_Disc:(id)sender {
    UInt8 buf[] = CMD_HDD;
    NSString *textSortida = (NSString*) sendCommand(buf);
}

- (IBAction)boto_Red:(id)sender {
    UInt8 buf[] = CMD_RED;
    NSString *textSortida = (NSString*) sendCommand(buf);
}

- (IBAction)boto_Widgets:(id)sender {
    UInt8 buf[] = CMD_OKI_WIDGETSTV;
    NSString *textSortida = (NSString*) sendCommand(buf);
}

- (IBAction)boto_CatchTv:(id)sender {
    UInt8 buf[] = CMD_OKI_CATCHTV;
    NSString *textSortida = (NSString*) sendCommand(buf);
}

- (IBAction)boto_Grab:(id)sender {
    UInt8 buf[] = CMD_GRAB;
    NSString *textSortida = (NSString*) sendCommand(buf);
}

- (IBAction)boto_Epg:(id)sender {
    UInt8 buf[] = CMD_EPG;
    NSString *textSortida = (NSString*) sendCommand(buf);
}

- (IBAction)boto_Fav:(id)sender {
    UInt8 buf[] = CMD_OKI_FAVORITE;
    NSString *textSortida = (NSString*) sendCommand(buf);
}

- (IBAction)boto_Mute:(id)sender {
    UInt8 buf[] = CMD_MUTE;
    NSString *textSortida = (NSString*) sendCommand(buf);
}

- (IBAction)boto_Zero:(id)sender {
    UInt8 buf[] = CMD_ZERO;
    NSString *textSortida = (NSString*) sendCommand(buf);
}

- (IBAction)boto_One:(id)sender {
    UInt8 buf[] = CMD_ONE;
    NSString *textSortida = (NSString*) sendCommand(buf);
}

- (IBAction)boto_Two:(id)sender {
    UInt8 buf[] = CMD_TWO;
    NSString *textSortida = (NSString*) sendCommand(buf);
}

- (IBAction)boto_Three:(id)sender {
    UInt8 buf[] = CMD_THREE;
    NSString *textSortida = (NSString*) sendCommand(buf);
}

- (IBAction)boto_Four:(id)sender {
    UInt8 buf[] = CMD_FOUR;
    NSString *textSortida = (NSString*) sendCommand(buf);
}

- (IBAction)boto_Five:(id)sender {
    UInt8 buf[] = CMD_FIVE;
    NSString *textSortida = (NSString*) sendCommand(buf);
}

- (IBAction)boto_Six:(id)sender {
    UInt8 buf[] = CMD_SIX;
    NSString *textSortida = (NSString*) sendCommand(buf);
}

- (IBAction)boto_Seven:(id)sender {
    UInt8 buf[] = CMD_SEVEN;
    NSString *textSortida = (NSString*) sendCommand(buf);
}

- (IBAction)boto_Eight:(id)sender {
    UInt8 buf[] = CMD_EIGHT;
    NSString *textSortida = (NSString*) sendCommand(buf);
}

- (IBAction)boto_Nine:(id)sender {
    UInt8 buf[] = CMD_NINE;
    NSString *textSortida = (NSString*) sendCommand(buf);
}
@end
