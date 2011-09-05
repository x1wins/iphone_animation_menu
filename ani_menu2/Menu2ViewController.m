//
//  Menu2ViewController.m
//  ani_menu2
//
//  Created by famz on 11. 7. 6..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Menu2ViewController.h"


@implementation Menu2ViewController

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
    [self.view setBackgroundColor:[UIColor magentaColor]];

    /*
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 2000, 320)];
    [label setText:@"test scroll view size 2000 test scroll view size 2000 test scroll view size 2000 test scroll view size 2000 test scroll view size 2000"];
    [label setTextAlignment:UITextAlignmentCenter];
    [label setBackgroundColor:[UIColor clearColor]];
    */
    UIButton *button[IMG_AMOUNT];
    UIImage *img[IMG_AMOUNT];
    NSArray *array = [[NSArray alloc]initWithObjects:@"http://www.segye.com/content/image/2009/01/06/20090106000247_0.jpg",@"http://famz.co.kr/images/main/logo.gif",@"http://www.google.co.kr/images/experiments/nav_logo78.png",@"http://i1.daumcdn.net/imgsrc.search/search_all/2010/image/img_daum.gif", @"http://static.naver.com/www/u/2010/0611/nmms_215646753.gif", nil];
    int x=0 ,y=0;
    
    UIScrollView *scView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 480, 320)];
    [scView setScrollEnabled:YES];
    [scView setContentSize:CGSizeMake(2000, 500)];
    scView.pagingEnabled = YES;
    
    [self.view addSubview:scView];
    
    for(int i=0; i<IMG_AMOUNT; i++){
        
        NSURL *url = [NSURL URLWithString:[array objectAtIndex:i]];
        NSData *data = [NSData dataWithContentsOfURL:url];
        img[i] = [[UIImage alloc] initWithData:data];
        button[i] = [[UIButton alloc]initWithFrame:CGRectMake( x, y, img[i].size.width, img[i].size.height)];
        [button[i] setImage:img[i] forState:UIControlStateNormal];
        x = x + img[i].size.width;
        [scView addSubview:button[i]];        
        
    }
    
    UIPageControl *pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
    [pageControl setCurrentPage:0];
    [pageControl setNumberOfPages:5];
    [pageControl addTarget:self action:@selector(chagePage) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:pageControl];
    
}

/* event */

- (void)changePage {
    
    NSLog(@"sdf");
    
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
