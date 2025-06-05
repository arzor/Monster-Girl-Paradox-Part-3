#========================#
# Vibration Support v1.0 |
# By JoSmiHnTh           |
#========================#
class VibrationSequence

  def initialize
    @sequence = [].cycle
    @max_duration = -1
    @current_duration = 0
  end

  def refresh(sequence, duration)
    @sequence = sequence.cycle
    @max_duration = duration

  end

  def update
    return if @max_duration == -1

    @max_duration -= 1
    return WolfPad.set_motors(0, 0) if @max_duration <= 0

    if @current_duration > 0
      @current_duration -= 1

    else
      command = @sequence.next
      WolfPad.set_motors(command[0], command[1])
      @current_duration = command[2]

    end

  end

end


class HeartbeatVibration < VibrationSequence

  def start(duration)
    self.refresh([[0, 0.3, 22], [0.25, 0, 15], [0, 0, 18]], duration)
  end

end


class ScreenShakeVibration < VibrationSequence

  def start(power, speed, duration)
    motor_speed = (power - 1) / (9 - 1).to_f
    motor_delay =  (4 * (speed - 1) / (9 - 1).to_f)

    self.refresh([[0, motor_speed, motor_delay], [motor_speed, 0, motor_delay]], duration)
  end

end

$screen_shake_vibration = ScreenShakeVibration.new
$heartbeat_vibration = HeartbeatVibration.new

class Game_Screen

  alias old_start_shake :start_shake
  def start_shake(power, speed, duration)
    old_start_shake(power, speed, duration)
    $screen_shake_vibration.start(power, speed, duration)
  end

  alias old_update_shake :update_shake
  def update_shake
    old_update_shake
    $screen_shake_vibration.update
  end

  alias old_update_pictures :update_pictures
  def update_pictures
    old_update_pictures
    $heartbeat_vibration.update
  end

end

class Game_Picture

  alias old_move :move
  def move(origin, x, y, zoom_x, zoom_y, opacity, blend_type, duration)
    old_move(origin, x, y, zoom_x, zoom_y, opacity, blend_type, duration)

    if %w[sys_white].include?(@name)
      $heartbeat_vibration.start(duration)
    end

  end

end