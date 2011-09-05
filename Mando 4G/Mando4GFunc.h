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

#define CMD_ZERO	"K|28"
#define CMD_ONE		"K|29"
#define CMD_TWO		"K|30"
#define CMD_THREE	"K|31"
#define CMD_FOUR	"K|32"
#define CMD_FIVE	"K|33"
#define CMD_SIX		"K|34"
#define CMD_SEVEN	"K|35"
#define CMD_EIGHT	"K|36"
#define CMD_NINE	"K|37"
#define CMD_PLAY	"K|39"
#define CMD_PAUSE	"K|40"
#define CMD_PLAY_PAUSE	"K|-28"
#define CMD_STOP	"K|41"
#define CMD_NEXT	"K|42"
#define CMD_PREV	"K|43"
#define CMD_FFWD	"K|44"
#define CMD_FRWD	"K|45"
#define CMD_SFWD	"K|46"
#define CMD_IR_A	"K|48"
#define CMD_REPEAT	"K|49"
#define CMD_STITLE	"K|51"
#define CMD_AUDIO	"K|52"
#define CMD_ZOOM	"K|54"
#define CMD_VOL_UP	"K|55"
#define CMD_VOL_DOWN	"K|56"
#define CMD_MUTE        "K|57"
#define CMD_ZOOM_IN     "K|58"
#define CMD_ZOOM_OUT	"K|59"
#define CMD_EPG         "K|61"
#define CMD_NEXT_FILE	"K|65"
#define CMD_PREV_FILE	"K|66"
#define CMD_TELETEXT	"K|71"
#define CMD_SUBTITLE_DELAY_PLUS	"K|78"
#define CMD_SUBTITLE_DELAY_MINUS "K|79"
#define CMD_FORCE_RECORD	"K|104"
#define CMD_OPTION_RED		"K|120"
#define CMD_OPTION_GREEN	"K|121"
#define CMD_OPTION_YELLOW	"K|122"
#define CMD_OPTION_BLUE		"K|123"
#define CMD_OKI_KEY         "K|115"
#define CMD_OKI_FAVORITE	"K|116"
#define CMD_OKI_TOPTV		"K|117"
#define CMD_OKI_WIDGETSTV	"K|118"
#define CMD_OKI_CATCHTV		"K|119"
#define CMD_OKI_SEARCH		"K|-92"
#define CMD_PSEUDO_STANDBY	"K|-119"
#define CMD_SCREENSHOT		"K|-120"

#define CMD_GRAB            "K|99"
#define CMD_HDD             "K|1022"
#define CMD_TARJETA         "K|1021"
#define CMD_MEDIA           "K|102"
#define CMD_RED             "K|1023"
#define CMD_USB             "K|1020"

#define CMD_OPERA           "B|o"

#define CMD_QWERTY_BACKSPACE "Q|22"

// Definiciones para el mando qwerty
NSMutableDictionary *codigosQwerty;

NSString *ipEquipSelect;

NSString* sendCommand(const UInt8 *commandEnviar);
void alertaMissatge(NSString* title, NSString* missatge);
void asignaCodigosQwerty(void);
#endif

