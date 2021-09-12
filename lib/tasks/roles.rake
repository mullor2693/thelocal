namespace :roles do
  desc "Generate roles for seed database"
  task create_initials: :environment do
    # Roles
    role_count = 0
    role_created = 0
    puts "----------------------------------------"
    puts "CREATE ROLES"
    puts "----------------------------------------\n"
    [
        { name: "admin" }
      ].each do |getter_role|
          role_count+=1
          puts "----------------------------------------"
          puts "Role: #{getter_role[:name]}, started..."
          Role.where(name: getter_role[:name]).first_or_create!
      end
      puts "----------------------------------------\n"
      puts "----------------------------------------"
      puts "Total: #{role_count}, Creados: #{role_created}"
      puts "----------------------------------------\n\n"
  end
end
