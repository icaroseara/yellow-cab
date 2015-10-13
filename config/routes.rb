Rails.application.routes.draw do
  mount API => '/'
  mount GrapeSwaggerRails::Engine => '/apidoc'
end
