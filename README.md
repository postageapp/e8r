# e8r

E8R is a series of exensions to [Enumerable](https://ruby-doc.org/core-3.0.1/Enumerable.html)
to expand the contexts in which that approach can be used.

The initial targets are:

* [Async](https://github.com/socketry/async) tasks
* Threads using an optional thread pool
* Ractors, using an optional ractor pool

> This is currently an experimental project. The names are all arbitrary and
> subject to change.

## Installation

Add to your `Gemfile`:

```ruby
gem 'e8r'
```

Then:

```shell
bundle install
```

## Usage

E8R patches into Enumerable and Enumerator to add these new capabilities.

### Async

```ruby
example = (1..100).to_a
accum = [ ]

example.async do |e|
  Async do
    accum << e * 2
  end
end.wait

accum

```