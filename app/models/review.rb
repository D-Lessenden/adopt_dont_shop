class Review < ApplicationRecord
  after_initialize :set_defaults

  belongs_to :shelter

  def set_defaults
    self.picture ||= "https://www.creativefabrica.com/wp-content/uploads/2019/11/08/paw-print-2-title-312x208.jpg"
    #{}"https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRuX5O3aFTaYF_PepXZfo6Lqgx3hzT_pxYG_w&usqp=CAU"
  end
end
