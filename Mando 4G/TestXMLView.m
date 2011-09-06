    //
//  TestXMLView.m
//  Mando 4G
//
//  Created by alfonso on 04/09/11.
//  Copyright 2011 SIESTA. All rights reserved.
//

#import "TestXMLView.h"
#import "Mando4GFunc.h"
#import "XMLReader.h"
#import "ASIHTTPRequest.h"

#define USE_CUSTOM_DRAWING 1
@implementation TestXMLView
@synthesize xmlDictionary;
@synthesize tableView;
@synthesize imageView;
// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

- (void)loadXmlDictionary:(NSString *)URL {
	NSURL *url = nil;

	if (URL==nil) {
		url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@/EXT/ios", ipEquipSelect]];
//	 url = [NSURL URLWithString:@"http://192.168.1.235/EXT/ios"];
	} else {
		NSString *trimmedString = [URL stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

	 url = [NSURL URLWithString:trimmedString];
	}
	

	
	ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
	[request startSynchronous];
	NSError *error = [request error];
	if (!error) {
		NSString *response = [request responseString];
		NSError *parseError = nil;
		
		self.xmlDictionary = [XMLReader dictionaryForXMLString:response error:&parseError];
		
		NSLog(@"%@", xmlDictionary);
	}
	
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	NSLog (@"Test");
	tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	tableView.rowHeight = 200;
	tableView.backgroundColor = [UIColor clearColor];
	imageView.image = [UIImage imageNamed:@"gradientBackground.png"];
	
    //
    // Create a header view. Wrap it in a container to allow us to position
    // it better.
    //
    UIView *containerView =
	[[[UIView alloc]
	  initWithFrame:CGRectMake(0, 0, 300, 60)]
	 autorelease];
    UILabel *headerLabel =
	[[[UILabel alloc]
	  initWithFrame:CGRectMake(10, 20, 300, 40)]
	 autorelease];
    headerLabel.text = NSLocalizedString(@"Header for the table", @"");
    headerLabel.textColor = [UIColor whiteColor];
    headerLabel.shadowColor = [UIColor blackColor];
    headerLabel.shadowOffset = CGSizeMake(0, 1);
    headerLabel.font = [UIFont boldSystemFontOfSize:22];
    headerLabel.backgroundColor = [UIColor clearColor];
    [containerView addSubview:headerLabel];
    self.tableView.tableHeaderView = containerView;	
	
	
	
	[self loadXmlDictionary:nil];
/*
	//
	// XML string from http://labs.adobe.com/technologies/spry/samples/data_region/NestedXMLDataSample.html
	//
	NSString *testXMLString = @"<items><item id=\"0001\" type=\"donut\"><name>Cake</name><ppu>0.55</ppu><batters><batter id=\"1001\">Regular</batter><batter id=\"1002\">Chocolate</batter><batter id=\"1003\">Blueberry</batter></batters><topping id=\"5001\">None</topping><topping id=\"5002\">Glazed</topping><topping id=\"5005\">Sugar</topping></item></items>";
	// Parse the XML into a dictionary
	NSError *parseError = nil;
	NSDictionary *xmlDictionary = [XMLReader dictionaryForXMLString:testXMLString error:&parseError];
	
	// Print the dictionary
	NSLog(@"%@", xmlDictionary);
*/
	
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	
	NSArray *array = [[xmlDictionary valueForKey:@"rss"] valueForKey:@"channel"] ;
	return [array count];
	
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
#if USE_CUSTOM_DRAWING
	const NSInteger TOP_LABEL_TAG = 1001;
	const NSInteger BOTTOM_LABEL_TAG = 1002;
	UILabel *topLabel;
	UILabel *bottomLabel;
#endif

	
	NSLog(@"Test2");
//	NSLog(@"%@", self.xmlDictionary);
	static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

	NSArray *array = [[xmlDictionary valueForKey:@"rss"] valueForKey:@"channel"] ;
	
	NSDictionary *string = [array objectAtIndex:indexPath.row];
	NSString *cellstring = [[string valueForKey:@"name"] valueForKey:@"text"];
	NSString *channelstring = [[string valueForKey:@"id"] valueForKey:@"text"];
	NSString *current = [[string valueForKey:@"current"] valueForKey:@"text"];
	NSString *abrev_notrim = [[string valueForKey:@"abrev"] valueForKey:@"text"];
	NSString *abrev = [[abrev_notrim stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];


	
	if (cell == nil){
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
#if USE_CUSTOM_DRAWING
		UIImage *indicatorImage = [UIImage imageNamed:@"null.png"];
		cell.accessoryView =
		[[[UIImageView alloc]
		  initWithImage:indicatorImage]
		 autorelease];
		
		const CGFloat LABEL_HEIGHT = 20;
		UIImage *image = [UIImage imageNamed:@"IMG_CH_BLANK.png"];
		
		//
		// Create the label for the top row of text
		//
		topLabel =
		[[[UILabel alloc]
		  initWithFrame:
		  CGRectMake(
					 image.size.width + 2.0 * cell.indentationWidth,
					 0.5 * (tableView.rowHeight - 2 * LABEL_HEIGHT),
					 tableView.bounds.size.width -
					 image.size.width - 4.0 * cell.indentationWidth
					 - indicatorImage.size.width,
					 LABEL_HEIGHT)]
		 autorelease];
		[cell.contentView addSubview:topLabel];
		
		//
		// Configure the properties for the text that are the same on every row
		//
		topLabel.tag = TOP_LABEL_TAG;
		topLabel.backgroundColor = [UIColor clearColor];
		topLabel.textColor = [UIColor colorWithRed:0.25 green:0.0 blue:0.0 alpha:1.0];
		topLabel.highlightedTextColor = [UIColor colorWithRed:1.0 green:1.0 blue:0.9 alpha:1.0];
		topLabel.font = [UIFont systemFontOfSize:[UIFont labelFontSize]];
		
		//
		// Create the label for the top row of text
		//
		bottomLabel =
		[[[UILabel alloc]
		  initWithFrame:
		  CGRectMake(
					 image.size.width + 2.0 * cell.indentationWidth,
					 0.5 * (tableView.rowHeight - 2 * LABEL_HEIGHT) + LABEL_HEIGHT,
					 tableView.bounds.size.width -
					 image.size.width - 4.0 * cell.indentationWidth
					 - indicatorImage.size.width,
					 LABEL_HEIGHT)]
		 autorelease];
		[cell.contentView addSubview:bottomLabel];
		
		//
		// Configure the properties for the text that are the same on every row
		//
		bottomLabel.tag = BOTTOM_LABEL_TAG;
		bottomLabel.backgroundColor = [UIColor clearColor];
		bottomLabel.textColor = [UIColor colorWithRed:0.25 green:0.0 blue:0.0 alpha:1.0];
		bottomLabel.highlightedTextColor = [UIColor colorWithRed:1.0 green:1.0 blue:0.9 alpha:1.0];
		bottomLabel.font = [UIFont systemFontOfSize:[UIFont labelFontSize] - 2];
		
		//
		// Create a background image view.
		//
		cell.backgroundView =
		[[[UIImageView alloc] init] autorelease];
		cell.selectedBackgroundView =
		[[[UIImageView alloc] init] autorelease];
#endif
	} 
#if USE_CUSTOM_DRAWING
	else
	{
		topLabel = (UILabel *)[cell viewWithTag:TOP_LABEL_TAG];
		bottomLabel = (UILabel *)[cell viewWithTag:BOTTOM_LABEL_TAG];
	}
	
    topLabel.text = [NSString stringWithFormat:@"%@", cellstring];
    bottomLabel.text = [NSString stringWithFormat:@"%@", current];
    
	//
	// Set the background and selected background images for the text.
	// Since we will round the corners at the top and bottom of sections, we
	// need to conditionally choose the images based on the row index and the
	// number of rows in the section.
	//
	UIImage *rowBackground;
	UIImage *selectionBackground;
	NSInteger sectionRows = [tableView numberOfRowsInSection:[indexPath section]];
	NSInteger row = [indexPath row];
	if (row == 0 && row == sectionRows - 1)
	{
		rowBackground = [UIImage imageNamed:@"topAndBottomRow.png"];
		selectionBackground = [UIImage imageNamed:@"topAndBottomRowSelected.png"];
	}
	else if (row == 0)
	{
		rowBackground = [UIImage imageNamed:@"topRow.png"];
		selectionBackground = [UIImage imageNamed:@"topRowSelected.png"];
	}
	else if (row == sectionRows - 1)
	{
		rowBackground = [UIImage imageNamed:@"bottomRow.png"];
		selectionBackground = [UIImage imageNamed:@"bottomRowSelected.png"];
	}
	else
	{
		rowBackground = [UIImage imageNamed:@"middleRow.png"];
		selectionBackground = [UIImage imageNamed:@"middleRowSelected.png"];
	}
	((UIImageView *)cell.backgroundView).image = rowBackground;
	((UIImageView *)cell.selectedBackgroundView).image = selectionBackground;
	
	//
	// Here I set an image based on the row. This is just to have something
	// colorful to show on each row.
	//
	NSString *channel_name_url = [NSString stringWithFormat:@"http://%@/EXT/ios/images/IMG_CH_%@.png", ipEquipSelect,abrev];
    
    //Por si decidimos hacer del modulo parte de la aplicacion web
//    NSString *channel_name_url = [NSString stringWithFormat:@"http://%@/web/modulos/parrilla/images/parrilla/IMG_CH_%@.png", ipEquipSelect,abrev];

	NSLog (@"%@",channel_name_url);


	// cell.image = [UIImage imageNamed:channel_name];
	cell.image = 	[UIImage imageWithData: [NSData dataWithContentsOfURL: [NSURL URLWithString:channel_name_url]]];

	
#else
	
	
	// Creamos una custom cell de prueba, que habrá que customizar para mostrar el logo del canal 
	
	
	[cell setText:[NSString stringWithFormat:@"%@ - %@", channelstring, cellstring]];
#endif
	return cell;
}

- (void)sendOneCommand:(int)code {
	
	switch( code) {
		case (1):
			sendCommand(CMD_ONE);
			break;
		case (2):
			sendCommand(CMD_TWO);
			break;
		case (3):
			sendCommand(CMD_THREE);
			break;
		case (4):
			sendCommand(CMD_FOUR);
			break;
		case (5):
			sendCommand(CMD_FIVE);
			break;
		case (6):
			sendCommand(CMD_SIX);
			break;
		case (7):
			sendCommand(CMD_SEVEN);
			break;
		case (8):
			sendCommand(CMD_EIGHT);
			break;
		case (9):
			sendCommand(CMD_NINE);
			break;
		case (0):
			sendCommand(CMD_ZERO);
			break;
			
	}
	// Enviamos comando para cambiar de canal según el código de canal
//    sendCommand(buf);	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"Pues me han dado y el index es: %d",indexPath.row);
	NSArray *array = [[xmlDictionary valueForKey:@"rss"] valueForKey:@"channel"];
	
	NSDictionary *string = [array objectAtIndex:indexPath.row];
	NSString *cellstring = [[string valueForKey:@"id"] valueForKey:@"text"];
	NSString *trimmedString = [cellstring stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

	// El siguiente codigo sirve para implementar RSS
	// NSLog(@"La URL que hay que invocar es: %@",cellstring);
	// Recargamos el xmlDictionary y recargamos la tabla
    //	[self loadXmlDictionary:cellstring];
    //	[tableView reloadData];
	
	int len = [trimmedString length];
	int channel_number = [trimmedString intValue];
	
	// Send codes
	for (int j=len;j>0;j--) {
		int ch_code = channel_number /(pow(10,j-1));
		channel_number -= ch_code*pow(10,j-1);
		NSLog(@"Codigo a enviar: %d",ch_code);
	
		[self sendOneCommand:ch_code];
	
	}
	

}
@end
