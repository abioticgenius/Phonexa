# Phonexa

Phonexa is a voice-to-voice live translation application designed to provide real-time translation between multiple languages. It aims to facilitate seamless communication by translating spoken language into another language with minimal delay.

## Features

- **Real-Time Translation:** Convert spoken language into another language in real-time.
- **Language Selection:** Choose from a variety of languages for translation.
- **User-Friendly UI:** Smooth and intuitive user interface designed with Flutter.
- **Text-to-Speech:** Read out the translated text using the appropriate font and language settings.

## Technologies Used

- **Frontend:** Flutter for mobile application development.
- **Backend:** Flask for server-side logic.
- **Database:** Firebase for storing and managing data.
- **Speech Recognition:** Mozilla DeepSpeech for converting speech to text.
- **Translation Service:** LibreTranslate and Microsoft Translator Text API for language translation.

## Installation

### Prerequisites

- **Flutter:** Ensure you have Flutter installed on your system. Follow the [Flutter installation guide](https://flutter.dev/docs/get-started/install) if you haven't set it up yet.
- **Python:** Required for running the Flask backend. Download and install Python from [python.org](https://www.python.org/).

### Clone the Repository

```bash
git clone https://github.com/your-username/Phonexa.git
cd Phonexa
```

### Set Up the Flutter Frontend

```bash
cd Phonexa
flutter pub get
flutter run
```

### Set Up the Flask Backend

```bash
cd backend
python -m venv venv
source venv/bin/activate  # On Windows use `venv\Scripts\activate`
pip install -r requirements.txt
python app.py
```

## Configuration
- **Translation API:** Ensure that the LibreTranslate server is running and accessible at https://f8d8-223-185-135-170.ngrok-free.app or adjust the URL in the code if necessary.
- **Firebase:** Set up Firebase and configure it according to your project needs.

## Usage

```text
Launch the Phonexa application on your mobile device.
Select the source and target languages using the dropdown menu.
Press the record button to start translating your speech in real-time.
The translated text will be displayed and read out using text-to-speech.
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE.md) file for details.

## Acknowledgements

**Flutter:** For providing a powerful framework for building cross-platform applications.
**Mozilla DeepSpeech:** For accurate speech recognition.
**LibreTranslate:** For providing translation services.
**Firebase:** For offering a robust database and authentication system.

## Contact

For any questions or support, please contact proshan2004@gmail.com.



