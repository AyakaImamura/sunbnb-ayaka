module RoomsHelper
  def is_done?(item)
    unless item.blank?
      content_tag :span, class: "" do
        content_tag :i, nil, class: "fa fa-check"
      end
    end
  end

  def is_not_ready?(room)
    room.price.blank? || room.name.blank? || room.photos.blank? || room.address.blank?
  end
  # When "is_active? and price etc.." is blank, status of publish button isn't ready 

  # def is_ready?(room)
  #     !room.is_active? && !room.price.blank? && !room.name.blank? && !room.photos.blank? && !room.address.blank?
  # end
end
