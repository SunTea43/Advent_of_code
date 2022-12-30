class Range
    def is_in_range_of(another)
        another.include?(self.min) and another.include?(self.max)
    end
end
file = File.open("input.txt","r")
lines = file.readlines
counter=0
lines.each do |line|
    pairs = line.split(",")
    range1,range2 = pairs.map do |p| 
        lim1,lim2=p.split("-")
        lim1.to_i..lim2.to_i
    end
    if range1.is_in_range_of(range2) or range2.is_in_range_of(range1)
        counter+=1
    end
end 
puts counter