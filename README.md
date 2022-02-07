# Hotwire: Server-rendering alerts for client-side actions

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)][heroku-deploy-app]

[heroku-deploy-app]: https://heroku.com/deploy?template=https://github.com/thoughtbot/hotwire-example-template/tree/hotwire-example-flash-message-button

[It all starts with HTML][].

Stimulus controllers are at their best when they read and write their state to
HTML. Controller state is most often synthesized from [attributes][], but can
also come from content like [`<template>`][template] elements.

[It All Starts With HTML]: https://stimulus.hotwired.dev/handbook/hello-stimulus#it-all-starts-with-html
[HTML attributes]: https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes
[template]: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/template

# Our starting point

We'll start by recreating the [_Building Something Real_][] example from the
[Stimulus Handbook][].

[_Building Something Real_]: https://stimulus.hotwired.dev/handbook/building-something-real
[Stimulus Handbook]: https://stimulus.hotwired.dev/handbook/introduction
[readonly]: https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/readonly

Our controller:

```ruby
# app/controllers/invitation_codes_controller.rb

class InvitationCodesController < ApplicationController
  def show
    @invitation_code = params[:id]
  end
end
```

Our view template:

```erb
<%# app/views/invitation_codes/show.html.erb %>

<section>
  <h1>Invitations</h1>

  <fieldset>
    <label for="invitation_code" class="block">Invitation Code</label>
    <input id="invitation_code" class="block" value="<%= @invitation_code %>" readonly>

    <button type="button" value="<%= @invitation_code %>"
            data-controller="clipboard"
            data-action="click->clipboard#copy">
      Copy to clipboard
    </button>
  </fieldset>

  <fieldset>
    <label for="paste">Paste</label>
    <input id="paste">
  </fieldset>
</section>
```

The `clipboard` Stimulus controller:

```javascript
// app/javascript/controllers/clipboard_controller.js

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  copy({ target: { value } }) {
    navigator.clipboard.writeText(value)
  }
}
```

https://user-images.githubusercontent.com/2575027/152818126-821a4e64-8318-44a0-bbd5-0d1aa3e132fc.mov
