local jdtls = require("jdtls")

-- 1. Resolução dos caminhos do Mason e Lombok
local mason_path = vim.fn.stdpath("data") .. "/mason/"
local lombok_path = mason_path .. "share/jdtls/lombok.jar"

-- 2. Identificação dinâmica do diretório raiz e do workspace por projeto
local root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" })
local project_name = vim.fn.fnamemodify(root_dir or vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/workspace/" .. project_name

-- 3. Tabela de configuração do JDTLS
local config = {
	cmd = {
		"jdtls",
		string.format("--jvm-arg=-javaagent:%s", lombok_path),
		"-data",
		workspace_dir,
	},
	root_dir = root_dir,
	settings = {
		java = {
			signatureHelp = { enabled = true },
			contentProvider = { preferred = "fernflower" },
			completion = {
				favoriteStaticMembers = {
					"org.hamcrest.MatcherAssert.assertThat",
					"org.hamcrest.Matchers.*",
					"org.hamcrest.CoreMatchers.*",
					"org.junit.jupiter.api.Assertions.*",
					"java.util.Objects.requireNonNull",
					"java.util.Objects.requireNonNullElse",
					"org.mockito.Mockito.*",
				},
			},
		},
	},
}

-- 4. Inicia ou anexa o servidor no buffer atual
jdtls.start_or_attach(config)
