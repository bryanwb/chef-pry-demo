# chef-pry-demo cookbook

This is a super simple cookbook that teaches you how to use pry w/in
chef.

# Requirements

Make sure you have ruby 1.9 installed, then install these gems.

```
$ gem install --no-ri --no-rdoc pry pry-nav pry-doc chef
```

To use pry with the Omnibus chef package, 
```
$ /opt/chef/embedded/bin/gem install --no-ri --no-rdoc pry pry-nav pry-doc
$ chef-shell  # or shef
chef> require 'pry'
chef> binding.pry
```

# Usage

`$ cd chef-pry-demo && sudo chef-solo -c solo.rb -j dna.json` where solo.rb and dna.json are the ones at the
root of this repository.

You will drop down to the first breakpoint attributes/default.rb. Execute `whereami` 
to see where you are in the code. Next, execute `node[:chef_pry_demo][:foobar]` to see 
the current value of the attribute.

See the methods and instance variables on the node object `ls node`, then `show-doc node.save` 
to see the documentation for the save method. Chef internal docs aren't that great. `show-doc "foo".split` or 
`show-doc "foo".gsub` are must better illustrations of how u can browse ruby documentation
with pry. Also try `ls "foo"` or `ls 5` to see the methods available on a string and an integer.

To continue to the next example, hit Control D or type `continue`. Now you should be inside the default recipe.
Type `whereami`, notice that there is a ruby_block above you with an embedded breakpoint. Type, `whereami 20` 
for greater context. The ruby breakpoint you are at is processed before the individual resources. This is because
it is still compile time.

Type `continue` once more and you will be inside the ruby_block resource. Type `continue` again and you will be 
inside the eRubis template.

# Author

Author:: Bryan W. Berry (<bryan.berry@gmail.com>)
