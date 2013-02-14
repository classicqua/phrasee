module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end


  def default_user_image_tag
    return '<img class="img-polaroid" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAADFUlEQVR4Xu2Y+UsqcRTFjy3aZhJltGAuP5hFEUpEG/73khkWglhqP2hZFLTYvufjXN486lnoTBah90IQ8+Y7d+75nu/59MZ2dnZWQQuXTQVQB+gR0Axo4QyEhqBSQCmgFFAKKAVaWAHFoGJQMagYVAy2MAT0P0OKQcWgYlAxqBhUDJpU4OLiAufn53h5eYHL5cLQ0NCnT+C9V1dXGB4eht1ur7vTT/Tgy5jGYKFQwO7uLrq6utDe3o6bmxuMjY1henq6arjb21skEgk8Pz9jeXkZPT09dQnwEz2MFzElAIddW1vDxMQEgsGgPGNnZwccdGZm5t0Oc+iNjQ3c39+LU1ZWVtDd3V1TgJ/o8fYlTAmQy+VwcHCAaDSKtrY2Gayjo6NqqEqlglQqBdrY6/WKY1ZXV8U1rO3tbTw8PGB2dlZctLe3h5OTE0xOTsrzG9GjptJ/bzAlwObmpgzd29uL4+Nj+b2vrw9TU1OSBUZx4GKxiEgkgru7O2QymXcCMBPoDoozOjqK9fV1jI+Pi6sa1eNbBIjH47i+vobT6YTH45EePK+Pj49i8c7OThwdHSGdTstu8p7Dw8MqAbiOu57P5yUXbDYbFhYWxFWN7FGPCKYcsLW1hdPTUywuLsrOs4yB5+bm5BozgmnPnGBdXl7KPT6fT4ZlYBoVi8XEIeFwGIODg3K50T1qiWBKgGw2i1KpJHZ2OBzybOIwmUwKBSgALcwdNer19fVfVvT398uxYBnOoFgMx/n5eVnXyB61hue/mxKA9ifW3G43AoGABBjPd7lcxtLS0ocpz0Bj6L2lgIFH/m1AR1BAv98vz2xUj3qGNy0AF+zv78vZ5c6ySIFQKISRkZEPe/Kskx4UiOHJ4OTAxCOvMTeMXac7BgYGvtyj3uEtCcBFRBh3ikVbc4jP6unpCfwhAg10cj3dYxwjivL/ta/0+HYBzDT47feayoDfPoyV91MB9JOYfhLTT2L6ScxKejbLGqWAUkApoBRQCjRLoluZQymgFFAKKAWUAlbSs1nWKAWUAkoBpYBSoFkS3cocLU+BP2VC558D5x+0AAAAAElFTkSuQmCC" />'
  end
end
