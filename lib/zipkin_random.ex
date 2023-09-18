defmodule ZipkinRandom do
  require OpenTelemetry.Tracer

  def hello do
    serviceA = UUID.uuid4() |> IO.inspect(label: "serviceA")
    serviceB = UUID.uuid4() |> IO.inspect(label: "serviceB")


    OpenTelemetry.Tracer.start_span("service_A_" <> serviceA)

    Process.sleep(50)

    OpenTelemetry.Tracer.with_span "service_B_" <> serviceB do
      Process.sleep(50)
    end

    Process.sleep(50)

    OpenTelemetry.Tracer.end_span()
  end
end
