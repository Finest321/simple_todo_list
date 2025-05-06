
# ✅ Simple ToDo List App

Welcome to my **Simple ToDo List** app! This is a Flutter-based mobile application built to help you stay organized by creating and managing tasks. With seamless integration with **Firebase**, the app ensures that your tasks are synced in real-time. The app follows the **BLoC pattern** for state management, which makes it both scalable and maintainable.

## 📱 Features

* **Add Tasks**: Easily create new tasks on the go.
* **Delete Tasks**: Quickly remove tasks you no longer need.
* **Toggle Completed/Incomplete**: Mark tasks as completed or revert them back.
* **Real-Time Sync**: Your tasks are stored in Firebase Firestore, ensuring that they sync across devices instantly.
* **User-Friendly Interface**: Built with modern Flutter widgets to ensure smooth performance on both Android and iOS.

## 🔧 Tech Stack

* **Flutter**: Cross-platform mobile development framework for creating apps on both Android and iOS.
* **Dart**: The programming language powering Flutter.
* **BLoC (flutter\_bloc)**: A pattern for managing the app's state in a predictable and reusable way.
* **Firebase Firestore**: Cloud-based NoSQL database that provides real-time syncing and storage for your tasks.
* **GetIt** *(optional)*: A dependency injection solution to manage app services and dependencies in a clean way.

## 🧑‍💻 Usage

Here’s how to get started with the app:

1. **Create Tasks**: Use the floating action button on the HomeScreen to add new tasks. The task will be displayed under the "Recent" section.
2. **Mark as Completed**: You can mark tasks as complete by checking the checkbox. Completed tasks will move to the bottom of the list.
3. **Delete Tasks**: Simply tap and hold to delete tasks, or swipe left to remove them from the list.
4. **Real-Time Sync**: Changes made to the tasks are automatically synced to Firebase, making the data available on any device in real time.

## 📁 Project Structure

The project is organized in the following structure:

```
lib/
├── bloc/             # Contains BLoC files like TaskBloc, TaskEvent, TaskState
├── models/           # Task model (Task.dart)
├── repository/       # TaskRepository (handles Firebase logic)
├── screens/          # HomeScreen and other UI screens
├── widgets/          # Reusable components like buttons and dialogs
└── main.dart         # The entry point of the application
```

## 🧑‍💻 Contributing

Contributions are always welcome! Feel free to submit a pull request, report issues, or suggest new features.

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-name`).
3. Commit your changes (`git commit -m 'Add new feature'`).
4. Push your branch to your forked repository (`git push origin feature-name`).
5. Create a pull request.

## 📄 License

This project is licensed under the MIT License.
See the [LICENSE](LICENSE) file for more details.

## 📚 Helpful Resources

Here are some helpful resources that helped me build this app:

* [Flutter Documentation](https://flutter.dev/docs)
* [Firebase for Flutter](https://firebase.flutter.dev/docs/overview)
* [flutter\_bloc Package](https://pub.dev/packages/flutter_bloc)
* [Cloud Firestore](https://firebase.google.com/docs/firestore)

## 📬 Contact

Feel free to get in touch if you have any questions, feedback, or ideas for collaboration:

* **Email**: [unwanaudofa49@gmail.com](mailto:unwanaudofa49@gmail.com)
* **GitHub**: [Finest321](https://github.com/Finest321)
* **LinkedIn**: [Unwana Udofa](https://www.linkedin.com/in/unwana-udofa-9884201a4)

I'm open to job opportunities and collaborations. Let’s connect!


