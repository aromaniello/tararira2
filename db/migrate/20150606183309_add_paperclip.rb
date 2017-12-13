class AddPaperclip < ActiveRecord::Migration
  def change
  	add_attachment :transactions, :proof
  end
end
