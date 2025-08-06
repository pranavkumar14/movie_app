# Keep Flutter and plugin classes
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# Keep Retrofit, Gson, etc.
-keep class retrofit2.** { *; }
-keep class com.google.gson.** { *; }
-keepattributes Signature
-keepattributes *Annotation*
