
 require_relative 'entry'
 require "csv"
 
   class AddressBook
     attr_reader :entries

     def initialize
       @entries = []
     end 

     def remove_entry(name, phone, email)
       delete_entry = nil
       @entries.each do |entry|
         if name == entry.name && phone == entry.phone_number && email = entry.email
           delete_entry = entry
         end
     end
   
     @entries.delete(delete_entry)
   
     end

     def add_entry(name, phone, email)
    
       index = 0
       @entries.each do |entry|
    
       if name < entry.name
         break
       end
         index+= 1
       end
         @entries.insert(index, Entry.new(name, phone, email))
     end
     
     def import_from_csv(file_name)
       csv_text = File.read(file_name)
       csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
 
       csv.each do |row|
       row_hash = row.to_hash
       add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
     end
     end
     
    def detonate
       @entries = []
    end
     
    def binary_search(name)
           # #1
     lower = 0
     upper = entries.length - 1
 
     # #2
     while lower <= upper
       # #3
       mid = (lower + upper) / 2
       mid_name = entries[mid].name
 
       # #4
       if name == mid_name
         return entries[mid]
       elsif name < mid_name
         upper = mid - 1
       elsif name > mid_name
         lower = mid + 1
       end
     end
 
     # #5
     return nil
     
    end
    
    def iterative_search(name)
                 # #1
     lower = 0
     upper = entries.length - 1
 
     # #2
     while lower <= upper
 
       # #4
       if name == entries[lower].name
         return entries[lower].name
       elsif name != entries[lower].name
         lower += 1
       end
     end
    end
   end
