//
//  TestXMLView.h
//  Mando 4G
//
//  Created by alfonso on 04/09/11.
//  Copyright 2011 SIESTA. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TestXMLView : UITableViewController {
	NSDictionary *xmlDictionary;
	UITableView *myTableView;
	UIImageView *imageView;
}
- (void)loadXmlDictionary:(NSString *)URL;
- (void)sendOneCommand:(int)code;

@property (nonatomic, copy) IBOutlet NSDictionary *xmlDictionary;
@property (nonatomic, retain) IBOutlet UITableView *myTableView;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;

@end
