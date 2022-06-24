model Pufferspeicher2
  package Medium = BuildingSystems.Media.Water;
  BuildingSystems.Technologies.ThermalStorages.FluidStorage storage1(
  redeclare package Medium = Medium, 
  redeclare package Medium_HX_1 = Medium,
  redeclare package Medium_HX_2 = Medium,
  AdditionalFluidPorts = false,  
  Ele_HX_1=2,
  HX_1=false,
  HX_2=false,
  T_start(displayUnit = "degC") = 283.15, 
  V = 0.4, height = 0.3, nEle = 10) annotation(
    Placement(visible = true, transformation(origin = {-10, -69}, extent = {{-28, -21}, {28, 21}}, rotation = 0)));
  Modelica.Blocks.Sources.Pulse m_flow1(amplitude = 0.83, nperiod = 1, offset = 0.0, period = 57600, startTime = 28800, width = 57600) annotation(
    Placement(visible = true, transformation(origin = {68, 14}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  BuildingSystems.Fluid.Sources.MassFlowSource_T source1(
  redeclare package Medium = Medium,
  T = 283.15, m_flow = 0.83, nPorts = 1, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  BuildingSystems.Technologies.ThermalStorages.FluidStorage storage3(
  redeclare package Medium = Medium,
  redeclare package Medium_HX_1 = Medium,
  redeclare package Medium_HX_2 = Medium,  
  AdditionalFluidPorts = false, 
  Ele_HX_1=2,
  HX_1=false,
  HX_2=false,
  V = 1.0, height = 0.75, nEle = 10) annotation(
    Placement(visible = true, transformation(origin = {-12, 50}, extent = {{-26, -20}, {26, 20}}, rotation = 0)));
  BuildingSystems.Fluid.Sources.MassFlowSource_T source2(
  redeclare package Medium = Medium,
  T = 333.15, m_flow = 0.83, nPorts = 1, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {-50, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Pulse m_flow2(amplitude = 0.83, nperiod = 1, offset = 0.0, period = 18000, startTime = 0, width = 18000) annotation(
    Placement(visible = true, transformation(origin = {-92, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  BuildingSystems.Fluid.Sources.Boundary_pT sink2(
  redeclare package Medium = Medium,
  T = 293.15, nPorts = 1, p(displayUnit = "Pa"), use_T_in = false) annotation(
    Placement(visible = true, transformation(origin = {-73, -49}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
  BuildingSystems.Fluid.Sources.Boundary_pT sink1(
  redeclare package Medium = Medium,
  T = 293.15, nPorts = 1, p(displayUnit = "Pa"), use_T_in = false) annotation(
    Placement(visible = true, transformation(origin = {-68, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 298.15) annotation(
    Placement(visible = true, transformation(origin = {62, 78}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature6(T = 298.15) annotation(
    Placement(visible = true, transformation(origin = {40, 42}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature7(T = 298.15) annotation(
    Placement(visible = true, transformation(origin = {50, -42}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  BuildingSystems.Technologies.ThermalStorages.FluidStorage storage2(
  redeclare package Medium = Medium, 
  redeclare package Medium_HX_1 = Medium,
  redeclare package Medium_HX_2 = Medium,
  AdditionalFluidPorts = false, 
  Ele_HX_1 = 2, 
  HX_1 = false, 
  HX_2 = false, 
  V = 0.6, height = 0.45, nEle = 10) annotation(
    Placement(visible = true, transformation(origin = {-11, -9}, extent = {{-27, -21}, {27, 21}}, rotation = 0)));
  BuildingSystems.Fluid.Movers.FlowControlled_m_flow pump2(
  redeclare package Medium = Medium,
    m_flow_nominal = 5.0,
    riseTime(displayUnit="min") = 1440)annotation(
    Placement(visible = true, transformation(origin = {-62, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  BuildingSystems.Fluid.Movers.FlowControlled_m_flow pump1(
  redeclare package Medium = Medium,
    m_flow_nominal = 5.0,
    riseTime(displayUnit="min") = 1440)annotation(
    Placement(visible = true, transformation(origin = {-52, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.RealExpression realExpression(y = 1)  annotation(
    Placement(visible = true, transformation(origin = {-86, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = 1)  annotation(
    Placement(visible = true, transformation(origin = {-86, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(m_flow2.y, source2.m_flow_in) annotation(
    Line(points = {{-81, -82}, {-70.5, -82}, {-70.5, -78}, {-62, -78}}, color = {0, 0, 127}));
  connect(sink2.ports[1], storage1.port_b1) annotation(
    Line(points = {{-60, -49}, {-48, -49}, {-48, -50}, {-30, -50}}, color = {0, 127, 255}));
  connect(fixedTemperature.port, storage3.heatPort) annotation(
    Line(points = {{52, 78}, {-12, 78}, {-12, 70}}, color = {191, 0, 0}));
  connect(source2.ports[1], storage1.port_a1) annotation(
    Line(points = {{-40, -86}, {-30, -86}, {-30, -88}}, color = {0, 127, 255}));
  connect(sink1.ports[1], storage3.port_b1) annotation(
    Line(points = {{-58, 74}, {-38, 74}, {-38, 68}, {-30, 68}}, color = {0, 127, 255}));
  connect(source1.ports[1], storage2.port_a2) annotation(
    Line(points = {{20, 10}, {8, 10}}, color = {0, 127, 255}));
  connect(storage1.heatPort, fixedTemperature7.port) annotation(
    Line(points = {{-10, -48}, {-8, -48}, {-8, -42}, {40, -42}}, color = {191, 0, 0}));
  connect(storage2.heatPort, fixedTemperature6.port) annotation(
    Line(points = {{-10, 12}, {16, 12}, {16, 42}, {30, 42}}, color = {191, 0, 0}));
  connect(source1.m_flow_in, m_flow1.y) annotation(
    Line(points = {{42, 18}, {52, 18}, {52, 14}, {58, 14}}, color = {0, 0, 127}));
  connect(storage1.port_b1, pump1.port_a) annotation(
    Line(points = {{-30, -50}, {-52, -50}, {-52, -38}}, color = {0, 127, 255}));
  connect(pump1.port_b, storage2.port_a1) annotation(
    Line(points = {{-52, -18}, {-52, -12}, {-40, -12}, {-40, -28}, {-30, -28}}, color = {0, 127, 255}));
  connect(realExpression1.y, pump1.m_flow_in) annotation(
    Line(points = {{-74, -24}, {-66, -24}, {-66, -28}, {-64, -28}}, color = {0, 0, 127}));
  connect(pump2.port_b, storage3.port_a1) annotation(
    Line(points = {{-62, 32}, {-62, 38}, {-38, 38}, {-38, 32}, {-30, 32}}, color = {0, 127, 255}));
  connect(pump2.port_a, storage2.port_b1) annotation(
    Line(points = {{-62, 12}, {-47, 12}, {-47, 10}, {-30, 10}}, color = {0, 127, 255}));
  connect(realExpression.y, pump2.m_flow_in) annotation(
    Line(points = {{-74, 20}, {-75, 20}, {-75, 22}, {-74, 22}}, color = {0, 0, 127}));
  annotation(
    uses(BuildingSystems(version = "2.0.0-beta"), Modelica(version = "3.2.3")),
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 3600));
end Pufferspeicher2;
