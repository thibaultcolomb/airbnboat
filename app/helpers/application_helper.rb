module ApplicationHelper
  def display_star_rating(rating)
    full_stars = rating.floor
    half_star = ((rating - full_stars) * 2).round == 1
    empty_stars = (5 - full_stars - (half_star ? 1 : 0))

    star_html = ""

    full_stars.times { star_html += "<i class='fas fa-star'></i>" }
    star_html += "<i class='fas fa-star-half-alt'></i>" if half_star
    empty_stars.times { star_html += "<i class='far fa-star'></i>" }

    star_html.html_safe
  end
end
