<p align="center">
<img src="https://infinapps.com/wp-content/uploads/2018/10/mongodb-logo.png" alt="MongoDB" width="275" height="275" />
</p>

## MongoDB-Roblox
Oh hey there! Welcome.

You may have some questions such as: 

* What is this?
* Well MongoDB-Roblox is a wrapper for mongodb in roblox
* Why not just use the datastore roblox provides?
* If you use this you will be able to access your data from anywhere, such as a discord bot, web dashboard etc..
* How do I start using this?
* Well continue reading as the tutorial part is coming up

## Getting started
To start using MongoDB-Roblox you will need an api key, you can get this by getting in contact with me on discord through [my profile](https://discord.com/users/638476135457357849).

Steps: 

* Copy the mongo.lua script code from the src folder
* Paste it in a module script named to your liking (default is "mongo", you will need this name to require the module into other scripts)
* Go to ServerStorage and make a folder called "DB"
* In the DB folder put 2 string values in, "url' and "key".
* Set the "key" value to the api key, and the url key to the api url (https://api-production-ewox.up.railway.app/)

You're now done with the setup!

## Documentation 
Defining: 
We in this case assume that "db" is defined as `local db = require(game:GetService("ServerScriptService").mongo)`

Properties: 
* Params are the parameters to search for, this needs to be a lua table like so: `{user = "669882318"}`.
* Model is the mongoDB model name where you need to search, you will have yor own model names like `korabi-money` or `korabi-rebirths`. 
* Update is only used in db:Update() and it is a lua table of what needs to be changed in the info.

Functions: <br>
<br>
db:Find(Params, Model)<br>
db:Create(Params, Model)<br>
db:Delete(Params, Model)<br>
db:Update(Params, Model, Update)<br>

<br>
Support: <br>
<br>
For support send me a friend request on discord via [my profile](https://discord.com/users/638476135457357849)
<br>
Example: <br>
<br>

```lua
local db = require(game:GetService("ServerScriptService").mongo)

game:GetService("Players").PlayerAdded:Connect(function(player)
	local ls = Instance.new("Folder", player)
	ls.Name = "leaderstats"
	local money = Instance.new("IntValue", ls)
	money.Name = "money"
	money.Value = 0
	local data = db:Find({user = tostring(player.userId)}, "money")
	print(data)
	if data.success == true then
		money.Value = data.money
	else
		data = db:Create({user = tostring(player.userId), money = 0, name = player.Name}, "money")
		print("new data for player ".. player.Name)
	end
end)

game:GetService("Players").PlayerRemoving:Connect(function(player)
	local data = db:Update({user = tostring(player.userId)}, "money", {money = player.leaderstats.money.Value, name = string.lower(player.Name)})
	if data.success == true then
		print("saved")
	else
		print(data)
		print("error while saving")
	end
end)

game.ReplicatedStorage.click.OnServerEvent:Connect(function(p)
	p.leaderstats.money.Value = p.leaderstats.money.Value + 1
end)
```
Thanks for visiting!

\- Korabi, Owner and Head Developer.