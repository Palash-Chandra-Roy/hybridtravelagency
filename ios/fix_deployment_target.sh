#!/bin/bash
# Fix iOS Deployment Target for all frameworks
# Run this script before building for TestFlight if you encounter MinimumOSVersion errors

echo "🔧 Fixing iOS Deployment Target..."

# Update AppFrameworkInfo.plist
if [ -f "ios/Flutter/AppFrameworkInfo.plist" ]; then
    # Use sed to replace MinimumOSVersion
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        sed -i '' 's|<string>9\.0</string>|<string>13.0</string>|g' ios/Flutter/AppFrameworkInfo.plist
        sed -i '' 's|<string>10\.0</string>|<string>13.0</string>|g' ios/Flutter/AppFrameworkInfo.plist
        sed -i '' 's|<string>11\.0</string>|<string>13.0</string>|g' ios/Flutter/AppFrameworkInfo.plist
        sed -i '' 's|<string>12\.0</string>|<string>13.0</string>|g' ios/Flutter/AppFrameworkInfo.plist
    else
        # Linux
        sed -i 's|<string>9\.0</string>|<string>13.0</string>|g' ios/Flutter/AppFrameworkInfo.plist
        sed -i 's|<string>10\.0</string>|<string>13.0</string>|g' ios/Flutter/AppFrameworkInfo.plist
        sed -i 's|<string>11\.0</string>|<string>13.0</string>|g' ios/Flutter/AppFrameworkInfo.plist
        sed -i 's|<string>12\.0</string>|<string>13.0</string>|g' ios/Flutter/AppFrameworkInfo.plist
    fi
    echo "✅ Updated AppFrameworkInfo.plist"
else
    echo "⚠️  AppFrameworkInfo.plist not found"
fi

echo "✅ Deployment target fix complete!"
echo ""
echo "Next steps:"
echo "  1. cd ios && pod install && cd .."
echo "  2. flutter clean"
echo "  3. flutter build ios --release"

