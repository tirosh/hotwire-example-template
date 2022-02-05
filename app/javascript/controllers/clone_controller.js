import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "template" ]

  append() {
    for (const target of this.templateTargets) {
      const { content } = target

      this.element.append(content.cloneNode(true))
    }
  }
}
