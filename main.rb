require_relative 'theater.rb'

# Жюри
j1 = Juri.new('man')
j2 = Juri.new('man')
j3 = Juri.new('woman')
j4 = Juri.new('woman')
juri = [j1, j2, j3, j4]

# Актеры
p1 = Actor.new('yura', 'man', 22, [])
p2 = Actor.new('dima', 'man', 11, [])
p3 = Actor.new('anna', 'woman', 30, [])
p4 = Actor.new('lena', 'woman', 13, [])
p5 = Actor.new('olga', 'woman', 20, [])
actors = [p1, p2, p3, p4, p5]

# Роли
r1 = Role.new('Act1', 'man', 12..21, actors, juri)
r2 = Role.new('Act2', 'man', 10..24, actors, juri)
r3 = Role.new('Act3', 'woman', 11..22,  actors, juri)
r4 = Role.new('Act4', 'woman', 15..44,  actors, juri)
roles = [r1, r2, r3, r4]

# Выступления
roles.each {|r| r.do_actions}

# Лучшая роль для актера
puts "Best role for #{p1.name}: " + p1.best_role.role_name.to_s
puts "Best role for #{p2.name}: " + p2.best_role.role_name.to_s
puts "Best role for #{p3.name}: " + p3.best_role.role_name.to_s
puts "Best role for #{p4.name}: " + p4.best_role.role_name.to_s
puts "Best role for #{p5.name}: " + p5.best_role.role_name.to_s

# Общая продолжительность выступления для актера
puts "Actor #{p1.name} duration: " + p1.sum_duration.to_s
puts "Actor #{p2.name} duration: " + p2.sum_duration.to_s
puts "Actor #{p3.name} duration: " + p3.sum_duration.to_s
puts "Actor #{p4.name} duration: " + p4.sum_duration.to_s
puts "Actor #{p5.name} duration: " + p5.sum_duration.to_s

puts 'THE END'
