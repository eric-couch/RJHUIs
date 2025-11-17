using System;
using DevExpress.Web;
using DevExpress.Web.Data;

public class TestEvents {
    void TestHandler1(object sender, ASPxDataInsertingEventArgs e) { 
        var newValues = e.NewValues;
        e.Cancel = false;
    }
    
    void TestHandler2(object sender, ASPxDataUpdatingEventArgs e) { 
        var keys = e.Keys;
        var newValues = e.NewValues;
        var oldValues = e.OldValues;
        e.Cancel = false;
    }
    
    void TestHandler3(object sender, ASPxDataDeletingEventArgs e) { 
        var keys = e.Keys;
        var values = e.Values;
        e.Cancel = false;
    }
}
