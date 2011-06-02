#!/usr/bin/env php
<?php
require_once 'USVN/autoload.php';

$configfile = $argv[1];

try {
        USVN_Translation::initTranslation('en_US', 'locale');
        $config = new USVN_Config_Ini($configfile, 'general');
        Zend_Db_Table::setDefaultAdapter(Zend_Db::factory($config->database->adapterName, $config->database->options->toArray()));
        Zend_Db_Table::getDefaultAdapter()->getProfiler()->setEnabled(true);
        USVN_Db_Table::$prefix = $config->database->prefix;
        Zend_Registry::set('config', $config);
        USVN_Authz::generate();
}
catch (Exception $e) {
        echo $e->getMessage() . "\n";
        exit(1);
}

echo "OK";

exit(0);
?>
