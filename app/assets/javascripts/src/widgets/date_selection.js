$(function() {

  Ext.define('Gowane.Widgets.DateSelection', {
    extend: 'Ext.form.Panel',
    alias: "widget.date_selection",
    bodyPadding: 10,
    defaultType: 'textfield',
    title: "Periode",
    bbar: [{xtype: 'button', text: "Update"}],
    items: [
      {
        xtype: 'datefield',
        fieldLabel: 'From',
        name: 'fromDay'
      },
      {
        xtype: 'datefield',
        fieldLabel: 'To',
        name: 'toDay'
      }
    ]
  });

});