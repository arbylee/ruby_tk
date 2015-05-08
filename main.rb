require 'tk'

class MysteryApp
  def initialize
    @root = TkRoot.new(height: 500,
                       width: 420,
                       background: 'lightblue') {title ":)"}
    @timer = TkTimer.new
    @canvas = TkCanvas.new(background: 'grey')
    @canvas.place(height: 400, width: 400, x: 10, y: 10)
    @rectangles = [ [200, 10, 220, 80],

                    [200, 120, 220, 140],
                    [180, 100, 200, 120],
                    [160, 100, 180, 120],
                    [140, 120, 160, 140],
                    [140, 140, 160, 160],
                    [140, 160, 160, 180],
                    [160, 180, 180, 200],
                    [180, 200, 200, 220],
                    [200, 220, 220, 240],
                    [220, 100, 240, 120],
                    [240, 100, 260, 120],
                    [260, 120, 280, 140],
                    [280, 140, 260, 160],
                    [280, 160, 260, 180],
                    [260, 180, 240, 200],
                    [240, 200, 220, 220],

                    [160, 240, 180, 340],
                    [180, 320, 240, 340],
                    [240, 240, 260, 340]
                  ]
  end

  def run
    if @rectangles.any?
      @timer.stop
      @timer.start(300, proc{ place_rectangle(*@rectangles.shift); run })
    end
  end

  def mainloop
    Tk.mainloop
  end

  def place_rectangle(x1, y1, x2, y2)
    TkcRectangle.new(@canvas, x1, y1, x2, y2, { fill: 'purple' })
  end
end


app = MysteryApp.new
button = TkButton.new do
  text "Start"
  background "green"
  command proc {app.run}
end
button.place(height: 20, width: 60, x: 180, y: 450)

app.mainloop
