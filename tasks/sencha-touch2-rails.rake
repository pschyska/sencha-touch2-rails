# based on https://github.com/sakuro/ext_rails_shim/blob/master/lib/tasks/ext_rails_shim_tasks.rake @e6da6188d91eb201a4cc7ed952e827bc7d63bac9

namespace :'sencha-touch2-rails' do
  JAVASCRIPTS_DIR = 'vendor/assets/javascripts/sencha-touch2-rails'
  STYLESHEETS_DIR = 'vendor/assets/stylesheets/sencha-touch2-rails'

  directory JAVASCRIPTS_DIR
  directory STYLESHEETS_DIR

  desc 'Install Sencha Touch scripts and themes'
  task :install => %w(install:javascripts install:themes)


  namespace :install do
    task :touch_dir do
      raise 'TOUCH_DIR is not set.' unless ENV.has_key?('TOUCH_DIR')
      raise 'TOUCH_DIR is not a directory.' unless FileTest.directory?(File.expand_path(ENV['TOUCH_DIR']))
    end

    task javascripts: JAVASCRIPTS_DIR do
      script_files = FileList["#{File.expand_path(ENV['TOUCH_DIR'])}/*.js"]
      cp script_files, JAVASCRIPTS_DIR
    end

    task themes: 'stylesheets'

    task stylesheets: STYLESHEETS_DIR do
      compass_command_line = %w(compass compile)
      compass_command_line << '--config' << File.join(File.expand_path(ENV['TOUCH_DIR']), 'resources/themes/compass_init.rb')
      compass_command_line << '--sass-dir' << File.join(File.expand_path(ENV['TOUCH_DIR']), 'resources/sass')
      compass_command_line << '--css-dir' << STYLESHEETS_DIR
      compass_command_line << '--output-style' << 'compressed'
      compass_command_line << '--load' << File.join(File.expand_path(ENV['TOUCH_DIR']), 'resources/themes')
      sh *compass_command_line
    end
  end
end

Rake.application.tasks_in_scope(%w(sencha-touch2-rails install)).each do |t|
  next if t.name == 'sencha-touch2-rails:install:touch_dir'
  t.prerequisites.unshift 'sencha-touch2-rails:install:touch_dir'
end

