import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}
class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _isDarkTheme = false; 
  void _toggleTheme(){
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    
    });
  }
  
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'Theme Switcher',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
        
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: _isDarkTheme? ThemeMode.dark: ThemeMode.light,
      home:HomePage (toggleTheme: _toggleTheme),
    );
  }
}

class HomePage extends StatelessWidget {
  final VoidCallback toggleTheme;
  const HomePage({required this.toggleTheme, super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        title: const Text('Theme Switcher'),
        backgroundColor: const Color.fromARGB(255, 200, 159, 198),  
        actions: [
          IconButton(            
          icon:const Icon(Icons.toggle_off_outlined),
          onPressed: toggleTheme, 
          )
        ],     
       ),
       body: Center(   
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const MyTextField(),
            const SizedBox(height: 59,),
             ElevatedButton(onPressed: (){

             }, 
             child: const Text('Submit me')),

          ],
        ),
        
        
       ),
    );
  }
}
class MyTextField extends StatefulWidget {
  const MyTextField({super.key});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  final TextEditingController nameController =TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey <FormState> _formKey = GlobalKey <FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 30,),
        SizedBox(
        width: 400,
        child: TextFormField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'Enter your name',
            border: OutlineInputBorder(),

          ),
          validator: (value){
            if(value == null || value.isEmpty){
              return 'Please, enter your name';
            }
            return null;
            
          },
        ),
        ),
        const SizedBox(height: 15,),
        SizedBox(
        width: 400,
        child: TextFormField(
          controller: emailController,
          decoration:const InputDecoration(
            labelText: 'Enter a valid email  address',
            border: OutlineInputBorder(),
          ),
          validator: (value){
            if (value == null || value.isEmpty){
              return 'Please a valid email';
            }
            const emailPattern = 
            r'^[a-zA-Z0-9._%-+]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
            if(!RegExp(emailPattern).hasMatch(value)){
              return 'Please enter a valid email';
            }
            return null ; 
          },

        ),
        ),
        const SizedBox(height: 15,),
        SizedBox(
          width: 400,
         child: TextFormField(
          controller: passwordController,
          decoration:const InputDecoration(
            labelText: 'Enter your password',
            border: OutlineInputBorder(),
      

          ),
          validator: (value){
            if(value == null || value.isEmpty){
              return 'Enter a valid password';
            }
            else if(value.length < 6){
              return 'Password must be at least 6 characters';
            }
            return null ; 
            
          },
        ),
        ),
      ],
    ),
    );
  }
  @override 
  void dispose(){
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
