# FuriDown Jekyll plugin

## What?
This is Jekyll plugin that allows you to add furigana text to your website in markdown.

## How?
To use this plugin, put `FuriDown.rb` in your `_plugins` folder, and link to the `ruby.css` stylesheet in the pages in which you would like to use furigana.

(I suggest that you use a `head.html` Jekyll include file to keep your website's `<head>` information in one place)

Next, add the line
```YAML
markdown: FuriDown
```
to your `_config.yml`.

Now you're all ready to start adding furigana to your website! Just use the syntax `[text|furigana]` in any of your markdown pages.
