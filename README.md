# WasedaTime_mobile

[WasedaTime](https://wasedatime.com) (stands for Waseda Timetable) is a non-profit & student-run open source web app for syllabus searching, course reviews and bus schedule checking at Waseda University.

## Built With

**Backend**

You can view the repository [here](https://github.com/wasedatime/wasedatime-backend).

- [Amazon Web Service](https://aws.amazon.com/) - Fully powered by AWS.

**Frontend (Client)**

You can view the repository [here](https://github.com/wasedatime/wasedatime-web)

- Common
  - [Single-spa](https://single-spa.js.org) - A framework to bring together multiple JavaScript microfrontends in a frontend application.
  - [Styled Components](https://www.styled-components.com) - Library used for adding CSS to React components.
- Root
  - [Tailwind](https://tailwindcss.com) - A utility-first CSS framework packed with classes with humen-friendly name; highly customizable.
- Syllabus
  - [Redux](https://redux.js.org) - Library used to manage the state of front-end.
  - [Semantic UI React](https://react.semantic-ui.com) - Official React integration for Semantic UI, a development framework that helps create layouts with prebuilt components easily.
- Campus
  - [React Bootstrap](https://react-bootstrap.github.io) - Official React integration for Bootstrap, a frequently updated development framework that helps create layouts with prebuilt components easily.

# Prerequisites

Before you get started, make sure you have the following software installed on your system:

- Flutter: Follow the instructions on the Flutter website to install the SDK and configure the necessary environment variables.
- Dart SDK: Install the Dart SDK if it isn't already included in your Flutter installation.
- Android Studio (Optional): Recommended for Android app development. Includes the Android SDK and emulator.
- Xcode (Optional, macOS only): Required for iOS app development.

# Getting Started

This project is a starting point for a Flutter application for WasedaTime:

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Follow these steps to set up and run the project:

### Git/GitHub

1.  Create a GitHub account if you haven't
2.  If you are a member of our development team, tell me your username or email so that I can add you to our GitHub team.
3.  Install Git on your computer (local): https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

### Clone WasedaTime

```
// By HTTP
git clone https://github.com/wasedatime/wasedatime-mobile.git
// By SSH
git clone git@github.com:wasedatime/wasedatime-mobile.git
```

Then move into the cloned repository:

```
cd wasedatime-web
```

Run `git status` or `git branch` to confirm that you are on `master` branch

### Instal dependencies

```
flutter pub get
```

### Run the app

To run the app on an emulator or physical device, first ensure that a device is running.

For Android:

- Open Android Studio and launch the Android Virtual Device (AVD) Manager to start an emulator.
- Or, connect a physical Android device to your computer via USB with USB debugging enabled.

For iOS (macOS only):

- Open Xcode and start the iOS Simulator.
- Or, connect a physical iOS device to your computer with a valid provisioning profile.
- Now, run the app using the following command:

```
flutter run
```

## Branches

- **main**: The released version. The website actually viewed and used by users is run according to the code in `master`.
- **develop**: Having the latest changes ready to be released. Sometimes different features may conflict with each other, which you would not find during the development on your branch, and that's why this `develop` branch is needed: Merge different new changes and test them with `develop` before officially release
- **feature/name-of-your-feature**: Should be created from `develop`. You should always develop your feature on this branch. If you are working on multiple new features, create different feature branches for each of them
- **hotfix**: Created from `master` and directly pushed backed to `master` after development. This is only for debugging in emergency.

# Contributing

We welcome any developers to submit an issue or a pull request! :blush:
For any developers who want to make contribution, including our members, please refer to the following steps!

## Steps

### Before development

1. Make a new branch from `develop` branch called “feature/(name)”
   ```
   git checkout develop
   git checkout -b feature/{name-of-your-new-feature}
   ```
2. Then you can run `git status` or `git branch` again to confirm that you are on a new branch.

3. Begin your development!

### Commit during development

Whenever there is some progress in your work, commit it.

1. Run `git status` to check what files are changed during your development.

2. Let Git know what files are ready to be committed

   ```
   git add path/to/the/file
   // or you can add all changed files by:
   git add .
   ```

3. Commit your changes with a message precisely but specifically describing your changes

   ```
   git commit -m "feat: styling of the clean button"
   ```

   Please refer to this link about how to write a commit message: https://www.conventionalcommits.org/en/v1.0.0/

4. Push your changes to GitHub
   ```
   git push origin feature/{name-of-your-new-feature}
   ```

_Code editor like VScode has functionality for you to do the above steps without typing them one by one. What you need to do will not change; it just make the process more convenient._

### Finish development

1. On the [repository page](https://github.com/wasedatime/wasedatime-mobile), click on the `Pull Request` tab, and then click the `New pull request` button.
2. Set the **base** branch to `develop`, **compare** branch to your branch.
3. Click `Create pull request` button.
4. Inform us that you have created a Pull Request (PR) and we will review it.
5. Continue developing if we found anything to be improved
6. If everything is OK, GREAT JOB! We will merge it into `develop`.
7. **Delete your feature branch on local**
   ```
   git branch -D feature/{name-of-your-finished-feature}
   ```

## Create a new app (micro-app) in WasedaTime

_This section is being moved to internal documentation since it is an instruction for creating new & big features, which would be leave to our team members._

# License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
