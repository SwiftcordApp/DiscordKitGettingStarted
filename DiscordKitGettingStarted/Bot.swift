//
//  Bot.swift
//  DiscordKitGettingStarted
//
//  Created by Vincent Kwok on 14/12/22.
//

import Foundation
import DiscordKitBot // Import the DiscordKit module for all the wonders contained within

/// The main entrypoint of our Discord bot
@main
public struct Bot {
    static let bot = Client(intents: .unprivileged)

    private static func registerSlashCommands() async throws {
        try await bot.registerApplicationCommands(guild: ProcessInfo.processInfo.environment["COMMAND_GUILD_ID"]) {
            NewAppCommand("hello", description: "Get a nice hello message") { interaction in
                print("Received hello interaction!")
            }
        }
    }

    public static func main() {
        bot.ready.listen {
            print("Successfully logged in as \(bot.user!.username)#\(bot.user!.discriminator)!")

            // Register slash commands after logging in
            do {
                print("Registering interactions...")
                try await registerSlashCommands()
                print("Registered interactions!")
            } catch {
                print("Failed to register interactions: \(error.localizedDescription)")
            }
        }

        // Login to Discord's API
        bot.login()

        // Run the main RunLoop to prevent the program from exiting
        RunLoop.main.run()
    }
}
