defmodule Ctrl.Rpi.Backends do
  @moduledoc """
  Raspberry Pi backends.
  """

  alias Ctrl.Rpi.{ Gpio, W1 }

  defmodule HeaterBackend do
    @behaviour Ctrl.Heater.Backend

    @pin 17

    def init do
      Gpio.output_pin @pin
      :ok
    end

    def on! do
      Gpio.set_pin @pin, :on
      :on
    end

    def off! do
      Gpio.set_pin @pin, :off
      :off
    end
  end


  defmodule MeasureBackend do
    @behaviour Ctrl.Measure.Backend

    def init do
      :ok
    end

    def temperature? do
      W1.read W1.sensor
    end

    def time? do
      DateTime.utc_now |> DateTime.to_unix
    end
  end
end