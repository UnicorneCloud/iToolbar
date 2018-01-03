//
//  iNavigationBar.h
//  iToolbar
//
//  Created by Eric Pinet on 18-01-02.
//

#import <UIKit/UIKit.h>

@class iToolbar;

@interface iNavigationBar : UINavigationBar

/**
 iToolbar child of the NavigationBar.
 */
@property (nonatomic) iToolbar *toolbar;

/**
 Set the iToolbar use with this parent view.
 
 @param toolbar iToolbar use with this navbar.
 */
- (void) setToolbar:(iToolbar *) toolbar;

@end
