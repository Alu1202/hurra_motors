import java.util.Properties
import java.io.FileInputStream
plugins {
    id("com.android.application")

    // Firebase
    id("com.google.gms.google-services")
    id("com.google.firebase.crashlytics")

    // Kotlin (FIXED)
    id("org.jetbrains.kotlin.android")

    // Flutter (must be last)
    id("dev.flutter.flutter-gradle-plugin")
}
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")

if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(
     FileInputStream(keystorePropertiesFile)
    )
}

android {
    namespace = "com.example.hurra_motors"
    compileSdk = 35

    ndkVersion = flutter.ndkVersion

    signingConfigs {
        create("release") {
            if (keystorePropertiesFile.exists()) {
                storeFile = file(keystoreProperties.getProperty("releaseStoreFile"))
                storePassword = keystoreProperties.getProperty("releaseStorePassword")
                keyAlias = keystoreProperties.getProperty("releaseKeyAlias")
                keyPassword = keystoreProperties.getProperty("releaseKeyPassword")
            }
        }
    }

    defaultConfig {
        applicationId = "com.example.hurra_motors"

        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion

        versionCode = flutter.versionCode
        versionName = flutter.versionName

        multiDexEnabled = true
    }

    /* ================================
       Java & Kotlin
    ================================ */
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
        isCoreLibraryDesugaringEnabled = true
    }

    kotlin {
        jvmToolchain(17)
    }

    /* ================================
       Build Types
    ================================ */
    buildTypes {
        getByName("release") {
            // ⚠️ Change this before Play Store upload
            signingConfig = signingConfigs.getByName("release")

            isMinifyEnabled = true
            isShrinkResources = true

            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }

        getByName("debug") {
            isMinifyEnabled = false
            isShrinkResources = false
        }
    }
    buildFeatures {
        viewBinding = true
    }
}

dependencies {
    implementation("androidx.glance:glance-appwidget:1.1.1")
    implementation("androidx.compose.runtime:runtime:1.11.2")
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.5")

    implementation("androidx.multidex:multidex:2.0.1")
}

flutter {
    source = "../.."
}
