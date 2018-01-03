//
//  iToolbar.m
//  iToolbar_Example
//
//  Created by Eric Pinet on 18-01-01.
//  Copyright © 2018 ericpinet. All rights reserved.
//

#import "iToolbar.h"
#import "iNavigationBar.h"

#define iToolbarAnimationDuration 0.3
#define iToolbarDefaultHeight 44

typedef NS_ENUM(NSInteger, iToolbarState) {
    iToolbarStateHidden,    // The iToolbar is currently hidden behind the navigation bar, or not added to a view hierarchy yet.
    iToolbarStateShowing,   // The iToolbar is sliding onto screen, from below the navigation bar.
    iToolbarStateShown,     // The iToolbar is visible below the navigation bar and is not currently animating.
    iToolbarStateHiding,    // The iToolbar is sliding off screen, back under the navigation drawer.
};

@implementation iToolbar {
    iToolbarState state;
}

- (id) init {
    self = [super init];
    if (self) {
        [self initHelper];
    }
    return self;
}

- (id)initWithFrame:(CGRect)theFrame {
    self = [super initWithFrame:theFrame];
    if (self) {
        [self initHelper];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    if (self) {
        [self initHelper];
    }
    return self;
}

- (id) initWithParentView: (iNavigationBar *) parentView
               scrollView: (UIScrollView *) scrollView
              contentView: (UIView *) contentView
                   height: (NSInteger) height {
    
    self = [super init];
    if (self) {
        [self setParentNavbar:parentView];
        [self setScrollView:scrollView];
        self.height = height;
    }
    return self;
}

- (void) initHelper {
    _parentNavbar = nil;
    _scrollView = nil;
    _height = iToolbarDefaultHeight;
    state = iToolbarStateHidden;
    _isVisible = false;
}

/**
 Set the parent view of the iToolbar. This parent view is use to place
 the iToolbar at the right place.

 @param parentView Parent view of the iToolbar.
 */
- (void) setParentNavbar:(iNavigationBar *) parentView {
    if (_parentNavbar != parentView) {
        _parentNavbar = parentView;
        
    }
    [_parentNavbar addSubview:self];
    [_parentNavbar setToolbar:self];
    self.frame = CGRectMake(0, _parentNavbar.frame.size.height, _parentNavbar.frame.size.width, 0);
    [self layoutIfNeeded];
}

/**
 Set the scroll view under the tool bar. This scrollview will be
 adjusted if iToolbar is shown to show all item in table.

 @param scrollView A  UIScrollView to adjust when iToolBar is shown.
 */
- (void) setScollView:(UIScrollView *) scrollView {
    if (_scrollView != scrollView) {
        _scrollView = scrollView;
    }
}

/**
 Set the content view of the iToolbar. This content view is use show somethings in
 the iToolbar.
 
 @param contentView of the iToolbar.
 */
- (void) setContentView:(UIView *) contentView {
    if (_contentView != contentView) {
        _contentView = contentView;
    }
    if (_contentView) {
        _contentView.frame = CGRectMake(0, 0, self.frame.size.width, 0);
        [self addSubview:_contentView];
    }
}

/**
 Show the iToolbar under the ParentView. Adjust the scrollbar if needed.
 Note: Setup parentView and scrollView (optionnel) before.
 
 @param animated If true, the show with annimation
 */
- (void) show: (BOOL) animated {

    if (animated) {
        [UIView animateWithDuration:iToolbarAnimationDuration
                              delay:0
                            options: UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             state = iToolbarStateShowing;
                             [self setupFrameForShow];
                             [self layoutIfNeeded];
                         }
                         completion:^(BOOL finished){
                             state = iToolbarStateShown;
                             _isVisible = true;
                             NSLog(@"iToolBar shown!");
                         }];
    }
    else {
        [self setupFrameForShow];
        state = iToolbarStateShown;
        _isVisible = true;
        NSLog(@"iToolBar shown!");
    }
    
}


/**
 Setup the frame of all view to show iToolbar
 */
- (void) setupFrameForShow {
    CGRect newFrame = CGRectMake(0, self.frame.origin.y, self.frame.size.width, _height);
    self.frame = newFrame;
    
    if (_scrollView) {
        UIEdgeInsets insets = _scrollView.contentInset;
        insets.top += _height;
        _scrollView.contentInset = insets;
        _scrollView.scrollIndicatorInsets = insets;
        _scrollView.contentOffset = CGPointMake(_scrollView.contentOffset.x,
                                                _scrollView.contentOffset.y -_height);
    }
    if (_contentView) {
        _contentView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    }
}



/**
 Hide the iToolbar under the ParentView. Adjust the scrollbar if needed.
 Note: Setup parentView and scrollView (optionnel) before.
 
 @param animated If true, the show with annimation
 */
- (void) hide: (BOOL) animated {
    
    if (animated) {
        [UIView animateWithDuration:iToolbarAnimationDuration
                              delay:0
                            options: UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             state = iToolbarStateHidden;
                             [self setupFrameForHide];
                             [self layoutIfNeeded];
                         }
                         completion:^(BOOL finished){
                             state = iToolbarStateHidden;
                             _isVisible = false;
                             NSLog(@"iToolBar hidden!");
                         }];
    }
    else {
        [self setupFrameForHide];
        [self layoutIfNeeded];
        state = iToolbarStateHidden;
        _isVisible = false;
        NSLog(@"iToolBar hidden!");
    }
}


/**
 Setup frame of all view for hide.
 */
- (void) setupFrameForHide {
    CGRect newFrame = CGRectMake(0, self.frame.origin.y, self.frame.size.width, 0);
    self.frame = newFrame;
    
    if (_scrollView) {
        UIEdgeInsets insets = _scrollView.contentInset;
        insets.top -= _height;
        _scrollView.contentInset = insets;
        _scrollView.scrollIndicatorInsets = insets;
    }
    if (_contentView) {
        _contentView.frame = CGRectMake(0, 0, self.frame.size.width, 0);
    }
}

@end
