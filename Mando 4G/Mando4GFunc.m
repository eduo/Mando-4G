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
    CFWriteStreamRef writeStream = NULL;
    CFReadStreamRef readStream = NULL;
    
    // NSLog(@"IP Config: %@", ipEquipSelect);
    // CFStringRef host = CFSTR("192.168.1.12");
    CFStringRef host = (CFStringRef) ipEquipSelect;
    UInt32 port = 9010;
    
    CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault, host, port, &readStream, &writeStream);
    
    CFWriteStreamSetProperty(writeStream, kCFStreamPropertyShouldCloseNativeSocket, kCFBooleanTrue);
    CFReadStreamSetProperty(readStream, kCFStreamPropertyShouldCloseNativeSocket, kCFBooleanTrue);
    
    if(!CFWriteStreamOpen(writeStream)) {
        NSLog(@"Error Obrint Stream d'Escriptura");
    }
    else {
        /* UInt8 buf[] = "K|2";  */
        int bytesWritten = CFWriteStreamWrite(writeStream, commandEnviar, strlen((char*)commandEnviar));
        // NSLog(@"Written: %d", bytesWritten);
        enviat = [NSString stringWithFormat:@"Enviat: %@ - Enviats: %d Bytes", [NSString stringWithUTF8String:(const char *)commandEnviar], bytesWritten];
        
        if (bytesWritten < 0) {
            CFStreamError error = CFWriteStreamGetError(writeStream);
            /** How do I print out description? All i get is -1 here. i.e What is perror() equivalent? **/
            NSLog(@"Error: %@", error);
            enviat = [NSString stringWithFormat:@"Error: %@", error];
        }
        
    }
    
    if(!CFReadStreamOpen(readStream)) {
        NSLog(@"Error Obrint Stream de Lectura");
    }
    else {
        UInt8 bufread[128];
        int bytesReaded = CFReadStreamRead(readStream, bufread, sizeof(bufread));
        // NSLog(@"Llegit: %d", bytesReaded);
        /* self.label.text = [NSString stringWithFormat:@"%@ - Llegit: %@ - Llegits: %d Bytes", self.label.text, [(NSString*)bufread substringToIndex:strlen((char*)bufread)], bytesReaded];
         */
        
        if (bytesReaded < 0) {
            CFStreamError error = CFReadStreamGetError(readStream);
            /** How do I print out description? All i get is -1 here. i.e What is perror() equivalent? **/
            NSLog(@"Error: %@", error);
            enviat = [NSString stringWithFormat:@"Error: %@", error];
        }
    }
    
    CFWriteStreamClose(writeStream);
    CFReadStreamClose(readStream);   
    return enviat;
}
