# Resource Descriptor
Primary functionality defining representation of a resource is encapsulated in a resource descriptor file. For
this demo, the [DRDs resource descriptor](api_descriptors/drds_descriptor_v1.yml) is used.

# Launching
```
$ bundle exec irb 
> load './demo.rb'
```

# Things to try

```
> show_alps # This may take a while depending on how long it takes the app (XCode) that reads .xml extensions to load.

> d = Drd.all.first
> d.to_media_type(:xhtml)
> d.to_media_type(:html)

> launch(d.to_media_type(:xhtml))
> launch(d.to_media_type(:xhtml, conditions: :can_do_anything))

> launch(d.to_media_type(:xhtml, {semantics: :styled_microdata}))
> launch(d.to_media_type(:xhtml, {semantics: :styled_microdata, conditions: :can_do_anything}))
> launch(d.to_media_type(:xhtml, {semantics: :styled_microdata, conditions: [:can_update, :can_delete]}))

# Try other variations of conditions

> c = Drds.collection
> c.to_media_type(:xhtml)

> launch(c.to_media_type(:xhtml))
> launch(c.to_media_type(:xhtml, conditions: :can_do_anything))

> launch(c.to_media_type(:xhtml, {semantics: :styled_microdata}))
> launch(c.to_media_type(:xhtml, {semantics: :styled_microdata, conditions: :can_do_anything}))
> launch(c.to_media_type(:xhtml, {semantics: :styled_microdata, conditions: :can_activate}))
> launch(c.to_media_type(:xhtml, {semantics: :styled_microdata, conditions: [:can_create, :can_delete]}))

> launch(c.to_media_type(:xhtml, {semantics: :styled_microdata, conditions: :can_do_anything, only: :kind}))
> launch(c.to_media_type(:xhtml, {semantics: :styled_microdata, conditions: :can_do_anything, except: :kind}))

```
