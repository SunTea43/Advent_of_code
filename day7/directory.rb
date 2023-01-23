class Directory
    attr_accessor :nodes, :weight, :name, :parent_directory
    def initialize(name,parent_directory)
        @nodes=[]
        @weight =0
        @name = name
        @parent_directory = parent_directory
    end
    def directory_weight
        total_weight= 0
        nodes.each do |node|
            if node.class == Directory
                total_weight+=node.directory_weight
            else
                total_weight+=node.weight
            end
        end
        total_weight
    end
    def find_directory(name)
        nodes.each do |node|
            if node.class == Directory 
                if node.name==name
                    return node
                else
                    node_founded = node.find_directory(name)
                    if node_founded
                        return node_founded
                    end
                end
            end
        end
        nil
    end
    def get_directories
        directories =[]
        nodes.each do |node|
            if node.class == Directory
                directories<<node
                unless node.nodes.empty?
                    subdirectories = node.get_directories
                    directories<<subdirectories
                    directories.flatten!
                end
            end
        end
        directories
    end
end