//+------------------------------------------------------------------+
//|                                                       BuyNow.mq4 |
//|     Chuba G. Moganedi, Copyright 2019, MetaQuotes Software Corp. |
//|                                      chubagarfieldmoganedi.co.za |
//+------------------------------------------------------------------+

#property copyright "Chuba G. Moganedi, Copyright 2019, MetaQuotes Software Corp."
#property link      "chubagarfieldmoganedi.co.za"
#property version   "1.00"
#property strict
#property script_show_inputs

//--- input parameters

input double   LOTS     =  0.1;
input uint     TP_PIPS  =  750;
input uint     SL_PIPS  =  750;
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
{
   if ( sendBuyOrder() < 0)
   {
      Alert("Failed to send the buy order: ", GetLastError());
   }
   else
   {
      Alert("Order successfuly placed: ", Symbol());
   }
   return;
}
//+------------------------------------------------------------------+

int sendBuyOrder()
{
   return OrderSend(Symbol(), OP_BUY, LOTS, Ask, 2, Bid - SL_PIPS * Point, Bid + TP_PIPS * Point);
}
