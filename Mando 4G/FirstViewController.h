//
//  FirstViewController.h
//  Mando4G_TabBar
//
//  Created by Xavier Romero on 15/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController {
    UILabel *etiquetaIP;
}

@property (nonatomic, retain) IBOutlet UILabel *etiquetaIP;
- (IBAction)boto_Menu:(id)sender;
- (IBAction)boto_Salir:(id)sender;
- (IBAction)boto_Config:(id)sender;
- (IBAction)boto_Info:(id)sender;
- (IBAction)boto_Power:(id)sender;
- (IBAction)boto_Ok:(id)sender;
- (IBAction)boto_Up:(id)sender;
- (IBAction)boto_Down:(id)sender;
- (IBAction)boto_Left:(id)sender;
- (IBAction)boto_Right:(id)sender;
- (IBAction)boto_Sg:(id)sender;
- (IBAction)boto_Usb:(id)sender;
- (IBAction)boto_Disc:(id)sender;
- (IBAction)boto_Red:(id)sender;
- (IBAction)boto_Vermell:(id)sender;
- (IBAction)boto_Verd:(id)sender;
- (IBAction)boto_Groc:(id)sender;
- (IBAction)boto_Blau:(id)sender;
- (IBAction)boto_Rewind:(id)sender;
- (IBAction)boto_Pausa:(id)sender;
- (IBAction)boto_Stop:(id)sender;
- (IBAction)boto_Forward:(id)sender;
- (IBAction)boto_Skip_rw:(id)sender;
- (IBAction)boto_Skip_fw:(id)sender;
- (IBAction)boto_Grab:(id)sender;
- (IBAction)boto_Widgets:(id)sender;
- (IBAction)boto_CatchTv:(id)sender;
- (IBAction)boto_Mute:(id)sender;
- (IBAction)boto_Prev_File:(id)sender;
- (IBAction)boto_Next_File:(id)sender;


@end
