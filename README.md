# Assignment for JethiTech Internship

## Assignment details:
-	Use the attached json file as your mock data as API response, parse this user data and display in a list view, alongside his name there will be button named sign-in!
-	Once the user taps on his name for the first time, he’ll be prompted a dialog where he need to fill in his age and gender, once they have done so, it’ll take the user to the new screen where he’ll be displayed his name, age, gender!
-	Now, once this is done every individual users sign-in is retained in local storage, using DB of your preference like getStorage, hive… so now the sign-in button alongside the name changes to sign-out.
-	The next time, user clicks over his name he is not shown the dialog, simply taken to next screen, where his details name, age, and gender is shown.
-	On clicking sign-out, we remove user sign-in state from the local DB, so button toggles to sign-in once again!

## Packages used:
1. [flutter_bloc](https://pub.dev/packages/flutter_bloc)
2. [hive](https://pub.dev/packages/hive)
3. [hive_flutter](https://pub.dev/packages/hive_flutter)
4. [google_fonts](https://pub.dev/packages/google_fonts)
5. [hive_generator](https://pub.dev/packages/hive_generator)
6. [build_runner](https://pub.dev/packages/google_fonts)
