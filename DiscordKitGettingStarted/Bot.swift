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
    private static let HELLO_MESSAGES = [
        "Hello, World!",
        "Helloooo! I can hear you!",
        "Who's there?",
        "Beep, boop, I'm a bot.",
        "I'm alive!"
    ]

    static let bot = Client(intents: .unprivileged)

    private static func registerSlashCommands() async throws {
        try await bot.registerApplicationCommands(guild: ProcessInfo.processInfo.environment["COMMAND_GUILD_ID"]) {
            NewAppCommand("hello", description: "Get a nice hello message") {
                StringOption("name", description: "Your beautiful name")
            } handler: { interaction in
                print("Received hello interaction!")
                if let name: String = interaction.optionValue(of: "name") {
                    try? await interaction.reply("Hello \(name), hope you're having a wonderful day!")
                } else {
                    // Reply with a random hello message
                    try? await interaction.reply(HELLO_MESSAGES.randomElement()!)
                }
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
