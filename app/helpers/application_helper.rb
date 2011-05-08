module ApplicationHelper
  def user_est_admin?
    return false unless user_signed_in?
    current_user.admin
  end
  
  def nl2br(str)
    new_str = ""
    str.each_line {|s| new_str += s+sanitize("<br/>") } unless str.nil?
    tags = %w(a acronym b strong i em li ul ol h1 h2 h3 h4 h5 h6 blockquote br cite sub sup ins p)
    sanitize(new_str, :tags => tags, :attributes => %w(href title))
  end
  
  def will_paginate_scica objets
    will_paginate objets, :prev_label => '&#8592; Pr&eacute;c&eacute;dent', :next_label => 'Suivant &#8594;'
  end
end
