import org.jetbrains.kotlin.gradle.plugin.mpp.apple.swiftexport.SWIFT_EXPORT_COROUTINES_SUPPORT_TURNED_ON
import org.jetbrains.kotlin.gradle.swiftexport.ExperimentalSwiftExportDsl

plugins {
    alias(libs.plugins.kotlinMultiplatform)
    
}

kotlin {
    iosArm64()
    iosSimulatorArm64()

    @OptIn(ExperimentalSwiftExportDsl::class)
    swiftExport {
        moduleName = "Shared"
        flattenPackage = "dev.johnoreilly.swiftexport"

        configure {
            settings.put(SWIFT_EXPORT_COROUTINES_SUPPORT_TURNED_ON, "true")
        }
    }

    sourceSets {
        commonMain.dependencies {
            implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
        }
        commonTest.dependencies {
        }
    }
}

