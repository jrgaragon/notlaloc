const router = function () {
    let self = this;
    self.routesNoAuthRequired = ['/authenticate', '/noAuth'];

    self.getNoAuthRoutes = async function () {
        return self.routesNoAuthRequired;
    }
};

router.getInstance = function () {
    return new router();
}

module.exports = router;
