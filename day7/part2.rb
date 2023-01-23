require "./directory.rb"
require "./file_data.rb"
file = File.open("input.txt","r")
lines = file.readlines
directory_tree = nil
current_directory = nil
cd_regex = /cd\s(\w|\/|\.\.)*/

lines.each_with_index do |line,idx|
    if line.start_with? "$" #It means, that is a command
        if line.match? cd_regex
            init_cmd,dir_text, dir_name = line.split(" ")
            if directory_tree.nil?
                directory_tree = Directory.new("/",nil)
                current_directory = directory_tree
            elsif dir_name==".."
                current_directory = current_directory.parent_directory
            else
                current_directory = directory_tree.find_directory(current_directory.name+"/"+dir_name)
            end
        elsif line == "$ ls"
            next
        end
    elsif line.start_with? "dir"
        current_directory.nodes<<Directory.new(current_directory.name+"/"+line.split(" ")[1],current_directory)
    else
        file_size, file_name = line.split(" ")
        current_directory.nodes<<FileData.new(current_directory.name+file_name,file_size.to_i,current_directory)
    end
end
total_weight_to_delete= 0
directories = directory_tree.get_directories
total_used_space = directory_tree.directory_weight
total_disk_available = 70000000 - total_used_space
total_needed_space = 30000000 - total_disk_available
directories.each_with_index do |directory,idx|
    directory_weight = directory.directory_weight
    if directory_weight>=total_needed_space and (total_weight_to_delete == 0 or total_weight_to_delete>directory_weight)  
        total_weight_to_delete=directory_weight
    end
end
puts total_weight_to_delete
