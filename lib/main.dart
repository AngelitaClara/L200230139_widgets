import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    int columnCount = orientation == Orientation.portrait ? 2 : 4;

    return Scaffold(
      // ================= APPBAR =================
      appBar: AppBar(
        backgroundColor: Colors.blue,

        // leading
        leading: Icon(Icons.menu),

        // title
        title: Text("Tugas Widgets"),

        // 2 actions
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),

          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),

          // BONUS PopupMenuButton
          PopupMenuButton<String>(
            onSelected: (value) {},
            itemBuilder: (context) => [
              PopupMenuItem(value: "Profile", child: Text("Profile")),
              PopupMenuItem(value: "Settings", child: Text("Settings")),
              PopupMenuItem(value: "Help", child: Text("Help")),
              PopupMenuItem(value: "Logout", child: Text("Logout")),
            ],
          ),
        ],
      ),

      // ================= BODY =================
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== CONTAINER + BOXDECORATION =====
              Container(
                height: 120,
                width: double.infinity,

                decoration: BoxDecoration(
                  color: Colors.orange,

                  borderRadius: BorderRadius.circular(20),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),

                child: Center(
                  child: Text(
                    "Container BoxDecoration",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),

              SizedBox(height: 25),

              // ===== RICHTEXT =====
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Flutter ",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    TextSpan(
                      text: "Widgets ",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 24,
                        fontStyle: FontStyle.italic,
                      ),
                    ),

                    TextSpan(
                      text: "Mobile",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 24,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              // ===== FORM =====
              Form(
                key: _formKey,

                child: Column(
                  children: [
                    // FIELD NAMA
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Nama",
                        border: OutlineInputBorder(),
                      ),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Nama wajib diisi";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 15),

                    // FIELD EMAIL
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                      ),

                      validator: (value) {
                        if (value == null || !value.contains("@")) {
                          return "Email tidak valid";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 15),

                    // FIELD PASSWORD
                    TextFormField(
                      obscureText: true,

                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                      ),

                      validator: (value) {
                        if (value == null || value.length < 6) {
                          return "Password minimal 6 karakter";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Form berhasil divalidasi")),
                          );
                        }
                      },

                      child: Text("Submit"),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              // ===== ORIENTATION =====
              Text(
                "Responsive Grid",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 15),

              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),

                itemCount: 8,

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columnCount,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),

                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: Center(
                      child: Text(
                        "Item ${index + 1}",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
