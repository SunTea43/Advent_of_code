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

def force_choice(p1,p2)
    case p2
    when "X"
        case p1
        when "A"
            (p1.ord+25).chr
        when "B","C"
            (p1.ord+22).chr
        end
    when "Y"
        (p1.ord+23).chr
    when "Z"
        case p1
        when "A","B"
            (p1.ord+24).chr
        when "C"
            (p1.ord+21).chr
        end
    end
end
file = File.open("input.txt","r")
lines = file.readlines
total_points=0

lines.each do |line|
    p1,p2 = line.split(" ")
    p2 = force_choice(p1,p2)
    total_points+=points_for_my_choice(p2) + points_for_match(p1,p2) 
end

puts total_points