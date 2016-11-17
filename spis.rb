File.readlines("stare.txt").each do |stare|
  n = 0
  File.readlines("obecny.txt").each do |obecne|
    if stare.downcase == obecne.downcase
      n += 1
    end
  end
  if n == 0
    puts stare
  end
end