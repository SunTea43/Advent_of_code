file = File.open("input.txt","r")
lines = file.readlines
elves=[]
current_elve = {number: elves.size, calories:0}
maximum_elve = current_elve
lines.each_with_index do |line,idx|
    if line.strip!.empty?
       if current_elve[:calories]>maximum_elve[:calories]
        maximum_elve=current_elve
       end
        current_elve = {number: elves.size,calories: 0}
    else
        current_elve[:calories] +=line.to_i
    end
end
if current_elve[:calories]>maximum_elve[:calories]
    maximum_elve=current_elve
end
   
puts maximum_elve
