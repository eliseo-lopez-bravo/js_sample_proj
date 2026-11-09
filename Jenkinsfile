pipeline {
    agent any

    environment {
        PHONE_IP = '192.168.1.70'
        PHONE_USER = 'u0_a435'
        PHONE_PORT = '8022'
    }

    stages {

        stage('Deploy Application') {
            steps {

                sshagent(credentials: ['android-termux-key']) {

                    sh '''
                        scp -P ${PHONE_PORT} \
                        app.js deploy.sh \
                        ${PHONE_USER}@${PHONE_IP}:apps/demo/

                        ssh -p ${PHONE_PORT} \
                        ${PHONE_USER}@${PHONE_IP} \
                        'bash ~/apps/demo/deploy.sh'
                    '''
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                sh '''
                    ssh -p ${PHONE_PORT} \
                    ${PHONE_USER}@${PHONE_IP} \
                    'curl -s http://127.0.0.1:3000'
                '''
            }
        }
    }
}
