package dev.johnoreilly.swiftexport

import kotlinx.coroutines.delay

class Greeting {
    private val platform = getPlatform()

    fun greet(): String {
        return "Hi there, ${platform.name}!"
    }

    suspend fun suspendGreet(): String {
        delay(5000)
        return "Hi there (suspend), ${platform.name}!"
    }
}