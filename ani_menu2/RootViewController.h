//
//  RootViewController.h
//  ani_menu2
//
//  Created by famz on 11. 7. 6..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Menu1ViewController.h"
#import "Menu2ViewController.h"


#define VIEW_WIDTH 480
#define VIEW_HEIGHT 320
#define BUTTON_WIDTH 50
#define BUTTON_HEIGHT 80

@interface RootViewController : UIViewController {

    BOOL togle;
    CGRect viewRect;
    
    Menu1ViewController *menu1ViewController;
    Menu2ViewController *menu2ViewController;
    
    UIButton *menu1Button;
    UIButton *menu2Button;

}

@end
