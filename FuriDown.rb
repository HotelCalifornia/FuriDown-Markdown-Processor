require "redcarpet"

class RubyMD < Redcarpet::Render::HTML
  def preprocess(doc)
    doc.gsub!(/\[(.+?)\|(.+?)\]/, "<ruby><rb>\\1</rb><rp>(</rp><rt>\\2</rt><rp>)</rp></ruby>")
    doc
  end
end

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
