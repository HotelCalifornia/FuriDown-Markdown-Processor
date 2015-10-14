# FuriDown Jekyll plugin

## What?
This is a Jekyll plugin that allows you to add furigana text to your website in markdown.

In Chinese-based languages, many of the characters have multiple different readings. In Japanese, which uses Chinese characters (called Kanji), Furigana refers to the small text that appears above these characters that explain how to read them. In Chinese itself, the same function is performed by Pinyin.

## How?
To use this plugin, put `FuriDown.rb` in your `_plugins` folder, and link to the `ruby.css` stylesheet in the pages in which you would like to use furigana.

(I suggest that you use a `head.html` Jekyll include file to keep your website's `<head>` information in one place)

Next, add the line
```YAML
markdown: FuriDown
```
to your `_config.yml`.

Now you're all ready to start adding furigana to your website! Just use the syntax `[text|furigana]` in any of your markdown pages.

## Behind the scenes
HTML5 added the `<ruby>` tagset to allow for text annotations, as some languages make heavy use of these annotations.

The tag's syntax is somewhat verbose:
```HTML
<ruby>
  <rb>日本語</rb>
  <rp>(</rp>
  <rt>にほんご</rt>
  <rp>)</rp>
</ruby>
```
and by default, renders as **日本語(にほんご)**.

Some browsers have plugins that can make the furigana render properly (above the text), but this doesn't help mobile users, or users that don't have one of those plugins.

A solution to this can be found by using CSS. While not perfect, it covers most of furigana's use-cases.

This plugin is an extension of the Redcarpet markdown processor. This way, you have all the functionality of traditional markdown, as well as the furigana functionality.

Using this plugin you simply need to write:
```markdown
[日本語|にほんご]
```
to generate the above code.
