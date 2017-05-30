# vim-config
Sub-Net .vimrc, no windows support for now.

# Pre Req.
Vim 7.0+ in any way.

On Ubuntu something like
```
aptitude install vim -y
```

On OSX via Brew
```
brew install vim
```

# Install
This will delete you local vim config files and overwrites them
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/FlorianBerthold/vim-config/master/install.sh)"
```

# Sneak on f
Sneak is invoked with `f` followed by exactly two characters:

    f{char}{char}

* Type `fab` to **move the cursor** immediately to the next instance of the text "ab".
    * Additional matches, if any, are highlighted until the cursor is moved.
* Type `;` to go to the next match (or `f` again, if `s_next` is enabled; see [`:help sneak`](doc/sneak.txt)).
* Type `3;` to skip to the third match from the current position.
* Type `ctrl-o` or ``` `` ``` to go back to the starting point.
    * This is a built-in Vim motion; Sneak adds to Vim's [jumplist](http://vimdoc.sourceforge.net/htmldoc/motion.html#jumplist)
      *only* on `f` invocation—not repeats—so you can
      abandon a trail of `;` or `,` by a single `ctrl-o` or ``` `` ```.
* Type `f<Enter>` at any time to repeat the last Sneak-search.
* Type `F` to search backwards.



# Lion - text aligment plugin
```[count]gl{motion}{char}``` = ```glip"``` to align left from a "

```[count]gL{motion}{char}``` = ```gLip"``` to align right from a "


# commentary.vim

Comment stuff out.  Use `gcc` to comment out a line (takes a count),
`gc` to comment out the target of a motion (for example, `gcap` to
comment out a paragraph), `gc` in visual mode to comment out the selection,
and `gc` in operator pending mode to target a comment.  You can also use
it as a command, either with a range like `:7,17Commentary`, or as part of a
`:global` invocation like with `:g/TODO/Commentary`. That's it.

I wrote this because 5 years after Vim added support for mapping an
operator, I still couldn't find a commenting plugin that leveraged that
feature (I overlooked
[tcomment.vim](https://github.com/tomtom/tcomment_vim)).  Striving for
minimalism, it weighs in at under 100 lines of code.

Oh, and it uncomments, too.  The above maps actually toggle, and `gcgc`
uncomments a set of adjacent commented lines.
