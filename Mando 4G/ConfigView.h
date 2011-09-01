//
//  ConfigView.h
//  Mando4G_TabBar
//
//  Created by Xavier Romero on 15/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfigView : UIViewController <UITextFieldDelegate> {
    UITextField *ipEquip;
    UILabel *etiquetaIP;
}
@property (nonatomic, retain) IBOutlet UITextField *ipEquip;

@property (nonatomic, retain) IBOutlet UILabel *etiquetaIP;
- (IBAction)boto_Ok_IP:(id)sender;
- (void)guarda_config;

@end
