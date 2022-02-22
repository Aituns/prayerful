import 'package:firebase_auth/firebase_auth.dart';

import 'package:prayerful/utils/date_converter.dart';

final uid = FirebaseAuth.instance.currentUser!.uid.toString();

DateConverter dc = DateConverter();
