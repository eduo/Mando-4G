//
//  Mando4GFunc.h
//  Mando4G
//
//  Created by Xavier Romero on 14/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#ifndef Mando4G_Mando4GFunc_h
#define Mando4G_Mando4GFunc_h

#define CMD_POWER    "K|1"
#define CMD_INFO     "K|2"
#define CMD_CONFIG   "K|3"
#define CMD_PSCAN    "K|6"    // Esbrinar que es
#define CMD_SCHEDULE "K|9"    // Esbrinar que es
#define CMD_MENU     "K|17"
#define CMD_UP       "K|19"
#define CMD_DOWN     "K|20"
#define CMD_LEFT     "K|21"
#define CMD_RIGHT    "K|22"
#define CMD_OK       "K|23"
#define CMD_SALIR    "K|24"


NSString* sendCommand(const UInt8 *commandEnviar);

#endif
