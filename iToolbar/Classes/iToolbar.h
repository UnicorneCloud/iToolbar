//
//  iToolbar.h
//
//  Created by Eric Pinet on 18-01-01.
//  Copyright © 2018 ericpinet. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iNavigationBar;

@interface iToolbar : UIToolbar

/**
 Parent iNavigationBar of the iToolbar.
 */
@property (nonatomic) iNavigationBar *parentNavbar;

/**
 UIScrollView to adjust when iToolBar is shown.
 */
@property (nonatomic) UIScrollView *scrollView;

/**
 ContentView of the iToolbar
 */
@property (nonatomic) UIView *contentView;

/**
 Height of the iToolbar.
 */
@property (nonatomic) NSInteger height;


/**
 Return true if the iToolbar is shown.
 */
@property (nonatomic, readonly) Boolean isVisible;



- (id) initWithParentView: (iNavigationBar *) parentView
               scrollView: (UIScrollView *) scrollView
              contentView: (UIView *) contentView
                   height: (NSInteger) height;

/**
 Set the parent view of the iToolbar. This parent view is use to place
 the iToolbar at the right place.
 
 @param parentView Parent view of the iToolbar.
 */
- (void) setParentNavbar:(iNavigationBar *) parentView;

/**
 Set the scroll view under the tool bar. This scrollview will be
 adjusted if iToolbar is shown to show all item in table.
 
 @param scrollView A  UIScrollView to adjust when iToolBar is shown.
 */
- (void) setScollView:(UIScrollView *) scrollView;

/**
 Set the content view of the iToolbar. This content view is use show somethings in
 the iToolbar.
 
 @param contentView of the iToolbar.
 */
- (void) setContentView:(UIView *) contentView;

/**
 Show the iToolbar under the ParentView. Adjust the scrollbar if needed.
 Note: Setup parentView and scrollView (optionnel) before.
 */

/**
 Show the iToolbar under the ParentView. Adjust the scrollbar if needed.
 Note: Setup parentView and scrollView (optionnel) before.

 @param animated If true, the show with annimation
 */
- (void) show: (BOOL) animated;

/**
 Hide the iToolbar under the ParentView. Adjust the scrollbar if needed.
 Note: Setup parentView and scrollView (optionnel) before.
 
 @param animated If true, the show with annimation
 */
- (void) hide: (BOOL) animated;

@end
