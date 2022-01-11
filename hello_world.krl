ruleset hello_world {
  meta {
    name "Hello World"
    description <<
A first ruleset for the Quickstart
>>
    author "Phil Windley"
    shares hello
  }
   
  global {
    hello = function(obj) {
      msg = "Hello " + obj;
      msg
    }
  }
   
  rule hello_world {
    select when echo hello
    send_directive("say", {"something": "Hello World"})
  }

  //This uses the || operator
  // rule monkey {
  //   select when echo monkey
  //   pre {
  //     name = event:attr("name").klog("Given name: ")
  //   }
  //   send_directive("say", {"something": "Hello " + (name || "Monkey")})
  // }
   
  //This uses the ternary conditional
  rule monkey {
    select when echo monkey
    pre {
      name = event:attr("name").klog("Given name: ")
    }
    send_directive("say", {"something": "Hello " + ((name) => name | "Monkey")})
  }
}