file = File.open("input.txt","r")
lines = file.readlines
stacks = [[],[],[],[],[],[],[],[],[]]
lines.each_with_index do |line,idx|
    if idx<8
        (0..8).each do |i|
            unless line[4*i+1].strip.empty?
                stacks[i] << line[4*i+1]
            end
        end
        if idx==7
            stacks.each do |stack|
                stack.reverse!
            end
        end
    elsif idx>9
        row = line.split(" ")
        elements, origin, destination = row[1].to_i,row[3].to_i, row[5].to_i
        (0...elements).each do |i|
            el = stacks[origin-1].pop
            stacks[destination-1]<< el
        end
    end
end
stacks.each do |stack|
    print stack.last
end