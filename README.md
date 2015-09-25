# The WebOVision Theme for JSConf.eu 2015

[Listen to it (Will not work in Safari, unfortunately, see [below](#on-browser-compatibitly))](http://pixelpoke.de/webovision).

So, one day on twitter, Malte Ubl of JSConf.eu fame asks if someone could create a
short 8Bit style piece of music. As I have a reputation to keep in terms of making
music for or at JSConf.eu, I directly asked him what he wanted and he pointed
me to a recording of the prelude to "Te Deum" by Marc-Antoine Charpentier -- better
known as the Eurovision Theme, being used as an intro to TV shows done for the
Eurovision, a European organisation created to exchange TV programs between European
TV stations. To me personally, as for many Germans from my generations, this is almost
synonymous with watching "Wetten Das.?", the most popular saturday night TV show
back in the days. Let me quote "Generation Golf", a popular coming of age novel published in 2001:

> Mir geht es gut. Ich sitze in der warmen Badewanne, und zwischen meinen Knien schwimmt das braune Seeräuberschiff von Playmobil. Nachher schaue ich 'Wetten, daß.?' mit Frank Elstner, dazu gibt es Erdnußflips. Niemals wieder hatte ich in späteren Jahren solch ein sicheres Gefühl, zu einem bestimmten Zeitpunkt genau das Richtige zu tun.

Crappy translation by me:

> I'm fine. I'm sitting in the warm bath tub and I have the brown pirate ship of Playmobil swimming between my knees. Later tonight, I'll be watching 'Wetten, daß.?' with Frank Elstner, and we'll have peanut flips with that. Never again later in my life did I feel so sure to do exactly the right thing at the right moment.

Of course I could have just loaded a MIDI file into GarageBand or whatever and use some cheap synth sounds to generate the 8Bit version. But that would have been cheating in my eyes, this being JSConf.eu. So here's the code to a Web Audio based version. Again,  you can find the final result at [The Web](http://pixelpoke.de/webovision).

## How it's done

Firs of all: I'm sorry, I used ruby. But it's my favourite language and it was done in a bit of a hurry.

So, here's how it was done:

1. Find a good MIDI file for the Te Deum prelude.
2. Find a ruby library for parsing MIDI files which are actually a pretty complicated binary format
3. Write a converter that converts MIDI into somewhat readable JSON (which you can look at at[webovision.json](webovision.json))
4. Write a minimal player that will read in the JSON and make it react to the most important events in the converted MIDI data: ProgramChange (to have different voices sound different), SetVolume (To have the different voices play at different volumes) and NoteOn/Off of course.
5. Finetune the different voices to sound 8Bitty and not shitty. You be the judge.

# On browser compatibitly

Every browser that implements the [current published version](http://www.w3.org/TR/webaudio/) of the Web Audio API should be able to play this. Unfortunately this means it won't play on the latest Safari, which is a bummer, but they decided to not update the API even in the latest incarnation. I could easily fix it by including Chris Wilsons [AudioContext](https://github.com/cwilso/AudioContext-MonkeyPatch) monkey patch, but at this point I'm not sure it's worth the hassle. Sorry, Safari users. I've tested it with Firefox and Chrome, it should work in IE11, please let me know if you're able to test that.

# The included MIDI file

It's from the Internet. It does not include a copyright note and I can't remember the exact source. The piece of music itself is from the 17th century so it's safely within the public domain. I just wanted to make sure that everything needed to comprehensibly document my process is in this repo.
