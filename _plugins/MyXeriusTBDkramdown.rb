
class Jekyll::Converters::Markdown::MyXeriusTBDkramdown

  def initialize(config)
    require 'kramdown'
     @config = config
  rescue LoadError
    STDERR.puts 'You are missing a library required for Markdown.'
    raise FatalException.new("Missing dependency: kramdown")
  end

  def convert(content)
    options = @config['kramdown']
    kramdown = Kramdown::Document.new(content, options);
    html = kramdown.to_MyXeriusTBDHtmlConverter
    return html;
  end
end


module Kramdown
    module Converter
      class MyXeriusTBDHtmlConverter < Html
        def convert_a(el, indent)
            el.attr['(popup)'] = ''            
           html_original = super el, indent
          
           return html_original
        end
      end
    end
  end