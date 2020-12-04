IOS Boilerplate
============================

Table of Contents
-----------------

- [Prerequisites](#prerequisites)
- [Project Structure](#project-structure)
- [Workspace Preparing](#workspace-preparing)
- [List of Frameworks](#list-of-frameworks)
- [License](#license)

## Prerequisites

- [MacOS Mojave (10.14.3 or higher)](https://support.apple.com/kb/SP777)
- [Xcode 11 or higher](https://developer.apple.com/download/) ~ Swift 5.0
- [CocoaPods 1.4.0 or higher](https://cocoapods.org/#install)

## Project Structure

| Name | Description |
| --- | --- |
| **Application/**/Services/ | Application based services will be defined here, such as logging, network, server... |
| **Configs**/ | Everything relative to build and ennvirenment configuration will be defined here |
| **Managers**/ | Managers will be put here such as LoggerManager, UtilityManager... |
| **Network**/ | Network related implementations will be defined here |
| **Scenes**/ | Application related scenes will be defined here, such as navigation viewcontrollers, storyboards... |
| **Utility**/ | Extensions, final classes etc. will be putt here  |
| **Resources**/ | Images, icons, assets, fonts, Mocks, `Localizable.strings`... 


## Workspace Preparing

- change your working directory to `scripts/installation` then copy `rename-project.swift file to root directory`  from the terminal `$./rename-project.swift "$OLD_PROJECT_NAME" "$NEW_PROJECT_NAME"` - this will change project name.
- change your working directory to  `scripts/installation` `$sh install-githooks.sh` - this will install git-hooks into your project.
- `pod install` - this command will regenerate workspace with Xcode.
	- [pod](https://cocoapods.org/) command & project's dependences.
- `open *.xcw*` - this command will open generated workspace with Xcode.

## List of Frameworks

| Framework | Description |
| ------------------------------- | --------------------------------------------------------------------- |
| SwiftLint | A tool to enforce Swift style and conventions. |
| Swifter | Tiny http server engine written in Swift programming language. |
| CocoaLumberJack | Powerful & flexible logging framework. |
| CocoaDebug | iOS debugging tool. |

## Useful Tools and Resources

- [CocoaPods](https://cocoapods.org/) - CocoaPods is a dependency manager for Swift and Objective-C Cocoa projects. It has over 33 thousand libraries and is used in over 2.2 million apps. CocoaPods can help you scale your projects elegantly.
- [SwiftLint](https://github.com/realm/SwiftLint) - A tool to enforce Swift style and conventions.
- [TestFlight](https://help.apple.com/itunes-connect/developer/#/devdc42b26b8) - TestFlight beta testing lets you distribute beta builds of your app to testers and collect feedback.

## License

```
Copyright 2020 adesso Turkey

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
