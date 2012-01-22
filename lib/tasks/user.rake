namespace :user do
  desc "List the username and security roles of all users or a single user (e.g. 'rake user:list' or 'rake user:list[dewey]')"
  task :list, [:username] => :environment do |t, args|
    username = args[:username].to_s.strip
    if username
      display_user(User.find_by_username(username))
    else
      User.order(:username).each { |user| display_user(user) }
    end
  end

  desc "Set the password for a given user"
  task :set_password, [:username, :password] => :environment do |t, args|
    username = args[:username].to_s.strip
    unless username.present?
      puts "You must specify a username"
    else
      password = args[:password].to_s.strip
      unless password.present?
        puts "You must specify a password"
      else
        user = User.find_by_username(username)
        unless user
          puts "Unknown username: '#{username}'"
        else
          attrs = {:password => password, :password_confirmation => password}
          unless user.update_attributes(attrs)
            puts "Error: #{user.errors.full_messages}"
          end
        end
      end
    end
  end

  desc "Add a security role to a given user (producer, director, or actor)"
  task :add_role, [:username, :role] => :environment do |t, args|
    username = args[:username].to_s.strip
    unless username.present?
      puts "You must specify a username"
    else
      role = args[:role].to_s.strip
      unless role.present?
        puts "You must specify a security role (producer, director, or actor)"
      else
        user = User.find_by_username(username)
        unless user
          puts "Unknown username: '#{username}'"
        else
          roleSym = role.downcase.to_sym
          attrs = {roleSym => true}
          unless user.update_attributes(attrs)
            puts "Error: #{user.errors.full_messages}"
          end
        end
      end
    end
  end

  desc "Remove all security roles, or a single security role, from a given user (e.g. 'rake user:remove_role[dewey]' or 'rake user:remove_role[dewey,actor]')"
  task :remove_role, [:username, :role] => :environment do |t, args|
    username = args[:username].to_s.strip
    unless username.present?
      puts "You must specify a username"
    else
      user = User.find_by_username(username)
      unless user
        puts "Unknown username: '#{username}'"
      else
        role = args[:role].to_s.strip
        unless role.present?
          attrs = {:producer => false, :director => false, :actor => false}
        else
          roleSym = role.downcase.to_sym
          attrs = {roleSym => false}
        end
        unless user.update_attributes(attrs)
          puts "Error: #{user.errors.full_messages}"
        end
      end
    end
  end

  def display_user(user)
    puts ([user.username] + user.security_roles).join("\t") if user
  end
end