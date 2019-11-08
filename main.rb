require 'trello'
require 'pry'


def puts_todos
  configure
  cards = get_cards

  puts '---------------------------'
  puts '[TODO]'
  cards.each do |card|
    puts card.name
  end
  puts '---------------------------'
end

  def configure
    Trello.configure do |config|
      config.developer_public_key = 'TRELLO_PUBLIC_KEY' # The "key" from step 1
      config.member_token = 'TRELLO_MEMBER_TOKEN' # The token from step 2.
    end
  end

  def get_cards
    member = Trello::Member.find('TRELLO_USER_NAME')
    boards = member.boards
    board = boards.find { |board| board.name == 'TODO' }
    lists = board.lists
    list = board.lists[0]
    cards = list.cards
  end

puts_todos
