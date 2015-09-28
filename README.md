# instabug-cordova-plugin

Offers an easy Instabug (https://instabug.com) integration in your cordova projects.

## Installation

```
cordova plugin add com.instabug.phonegap --save
```

## Usage

```
instabug.init(CONFIG);

instabug.invoke();

instabug.invokeBugReporter();

instabug.invokeFeedbackSender();
```

### Configuration

Configuration can be passed in init function and reflects Instabug API reference (https://instabug.com/public/ios-api-reference/hierarchy.html).

The options are:

|      Option       |    Value   |   Required   |     Description   |
|-------------------|------------|--------------|-------------------|
| iosToken | String |  true  | The token that identifies the app, you can find it on your dashboard |
| barBackground | String |       | The header background and buttons font color |
| barForeground | String |       | The buttons background and the header font color |
| bugHeaderText | String |       | The text displayed in the header and the action sheet representing bug reports |
| feedbackHeaderText | String |       | The text displayed in the header and the action sheet representing feedback reports |
| appLocale | String |       | The locale used to display the strings in the correct language. [Check list below.](#Locales) |
| emailEnabled | Boolean |       | Sets the default value of whether to ask the user for an email or not |
| emailRequired | Boolean |       | Sets the value of whether the email field is required or not |
| showTutorial | Boolean |       | Sets the default value of the tutorial alert, that gets shown on launching the first bug report |

#### <a id="Locales"></a>Locales

Available values are :

IBGLocaleArabic,
IBGLocaleChineseSimplified,
IBGLocaleChineseTraditional,
IBGLocaleEnglish,
IBGLocaleFinnish,
IBGLocaleFrench,
IBGLocaleGerman,
IBGLocaleItalian,
IBGLocaleJapanese,
IBGLocaleKorean,
IBGLocalePolish,
IBGLocalePortuguese,
IBGLocalePortugueseBrazil,
IBGLocaleRussian,
IBGLocaleSlovenian,
IBGLocaleSpanish,
IBGLocaleSwedish,
IBGLocaleTurkish