source 'https://github.com/CocoaPods/Specs.git'
workspace 'ORStackView'

use_frameworks!

target 'ORStackViewExample' do
  pod "ORStackView", :path => "ORStackView.podspec"
  pod 'FLKAutoLayout', :git => 'https://github.com/orta/FLKAutoLayout.git', :branch => 'v1'
  xcodeproj 'ORStackViewExample.xcodeproj'
end

target 'ORStackViewExampleTests' do
  pod "ORStackView", :path => "ORStackView.podspec"
  pod 'Specta'
  pod 'Expecta'
  pod 'OCMock'
  pod 'FBSnapshotTestCase'
  pod 'Expecta+Snapshots'
  xcodeproj 'ORStackViewExample.xcodeproj'
end
