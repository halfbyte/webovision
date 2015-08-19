require 'rubygems'
require 'bundler/setup'
require 'midilib'
require 'json'

tracks = []

seq = MIDI::Sequence.new()

infile = ARGV[0]
outfile = ARGV[1]

if !infile || !outfile || infile == '' || outfile == ''
  puts "usage: ruby convert.rb <infile> <outfile>"
  exit(10)
end


# Read the contents of a MIDI file into the sequence.
File.open(infile, 'rb') { | file |
    seq.read(file)
}

#puts seq.inspect



seq.tracks.each do |track|
  tracks << {
    name: track.name,
    events: track.events.map do |event|
      if event.is_a?(MIDI::NoteOn)
        [:noteon, event.time_from_start, event.channel, event.note, event.velocity]
      elsif event.is_a?(MIDI::NoteOff)
        [:noteoff, event.time_from_start, event.channel, event.note, event.velocity]
      elsif event.is_a?(MIDI::Controller)
        [:controller, event.time_from_start, event.channel, event.controller, event.value]
      elsif event.is_a?(MIDI::ProgramChange)
        [:progchange, event.time_from_start, event.channel, event.program]
      else
        puts event.inspect;
        nil
      end
    end.compact
  }
end

File.open(outfile, 'wb') do |file|
  file.write({ppqn: seq.ppqn, bpm: seq.beats_per_minute, tracks: tracks}.to_json)
end
