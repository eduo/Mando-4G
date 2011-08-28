//
//  ConfigView.m
//  Mando4G_TabBar
//
//  Created by Xavier Romero on 15/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ConfigView.h"
#import "Mando4GFunc.h"

@implementation ConfigView
@synthesize ipEquip;
@synthesize etiquetaIP;

/*
 
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
 
*/

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setIpEquip:nil];
    [self setEtiquetaIP:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)boto_Ok_IP:(id)sender {
    NSString *etiqueta = nil;
    if ([self.ipEquip.text length] == 0 ) {
        etiqueta = [[NSString alloc] initWithFormat:@"Configurar IP MediaCenter"];
    } else {
        // NSLog(@"IP Config camp Text: %@", self.ipEquip.text);
        if ([self.ipEquip isFirstResponder]) {
            [self.ipEquip resignFirstResponder];
        }
        ipEquipSelect = self.ipEquip.text;
        // NSLog(@"IP Config ipEquipSelect: %@", ipEquipSelect);
        etiqueta = [[NSString alloc] initWithFormat:@"IP MC4G: %@",ipEquipSelect];
    }
    self.etiquetaIP.text = etiqueta;
        
    [etiqueta release];
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.ipEquip) {
        [theTextField resignFirstResponder];
    }
    return YES;
}

- (void)dealloc {
    [ipEquip release];
    [etiquetaIP release];
    [super dealloc];
}
@end
