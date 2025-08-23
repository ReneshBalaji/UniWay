// Top-level build file where you can add configuration options common to all sub-projects/modules.
buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        // Keeping the higher version for Android Gradle Plugin
        classpath("com.android.tools.build:gradle:8.5.1")
        // Keeping the higher version for Kotlin Gradle Plugin
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:1.9.22")
    }
}

// Allprojects block is often not needed at the top-level build.gradle.kts
// It's typically handled by pluginManagement or subprojects block.
// If you intended to have it here, make sure its content is valid.
// For a standard Flutter project, this block at the top-level is often removed or empty.

// Corrected build directory setup, typically for the root project build directory
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    // This ensures each subproject uses a build directory within the root "build" folder
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

tasks.register("clean", Delete::class) {
    delete(rootProject.buildDir)
}