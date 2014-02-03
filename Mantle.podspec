Pod::Spec.new do |s|
  s.name         = "Mantle"
  s.version      = "1.3.1"
  s.summary      = "A fork of Mantle including MTLXMLAdapter, MTLQueryAdapter, and the MTLModel protocol."
  s.homepage     = "https://github.com/DestoAU/MantleXMLAdapter"
  s.license      = "MIT"
  s.authors      = { "Rob Amos" => "robert.amos@desto.com.au" }
  s.source       = { :git => "https://github.com/DestoAU/MantleXMLAdapter.git", :tag => '1.3.1' }
  s.source_files = 'Mantle'
  s.dependency  'KissXML'
  s.framework    = 'Foundation'

  s.ios.deployment_target = '5.0' # there are usages of __weak
  s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.subspec 'extobjc' do |extobjc|
    extobjc.source_files   = 'Mantle/extobjc'
  end
  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2' }
end