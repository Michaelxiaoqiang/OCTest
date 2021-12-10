xcodebuild archive -project SRCBTest.xcodeproj -scheme SRCBTest CODE_SIGN_IDENTITY="iPhone Distribution: SHANGHAI RURAL COMMERCIAL BANK CO., LTD." PROVISIONING_PROFILE="71ae8e52-ccc4-4142-ae94-d70ab2f1014f.mobileprovision"  -archivePath "./SRCBTest"
exportPath="./output/export"
exportOptionPlist="./output/exportOptions.plist"
xcodebuild -exportArchive -archivePath SRCBTest.xcarchive -exportPath $exportPath -exportOptionsPlist $exportOptionPlist