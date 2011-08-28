//
//  BuscarView.h
//  
//
//  Created by Xavier Romero on 20/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//



@interface BuscarView : UIViewController {
    UITextField *textMissatge;
    UILabel *etiquetaIP;
}
@property (nonatomic, retain) IBOutlet UILabel *etiquetaIP;

@property (nonatomic, retain) IBOutlet UITextField *textMissatge;
- (IBAction)boto_Del:(id)sender;
- (IBAction)boto_buscar:(id)sender;
- (IBAction)boto_www:(id)sender;
- (IBAction)boto_qwerty:(id)sender;
- (IBAction)boto_msg:(id)sender;

@end
