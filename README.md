# ORStackView

[![Version](http://cocoapod-badges.herokuapp.com/v/ORStackView/badge.png)](http://cocoadocs.org/docsets/ORStackView)
[![Platform](http://cocoapod-badges.herokuapp.com/p/ORStackView/badge.png)](http://cocoadocs.org/docsets/ORStackView)

Makes setting up a collection of stacked views simple.
Uses [FLKAutoLayout](https://github.com/dkduck/FLKAutoLayout) to simplify the API, you should probably be using. 

```
- (void)loadView
{
    self.view = [[ORStackView alloc] init];
}

- (void)viewDidLoad
{
  ORColourView *title = [[ORColourView alloc] init];
  title.text = @"Title";

  ORColourView *subtitle = [[ORColourView alloc] init];
  subtitle.text = @"Subtitle";

  ORColourView *content = [[ORColourView alloc] init];
  content.text = @"Lorem ipsum, etc. etc.";

  [self.view addSubview:title withTopMargin:@"20" sideMargin:@"30"];
  [self.view addSubview:subtitle withTopMargin:@"40" sideMargin:@"70"];
  [self.view addSubview:content withTopMargin:@"60" sideMargin:@"20"];
}
```

Optionally if you have views which should only appear once you've got confirmation from an external source you can use view tags to specify an order. For example these views will be ordered correctly regardless of the insertation order chronologically.

```
- (void)loadView
{
    self.view = [[ORTagBasedAutoStackView alloc] init];
}

- (void)viewDidLoad
{
  ORColourView *title = [[ORColourView alloc] init];
  title.text = @"1 Title";
  title.tag = 1;

  ORColourView *subtitle = [[ORColourView alloc] init];
  subtitle.text = @"2 Subtitle";
  subtitle.tag = 2;

  ORColourView *content = [[ORColourView alloc] init];
  content.text = @"3 Lorem ipsum, etc. etc.";
  content.tag = 3;

  ORColourView *content2 = [[ORColourView alloc] init];
  content2.text = @"4 Lorem ipsum, etc. etc.";
  content2.tag = 4;

  ORColourView *content3 = [[ORColourView alloc] init];
  content3.text = @"5 Lorem ipsum, etc. etc.";
  content3.tag = 5;

  [self.view addSubview:subtitle withTopMargin:@"10" sideMargin:@"70"];
  [self.view addSubview:content withTopMargin:@"20" sideMargin:@"20"];
  [self.view addSubview:content3 withTopMargin:@"20" sideMargin:@"20"];
  [self.view addSubview:content2 withTopMargin:@"10" sideMargin:@"20"];
  [self.view addSubview:title withTopMargin:@"20" sideMargin:@"30"];
}
```

## Usage

To run the example project; clone the repo, and run `pod install` from the Project directory first.


## Installation

ORStackView is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "ORStackView"

## Author

Orta Therox, orta.therox@gmail.com

## License

ORStackView is available under the MIT license. See the LICENSE file for more info.

