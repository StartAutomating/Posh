
describe "Posh News" {
    it "Is a collection of news feeds from a module" {
        $Posh.News.All.Count | Should -BeGreaterThan 1
    }

    it "Only has blogs that have articles" {
        foreach ($feed in $Posh.News.All) {
            if (-not $feed.Article) {
                throw "$($feed.Name) has no articles!"
            }
        }
    }

    it "Does not have to ask for feeds twice" {
        $startTime = [datetime]::Now
        @(foreach ($feed in $Posh.News.All) {
            $feed.Article
        })
        ([DateTime]::Now - $startTime) | Should -BeLessThan ([timespan]"00:00:01")
    }

    it "Ensures all articles have a [string].Name" {
        $Posh.News.All.Article.Name | Should -BeOfType ([string])
    }
}
