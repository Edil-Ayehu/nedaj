# Keep model classes
-keep class com.example.models.** { *; }

# Keep your Transaction model class (if applicable)
-keep class com.example.nedaj.Transaction { *; }

# Keep the flutter plugin (if applicable)
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# If you're using GetX for translation
-keep class **.R {
    <fields>;
}

# Keep Glide (if used internally by FancyShimmerImage or any image loading library)
-keep class com.bumptech.glide.** { *; }
-keep interface com.bumptech.glide.** { *; }

# Keep FancyShimmerImage
-keep class com.**.FancyShimmerImage { *; }


