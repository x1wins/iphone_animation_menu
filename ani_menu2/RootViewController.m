//
//  RootViewController.m
//  ani_menu2
//
//  Created by famz on 11. 7. 6..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"


@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
    
    //fake init
    UIButton *fake1Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [fake1Button setTitle:@"1 on" forState:UIControlStateNormal];
    [fake1Button setFrame:CGRectMake(0, 0, BUTTON_WIDTH, BUTTON_HEIGHT)];
    //[fake1Button addTarget:self action:@selector(clickButton1) forControlEvents:UIControlEventTouchUpInside];
    [fake1Button setBackgroundColor:[UIColor purpleColor]];
    [fake1Button.titleLabel setFont:[UIFont systemFontOfSize:20]];
    [self.view addSubview:fake1Button];
    UIButton *fake2Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [fake2Button setTitle:@"2 on" forState:UIControlStateNormal];
    [fake2Button setFrame:CGRectMake(0, BUTTON_HEIGHT*1, BUTTON_WIDTH, BUTTON_HEIGHT)];
    //[fake2Button addTarget:self action:@selector(clickButton1) forControlEvents:UIControlEventTouchUpInside];
    [fake2Button setBackgroundColor:[UIColor magentaColor]];
    [fake2Button.titleLabel setFont:[UIFont systemFontOfSize:20]];
    [self.view addSubview:fake2Button];   
    
    
    
    //init
    toggle = YES;
    menu1ViewController = [[Menu1ViewController alloc]init];
    menu2ViewController = [[Menu2ViewController alloc]init];
    
    viewRect = [[UIScreen mainScreen] applicationFrame];
    
    [menu1ViewController.view setFrame:CGRectMake(-VIEW_WIDTH, 0, viewRect.size.width, viewRect.size.height)];
    [menu2ViewController.view setFrame:CGRectMake(-VIEW_WIDTH, 0, viewRect.size.width, viewRect.size.height)];
    
    /*
    NSLog(@"1 width= %f", menu1ViewController.view.frame.size.width);
    NSLog(@"1 height= %f", menu1ViewController.view.frame.size.height);
    NSLog(@"1 x = %f", menu1ViewController.view.frame.origin.x);
    NSLog(@"1 y = %f", menu1ViewController.view.frame.origin.y);
    NSLog(@"2 width= %f", menu2ViewController.view.frame.size.width);
    NSLog(@"2 height= %f", menu2ViewController.view.frame.size.height);    
    NSLog(@"2 x = %f", menu2ViewController.view.frame.origin.x);
    NSLog(@"2 y = %f", menu2ViewController.view.frame.origin.y);    
    */
    
    //button init
    menu1Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [menu1Button setTitle:@"1 on" forState:UIControlStateNormal];
    [menu1Button setFrame:CGRectMake(0, 0, BUTTON_WIDTH, BUTTON_HEIGHT)];
    [menu1Button addTarget:self action:@selector(clickButton1) forControlEvents:UIControlEventTouchUpInside];
    [menu1Button setBackgroundColor:[UIColor purpleColor]];
    [menu1Button.titleLabel setFont:[UIFont systemFontOfSize:20]];
    
    menu2Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [menu2Button setTitle:@"2 on" forState:UIControlStateNormal];
    [menu2Button setFrame:CGRectMake(0, BUTTON_HEIGHT*1, BUTTON_WIDTH, BUTTON_HEIGHT)];
    [menu2Button addTarget:self action:@selector(clickButton2) forControlEvents:UIControlEventTouchUpInside];
    [menu2Button setBackgroundColor:[UIColor magentaColor]];    
    [menu2Button.titleLabel setFont:[UIFont systemFontOfSize:20]];
    
    [self.view addSubview:menu1ViewController.view];
    [self.view addSubview:menu2ViewController.view];
    
    [self.view addSubview:menu1Button];
    [self.view addSubview:menu2Button];
    
}

- (void) allClose {
    
    [menu1ViewController.view setFrame:CGRectMake(-VIEW_WIDTH, 0, viewRect.size.width, viewRect.size.height)];
    [menu2ViewController.view setFrame:CGRectMake(-VIEW_WIDTH, 0, viewRect.size.width, viewRect.size.height)];
    
    [menu1Button setFrame:CGRectMake(0, 0, BUTTON_WIDTH, BUTTON_HEIGHT)];
    [menu2Button setFrame:CGRectMake(0, BUTTON_HEIGHT*1, BUTTON_WIDTH, BUTTON_HEIGHT)];
    
}

- (void) button2HiddenShow {

    [menu2Button setHidden:!toggle];
    
}

- (void) button1HiddenShow {
    
    [menu1Button setHidden:!toggle];
    
}

- (void) clickButton1 {
    
    if(toggle){
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:(float)1]; //이건 애니효과시간 파라미터에 여러 값을 넣어보면 어떤앤지 알게될거야
        [menu1ViewController.view setFrame:CGRectMake(-BUTTON_WIDTH, 0, VIEW_WIDTH, VIEW_HEIGHT)];
        [menu2ViewController.view setFrame:CGRectMake(-VIEW_WIDTH, 0, VIEW_WIDTH, VIEW_HEIGHT)];
        [menu1Button setFrame:CGRectMake(VIEW_WIDTH-BUTTON_WIDTH, 0, BUTTON_WIDTH, BUTTON_HEIGHT)];
        [menu2Button setHidden:YES];
//        [self performSelector:@selector(button2HiddenShow) withObject:self afterDelay:1];
        [UIView commitAnimations];
        
        /*
        NSLog(@"1 width= %f", menu1ViewController.view.frame.size.width);
        NSLog(@"1 height= %f", menu1ViewController.view.frame.size.height);
        NSLog(@"1 x = %f", menu1ViewController.view.frame.origin.x);
        NSLog(@"1 y = %f", menu1ViewController.view.frame.origin.y);
        NSLog(@"2 width= %f", menu2ViewController.view.frame.size.width);
        NSLog(@"2 height= %f", menu2ViewController.view.frame.size.height);    
        NSLog(@"2 x = %f", menu2ViewController.view.frame.origin.x);
        NSLog(@"2 y = %f", menu2ViewController.view.frame.origin.y);  
         */
        
    }else{
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:(float)1]; //이건 애니효과시간 파라미터에 여러 값을 넣어보면 어떤앤지 알게될거야
        [menu1ViewController.view setFrame:CGRectMake(-VIEW_WIDTH, 0, VIEW_WIDTH, VIEW_HEIGHT)];
        [menu2ViewController.view setFrame:CGRectMake(-VIEW_WIDTH, 0, VIEW_WIDTH, VIEW_HEIGHT)];
        [menu1Button setFrame:CGRectMake(0, 0, BUTTON_WIDTH, BUTTON_HEIGHT)];
//        [menu2Button setHidden:NO];
        [self performSelector:@selector(button2HiddenShow) withObject:self afterDelay:1];
        [UIView commitAnimations];
        
    }
    
    toggle = !toggle;
    
}

- (void) clickButton2 {
    
    if(toggle){
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:(float)1]; //이건 애니효과시간 파라미터에 여러 값을 넣어보면 어떤앤지 알게될거야
        [menu1ViewController.view setFrame:CGRectMake(-VIEW_WIDTH, 0, VIEW_WIDTH, VIEW_HEIGHT)];
        [menu2ViewController.view setFrame:CGRectMake(-BUTTON_WIDTH, 0, VIEW_WIDTH, VIEW_HEIGHT)];
        [menu2Button setFrame:CGRectMake(VIEW_WIDTH-BUTTON_WIDTH, BUTTON_HEIGHT, BUTTON_WIDTH, BUTTON_HEIGHT)];
        [menu1Button setHidden:YES];
//        [self performSelector:@selector(button1HiddenShow) withObject:self afterDelay:1];        
        [UIView commitAnimations];
        
        /*
         NSLog(@"1 width= %f", menu1ViewController.view.frame.size.width);
         NSLog(@"1 height= %f", menu1ViewController.view.frame.size.height);
         NSLog(@"1 x = %f", menu1ViewController.view.frame.origin.x);
         NSLog(@"1 y = %f", menu1ViewController.view.frame.origin.y);
         NSLog(@"2 width= %f", menu2ViewController.view.frame.size.width);
         NSLog(@"2 height= %f", menu2ViewController.view.frame.size.height);    
         NSLog(@"2 x = %f", menu2ViewController.view.frame.origin.x);
         NSLog(@"2 y = %f", menu2ViewController.view.frame.origin.y);  
         */
        
    }else{
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:(float)1]; //이건 애니효과시간 파라미터에 여러 값을 넣어보면 어떤앤지 알게될거야
        [menu1ViewController.view setFrame:CGRectMake(-VIEW_WIDTH, 0, VIEW_WIDTH, VIEW_HEIGHT)];
        [menu2ViewController.view setFrame:CGRectMake(-VIEW_WIDTH, 0, VIEW_WIDTH, VIEW_HEIGHT)];
        [menu2Button setFrame:CGRectMake(0, BUTTON_HEIGHT, BUTTON_WIDTH, BUTTON_HEIGHT)];
//        [menu1Button setHidden:NO];
        [self performSelector:@selector(button1HiddenShow) withObject:self afterDelay:1];
        [UIView commitAnimations];
        
    }
    
    toggle = !toggle;
    
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
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

@end
