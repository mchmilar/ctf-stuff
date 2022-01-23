# frozen_string_literal: true
# https://ctflearn.com/challenge/305

key = 'blorpy'
encrypted = 'gwoxRgqssihYspOntqpxs'

shift_key = key.chars.map { |c| c.ord - "a".ord }
result = encrypted.chars.map.with_index do |c, i|
  if c.downcase == c
    # lowercase letter
    offset_c_ord = c.ord - "a".ord
    (offset_c_ord - shift_key[i % key.size]) % 26 + "a".ord
  elsif c.downcase != c
    # upper case letter
    offset_c_ord = c.ord - "A".ord
    (offset_c_ord - shift_key[i % key.size]) % 26 + "A".ord
  else
    raise(StandardError, "Invalid character: #{c}")
  end
end

puts result.map(&:chr).join
