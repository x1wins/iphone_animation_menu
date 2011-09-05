//
//  Menu1ViewController.m
//  ani_menu2
//
//  Created by famz on 11. 7. 6..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Menu1ViewController.h"


@implementation Menu1ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor purpleColor]];
    
    //http://famz.co.kr/images/main/logo.gif
    
    //image download
    // 이미지를 읽어올 주소
    NSURL *url = [NSURL URLWithString:@"http://www.segye.com/content/image/2009/01/06/20090106000247_0.jpg"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    // 데이터가 정상적으로 읽혔는지 확인한다. 네트워크가 연결되지 않았다면 nil이다.
    if(data) {
        UIImage *image = [[UIImage alloc] initWithData:data];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        [imageView setFrame:CGRectMake(50, 0.0f, 480-50, 320)];
        [self.view addSubview:imageView];
        [imageView release];
        [image release];
    }
    // 데이터를 정상적으로 읽어오지 못했을 경우의 처리
    else
    {
        UILabel *label = [[UILabel alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
        [label setText:@"Image download fail..."];
        [label setTextAlignment:UITextAlignmentCenter];
        [label setBackgroundColor:[UIColor clearColor]];
        [self.view addSubview:label];
        [label release];
    }
    
    
    
    
 /*   
    UILabel *label = [[UILabel alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    [label setText:[NSString stringWithFormat:@"Image download fail... %d %d %d %d", label.bounds.origin.x, label.bounds.origin.y, label.bounds.size.width, label.bounds.size.height]];
    [label setTextAlignment:UITextAlignmentCenter];
    [label setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:label];
    [label release];
  */
    
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
    //return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

@end
