def is_upper?(c)
    /[[:upper:]]/.match(c)
end
def is_lower?(c)
    /[[:lower:]]/.match(c)
end
def get_score_from(letter)
    if is_upper? letter
        letter.ord - 38 
    else
        letter.ord - 96
    end
end
file = File.open("input.txt","r")
lines = file.readlines
total =0
groups = []
group=[]
lines.each_with_index do |str,idx|
    if idx%3==0 and idx!=0
        groups<<group
        group=[]
    end
    group <<str
end
groups <<group
total=0
groups.each_with_index do |group,idx|
    elf1,elf2,elf3 = group
    elf1.each_char do |letter|
        if elf2.include? letter and elf3.include? letter
            total+= get_score_from letter
            break
        end
    end

end
puts total