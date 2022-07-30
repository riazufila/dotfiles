local modules = {
	"plugins",
	"options",
}

-- Require modules.
for i = 1, #modules do
	require(modules[i])
end
