class DictionaryController < ApplicationController

	def index
	end

	def get_langs
		begin
			@langs = dictionary.get_langs
		rescue Exception => error
			render :text => error.message
		end
	end

	def lookup
		begin
			@articles = dictionary.lookup(params[:lang], params[:text])
		rescue Exception => error
			render :text => error.message
		else
			Request.create(lang: params[:lang],text: params[:text])
		end		
	end

	def journal
		@requests = Request.all
	end

	def destroy
		Request.destroy_all
		redirect_to action: "index"
	end

	protected

	def dictionary
		@dictionary ||= DictionaryAPI::DictionaryAPI.new('dict.1.1.20150814T100205Z.a0d27651d642b1d1.93ce6ba9cd891aada1fb98d47b6cd89c15a32f2e')
	end

end
