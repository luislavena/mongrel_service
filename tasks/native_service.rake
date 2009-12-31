require 'tools/freebasic'

# mongrel_service (native)
namespace :native do
  exe_options = {
    :debug => false,
    :profile => false,
    :errorchecking => :ex,
    :mt => true,
    :pedantic => true
  }

  exe_options[:debug] = true          if ENV['DEBUG']
  exe_options[:profile] = true        if ENV['PROFILE']
  exe_options[:errorchecking] = :exx  if ENV['EXX']
  exe_options[:pedantic] = false      if ENV['NOPEDANTIC']

  project_task  'mongrel_service' do
    executable  'mongrel_service'
    build_to    'bin'

    define      'DEBUG_LOG' unless ENV['RELEASE']
    define      "GEM_VERSION=#{HOE.spec.version}"

    main        'native/mongrel_service.bas'
    source      'native/console_process.bas'

    lib_path    'lib'
    library     'ServiceFB', 'ServiceFB_Utils'
    library     'user32', 'advapi32', 'psapi'

    option      exe_options
  end
end

task :native_service => [:native_lib, 'native:build']
task :clean => ['native:clobber']
