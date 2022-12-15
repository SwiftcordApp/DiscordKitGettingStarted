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
        // This is your main function, which will be ran when your app starts
        print("Hello world!")
    }
}
