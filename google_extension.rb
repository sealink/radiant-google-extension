# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'
class GoogleExtension < Radiant::Extension
  version "1.0"
  description "Extension to handle google tag manager/custom search engine integration."
  url ''


  def activate
    require 'google_tags'
    Page.send :include, GoogleTags
    admin.configuration.show.add :config, 'admin/configuration/google_show', :after => 'defaults'
    admin.configuration.edit.add :form,   'admin/configuration/google_edit', :after => 'edit_defaults'
  end


  def deactivate
  end
end
