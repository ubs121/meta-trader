// + ----------------------------------------------- -------------------+
// | MyPanel.mq5                                                       |
// | Copyright 2015, ubs121. http://ubs121.blogspot.com                 |
// | System requirements: MT4 build above 610                           |
// + ----------------------------------------------- -------------------+
#property strict
#property description "My First panel"

#include <Controls\Button.mqh>
#include <Controls\Dialog.mqh>

CDialog* dlg;


int OnInit() {
  
  long chart_id = ChartID();
  ChartSetInteger(chart_id,CHART_EVENT_MOUSE_MOVE,1);
  
  // create dialog
  dlg = new CDialog();
  dlg.Create(chart_id, "dlg1", 0, 10, 10, 200, 200);
  
  // add button
  CButton* btn = new CButton();
  btn.Create(chart_id, "my_btn", 0, 10, 10, 100, 40);
  btn.Text("My button");
  dlg.Add(btn);

  Print("dlg created...", dlg.Name());

  return (0);
}

void OnTick() {

  
}

void OnChartEvent(const int id,         // Event identifier  
                  const long& lparam,   // Event parameter of long type
                  const double& dparam, // Event parameter of double type
                  const string& sparam) // Event parameter of string type
  {
    //if (sparam == dlg.Name()) {
      dlg.OnEvent(id, lparam, dparam, sparam);
    //}
  }


void OnDeinit(const int reason) {
  dlg.Destroy();
}