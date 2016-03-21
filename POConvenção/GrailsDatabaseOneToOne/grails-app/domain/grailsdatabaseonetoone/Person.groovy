package grailsdatabaseonetoone

class Person {

    Integer code
    String name
    Date  birthday

    static hasOne = [life: Life]

    static constraints = {
      life unique: true
      life nullable: true
    }

    String  toString(){
      return code
    }
}
