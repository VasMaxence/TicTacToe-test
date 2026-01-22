import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("env")

    productFlavors {
        create("dev") {
            dimension = "env"
            applicationId = "com.hlcb.tictactoe.dev"
            resValue(type = "string", name = "app_name", value = "TicTacToe [Dev]")
        }
        create("staging") {
            dimension = "env"
            applicationId = "com.hlcb.tictactoe.staging"
            resValue(type = "string", name = "app_name", value = "TicTacToe [Staging]")
        }
        create("prod") {
            dimension = "env"
            applicationId = "com.hlcb.tictactoe"
            resValue(type = "string", name = "app_name", value = "TicTacToe")
        }
    }
}