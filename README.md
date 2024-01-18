# Debug View iOS

The Debug Package lets you easily add values meant for debugging purposes and showing them anywhere in your app.

## Getting Started

`DebugController` is used to add and store values meant for debugging purposes and `DebugScreen` (SwiftUI) or if you are using UIKit based apps, just wrap it in a `UIHostingController`, is used for displaying them.

## Creating Items
### Values

To create static or dynamic values (either `String` or your own Type which conforms to `CustomDebugStringConvertible` or `CustomStringConvertible`), use either of the initializers of the `DebugValue` struct.

#### Static Values

```swift
DebugValue(
    id: "staticValue",
    label: "Static Value",
    staticValue: "Your static value"
)
```
> ###### Notes
> Static values are evaluated when the `DebugValue` is instantiated.

#### Dynamic Values

```swift
DebugValue(
    id: "dynamicValueAutoClosure",
    label: "Dynamic Value Auto Closure",
    value: String(Int.random(in: 1 ... 6))
)
```

or:

```swift
DebugValue(
    id: "dynamicValueClosure",
    label: "Dynamic Value Closure",
    value: {
        String(Int.random(in: 1 ... 6))
    }
)
```

> ###### Notes
> Dynamic values are wrapped in a closure with `@autoclosure` or your own closure, and evaluated when the `DebugScreen` is shown. Every time the `DebugScreen` is shown again, values are re-evaluated.

### Buttons

To create buttons which perform a custom action, use the `DebugButton` struct.

```swift
DebugButton(
    id: "button",
    label: "The button label",
    action: {
        // your custom action
    }
)
```

#### Notes
> Make sure that your `DebugValue` or `DebugButton`s `id`s are unique, as they are used for diffing and identifying the item.

## Sections

Items are grouped by sections, making the information easier to read. Items are added to sections when inserting them into the `DebugController`.

```swift
DebugSection(
    id: "app",
    label: "App"
)
```

> ###### Notes
> Make sure that your `id`s are unique, as they are used for diffing and identifying the section.

## Adding Items

Add items to the `DebugController` by calling either of these functions:

- `addButton(_ button: DebugButton, toSection section: DebugSection)`
- `addValue(_ value: DebugValue, toSection section: DebugSection)`

> ###### Notes
> - Adding item with the same `id` twice will override the item in the `DebugController`s store.
> - Only items added with any of the above-mentioned methods are shown in the `DebugScreen`.
> - Sections and Values are ordered by time of insert. This means they will appear in the order they were added to the `DebugController`.

## Showing the Debug Screen

For SwiftUI based apps:

```swift
DebugScreen(
    controller: debugController,
    appearance: debugAppearance
)

```

For UIKit based apps, wrap the `DebugScreen` in a `UIHostingController`.

### Debug Screen Appearance
The `DebugScreen`s appearance can be configured via the `DebugScreenAppearance` struct.

```DebugScreenAppearance(tintColor: .red)```

## Defaults

The following `DebugValue`s exist by default:

```swift
public extension DebugValue {
    static let appVersion = DebugValue(
        id: "appVersion",
        label: "Version",
        value: Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    )
    
    static let appBuildNumber = DebugValue(
        id: "appBuildNumber",
        label: "Build Number",
        value: Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    )
    
    static let appBundleId = DebugValue(
        id: "bundleId",
        label: "Bundle Identifier",
        value: Bundle.main.bundleIdentifier
    )
    
    static let userLocale = DebugValue(
        id: "locale",
        label: "Locale",
        value: Locale.autoupdatingCurrent.identifier
    )
    
    static let deviceOSVersion = DebugValue(
        id: "deviceOSVersion",
        label: "OS Version",
        value: "\(UIDevice.current.systemName) \(UIDevice.current.systemVersion)"
    )
    
    static let deviceOSModel = DebugValue(
        id: "deviceOSModel",
        label: "Model",
        value: UIDevice.current.model
    )
    
    static let pushNotificationsRegistered = DebugValue(
        id: "pushNotificationsRegistered",
        label: "Push Notifications registered",
        value: UIApplication.shared.isRegisteredForRemoteNotifications
    )
}
```

The following `DebugSection`s exist by default:

```swift
public extension DebugSection {
    static let app = DebugSection(id: "app", label: "App")
    static let user = DebugSection(id: "user", label: "User")
    static let device = DebugSection(id: "device", label: "Device")
    static let pushNotifications = DebugSection(id: "pushNotifications", label: "Push Notifications")
}

```
