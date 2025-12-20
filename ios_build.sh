#!/bin/bash
# iOS Build & Deployment Helper Script for Hybrid Travel App

set -e  # Exit on error

echo "🚀 Hybrid Travel iOS Build Script"
echo "=================================="
echo ""

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to print colored output
print_step() {
    echo -e "${BLUE}📍 $1${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Check if we're in the right directory
if [ ! -f "pubspec.yaml" ]; then
    print_error "Error: pubspec.yaml not found. Please run this script from the project root."
    exit 1
fi

# Menu
echo "Select an option:"
echo "1. Clean & Install Pods"
echo "2. Build iOS (Release)"
echo "3. Build IPA for TestFlight"
echo "4. Full Clean + Rebuild"
echo "5. Open in Xcode"
echo "6. Run Flutter Analyze"
echo "7. Update Version Number"
echo ""
read -p "Enter your choice (1-7): " choice

case $choice in
    1)
        print_step "Cleaning Flutter..."
        flutter clean
        
        print_step "Getting Flutter dependencies..."
        flutter pub get
        
        print_step "Cleaning iOS Pods..."
        cd ios
        rm -rf Pods
        rm -rf Podfile.lock
        
        print_step "Installing CocoaPods..."
        pod install --repo-update
        cd ..
        
        print_success "Pods installed successfully!"
        ;;
        
    2)
        print_step "Building iOS in Release mode..."
        flutter build ios --release
        
        print_success "iOS build completed!"
        ;;
        
    3)
        print_step "Building IPA for TestFlight..."
        flutter build ipa --release
        
        print_success "IPA build completed!"
        echo ""
        echo "IPA location: build/ios/ipa/hybridtravelagency.ipa"
        ;;
        
    4)
        print_step "Starting full clean & rebuild..."
        
        print_step "Cleaning Flutter..."
        flutter clean
        
        print_step "Cleaning iOS..."
        cd ios
        rm -rf Pods
        rm -rf Podfile.lock
        rm -rf build
        rm -rf ~/Library/Developer/Xcode/DerivedData/Runner-*
        cd ..
        
        print_step "Getting Flutter dependencies..."
        flutter pub get
        
        print_step "Installing CocoaPods..."
        cd ios
        pod install --repo-update
        cd ..
        
        print_step "Building iOS..."
        flutter build ios --release
        
        print_success "Full rebuild completed successfully!"
        ;;
        
    5)
        print_step "Opening Xcode workspace..."
        open ios/Runner.xcworkspace
        
        print_success "Xcode opened!"
        echo ""
        echo "Remember to:"
        echo "  1. Select 'Any iOS Device (arm64)'"
        echo "  2. Check signing settings"
        echo "  3. Product → Archive for TestFlight"
        ;;
        
    6)
        print_step "Running Flutter analyze..."
        flutter analyze
        
        print_success "Analysis completed!"
        ;;
        
    7)
        echo ""
        echo "Current version from pubspec.yaml:"
        grep "version:" pubspec.yaml
        echo ""
        read -p "Enter new version (e.g., 1.0.1+2): " new_version
        
        # Update version in pubspec.yaml
        if [[ "$OSTYPE" == "darwin"* ]]; then
            # macOS
            sed -i '' "s/version: .*/version: $new_version/" pubspec.yaml
        else
            # Linux
            sed -i "s/version: .*/version: $new_version/" pubspec.yaml
        fi
        
        print_success "Version updated to: $new_version"
        echo ""
        echo "Don't forget to rebuild after changing version!"
        ;;
        
    *)
        print_error "Invalid choice. Please run the script again."
        exit 1
        ;;
esac

echo ""
print_success "Script completed successfully! 🎉"

