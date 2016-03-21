package grailsdatabaseonetoone

class Life {


    String style
    Person person

    static constraints = {
    }

    String toString(){
      return style
    }
}
