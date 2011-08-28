//
//  FirstViewController.m
//  Mando4G_TabBar
//
//  Created by Xavier Romero on 15/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"
#import "Mando4GFunc.h"

@implementation FirstViewController
@synthesize etiquetaIP;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    NSString *etiqueta = nil;
    // NSLog(@"IP Config ipEquipSelect: %@", ipEquipSelect);
    if ([ipEquipSelect length] == 0 ) {
        etiqueta = [[NSString alloc] initWithFormat:@"Configurar IP MediaCenter!!!"];
    } else {
        etiqueta = [[NSString alloc] initWithFormat:@"IP MC4G: %@",ipEquipSelect];
    }
    self.etiquetaIP.text = etiqueta;
    [etiqueta release];

    [super viewDidLoad];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    NSString *etiqueta = nil;
    // NSLog(@"IP Config ipEquipSelect: %@", ipEquipSelect);
    if ([ipEquipSelect length] == 0 ) {
        etiqueta = [[NSString alloc] initWithFormat:@"Configurar IP MediaCenter!!!"];
    } else {
        etiqueta = [[NSString alloc] initWithFormat:@"IP MC4G: %@",ipEquipSelect];
    }
    self.etiquetaIP.text = etiqueta;
    [etiqueta release];
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload
{
    [self setEtiquetaIP:nil];
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (IBAction)boto_Menu:(id)sender {
    UInt8 buf[] = CMD_MENU;
    sendCommand(buf);
}

- (IBAction)boto_Salir:(id)sender {
    UInt8 buf[] = CMD_SALIR;
    sendCommand(buf);
}

- (IBAction)boto_Config:(id)sender {
    UInt8 buf[] = CMD_CONFIG;
    sendCommand(buf);
}

- (IBAction)boto_Info:(id)sender {
    UInt8 buf[] = CMD_INFO;
    sendCommand(buf);
}

- (IBAction)boto_Power:(id)sender {
    UInt8 buf[] = CMD_POWER;
    sendCommand(buf);
}

- (IBAction)boto_Ok:(id)sender {
    UInt8 buf[] = CMD_OK;
    sendCommand(buf);
}

- (IBAction)boto_Up:(id)sender {
    UInt8 buf[] = CMD_UP;
    sendCommand(buf);
}

- (IBAction)boto_Down:(id)sender {
    UInt8 buf[] = CMD_DOWN;
    sendCommand(buf);
}

- (IBAction)boto_Left:(id)sender {
    UInt8 buf[] = CMD_LEFT;
    sendCommand(buf);
}

- (IBAction)boto_Right:(id)sender {
    UInt8 buf[] = CMD_RIGHT;
    sendCommand(buf);
}

- (IBAction)boto_Sg:(id)sender {
    UInt8 buf[] = CMD_EPG;
    sendCommand(buf);
}

- (IBAction)boto_Usb:(id)sender {
    UInt8 buf[] = CMD_USB;
    sendCommand(buf);
}

- (IBAction)boto_Disc:(id)sender {
    UInt8 buf[] = CMD_HDD;
    sendCommand(buf);
}

- (IBAction)boto_Red:(id)sender {
    UInt8 buf[] = CMD_RED;
    sendCommand(buf);
}

- (IBAction)boto_Vermell:(id)sender {
    UInt8 buf[] = CMD_OPTION_RED;
    sendCommand(buf);
}

- (IBAction)boto_Verd:(id)sender {
    UInt8 buf[] = CMD_OPTION_GREEN;
    sendCommand(buf);
}

- (IBAction)boto_Groc:(id)sender {
    UInt8 buf[] = CMD_OPTION_YELLOW;
    sendCommand(buf);
}

- (IBAction)boto_Blau:(id)sender {
    UInt8 buf[] = CMD_OPTION_BLUE;
    sendCommand(buf);
}

- (IBAction)boto_Rewind:(id)sender {
    UInt8 buf[] = CMD_FRWD;
    sendCommand(buf);
}

- (IBAction)boto_Pausa:(id)sender {
    UInt8 buf[] = CMD_PLAY_PAUSE;
    sendCommand(buf);
}

- (IBAction)boto_Stop:(id)sender {
    UInt8 buf[] = CMD_STOP;
    sendCommand(buf);
}

- (IBAction)boto_Forward:(id)sender {
    UInt8 buf[] = CMD_FFWD;
    sendCommand(buf);
}

- (IBAction)boto_Opera:(id)sender {
    UInt8 buf[] = CMD_OPERA;
    sendCommand(buf);
}

- (IBAction)boto_Skip_rw:(id)sender {
    UInt8 buf[] = CMD_PREV_FILE;
    sendCommand(buf);
}

- (IBAction)boto_Skip_fw:(id)sender {
    UInt8 buf[] = CMD_NEXT_FILE;
    sendCommand(buf);
}

- (IBAction)boto_Grab:(id)sender {
    UInt8 buf[] = CMD_GRAB;
    sendCommand(buf);
}

- (IBAction)boto_IrA:(id)sender {
    UInt8 buf[] = CMD_IR_A;
    sendCommand(buf);
}

- (IBAction)boto_Widgets:(id)sender {
    UInt8 buf[] = CMD_OKI_WIDGETSTV;
    sendCommand(buf);
}

- (IBAction)boto_CatchTv:(id)sender {
    UInt8 buf[] = CMD_OKI_CATCHTV;
    sendCommand(buf);
}

- (IBAction)boto_Mute:(id)sender {
    UInt8 buf[] = CMD_MUTE;
    sendCommand(buf);
}

- (void)dealloc {
    [etiquetaIP release];
    [super dealloc];
}
@end
