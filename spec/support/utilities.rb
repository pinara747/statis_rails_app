def full_title(page_title)
  base_title = "Pinar\'s Sample Rails App"
  if page_title.empty?
    base_title
  else
    "#{base_tile} } #{page_title}"
  end
end
