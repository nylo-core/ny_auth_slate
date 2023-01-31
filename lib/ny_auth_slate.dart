library ny_auth_slate;

import '/stubs/buttons.dart';
import '/stubs/login_page.dart';
import '/stubs/register_page.dart';
import '/stubs/text_fields.dart';
import 'package:nylo_support/metro/constants/strings.dart';
import 'package:nylo_support/metro/models/ny_template.dart';

/*
|--------------------------------------------------------------------------
| Publish template files
|
| Add your template to the `run` method and create a stub.
| Run the below in the terminal to create your stubs.
| "flutter pub run ny_auth_slate:main publish:all"
|
| Learn more https://nylo.dev/docs/4.x/slates
|--------------------------------------------------------------------------
*/

List<NyTemplate> run() => [
      NyTemplate(
        name: "login",
        saveTo: pagesFolder,
        pluginsRequired: [],
        stub: stubLoginPage(),
      ),
      NyTemplate(
        name: "register",
        saveTo: pagesFolder,
        pluginsRequired: ['url_launcher'],
        stub: stubRegisterPage(),
      ),
      NyTemplate(
        name: "buttons",
        saveTo: widgetsFolder,
        pluginsRequired: [],
        stub: stubButtons(),
      ),
      NyTemplate(
        name: "text_fields",
        saveTo: widgetsFolder,
        pluginsRequired: [],
        stub: stubTextFields(),
      ),
    ];

/*
|--------------------------------------------------------------------------
| Reference - saveTo Accepted Folders
|
| controllersFolder = 'lib/app/controllers';
| widgetsFolder = 'lib/resources/widgets';
| pagesFolder = 'lib/resources/pages';
| modelsFolder = 'lib/app/models';
| themesFolder = 'lib/resources/themes';
| providerFolder = 'lib/app/providers';
| eventsFolder = 'lib/app/events';
| networkingFolder = 'lib/app/networking';
| themeColorsFolder = 'lib/resources/themes/styles';
|--------------------------------------------------------------------------
*/
