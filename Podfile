source 'https://github.com/CocoaPods/Specs.git'
plugin 'slather'
workspace 'ORStackView'

target 'ORStackViewExample' do
  pod "ORStackView", :path => "ORStackView.podspec"
  pod 'FLKAutoLayout', '~> 0.2.1'
  xcodeproj 'ORStackViewExample.xcodeproj'
end

target 'ORStackViewExampleTests' do
  pod "ORStackView", :path => "ORStackView.podspec"
  pod 'Specta', '0.2.1'
  pod 'Expecta', '0.2.3'
  pod 'OCMock', '2.2.4'
  pod 'FBSnapshotTestCase', '1.2'
  pod 'Expecta+Snapshots', '1.2.1'
  xcodeproj 'ORStackViewExample.xcodeproj'
end
