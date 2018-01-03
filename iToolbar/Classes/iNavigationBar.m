//
//  iNavigationBar.m
//  iToolbar
//
//  Created by Eric Pinet on 18-01-02.
//

#import "iNavigationBar.h"
#import "iToolbar.h"

@implementation iNavigationBar

/**
 Set the iToolbar use with this parent.
 
 @param toolbar iToolbar use with this navbar.
 */
- (void) setToolbar:(iToolbar *) toolbar {
    if (_toolbar != toolbar) {
        _toolbar = toolbar;
    }
}


/**
 Override of the pointInside to catch event in iToolbar.

 @param point A point that is in the receiver’s local coordinate system (bounds).
 @param event The event that warranted a call to this method. If you are calling this method from outside your event-handling code, you may specify nil.
 @return YES if point is inside the receiver’s bounds; otherwise, NO.
 */
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    CGRect extendedRect = self.frame;
    extendedRect.origin.y = 0;
    
    float fixsize = 0;
    if (_toolbar && [_toolbar isVisible]) {
        fixsize = _toolbar.height;
    }
    
    extendedRect.size.height = self.frame.size.height + fixsize;
    
    BOOL pointInside = NO;
    if (CGRectContainsPoint(extendedRect, point)) {
        pointInside = YES;
    }
    return pointInside;
}




@end
