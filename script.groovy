def buildApp() {
		echo "Building Application!!!???" 
}
def testApp() {
		echo "Testing the Application!!!???" 
}
def deployApp() {
        echo "Deploying version  ${params.VERSION}"
}

return this