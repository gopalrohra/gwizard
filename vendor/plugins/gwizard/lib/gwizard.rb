# Gwizard
module ActionView

module Helpers

module GWizard

def wizard_for(wizard_options={}, html_options={}, &proc)
concat(tag(:div, html_options,true))
wizard_steps(wizard_options, &proc)
concat("</div>")
end

def wizard_steps(options={}, &proc)
w=WizardBuilder.new(self, options)
proc.call(w)
end

end #GWizard

class WizardBuilder
include Helpers::TagHelper

      attr_accessor :wizard_title, :binding
def initialize(binding, options={})
@wizard_title="Wizard initialize"
@binding=binding
@options=options
end

def step(step_number, html_options={}, &proc)
current_step=@binding.params[:current_step]==nil ? 1 : @binding.params[:current_step].to_i
if current_step!=step_number
return
end
back_url=generate_back_url(current_step)
next_url=generate_next_url(current_step)
finish_url=@options[:finish_url]
content=@binding.capture(&proc)
@binding.concat(tag(:div,html_options,true))
@binding.concat(@binding.content_tag(:div,content,{}))
@binding.concat(@binding.tag(:input, {:type=>"button", :value=>"Back", :name=>"back", :onclick=>"javascript:gw_back('#{back_url}')"}))
@binding.concat(@binding.tag(:input, {:type=>"button", :value=>"Next", :name=>"Next", :onclick=>"javascript:gw_next('#{next_url}')"}))
@binding.concat(@binding.tag(:input, {:type=>"button", :value=>"Skip", :name=>"Skip", :onclick=>"javascript:gw_skip('#{next_url}')"}))
@binding.concat(@binding.tag(:input, {:type=>"button", :value=>"Finish", :name=>"Finish", :onclick=>"javascript:gw_finish('#{finish_url}')"}))
@binding.concat("</div>")
end

private

def generate_back_url(current_step)
if current_step>1
@binding.url_for(:overwrite_params=>{:current_step=>current_step-1})
else
@binding.request.url
end
end

def generate_next_url(current_step)
steps=@options[:steps]
if(current_step<steps)
@binding.url_for(:overwrite_params=>{:current_step=>current_step+1})
else
@binding.request.url
end
end

end #WizardBuilder

end #Helpers

end #ActionView

