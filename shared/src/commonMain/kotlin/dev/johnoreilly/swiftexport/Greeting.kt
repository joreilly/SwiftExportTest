package dev.johnoreilly.swiftexport

import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow


class Greeting {
    private val platform = getPlatform()

    fun greet(): String {
        return "Hi there, ${platform.name}!"
    }

    fun flowTest(): Flow<String> {
        return flow {
            var index = 0
            while (true) {
                emit("hi ${index++}")
                delay(2000L)
            }
        }
    }

    suspend fun suspendGreet(): String {
        delay(5000)
        return "Hi there (suspend), ${platform.name}!"
    }
}