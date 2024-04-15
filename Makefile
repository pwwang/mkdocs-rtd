define VERSIONS
[
	{
		"version": "dev",
		"title": "dev",
		"aliases": []
	},
	{
		"version": "0.0.1",
		"title": "0.0.1",
		"aliases": [
			"latest"
		]
	},
	{
		"version": "0.0.2",
		"title": "0.0.2",
		"aliases": []
	}
]
endef

define INDEX_HTML
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Redirecting</title>
  <noscript>
    <meta http-equiv="refresh" content="1; url=latest/" />
  </noscript>
  <script>
    window.location.replace(
      "latest/" + window.location.search + window.location.hash
    );
  </script>
</head>
<body>
  Redirecting to <a href="latest/">latest/</a>...
</body>
</html>
endef

export VERSIONS
export INDEX_HTML

mike-test:
	@echo "Mike fake multiple versions to test pages by mike"
	@echo "- Cleaning up"
	@rm -rf mike-site
	@echo "- Making versions file"
	@mkdir -p mike-site
	@echo "$$VERSIONS" > mike-site/versions.json
	@echo "- Making redirection for default page"
	@echo "$$INDEX_HTML" > mike-site/index.html
	@echo "- Making a symlink for latest version"
	@ln -s 0.0.1 mike-site/latest
	@echo "- Making a symlink for dev version"
	@cp -r ./site/ mike-site/dev
	@sed -i 's/..VERSION../dev/g' mike-site/dev/index.html
	@echo "- Making a symlink for 0.0.1 version"
	@cp -r ./site/ mike-site/0.0.1
	@sed -i 's/..VERSION../0.0.1/g' mike-site/0.0.1/index.html
	@echo "- Making a symlink for 0.0.2 version"
	@cp -r ./site/ mike-site/0.0.2
	@sed -i 's/..VERSION../0.0.2/g' mike-site/0.0.2/index.html
	@echo "- Done. Serve mike-site with a static server"

.PHONY: mike-test
