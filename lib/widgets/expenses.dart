
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
class Expenses extends StatefulWidget{
  const Expenses({super.key});

  @override
  State<Expenses> createState(){

    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses>{
final List<Expense> _registeredExpenses =[
  Expense(
    title: 'Flutter course',
     amount: 19.99,
     date: DateTime.now(),
   category:  Category.food,
     
     
  ),

   Expense(
    title: 'Cinema',
     amount: 15.39,
     date: DateTime.now(),
      category: Category.leisure,
  ),
];
void _openAddExpenseOverlay(){
  showModalBottomSheet(
    useSafeArea: true,
    isScrollControlled: true,
  context: context,
   builder: (ctx)=> NewExpense(onAddExpense: _addExpense),
   );
}
void _addExpense (Expense expense){
  setState(() {
  _registeredExpenses.add(expense);
  });
}

void _removeExpense(Expense expense){
  final expenseIndex = _registeredExpenses.indexOf(expense);

  setState(() {
    _registeredExpenses.remove(expense);
  });
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 4),
      content:const Text ('Expense deleted'),
      action: SnackBarAction(
        label: 'undo',
        onPressed: (){
          setState(() {
            _registeredExpenses.insert(expenseIndex, expense);
          });
        },
        ),
      ),
    );
}

  @override
  Widget build(BuildContext context){

  
   final width = MediaQuery.of(context).size.width;

    Widget mainContext =const Center(
      child: Text('No expenses found.start adding some'),
    );
    if (_registeredExpenses.isNotEmpty){
      mainContext =ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

   return  Scaffold (
    appBar: AppBar(
      centerTitle: false,
      title: const Text('Flutter ExpenseTracker'),
     actions: [
      IconButton(
        onPressed:_openAddExpenseOverlay,
        icon:const Icon(Icons.add),
      ),
     ], 
    ),
    body:width < 600
    ? Column(
    children:  [
      Chart (expenses: _registeredExpenses),
      Expanded(
       child:mainContext
        
      ),
   ],
   )
   : Row(children: [
    Expanded(
      child: Chart (expenses: _registeredExpenses),
    ),
      Expanded(
       child:mainContext
        
      ),
   ]),
   );
  }
}