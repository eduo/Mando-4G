//
//  BuscarView.m
//  
//
//  Created by Xavier Romero on 20/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BuscarView.h"
#import "Mando4GFunc.h"

@implementation BuscarView
@synthesize etiquetaIP;
@synthesize textMissatge;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

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
    [self setTextMissatge:nil];
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

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.textMissatge) {
        [theTextField resignFirstResponder];
    }
    return YES;
}

- (void)dealloc {
    [textMissatge release];
    [etiquetaIP release];
    [super dealloc];
}
- (IBAction)boto_Del:(id)sender {
    if ([self.textMissatge isFirstResponder]) {
        [self.textMissatge resignFirstResponder];
    }
    UInt8 buf[] = CMD_QWERTY_BACKSPACE;
    sendCommand(buf);
}

- (IBAction)boto_buscar:(id)sender {
    if ([self.textMissatge isFirstResponder]) {
        [self.textMissatge resignFirstResponder];
    }
    NSString *texte = [NSString stringWithFormat:@"S|%@",textMissatge.text];
    sendCommand((const UInt8 *)[texte UTF8String]);
}

- (IBAction)boto_www:(id)sender {
    if ([self.textMissatge isFirstResponder]) {
        [self.textMissatge resignFirstResponder];
    }
    NSString *texte = [NSString stringWithFormat:@"B|%@",textMissatge.text];
    sendCommand((const UInt8 *)[texte UTF8String]);
}

- (IBAction)boto_qwerty:(id)sender {
    BOOL flagCap = NO;
    NSString *lletraQwerty;
    NSString *texte;
    
    if ([self.textMissatge isFirstResponder]) {
        [self.textMissatge resignFirstResponder];
    }

    NSLog(@"Text: %@, Long.: %d",textMissatge.text, textMissatge.text.length);
    for (int i=0; i < textMissatge.text.length; i++) {
        lletraQwerty = [textMissatge.text substringWithRange:NSMakeRange(i, 1)];
                
        unichar valorAsc = [lletraQwerty characterAtIndex: 0];
        NSLog(@"I: %d, Lletra: %@, Codi ASCII: %d",i, lletraQwerty, valorAsc);
        
        if (valorAsc >= 65 && valorAsc <= 90)  {
            NSLog(@"Està entre A i Z");	

            if (!flagCap) {
                NSLog(@"Envio CAPS");
                // sendCommand((const UInt8 *)[codigosQwerty objectForKey:@"CAP"]);
                flagCap = YES;
            }
        } else {
            if (valorAsc >= 97 && valorAsc <= 122) {
                NSLog(@"Està entre a i z");
                lletraQwerty = [lletraQwerty uppercaseString];

                if (flagCap) {
                    NSLog(@"Envio CAPS");
                    // sendCommand((const UInt8 *)[codigosQwerty objectForKey:@"CAP"]);
                    flagCap = NO;
                }
            } 
        }
 
        texte = [codigosQwerty objectForKey:lletraQwerty];

        if (texte != NULL) {
            NSLog(@"Envio la lletra: %@, Codi: %@", lletraQwerty, texte);
            // sendCommand((const UInt8 *)[texte UTF8String]);
        } else {
            NSLog(@"Caracter no admès: %@", lletraQwerty);
            alertaMissatge(@"AVISO", [NSString stringWithFormat:@"Caracter no válido: %@", lletraQwerty]);
        }
    }
    
    if (flagCap) {
        NSLog(@"Envio CAPS");
        // sendCommand((const UInt8 *)[codigosQwerty objectForKey:@"CAP"]);
        flagCap = NO;
    }
}

- (IBAction)boto_msg:(id)sender {
    if ([self.textMissatge isFirstResponder]) {
        [self.textMissatge resignFirstResponder];
    }
    NSString *texte = [NSString stringWithFormat:@"M|%@",textMissatge.text];
    sendCommand((const UInt8 *)[texte UTF8String]);
}

@end
