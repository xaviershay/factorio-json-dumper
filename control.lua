local json = require "json"

interface = {}
interface.recipes = function()
	-- To ensure they are all there...
	game.player.force.research_all_technologies()

	ret = {}
	for name, data in pairs(game.player.force.recipes) do
		ret[name] = {
		  ingredients = {},
	          products    = {}
	        }
		for _, i in ipairs(data.ingredients) do
			x = {}
			x['type'] = i.type
			x['name'] = i.name
			x['amount'] = i.amount
			table.insert(ret[name]["ingredients"], x)
		end
		for _, i in ipairs(data.products) do
			y = {}
			y['type'] = i.type
			y['name'] = i.name
			y['amount'] = i.amount
			-- TODO: Optionally include amount_min/max/probability
			table.insert(ret[name]["products"], y)
		end
	end
	log(json:encode(ret))
	game.player.print("All recipes dumped to log file as JSON")
end
remote.add_interface("json-dumper", interface)
