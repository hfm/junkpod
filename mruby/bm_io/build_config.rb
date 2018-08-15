MRuby::Build.new do |conf|
  toolchain :gcc
  conf.cc.flags << '-O3'

  conf.gembox 'default'
  conf.gem core: 'mruby-io'
end
