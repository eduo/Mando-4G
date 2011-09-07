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
    NSString *retornat;
    useconds_t tempsSleep = 20000;
    
    if ([self.textMissatge isFirstResponder]) {
        [self.textMissatge resignFirstResponder];
    }

    NSLog(@"Text: %@, Long.: %d",textMissatge.text, textMissatge.text.length);
    for (int i=0; i < textMissatge.text.length; i++) {
        lletraQwerty = [textMissatge.text substringWithRange:NSMakeRange(i, 1)];
                
        unichar valorAsc = [lletraQwerty characterAtIndex: 0];
        // NSLog(@"I: %d, Lletra: %@, Codi ASCII: %d",i, lletraQwerty, valorAsc);
        
        if (valorAsc >= 65 && valorAsc <= 90)  {
            // NSLog(@"Està entre A i Z");	

            if (!flagCap) {
                NSLog(@"Envio CAPS");
                retornat = sendCommand((const UInt8 *)[codigosQwerty objectForKey:@"CAP"]);
                // if (retornat != [codigosQwerty objectForKey:@"CAP"]) { alertaMissatge(@"ERROR", @"Envio incorrecto de CAP"); };
                flagCap = YES;
                // [NSThread sleepForTimeInterval:(NSTimeInterval) tempsSleep];
                usleep(tempsSleep);
            }
        } else {
            if (valorAsc >= 97 && valorAsc <= 122) {
                // NSLog(@"Està entre a i z");
                lletraQwerty = [lletraQwerty uppercaseString];

                if (flagCap) {
                    NSLog(@"Envio CAPS");
                    retornat = sendCommand((const UInt8 *)[codigosQwerty objectForKey:@"CAP"]);
                    // if (retornat != [codigosQwerty objectForKey:@"CAP"]) { alertaMissatge(@"ERROR", @"Envio incorrecto de CAP"); };
                    flagCap = NO;
                    // [NSThread sleepForTimeInterval:(NSTimeInterval) tempsSleep];
                    usleep(tempsSleep);
                }
            } 
        }
 
        texte = [codigosQwerty objectForKey:lletraQwerty];

        if (texte != NULL) {
            NSLog(@"Envio la lletra: %@, Codi: %@", lletraQwerty, texte);
            retornat = sendCommand((const UInt8 *)[texte UTF8String]);
            NSLog(@"Codi Tornat: %@", retornat);
            // if (retornat != [codigosQwerty objectForKey:lletraQwerty]) { alertaMissatge(@"ERROR", [NSString stringWithFormat:@"Envio incorrecto de: %@", texte]); };
            // [NSThread sleepForTimeInterval:(NSTimeInterval) tempsSleep];
            usleep(tempsSleep);
        } else {
            NSLog(@"Caracter no admès: %@", lletraQwerty);
            alertaMissatge(@"AVISO", [NSString stringWithFormat:@"Caracter no válido: %@", lletraQwerty]);
        }
    }
    
    if (flagCap) {
        NSLog(@"Envio CAPS");
        retornat = sendCommand((const UInt8 *)[codigosQwerty objectForKey:@"CAP"]);
        if (retornat != [codigosQwerty objectForKey:@"CAP"]) { alertaMissatge(@"ERROR", @"Envio incorrecto de CAP"); };
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

- (IBAction)boto_Opera:(id)sender {
    UInt8 buf[] = CMD_OPERA;
    sendCommand(buf);
}

- (IBAction)boto_Menu:(id)sender {
    UInt8 buf[] = CMD_MENU;
    sendCommand(buf);
}

- (IBAction)boto_Up:(id)sender {
    UInt8 buf[] = CMD_UP;
    sendCommand(buf);
}

- (IBAction)boto_Salir:(id)sender {
    UInt8 buf[] = CMD_SALIR;
    sendCommand(buf);
}

- (IBAction)boto_Left:(id)sender {
    UInt8 buf[] = CMD_LEFT;
    sendCommand(buf);
}

- (IBAction)boto_Ok:(id)sender {
    UInt8 buf[] = CMD_OK;
    sendCommand(buf);
}

- (IBAction)boto_Right:(id)sender {
    UInt8 buf[] = CMD_RIGHT;
    sendCommand(buf);
}

- (IBAction)boto_Config:(id)sender {
    UInt8 buf[] = CMD_CONFIG;
    sendCommand(buf);
}

- (IBAction)boto_Down:(id)sender {
    UInt8 buf[] = CMD_DOWN;
    sendCommand(buf);
}

- (IBAction)boto_Info:(id)sender {
    UInt8 buf[] = CMD_INFO;
    sendCommand(buf);
}

@end
