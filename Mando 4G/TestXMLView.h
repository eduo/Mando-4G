//
//  TestXMLView.h
//  Mando 4G
//
//  Created by alfonso on 04/09/11.
//  Copyright 2011 SIESTA. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TestXMLView : UIViewController {
	NSDictionary *xmlDictionary;
	UITableView *tableView;
	UIImageView *imageView;
}
- (void)loadXmlDictionary:(NSString *)URL;
- (void)sendOneCommand:(int)code;

@property (nonatomic, copy) IBOutlet NSDictionary *xmlDictionary;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;

@end
