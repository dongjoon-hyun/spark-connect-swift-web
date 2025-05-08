import Vapor
import SparkConnect

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        return await Task {
            do {
                let spark = try await SparkSession.builder.getOrCreate()
                let response = "Connected to Apache Spark \(await spark.version) Server"
                await spark.stop()
                return response
            } catch {
                return "Fail to connect: \(error)"
            }
        }.value
    }
}
