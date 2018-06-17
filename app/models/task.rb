class Task < ApplicationRecord

  enum status: { open: 'Open', in_progress: 'In progress', done: 'Done',
                 verified: 'Verified', failed: 'Failed'}

  scope :on_user, -> { where(status: %w(in_progress done)) }

  def task_assign_to(user)
    self.update(user_id: user, assigned: true)
  end

  def change_status(status)
    if ((status == "Verified" || status == "verified" )&& self.paid == false)
      reward = self.reward
      # balance_parent = Parent.find(self.parent_id).balance - reward
      Parent.find(self.parent_id).update(balance: Parent.find(self.parent_id).balance - reward)
      # balance_user = User.find(self.user_id).balance + reward
      User.find(self.user_id).update(balance: User.find(self.user_id).balance + reward )
      self.update(paid: true, status: status)
    elsif (status == "Failed" || status == "failed")
      if (self.reward > 1)
        reward = self.reward - 1
        self.update(status: status, reward: reward)
      else
        self.update(status: status)
      end
    else
      self.update(status: status)
    end
  end
end
