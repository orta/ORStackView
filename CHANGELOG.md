# ORStackView CHANGELOG

## 2.0.2

* Supports Artsy's FLKAutoLayout v1 (heh) - @orta

## 2.0.1

* Relaxes support for FLKAutoLayout, to allow using Artsy's FLKAutoLayout v1 - @orta
* Adds an API to edit top margins of existing views - 1aurabrown

## 3.0.1

* iOS7 fixes - @garnett

## 3.0.0

* Massive API breaking changes

* Switched to use CGFloats instead of NSStrings - @garnett
* Supports horizontal layouts - @garnett
* Adds a ORStackViewController - @garnett

## 2.0.0

* Fixed crash when setting ORStackView.bottomMarginHeight without any child views on iOS8 - @dblock
* Defaults to having a bottom constraint, I have _no idea_ why I didn't make this default. - @orta
* More inline documentation - @orta
* Update FBSnapshotTestCase and Expecta+Snapshots to fix Xcode6 testing. - @dbgrandi
* Support using Interface Builder - @orta

## 1.2.0

* Added ORSplitStackView - @1aurabrown
* Removes stale constraints with tag ordering at runtime - @1aurabrown
* Support for resizable height / margin constraings - @1aurabrown

## 1.1.0

* Allow ORStackScrollViews to be created via nibs - @kylef
* Use toplayoutguide in ORStackViews - @kylef

## 1.0.0

* Stacking views
* Stacking views that uses view tags to automatically set the order
* UIScrollView subclass that handles having a stack set up for you
* API for UIViewControllers
