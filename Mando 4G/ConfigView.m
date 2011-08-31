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
	NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];  
	
	if([settings objectForKey:@"ipEquip"] != nil) {  
		self.ipEquip.text = [settings objectForKey:@"ipEquip"];  
		ipEquipSelect = self.ipEquip.text;

	}  
	

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
	
	// recover IP Address from User Settings
	NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];  

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
		
		
		NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];  
		
		// Save the index.  
		[settings setObject:ipEquipSelect forKey:@"ipEquip"];  
	
		// Write them to disk - this is optional here,  
		// but should be done when the app exits.  
		[settings synchronize];  
		
		
    }
    self.etiquetaIP.text = etiqueta;
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    NSString *etiqueta = nil;
    
    if (theTextField == self.ipEquip) {
        [theTextField resignFirstResponder];
        if ([self.ipEquip.text length] == 0 ) {
            etiqueta = [[NSString alloc] initWithFormat:@"Configurar IP MediaCenter"];
        } else {
            // NSLog(@"IP Config camp Text: %@", self.ipEquip.text);
            ipEquipSelect = self.ipEquip.text;
            // NSLog(@"IP Config ipEquipSelect: %@", ipEquipSelect);
            etiqueta = [[NSString alloc] initWithFormat:@"IP MC4G: %@",ipEquipSelect];
        }
    }
    self.etiquetaIP.text = etiqueta;
    
    return YES;
}

- (void)dealloc {
    [ipEquip release];
    [etiquetaIP release];
    [super dealloc];
}
@end
