# OpenComputer-def

This project is an addon for the Lua Language Server, providing definitions and support for OpenComputers.

## Installation

1. Clone the repository:
	```sh
	git clone https://github.com/yourusername/OpenComputer-def.git
	```
2. Add the path to the `library` folder in your Lua Language Server configuration.
   ```json
	"Lua.runtime.version": "Lua 5.3",
	"Lua.workspace.library": [
		"C:/Users/colpa/IdeaProjects/LuaLs-addon/OpenComputer-def/library"
	]
	```
3. Or add the path third party addons in your Lua Language Server configuration.
	```json
	"Lua.workspace.userThirdParty": [
		"path/to/addons/locaction"
	]
	```

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request.
