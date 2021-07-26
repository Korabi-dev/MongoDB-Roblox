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

Support: <br>
<br>
For support send me a friend request on discord via [my profile](https://discord.com/users/638476135457357849)


Thanks for visiting!

- Korabi, Owner and Head Developer.