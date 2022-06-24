model Probe
  BuildingSystems.Fluid.Sources.MassFlowSource_T source2(T = 333.15, m_flow = 0.83, nPorts = 1, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(extent = {{48, -48}, {28, -28}}, rotation = 0)));
  BuildingSystems.Fluid.Sources.MassFlowSource_T source1(T = 283.15, m_flow = 0.83, nPorts = 1, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(extent = {{-42, -48}, {-22, -28}}, rotation = 0)));
  Modelica.Blocks.Sources.Pulse m_flow2(amplitude = 0.83, nperiod = 1, offset = 0.0, period = 18000, startTime = 0, width = 18000) annotation(
    Placement(visible = true, transformation(extent = {{76, -40}, {56, -20}}, rotation = 0)));
  BuildingSystems.Fluid.Sources.Boundary_pT sink2(T = 293.15, nPorts = 1, p(displayUnit = "Pa"), use_T_in = false) annotation(
    Placement(visible = true, transformation(origin = {38, 2}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  BuildingSystems.Fluid.Sources.Boundary_pT sink1(T = 293.15, nPorts = 1, p(displayUnit = "Pa"), use_T_in = false) annotation(
    Placement(visible = true, transformation(origin = {-60, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 298.15) annotation(
    Placement(visible = true, transformation(extent = {{-52, 52}, {-32, 72}}, rotation = 0)));
  BuildingSystems.Technologies.ThermalStorages.FluidStorage storage(AdditionalFluidPorts = false, Ele_HX_1 = 2, HX_1 = true, HX_2 = false, T_start(displayUnit = "degC") = 283.15, height = 2.0, nEle = 10) annotation(
    Placement(visible = true, transformation(extent = {{-20, -28}, {20, 12}}, rotation = 0)));
  Modelica.Blocks.Sources.Pulse m_flow1(amplitude = 0.83, nperiod = 1, offset = 0.0, period = 57600, startTime = 28800, width = 57600) annotation(
    Placement(visible = true, transformation(extent = {{-72, -58}, {-52, -38}}, rotation = 0)));
equation
  connect(fixedTemperature.port, storage.heatPort) annotation(
    Line(points = {{-32, 62}, {0, 62}, {0, 12.8}}, color = {191, 0, 0}));
  connect(source2.m_flow_in, m_flow2.y) annotation(
    Line(points = {{48, -30}, {55, -30}}, color = {0, 0, 127}));
  connect(sink2.ports[1], storage.port_HX_1_b) annotation(
    Line(points = {{28, 2}, {26, 2}, {26, -14}, {14, -14}, {14, -20}}, color = {0, 127, 255}));
  connect(sink1.ports[1], storage.port_b1) annotation(
    Line(points = {{-50, 10}, {-14, 10}}, color = {0, 127, 255}));
  connect(source1.m_flow_in, m_flow1.y) annotation(
    Line(points = {{-42, -30}, {-48, -30}, {-48, -48}, {-51, -48}}, color = {0, 0, 127}));
  connect(source1.ports[1], storage.port_a1) annotation(
    Line(points = {{-22, -38}, {-20, -38}, {-20, -26}, {-14, -26}}, color = {0, 127, 255}));
  connect(storage.port_HX_1_a, source2.ports[1]) annotation(
    Line(points = {{14, -16}, {20, -16}, {20, -38}, {28, -38}}, color = {0, 127, 255}));
  annotation(
    uses(BuildingSystems(version = "2.0.0-beta"), Modelica(version = "3.2.3")));
end Probe;
