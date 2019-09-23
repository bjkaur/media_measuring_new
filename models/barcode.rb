# Barcode format :
#
# (M|S)(.*)
#
# where .* is a base 36 encoded string.
#
class Barcode

  attr_reader :original_text

  def initialize text
    @original_text = text
  end

  def media_barcode?
    medium_id.present?
  end

  def lims_sample?
    lims_sample_id.present?
  end

  def valid_barcode?
    media_barcode? || lims_sample?
  end

  def data
    if media_barcode?
      medium_id
    elsif lims_sample?
      lims_sample_id
    end
  end

  def medium_id
    if medium = @original_text[/^M(.*)/,1]
      medium.to_i(36)
    end
  end

  def lims_sample_id
    if sample = @original_text[/^S(.*)/,1]
      sample.to_i(36)
    end
  end

end