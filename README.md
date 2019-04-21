# cerebro

The goal of cerebro is to find unique people (entities (mutants?)) in a dataset and assign them a unique ID.

[Cerebro-Wikipedia](https://en.wikipedia.org/wiki/Cerebro)

## Why would I need this?

I receive some data from an organization where individual people have more than one record. Often, I will need to identify unique people in the data before I can complete my analysis. However, this task is frequently complicated by misspelled names ("John" vs. "Jon"), mistyped dates of birth (2019-04-21 vs. 2019-05-21), missing data, and other data entry errors. So, finding unique people requires a method that allows for fuzzy string matches and other matching criteria that allow for error tolerance.

## Other packages

There are other existing packages that may be used for this task. Some that I'm aware of include:

* [RecordLinkage](https://github.com/cran/RecordLinkage)   
* [fastLink](https://github.com/kosukeimai/fastLink)   
* [fuzzyjoin](https://github.com/dgrtwo/fuzzyjoin)   

However, there are things about each of these packages that make them less-than ideal for the way I would like to complete this task. 

Eventually, I will get around to outlining exactly what those things are and adding some performance comparisons here.