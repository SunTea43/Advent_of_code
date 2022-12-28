def update_elves(elves=[],new_elf={})
    if elves.size<3
        elves<<new_elf
    else
        minimum_elve=elves.min_by{|elf| elf[:calories]}
        if minimum_elve[:calories]<new_elf[:calories]
            elves.delete minimum_elve
            elves<<new_elf
        end
    end
    elves
end
file = File.open("input.txt","r")
lines = file.readlines
elves =[]
current_elf = {number: 0, calories:0}
lines.each_with_index do |line,idx|
    if line.strip!.empty?
        elves = update_elves(elves,current_elf) 
        current_elf = {number: current_elf[:number]+1, calories:0}
    else
        current_elf[:calories] +=line.to_i
    end
end
elves = update_elves(elves,current_elf)
puts elves 
puts elves.map{|elve| elve[:calories]}.sum