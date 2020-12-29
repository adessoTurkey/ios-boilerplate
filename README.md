iOS Boilerplate
============================

This is the iOS boilerplate created by Adesso Turkey for new projects using Swift 5. The project's primary objective is to help the development of a new one to kick-start the environment with configurations, the required features used in common Adesso projects, and the helpful functionalities.

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
| **Application/Services**/ | Application based services will be defined here, such as logging, network, server... |
| **Configs**/ | Everything relative to build and environment configuration will be defined here |
| **Managers**/ | Managers will be put here such as LoggerManager, UtilityManager... |
| **Network**/ | Network related implementations will be defined here |
| **Scenes**/ | Application related scenes will be defined here, such as navigation viewcontrollers, storyboards... |
| **Utility**/ | Extensions, final classes etc. will be putt here  |
| **Resources**/ | Images, icons, assets, fonts, Mocks, `Localizable.strings`... 

## Workspace Preparing

- On the directory of `{project_root}/scripts/installation`, via terminal
	- run `./rename-project.swift "ios-boilerplate" "$NEW_PROJECT_NAME"` to change project name.
	- run `sh install-githooks.sh` to install git-hooks into your project. Includes following git hooks; Git hooks include SwiftLint validation, git message character limitation and issue-id check
		- pre-commit: This hook provides swiftlint control to detect errors quickly before commit.
		- commit-msg: This hook checks that messages must have a minimum 50 characters. It also tells it should contain an issue tag. Ticket id must be between square brackets and [ticketid] separated by hyphens. See example: "[ISSUE-123] commit message" or "[JIRA-56] - commit message"
	
- On your project root via terminal
	- run `pod install` - this command will regenerate workspace with Xcode.
		- [pod](https://cocoapods.org/) command & project's dependences.
	- run `open *.xcw*` - this command will open generated workspace with Xcode.

## List of Frameworks

| Framework | Description |
| ------------------------------- | --------------------------------------------------------------------- |
| [SwiftLint](https://github.com/realm/SwiftLint) | A tool to enforce Swift style and conventions. |
| [Swifter](https://github.com/SwifterSwift/SwifterSwift) | Tiny http server engine written in Swift programming language. |
| [CocoaLumberjack](https://github.com/CocoaLumberjack/CocoaLumberjack) | Powerful & flexible logging framework. |
| [CocoaDebug](https://github.com/CocoaDebug/CocoaDebug) | iOS debugging tool. |

## Useful Tools and Resources

- [CocoaPods](https://cocoapods.org/) - CocoaPods is a dependency manager for Swift and Objective-C Cocoa projects. It has over 33 thousand libraries and is used in over 2.2 million apps. CocoaPods can help you scale your projects elegantly.
- [SwiftLint](https://github.com/realm/SwiftLint) - A tool to enforce Swift style and conventions.
- [TestFlight](https://help.apple.com/itunes-connect/developer/#/devdc42b26b8) - TestFlight beta testing lets you distribute beta builds of your app to testers and collect feedback.
- [Appcenter](https://appcenter.ms/) - Continuously build, test, release, and monitor apps for every platform.

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
