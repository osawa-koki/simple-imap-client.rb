# frozen_string_literal: true

require 'dotenv'
require 'net/imap'

Dotenv.load

imap_server = ENV['IMAP_SERVER']
imap_port = ENV['IMAP_PORT'] || Net::IMAP.default_port
imap_user = ENV['IMAP_USER']
imap_password = ENV['IMAP_PASSWORD']

slice_from = ARGV[0].to_i || 0
slice_offset = ARGV[1].to_i || 10
slice_to = slice_from + slice_offset - 1

imap = Net::IMAP.new(imap_server, imap_port)
imap.authenticate('PLAIN', imap_user, imap_password)
imap.examine('INBOX')
message_ids = imap.search(['ALL']).sort.reverse[slice_from..slice_to]
message_ids.each do |message_id|
  envelope = imap.fetch(message_id, 'ENVELOPE')[0].attr['ENVELOPE']
  from = envelope.from[0].name
  subject = envelope.subject
  date = envelope.date
  seen = imap.fetch(message_id, 'FLAGS')[0].attr['FLAGS'].include?(:Seen)
  puts "#{message_id} | #{date} #{from} #{subject} #{seen ? 'Seen' : 'Unseen'}"
end
