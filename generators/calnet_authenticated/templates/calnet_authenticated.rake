#	From `script/generate calnet_authenticated` ...
unless Gem.source_index.find_name('ccls-calnet_authenticated').empty?
#if Gem.searcher.find('calnet_authenticated')
	gem 'ccls-calnet_authenticated'
	require 'calnet_authenticated/test_tasks'
end
