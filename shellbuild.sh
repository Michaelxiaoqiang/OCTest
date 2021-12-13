codeIdentify="iPhone Distribution: Bank of Qingdao Co., Ltd."
provisioningFile="76863b2c-73c3-40f9-97a0-d328f2d8872b.mobileprovision"
# codeIdentify="iPhone Distribution: SHANGHAI RURAL COMMERCIAL BANK CO., LTD."
# provisioningFile="71ae8e52-ccc4-4142-ae94-d70ab2f1014f.mobileprovision"
echo $codeIdentify $provisioningFile
xcodebuild archive -project SRCBTest.xcodeproj -scheme SRCBTest CODE_SIGN_IDENTITY="${codeIdentify}" PROVISIONING_PROFILE="${provisioningFile}"  -archivePath "./SRCBTest"
exportPath="./output/export"
exportOptionPlist="./output/exportOptions.plist"
xcodebuild -exportArchive -archivePath SRCBTest.xcarchive -exportPath $exportPath -exportOptionsPlist $exportOptionPlist