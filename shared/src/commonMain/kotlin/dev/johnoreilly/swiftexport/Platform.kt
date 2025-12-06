package dev.johnoreilly.swiftexport

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform