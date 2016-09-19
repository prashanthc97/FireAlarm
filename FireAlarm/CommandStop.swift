//
//  CommandStop.swift
//  FireAlarm
//
//  Created by NobodyNada on 8/31/16.
//  Copyright © 2016 NobodyNada. All rights reserved.
//

import Foundation

class CommandStop: Command {
    fileprivate let REBOOT_INDEX = 4
    override class func usage() -> [String] {
        return ["stop", "halt", "shutdown", "shut down", "restart", "reboot"]
    }
    
    override func run() throws {
        let action: ChatBot.StopAction
        let reply: String
        if usageIndex < REBOOT_INDEX {
            action = .halt
            reply = "Shutting down..."
        }
        else {
            action = .reboot
            reply = "Rebooting..."
        }
        bot.room.postReply(reply, to: message)
        bot.stop(action)
    }
}
