class Group < ActiveRecord::Base
  def self.all_groups
    %w(ACM CyberSec WIC)
  end
end
