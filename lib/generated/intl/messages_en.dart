// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "error_confirm_password_required": MessageLookupByLibrary.simpleMessage(
      "Please confirm your password",
    ),
    "error_email_invalid": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid email address",
    ),
    "error_email_required": MessageLookupByLibrary.simpleMessage(
      "Email is required",
    ),
    "error_field_required": MessageLookupByLibrary.simpleMessage(
      "This field is required",
    ),
    "error_password_number": MessageLookupByLibrary.simpleMessage(
      "Password must contain at least one number",
    ),
    "error_password_required": MessageLookupByLibrary.simpleMessage(
      "Password is required",
    ),
    "error_password_short": MessageLookupByLibrary.simpleMessage(
      "Password must be at least 6 characters",
    ),
    "error_password_uppercase": MessageLookupByLibrary.simpleMessage(
      "Password must contain at least one uppercase letter",
    ),
    "error_passwords_not_match": MessageLookupByLibrary.simpleMessage(
      "Passwords do not match",
    ),
    "error_phone_invalid": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid phone number",
    ),
    "error_phone_required": MessageLookupByLibrary.simpleMessage(
      "Phone number is required",
    ),
    "error_username_at": MessageLookupByLibrary.simpleMessage(
      "Username cannot contain @",
    ),
    "error_username_required": MessageLookupByLibrary.simpleMessage(
      "Username is required",
    ),
    "error_username_short": MessageLookupByLibrary.simpleMessage(
      "Username must be at least 3 characters",
    ),
  };
}
