def points_for_my_choice(p2)
    case p2
    when "X"
        1
    when "Y"
        2
    when "Z"
        3
    end
end
def points_for_match(p1,p2)
    operation =p2.ord - (p1.ord+23)
    case operation
    when 0
        3
    when -2,1
        6
    else
        0
    end
end

file = File.open("input.txt","r")
lines = file.readlines
total_points=0

lines.each do |line|
    p1,p2 = line.split(" ")
    total_points+=points_for_my_choice(p2) + points_for_match(p1,p2) 
end

puts total_points