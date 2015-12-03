//https://code.google.com/p/mql-projects/source/browse/trunk/MQL5/Include/Graph/Objects/Button.mqh?r=453


/*
 *   Button object
 */
class Button
{
private:
  string           _name;
  uint             _x, _y;
  uint             _width, _height;
  string           _caption;
  long             _chart_id;
  int              _sub_window;
  ENUM_BASE_CORNER _corner;
  long             _z_order;
  
public:
  Button(string name,
         uint x,
         uint y,
         uint width,
         uint height,
         long chart_id,
         int sub_window,
         ENUM_BASE_CORNER corner,
         long z_order
        ):
    _name (name),
    _x(x), _y(y),
    _width(width),
    _height(height),
    _chart_id(chart_id),
    _sub_window(sub_window),
    _corner(corner),
    _z_order(z_order)
  {
    bool objectCreated;
    
    if (ObjectFind(_chart_id, _name) < 0 )
    {

      objectCreated = ObjectCreate(_chart_id, _name, OBJ_BUTTON, _sub_window, 0, 0);

      if (objectCreated)
      {
        ObjectSetString (_chart_id, _name, OBJPROP_TEXT, _name);
        ObjectSetInteger(_chart_id, _name, OBJPROP_CORNER, _corner);
        ObjectSetInteger(_chart_id, _name, OBJPROP_XDISTANCE, _x);
        ObjectSetInteger(_chart_id, _name, OBJPROP_YDISTANCE, _y);
        ObjectSetInteger(_chart_id, _name, OBJPROP_SELECTABLE, false);
        ObjectSetInteger(_chart_id, _name, OBJPROP_ZORDER, _z_order);
        ObjectSetString (_chart_id, _name, OBJPROP_TOOLTIP, "\n");
      }
    }
  };

  void setState(bool state) {
    ObjectSetInteger(_chart_id, _name, OBJPROP_STATE, state);
  }

  bool getState() {
    return ObjectGetInteger(_chart_id, _name, OBJPROP_STATE);
  }
  
  ~Button()
  {
    if (!ObjectDelete(_chart_id, _name)) {
      Print("Failed to delete button: ", _name);
    }
  };
};
