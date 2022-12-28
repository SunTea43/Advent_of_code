file = File.open("input.txt","r")
lines = file.readlines
elves=[]
current_elf = {number: elves.size, calories:0}
maximum_elf = current_elf
lines.each_with_index do |line,idx|
    if line.strip!.empty?
       if current_elf[:calories]>maximum_elf[:calories]
        maximum_elf=current_elf
       end
        current_elf = {number: elves.size,calories: 0}
    else
        current_elf[:calories] +=line.to_i
    end
end
if current_elf[:calories]>maximum_elf[:calories]
    maximum_elf=current_elf
end
   
puts maximum_elf
