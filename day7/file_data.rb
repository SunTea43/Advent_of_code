class FileData
    attr_accessor :weight, :name, :parent_directory
    def initialize(name,weight,parent_directory)
        @weight =weight
        @name = name
        @parent_directory = parent_directory
    end
end