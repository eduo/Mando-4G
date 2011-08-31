//
//  Mando4GFunc.m
//  Mando4G
//
//  Created by Xavier Romero on 14/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Mando4GFunc.h"

NSString* sendCommand(const UInt8 *commandEnviar)
{
    NSString *enviat = nil;
    NSString *retornat = nil;
    CFWriteStreamRef writeStream = NULL;
    CFReadStreamRef readStream = NULL;
    
    UInt8 bufread[128];

    	// NSLog(@"IP Config: %@", ipEquipSelect);
    // CFStringRef host = CFSTR("192.168.1.12");
    
    if (ipEquipSelect == NULL) {
        alertaMissatge(@"ERROR",@"IP del MC4G no configurada");
        enviat = [NSString stringWithFormat:@"Error"];
    } else {
        CFStringRef host = (CFStringRef) ipEquipSelect;
        UInt32 port = 9010;
    
        CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault, host, port, &readStream, &writeStream);
    
        CFWriteStreamSetProperty(writeStream, kCFStreamPropertyShouldCloseNativeSocket, kCFBooleanTrue);
        CFReadStreamSetProperty(readStream, kCFStreamPropertyShouldCloseNativeSocket, kCFBooleanTrue);
    
        if(!CFWriteStreamOpen(writeStream)) {
            alertaMissatge(@"ERROR",@"Error accediendo a MC4G");
            NSLog(@"Error Obrint Stream d'Escriptura");
            enviat = [NSString stringWithFormat:@"Error"];
        }
        else {
            /* UInt8 buf[] = "K|2";  */
            int bytesWritten = CFWriteStreamWrite(writeStream, commandEnviar, strlen((char*)commandEnviar));
            // NSLog(@"Written: %d", bytesWritten);
            enviat = [NSString stringWithUTF8String:(const char *)commandEnviar];
            
            if (bytesWritten < 0) {
                // CFStreamError error = CFWriteStreamGetError(writeStream);
                /** How do I print out description? All i get is -1 here. i.e What is perror() equivalent? **/
                NSLog(@"Error al escriure per Sockets");
                alertaMissatge(@"ERROR",@"Error accediendo a MC4G");
                enviat = [NSString stringWithFormat:@"Error"];
            } else {
                
                if(!CFReadStreamOpen(readStream)) {
                    NSLog(@"Error Obrint Stream de Lectura");
                    alertaMissatge(@"ERROR",@"Error accediendo a MC4G");
                    enviat = [NSString stringWithFormat:@"Error"];
                }
                else {
                    int bytesReaded = CFReadStreamRead(readStream, bufread, sizeof(bufread));
                    // NSLog(@"Llegit: %d", bytesReaded);
                    /* self.label.text = [NSString stringWithFormat:@"%@ - Llegit: %@ - Llegits: %d Bytes", self.label.text, [(NSString*)bufread substringToIndex:strlen((char*)bufread)], bytesReaded];
                     */
                    
                    /* NSLog(@"Retornat: %@", [(NSString*)bufread substringToIndex:strlen((char*)bufread)]);
                       enviat = [(NSString*)bufread substringToIndex:strlen((char*)bufread)];
                    */
                    
                    if (bytesReaded < 0) {
                        // CFStreamError error = CFReadStreamGetError(readStream);
                        /** How do I print out description? All i get is -1 here. i.e What is perror() equivalent? **/
                        NSLog(@"Error al llegir de Sockets");
                        alertaMissatge(@"ERROR",@"Error accediendo a MC4G");
                        enviat = [NSString stringWithFormat:@"Error"];
                    } else {
                        retornat = [NSString stringWithUTF8String:(const char *) bufread];
                        NSLog(@"Retornat: %@", retornat);
                    }
                }
            }
            
        }
        
        CFWriteStreamClose(writeStream);
        CFReadStreamClose(readStream);
    }
    return retornat;
}

void alertaMissatge (NSString* title, NSString* missatge) {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:missatge
                                                   delegate:nil
                                          cancelButtonTitle:@"OK" 
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

void asignaCodigosQwerty(void) {
    codigosQwerty = [[NSMutableDictionary alloc] init];
    
    [codigosQwerty setObject:@"Q|1"  forKey:@"Q"];
    [codigosQwerty setObject:@"Q|2"  forKey:@"W"];
    [codigosQwerty setObject:@"Q|3"  forKey:@"E"];
    [codigosQwerty setObject:@"Q|4"  forKey:@"R"];
    [codigosQwerty setObject:@"Q|5"  forKey:@"T"];
    [codigosQwerty setObject:@"Q|6"  forKey:@"Y"];
    [codigosQwerty setObject:@"Q|7"  forKey:@"U"];
    [codigosQwerty setObject:@"Q|8"  forKey:@"I"];
    [codigosQwerty setObject:@"Q|9"  forKey:@"O"];
    [codigosQwerty setObject:@"Q|10" forKey:@"P"];
    [codigosQwerty setObject:@"Q|11" forKey:@"A"];
    [codigosQwerty setObject:@"Q|12" forKey:@"S"];
    [codigosQwerty setObject:@"Q|13" forKey:@"D"];
    [codigosQwerty setObject:@"Q|14" forKey:@"F"];
    [codigosQwerty setObject:@"Q|15" forKey:@"G"];
    [codigosQwerty setObject:@"Q|16" forKey:@"UP"];
    [codigosQwerty setObject:@"Q|17" forKey:@"LEFT"];
    [codigosQwerty setObject:@"Q|18" forKey:@"H"];
    [codigosQwerty setObject:@"Q|19" forKey:@"J"];
    [codigosQwerty setObject:@"Q|20" forKey:@"K"];
    [codigosQwerty setObject:@"Q|21" forKey:@"L"];
    [codigosQwerty setObject:@"Q|22" forKey:@"BACKSPACE"];
    [codigosQwerty setObject:@"Q|23" forKey:@"ALT"];
    [codigosQwerty setObject:@"Q|24" forKey:@"Z"];
    [codigosQwerty setObject:@"Q|25" forKey:@"X"];
    [codigosQwerty setObject:@"Q|26" forKey:@"C"];
    [codigosQwerty setObject:@"Q|27" forKey:@"V"];
    [codigosQwerty setObject:@"Q|28" forKey:@"DOWN"];
    [codigosQwerty setObject:@"Q|29" forKey:@"RIGHT"];
    [codigosQwerty setObject:@"Q|30" forKey:@"B"];
    [codigosQwerty setObject:@"Q|31" forKey:@"N"];
    [codigosQwerty setObject:@"Q|32" forKey:@"M"];
    [codigosQwerty setObject:@"Q|33" forKey:@"Ñ"];
    [codigosQwerty setObject:@"Q|34" forKey:@"OK"];
    [codigosQwerty setObject:@"Q|35" forKey:@"CAP"];
    [codigosQwerty setObject:@"Q|36" forKey:@"0"];
    [codigosQwerty setObject:@"Q|37" forKey:@"SPCL"];
    [codigosQwerty setObject:@"Q|38" forKey:@"SPCR"];
    [codigosQwerty setObject:@"Q|37" forKey:@" "];
    [codigosQwerty setObject:@"Q|39" forKey:@"SEARCH"];
    [codigosQwerty setObject:@"Q|40" forKey:@"CAP_R"];
    [codigosQwerty setObject:@"Q|41" forKey:@"#"];
    [codigosQwerty setObject:@"Q|42" forKey:@"1"];
    [codigosQwerty setObject:@"Q|43" forKey:@"2"];
    [codigosQwerty setObject:@"Q|44" forKey:@"3"];
    [codigosQwerty setObject:@"Q|45" forKey:@"("];
    [codigosQwerty setObject:@"Q|46" forKey:@")"];
    [codigosQwerty setObject:@"Q|47" forKey:@"_"];
    [codigosQwerty setObject:@"Q|48" forKey:@"-"];
    [codigosQwerty setObject:@"Q|49" forKey:@"+"];
    [codigosQwerty setObject:@"Q|50" forKey:@"@"];
    [codigosQwerty setObject:@"Q|51" forKey:@"*"];
    [codigosQwerty setObject:@"Q|52" forKey:@"4"];
    [codigosQwerty setObject:@"Q|53" forKey:@"5"];
    [codigosQwerty setObject:@"Q|54" forKey:@"6"];
    [codigosQwerty setObject:@"Q|55" forKey:@"/"];
    [codigosQwerty setObject:@"Q|56" forKey:@":"];
    [codigosQwerty setObject:@"Q|57" forKey:@";"];
    [codigosQwerty setObject:@"Q|58" forKey:@"'"];
    [codigosQwerty setObject:@"Q|59" forKey:@"\""];
    [codigosQwerty setObject:@"Q|60" forKey:@"DEL"];
    [codigosQwerty setObject:@"Q|61" forKey:@"7"];
    [codigosQwerty setObject:@"Q|62" forKey:@"8"];
    [codigosQwerty setObject:@"Q|63" forKey:@"9"];
    [codigosQwerty setObject:@"Q|64" forKey:@"?"];
    [codigosQwerty setObject:@"Q|65" forKey:@"!"];
    [codigosQwerty setObject:@"Q|66" forKey:@","];
    [codigosQwerty setObject:@"Q|67" forKey:@"."];
    [codigosQwerty setObject:@"Q|68" forKey:@"$"];
    
}
