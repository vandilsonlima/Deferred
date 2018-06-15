## Installation

Deferred is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Deferred', :git => 'https://github.com/vandilsonlima/Deferred.git', :branch => 'master'
```

### We can use it like this:

```swift
async {
    let value = task().await().value
    let value2 = task2(value).await().value
    let value3 = task3(value2).await().value
    print(value3)
}
```

### Instead of this:
```swift
task { value in
    task2(value) { value2 in
        task3(value2) { value3 in
            print(value3)
        }
    }
}
```


## Author

Vandilson Lima, vandilson.lim4@gmail.com

## License

Deferred is available under the MIT license. See the LICENSE file for more info.
