module BarcodesHelper

  require 'tempfile'

  def barcode
    out = self.id.to_s(36).upcase
    return out
  end

  ####
  # Generates a code to go with medium ID making a unique barcode
  # Code to print on the barcode giving a hint
  # to which medium it refers to in the scenario that the barcode
  # becomes unreadable.
  # Returns the last two characters of the base36 encoded barcode
  # string.
  # E.g. 133395 (P-395), 133396 (P-396), 133397 (P-397) 
  ####
  def barcode_hint
      number_part = self.id % 1000
      first_part = self.id.to_s[0..-4].to_i.to_s(36)[-1..-1].upcase
      "#{first_part}-#{number_part}"
  end

  # Certain characters are replaced with special characters to
  # avoid confusion between characters that are similar 
  # and to avoid filters have been swapped around.
  SpecialCharacters = {
    "O" => "-",
    "Q" => "#",
    "I" => "+",
    "1" => "$",
    "B" => "/",
    "5" => "%"
  }

  def self.add_special_characters(string)
    new_string = string.clone.upcase
    SpecialCharacters.each do |from, to| 
      new_string.gsub!(from, to)
    end
    new_string
  end

  def create_file(name, expired_date, barcode, barcode_hint)
    path = "/C:/print"

    file = Tempfile.new(['print', '.txt'])
    content = BarcodesHelper.new(print_label)

    file.path      
    file.write(content)
    file.read     
    file.close
    file.unlink   # deletes the temp file
  end

  def print data
    file = "print#{$$}-#{rand(99999)}"
    File.open(file)
      file << data
    end

  ####
  # 
  ####
  private 

  def print_label(name, expired_date, barcode, barcode_hint)
    #extra = "- #{extra}" if extra.present?
    #name =  "#{name} #{extra}"[0..16] 
    "\nN
q190
A7,0,0,3,2,2,N,\"#{barcode_hint}\"
A7,45,0,2,1,1,N,\"#{name}\"
A7,65,0,2,1,1,N,\"Exp:#{expired_date.strftime("%d-%b-%y")}\"
B20,85,0,3,2,3,40,N,\"M#{barcode}\"
P#{copies}\n";
  end

end 