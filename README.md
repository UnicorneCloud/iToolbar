# iToolbar

[![CI Status](http://img.shields.io/travis/ericpinet/iToolbar.svg?style=flat)](https://travis-ci.org/ericpinet/iToolbar)
[![Version](https://img.shields.io/cocoapods/v/iToolbar.svg?style=flat)](http://cocoapods.org/pods/iToolbar)
[![License](https://img.shields.io/cocoapods/l/iToolbar.svg?style=flat)](http://cocoapods.org/pods/iToolbar)
[![Platform](https://img.shields.io/cocoapods/p/iToolbar.svg?style=flat)](http://cocoapods.org/pods/iToolbar)


![iToolbar.gif](https://github.com/ericpinet/iToolbar/blob/master/readme/iToolbar.gif)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

N/A

## Installation

iToolbar is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'iToolbar'
```

And execute this command in your project folder:

```ruby
pod install
```

## Usage of iToolbar

See the sample project iToolbar in 'Exemple' directory.

## How to use details

### Subclass the UINavigationBar with iNavigationBar

![iNavigationBarSetup.png](https://github.com/ericpinet/iToolbar/blob/master/readme/iNavigationBarSetup.png)

### Import the header

```
#import <iToolbar.h>
```

### Setup the iToolbar

```
// Initialization of the iToolbar
_toolbar = [[iToolbar alloc] init];

// set the parent NavigationBar
[_toolbar setParentNavbar:(iNavigationBar*)self.navigationController.navigationBar];

// Set the scrolview to adjust when iToolbar is shown
[_toolbar setScollView:self.tableView];
```

### Add button or Custom View

#### Add button

```
UIBarButtonItem *button1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
target:self
action:@selector(click:)];

[...]

_toolbar.items = @[button1, ...];
```

#### Add custom view

```
UIView *contentView = [[UIView alloc] init];
[contentView setBackgroundColor:UIColor.brownColor];
[_toolbar setContentView:contentView];
```

### Show and Hide iToolbar

```
[_toolbar show:true]; // true for animated

[_toolbar hide:false]; // false to hide without animation
```

## Author

ericpinet, pineri01@gmail.com

## License

iToolbar is available under the MIT license. See the LICENSE file for more info.

