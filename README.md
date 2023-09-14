# mkdocs-rtd

A fork of mkdocs readthedocs theme to make it work better, especially with mkapi.

Why just use `extra_css` and `extra_javascript`?

- The javascript written in `theme.js` shipped with the original theme has problems expanding the sidebar items and it's not easy to fix it only using `extra_javascript`.

## Installation

```bash
pip install -U mkdocs-rtd
```

## Usage

```yaml
theme:
  name: rtd
```

All options are the same when using the original theme (`readthedocs`). See also:
<https://www.mkdocs.org/user-guide/choosing-your-theme/#readthedocs>
