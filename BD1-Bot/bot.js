// Require the necessary discord.js classes
const { Client, Intents } = require("discord.js");
const { token } = require("./config.json");

// Create a new client instance
const client = new Client({ intents: [Intents.FLAGS.GUILDS] });
const getLastLine = require("./utilities/fileTool").getLastLine;
const serverLog = "/home/ec2-user/screenlog.0";
const minLineLength = 1;
const { exec } = require("child_process");

client.once("ready", () => {
  console.log("Ready!");
});

client.on("interactionCreate", async (interaction) => {
  if (!interaction.isCommand()) return;

  const { commandName } = interaction;

  if (commandName === "ping") {
    await interaction.reply("Pong!");
  } else if (commandName === "server") {
    await interaction.reply(
      `Server name: ${interaction.guild.name}\nTotal members: ${interaction.guild.memberCount}`
    );
  } else if (commandName === "user") {
    await interaction.reply(
      `Your tag: ${interaction.user.tag}\nYour id: ${interaction.user.id}`
    );
  } else if (commandName === "online") {
    exec(
      "screen -S tachyonServer -p 0 -X stuff '/online^M'",
      (error, stdout, stderr) => {
        if (error) {
          console.log(`error: ${error.message}`);
          return;
        }
        if (stderr) {
          console.log(`stderr: ${stderr}`);
          return;
        }
        setTimeout(() => {
          getLastLine(serverLog, 1)
            .then((lastLine) => {
              await interaction.reply(lastLine);
            })
            .catch((err) => {
              console.error(err);
            });
        }, 1000);
      }
    );
  }
});

client.login(token);
