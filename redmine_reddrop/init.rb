require 'redmine'

Redmine::Plugin.register :redmine_reddrop do
  name 'Reddrop plugin'
  author 'Alrick Deillon, Kevin Tomba'
  description 'Reddrop is a plugin for Redmine that allows users of that service to sync their documents and files using Dropbox.'
  version '2.0b'
  url 'https://github.com/kevtomba/Reddrop'
  author_url 'https://github.com'

  menu :top_menu, :reddrop, { :controller => 'accesstokens', :action => 'index' }, :caption => 'Reddrop linking', :before => 'Help'
  menu :admin_menu, :reddrop, { :controller => 'generatedfolders', :action => 'index' }, :caption => 'Reddrop settings', :last => true, :html => {:style => 'background: url(/plugin_assets/redmine_reddrop/images/reddrop_16.png); background-repeat: no-repeat'}
  
  project_module :reddrop do
    permission :reddrop_consult_projectfolders, { :projectusers => [:index, :show, :download, :reddropproject, :unreddropproject, :dropbox_sync, :force_sync] }
    permission :reddrop_interact_projectfolders, { :projectusers => [:destroy, :add, :dropbox_sync, :force_sync] }
  end
  menu :project_menu, :reddrop, { :controller => 'projectusers', :action => 'index' }, :caption => 'Reddrop', :after => :activity, :param => :project_id
end
