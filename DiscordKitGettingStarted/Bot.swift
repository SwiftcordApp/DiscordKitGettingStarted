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

    public static func main() {
        bot.ready.listen {
            print("Successfully logged in as \(bot.user!.username)#\(bot.user!.discriminator)!")
        }

        // Login to Discord's API
        bot.login()

        // Run the main RunLoop to prevent the program from exiting
        RunLoop.main.run()
    }
}
