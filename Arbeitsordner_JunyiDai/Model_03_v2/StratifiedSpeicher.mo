model StratifiedSpeicher
  BuildingSystems.Fluid.Sources.Boundary_pT sin2(T = 293.15, nPorts = 1, p(displayUnit = "Pa"), use_T_in = false) annotation(
    Placement(visible = true, transformation(origin = {68, 2}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  BuildingSystems.Fluid.Sources.MassFlowSource_T sou2(T = 283.15, m_flow = 0, nPorts = 1, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(extent = {{80, -54}, {60, -34}}, rotation = 0)));
  BuildingSystems.Technologies.ThermalStorages.BaseClasses.StratificationModel.PartialInletStratification partialInletStratification(nEle = nEle) annotation(
    Placement(visible = true, transformation(extent = {{-66, -20}, {-46, 0}}, rotation = 0)));
  BuildingSystems.Technologies.ThermalStorages.FluidStorage storage(AdditionalFluidPorts = true, Ele_HX_1 = 2, HX_1 = false, HX_2 = false, T_start(displayUnit = "degC") = 283.15, height = 2.0, nEle = nEle) annotation(
    Placement(visible = true, transformation(extent = {{10, -30}, {50, 10}}, rotation = 0)));
  BuildingSystems.Fluid.Sources.MassFlowSource_T sou1(T = 333.15, m_flow = 1, nPorts = 1, use_m_flow_in = false) annotation(
    Placement(visible = true, transformation(extent = {{-100, -18}, {-80, 2}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 298.15) annotation(
    Placement(visible = true, transformation(extent = {{-40, 50}, {-20, 70}}, rotation = 0)));
  Modelica.Blocks.Sources.Pulse m_flow2(amplitude = 0.83, nperiod = 1, offset = 0.0, period = 18000, startTime = 0, width = 18000) annotation(
    Placement(visible = true, transformation(origin = {-128, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Pulse m_flow1(amplitude = 0.83, nperiod = 1, offset = 0.0, period = 57600, startTime = 28800, width = 57600) annotation(
    Placement(visible = true, transformation(origin = {106, -36}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(partialInletStratification.port_b_bot, storage.port_a1) annotation(
    Line(points = {{-47, -19}, {-8, -19}, {-8, -28}, {16, -28}}, color = {0, 127, 255}));
  connect(partialInletStratification.port_b_top, storage.port_b1) annotation(
    Line(points = {{-47, -1}, {-2, -1}, {-2, 8}, {16, 8}}, color = {0, 127, 255}));
  connect(sou1.ports[1], partialInletStratification.port_a) annotation(
    Line(points = {{-80, -8}, {-72, -8}, {-72, -19}, {-61, -19}}, color = {0, 127, 255}));
  connect(storage.port_b2, sou2.ports[1]) annotation(
    Line(points = {{44, -28}, {60, -28}, {60, -44}}, color = {0, 127, 255}));
  connect(storage.port_a2, sin2.ports[1]) annotation(
    Line(points = {{44, 8}, {52, 8}, {52, 2}, {58, 2}}, color = {0, 127, 255}));
  connect(partialInletStratification.ports_b[i], storage.port_a[i]) annotation(
    Line(points = {{-47, -10}, {16, -10}}, color = {0, 127, 255}));
  connect(fixedTemperature.port, storage.heatPort) annotation(
    Line(points = {{-20, 60}, {30, 60}, {30, 10.8}}, color = {191, 0, 0}));
  connect(partialInletStratification.T, storage.T) annotation(
    Line(points = {{-56, 0}, {-56, 16}, {-18, 16}, {-18, -4}, {2, -4}, {2, 2}, {15.2, 2}}, color = {0, 0, 127}));
  connect(m_flow2.y, sou1.T_in) annotation(
    Line(points = {{-116, -6}, {-102, -6}, {-102, -4}}, color = {0, 0, 127}));
  connect(m_flow1.y, sou2.m_flow_in) annotation(
    Line(points = {{96, -36}, {82, -36}}, color = {0, 0, 127}));
  annotation(
    uses(BuildingSystems(version = "2.0.0-beta"), Modelica(version = "3.2.3")),
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-6, Interval = 3600));
end StratifiedSpeicher;
