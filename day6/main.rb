file = File.open("input.txt","r")
line = file.readline
characters_to_be_processed =[]
line.each_char.with_index do |c,idx|
    characters_to_be_processed<<c
    if characters_to_be_processed.size==4
        if characters_to_be_processed.uniq.size == characters_to_be_processed.size
            puts idx+1
            break
        else
            characters_to_be_processed.delete_at 0
        end
    end
end