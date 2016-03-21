package grailsdatabaseonetoone

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LifeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Life.list(params), model:[lifeCount: Life.count()]
    }

    def show(Life life) {
        respond life
    }

    def create() {
        respond new Life(params)
    }

    @Transactional
    def save(Life life) {
        if (life == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (life.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond life.errors, view:'create'
            return
        }

        life.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'life.label', default: 'Life'), life.id])
                redirect life
            }
            '*' { respond life, [status: CREATED] }
        }
    }

    def edit(Life life) {
        respond life
    }

    @Transactional
    def update(Life life) {
        if (life == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (life.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond life.errors, view:'edit'
            return
        }

        life.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'life.label', default: 'Life'), life.id])
                redirect life
            }
            '*'{ respond life, [status: OK] }
        }
    }

    @Transactional
    def delete(Life life) {

        if (life == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        life.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'life.label', default: 'Life'), life.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'life.label', default: 'Life'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
