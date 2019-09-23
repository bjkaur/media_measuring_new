module Barcodable

  # Barcodes on objects created before a specific time will
  # show normally without any special characters

  def barcode
    out = self.id.to_s(36).upcase
    return out
  end

  # Something to print on the barcode that will give a hint
  # to which medium it refers to in the scenario that the barcode
  # becomes unreadable.
  # This returns the last two characters of the base36 encoded barcode
  # string.

  def barcode_hint
    if created_at < Time.parse("2018-01-22 13:00:00")
      # Need to show old barcode hint for older filters/blanks
      self.barcode.to_s[-2..-1]
    else
      number_part = self.id % 1000
      first_part = self.id.to_s[0..-4].to_i.to_s(36)[-1..-1].upcase
      "#{first_part}-#{number_part}"
    end
  end

  # Certain characters are replaced with special characters so that client's don't
  # get confused between characters that are similar.  There have been many cases where
  # this has happened and filters have been swapped around.

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

  # def self.remove_special_characters(string)
  #   new_string = string.clone.upcase
  #   SpecialCharacters.each do |from, to| 
  #     new_string.gsub!(to, from)
  #   end
  #   new_string
  # end

end
