//FILE: {:NAME:}_test.sv
//==============================================================================
// Declaration
//------------------------------------------------------------------------------
class {:NAME:}_test extends uvm_test;
  `uvm_component_utils({:NAME:}_test)
  {:NAME:}_env m_env;
  extern function new (string _name="", uvm_component _parent=null);
  extern function void build_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
endclass: {:NAME:}_test

//==============================================================================
// Implementation
//------------------------------------------------------------------------------
function {:NAME:}_test::new (string _name="", uvm_component _parent=null);
  super.new(_name, _parent);                                         
  `uvm_info("debug", "{:NAME:}_test::new", UVM_MEDIUM)                
endfunction: new

function void {:NAME:}_test::build_phase(uvm_phase phase);
  super.build_phase(phase); //< enable automation
  // Configure
  // Create
  m_env =  {:NAME:}_env::type_id::create("m_env", this);               
endfunction: build_phase

task {:NAME:}_test::run_phase(uvm_phase phase);
  {:SEQ:} main_sequence;
  main_sequence = {:SEQ:}::type_id::create();                        
  phase.raise_objection(this);                                     
  main_sequence.start(m_env.m_sequencer);                                    
  phase.drop_objection(this);                                      
endtask: run_phase

//==============================================================================
// Copyright & Licensing
//------------------------------------------------------------------------------
// {:COPYRIGHT:}
//
// {:include:$LICENSING:}

//The end
