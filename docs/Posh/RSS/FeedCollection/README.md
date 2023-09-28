## Posh.RSS.FeedCollection


Modules can put News in their module manifest.

Posh provides a simple RSS reader to help you stay up to date.

To view recent articles, use

~~~PowerShell
    $Posh.News.Recent
~~~

To view all feeds, use

~~~PowerShell
    $Posh.News.All
~~~

To view all articles from all feeds, use

~~~PowerShell
    $Posh.News.All.Article
~~~

To see a specific feed, use:

~~~PowerShell
    $Posh.News.Feed["PowerShell Team"]
~~~
### Script Methods


* [get_Feed](get_Feed.md)
* [get_Random](get_Random.md)
* [get_Recent](get_Recent.md)
* [get_RecentDuration](get_RecentDuration.md)
* [set_RecentDuration](set_RecentDuration.md)
