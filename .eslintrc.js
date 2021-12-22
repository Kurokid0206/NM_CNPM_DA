module.exports = {
	env: {
		browser: true,
		commonjs: true,
		es2021: true
	},
	extends: [
		"standard"
	],
	parserOptions: {
		ecmaVersion: 2021
	},
	rules: {
		semi: [2, "never"],
		indent: ["error", "tab"],
		"space-before-function-paren": ["error", {
			anonymous: "always",
			named: "never",
			asyncArrow: "always"
		}],
		quotes: ["error", "double", { avoidEscape: true }],
		allowIndentationTabs: true
	},
	
}
