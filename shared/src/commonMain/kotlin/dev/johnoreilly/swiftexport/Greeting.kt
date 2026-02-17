package dev.johnoreilly.swiftexport

import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.currentCoroutineContext
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow
import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.isActive


data class GreetingValue(val name: String)

class Greeting {
    private val platform = getPlatform()

    fun greet(): String {
        return "Hi there, ${platform.name}!"
    }

    fun flowTest(): Flow<GreetingValue> {
        return flow {
            var index = 0
            while (true) {
                emit(GreetingValue("hi ${index++}"))
                delay(2000L)
            }
        }
    }

    suspend fun suspendGreet(): String {
        delay(5000)
        return "Hi there (suspend), ${platform.name}!"
    }
}