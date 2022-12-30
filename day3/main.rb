def is_upper?(c)
    /[[:upper:]]/.match(c)
end
def is_lower?(c)
    /[[:lower:]]/.match(c)
end
def get_score_from (letter)
    if is_upper? letter
        letter.ord - 38 
    else
        letter.ord - 96
    end
end

file = File.open("input.txt","r")
lines = file.readlines
total =0
lines.each_with_index do |str,idx|
    first,second = str.partition(/.{#{str.size/2}}/)[1,2]
    first.each_char do |letter|
        if second.include? letter
            total += get_score_from letter 
            break
        end
    end
end
puts total