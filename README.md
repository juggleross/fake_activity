# FakeActivity

Your github activity isn't enough? No problem, let's change that.

## Installation

Install it yourself as:

    $ gem install fake_activity

## Usage

To use this gem you just need to write the following:

    $ fake_activity "1 Jan 2018" "16 Jul 2018"
    
Where `1 Jan 2018` is the start date of the period and `16 Jul 2018` is its end.

Let me explain the whole usage cycle:

**1. Сlone any github repo (new or old doesn't matter)**
        
    $ git clone https://github.com/juggleross/your_repo.git
        
**2. Select the desired time interval. Go to the project and run 'fake_activity' gem ( It would be better to choose an interval of not more than six months, because github can not draw activity for a longer period of time in one attempt )**
        
    $ fake_activity "1 Jan 2018" "16 Jul 2018"
        
**3. Check your commits and then push the changes to github**
        
    $ git push origin master
        
**4. You are perfect! If you want to remove this activity later, just delete your repository.**

    
## How it works?

This gem just generates a bunch of empty commits to the past. But for github, it doesn't matter. It will display this activity anyway.

Commits are generated with the following command:

    $ git commit -m "1 Jan 2018" --allow-empty --date="1 Jan 2018"
    
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/juggleross/fake_activity. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the FakeActivity project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/fake_activity/blob/master/CODE_OF_CONDUCT.md).
