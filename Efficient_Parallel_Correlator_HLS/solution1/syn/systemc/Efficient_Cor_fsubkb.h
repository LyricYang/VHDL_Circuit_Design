<?xml version="1.0" encoding="UTF-8"?>
<GenRun Id="DDR_FDD_IN_synth_1" LaunchPart="xc7a200tsbg484-1" LaunchTime="1473301475">
  <File Type="RDS-DCP" Name="DDR_FDD_IN.dcp"/>
  <File Type="PA-TCL" Name="DDR_FDD_IN.tcl"/>
  <File Type="RDS-PROPCONSTRS" Name="DDR_FDD_IN_drc_synth.rpt"/>
  <File Type="RUN-CONSTRS" Name="$PDATADIR/runs/DDR_FDD_IN_synth_1/constrs_in.xml"/>
  <File Type="RDS-UTIL-PB" Name="DDR_FDD_IN_utilization_synth.pb"/>
  <File Type="RUN-SRCS" Name="$PDATADIR/runs/DDR_FDD_IN_synth_1/sources.xml"/>
  <File Type="RUN-STRAT" Name="$PDATADIR/runs/DDR_FDD_IN_synth_1/DDR_FDD_IN_synth_1.psg"/>
  <File Type="RDS-RDS" Name="DDR_FDD_IN.vds"/>
  <File Type="RDS-UTIL" Name="DDR_FDD_IN_utilization_synth.rpt"/>
  <File Type="VDS-TIMINGSUMMARY" Name="DDR_FDD_IN_timing_summary_synth.rpt"/>
  <File Type="VDS-TIMING-PB" Name="DDR_FDD_IN_timing_summary_synth.pb"/>
  <FileSet Name="sources" Type="BlockSrcs" RelSrcDir="$PSRCDIR/DDR_FDD_IN">
    <File Path="$PSRCDIR/sources_1/ip/DDR_FDD_IN/DDR_FDD_IN.xci">
      <FileInfo>
        <Attr Name="UsedIn" Val="synthesis"/>
        <Attr Name="UsedIn" Val="implementation"/>
        <Attr Name="UsedIn" Val="simulation"/>
      </FileInfo>
    </File