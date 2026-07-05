#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
ENV_FILE="$PROJECT_DIR/.env"

if [[ ! -f "$ENV_FILE" ]]; then
  echo "Missing $ENV_FILE — copy .env.example to .env first." >&2
  exit 1
fi

set -a
# shellcheck disable=SC1090
source "$ENV_FILE"
set +a

required_vars=(
  FIREBASE_WEB_APP_ID
  FIREBASE_ANDROID_API_KEY
  FIREBASE_ANDROID_APP_ID
  FIREBASE_ANDROID_PACKAGE_NAME
  FIREBASE_IOS_API_KEY
  FIREBASE_IOS_APP_ID
  FIREBASE_IOS_BUNDLE_ID
  FIREBASE_IOS_CLIENT_ID
  FIREBASE_IOS_REVERSED_CLIENT_ID
  FIREBASE_WINDOWS_APP_ID
  FIREBASE_MESSAGING_SENDER_ID
  FIREBASE_PROJECT_ID
  FIREBASE_STORAGE_BUCKET
)

for var in "${required_vars[@]}"; do
  if [[ -z "${!var:-}" ]]; then
    echo "Missing $var in .env" >&2
    exit 1
  fi
done

mkdir -p "$PROJECT_DIR/android/app"
mkdir -p "$PROJECT_DIR/ios/Runner"
mkdir -p "$PROJECT_DIR/ios/Runner.xcworkspace"
mkdir -p "$PROJECT_DIR/macos/Runner"

cat > "$PROJECT_DIR/android/app/google-services.json" <<EOF
{
  "project_info": {
    "project_number": "$FIREBASE_MESSAGING_SENDER_ID",
    "project_id": "$FIREBASE_PROJECT_ID",
    "storage_bucket": "$FIREBASE_STORAGE_BUCKET"
  },
  "client": [
    {
      "client_info": {
        "mobilesdk_app_id": "$FIREBASE_ANDROID_APP_ID",
        "android_client_info": {
          "package_name": "$FIREBASE_ANDROID_PACKAGE_NAME"
        }
      },
      "oauth_client": [],
      "api_key": [
        {
          "current_key": "$FIREBASE_ANDROID_API_KEY"
        }
      ],
      "services": {
        "appinvite_service": {
          "other_platform_oauth_client": []
        }
      }
    }
  ],
  "configuration_version": "1"
}
EOF

write_plist() {
  local target="$1"
  local include_client_id="$2"

  if [[ "$include_client_id" == "true" ]]; then
    cat > "$target" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CLIENT_ID</key>
	<string>$FIREBASE_IOS_CLIENT_ID</string>
	<key>REVERSED_CLIENT_ID</key>
	<string>$FIREBASE_IOS_REVERSED_CLIENT_ID</string>
	<key>API_KEY</key>
	<string>$FIREBASE_IOS_API_KEY</string>
	<key>GCM_SENDER_ID</key>
	<string>$FIREBASE_MESSAGING_SENDER_ID</string>
	<key>PLIST_VERSION</key>
	<string>1</string>
	<key>BUNDLE_ID</key>
	<string>$FIREBASE_IOS_BUNDLE_ID</string>
	<key>PROJECT_ID</key>
	<string>$FIREBASE_PROJECT_ID</string>
	<key>STORAGE_BUCKET</key>
	<string>$FIREBASE_STORAGE_BUCKET</string>
	<key>IS_ADS_ENABLED</key>
	<false></false>
	<key>IS_ANALYTICS_ENABLED</key>
	<false></false>
	<key>IS_APPINVITE_ENABLED</key>
	<true></true>
	<key>IS_GCM_ENABLED</key>
	<true></true>
	<key>IS_SIGNIN_ENABLED</key>
	<true></true>
	<key>GOOGLE_APP_ID</key>
	<string>$FIREBASE_IOS_APP_ID</string>
</dict>
</plist>
EOF
  else
    cat > "$target" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>API_KEY</key>
	<string>$FIREBASE_IOS_API_KEY</string>
	<key>GCM_SENDER_ID</key>
	<string>$FIREBASE_MESSAGING_SENDER_ID</string>
	<key>PLIST_VERSION</key>
	<string>1</string>
	<key>BUNDLE_ID</key>
	<string>$FIREBASE_IOS_BUNDLE_ID</string>
	<key>PROJECT_ID</key>
	<string>$FIREBASE_PROJECT_ID</string>
	<key>STORAGE_BUCKET</key>
	<string>$FIREBASE_STORAGE_BUCKET</string>
	<key>IS_ADS_ENABLED</key>
	<false></false>
	<key>IS_ANALYTICS_ENABLED</key>
	<false></false>
	<key>IS_APPINVITE_ENABLED</key>
	<true></true>
	<key>IS_GCM_ENABLED</key>
	<true></true>
	<key>IS_SIGNIN_ENABLED</key>
	<true></true>
	<key>GOOGLE_APP_ID</key>
	<string>$FIREBASE_IOS_APP_ID</string>
</dict>
</plist>
EOF
  fi
}

write_plist "$PROJECT_DIR/ios/Runner/GoogleService-Info.plist" false
write_plist "$PROJECT_DIR/ios/Runner.xcworkspace/GoogleService-Info.plist" true
write_plist "$PROJECT_DIR/macos/Runner/GoogleService-Info.plist" false

INFO_PLIST="$PROJECT_DIR/ios/Runner/Info.plist"
if [[ -f "$INFO_PLIST" ]]; then
  sed -i.bak \
    -e "s|YOUR_IOS_CLIENT_ID|$FIREBASE_IOS_CLIENT_ID|g" \
    -e "s|YOUR_IOS_REVERSED_CLIENT_ID|$FIREBASE_IOS_REVERSED_CLIENT_ID|g" \
    "$INFO_PLIST"
  rm -f "${INFO_PLIST}.bak"
fi

cat > "$PROJECT_DIR/firebase.json" <<EOF
{"flutter":{"platforms":{"android":{"default":{"projectId":"$FIREBASE_PROJECT_ID","appId":"$FIREBASE_ANDROID_APP_ID","fileOutput":"android/app/google-services.json"}},"ios":{"default":{"projectId":"$FIREBASE_PROJECT_ID","appId":"$FIREBASE_IOS_APP_ID","uploadDebugSymbols":false,"fileOutput":"ios/Runner/GoogleService-Info.plist"}},"macos":{"default":{"projectId":"$FIREBASE_PROJECT_ID","appId":"$FIREBASE_IOS_APP_ID","uploadDebugSymbols":false,"fileOutput":"macos/Runner/GoogleService-Info.plist"}},"dart":{"lib/firebase_options.dart":{"projectId":"$FIREBASE_PROJECT_ID","configurations":{"android":"$FIREBASE_ANDROID_APP_ID","ios":"$FIREBASE_IOS_APP_ID","macos":"$FIREBASE_IOS_APP_ID","web":"$FIREBASE_WEB_APP_ID","windows":"$FIREBASE_WINDOWS_APP_ID"}}}}}}
EOF

echo "Generated Firebase native config files from .env"
