class AddPaperclipToTape < ActiveRecord::Migration
  def change
  	add_attachment :tapes, :tapepic
  end
end
