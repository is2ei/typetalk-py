typetalk-py
===

[![PyPI](https://img.shields.io/pypi/v/typetalk.svg)](https://pypi.python.org/pypi/typetalk)
[![Build Status](https://travis-ci.com/is2ei/typetalk-py.svg?branch=master)](https://travis-ci.com/is2ei/typetalk-py)
[![Coverage Status](https://coveralls.io/repos/github/is2ei/typetalk-py/badge.svg?branch=master)](https://coveralls.io/github/is2ei/typetalk-py?branch=master)

Typetalk API client written in Python

Usage
---

#### Simple bot example

```python
import os
import typetalk

bot = typetalk.Bot(token=os.environ['TYPETALK_TOKEN'])

res = bot.post_message(
    topic_id=os.environ['TYPETALK_TOPIC_ID'],
    message='Hello, world!'
)
assert res['post']['message'] == 'Hello, world!'
```

Links
---

- [Typetalk API Document](https://developer.nulab.com/docs/typetalk/)
