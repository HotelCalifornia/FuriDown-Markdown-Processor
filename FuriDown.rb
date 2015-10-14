require "redcarpet"

# Redcarpet::Render::HTML is the full Redcarpet markdown processor (i.e. it parses markdown and returns HTML)
class RubyMD < Redcarpet::Render::HTML
  # Override the preprocess() hook to substitute the `[text|furigana]` tag with the HTML <ruby> tag (and its friends)
  def preprocess(doc)
    doc.gsub!(/\[(.+?)\|(.+?)\]/, "<ruby><rb>\\1</rb><rp>(</rp><rt>\\2</rt><rp>)</rp></ruby>")
    doc
  end
end

# The actual Jekyll plugin
class Jekyll::Converters::Markdown::FuriDown
	def initialize(config)
		@config = config
	end
	def extensions
		Hash[ *@config['redcarpet']['extensions'].map { |e| [e.to_sym, true]  }.flatten ]
	end
	def markdown
		@markdown ||= Redcarpet::Markdown.new(RubyMD, extensions)
	end
	def convert(content)
		return super unless @config['markdown'] == 'FuriDown'
		markdown.render(content)
	end
end
