<?php
return array(
	'app_start'=> array('Common\Behavior\InitHookBehavior'),
	'app_end' => array('Common\Behavior\CronRunBehavior'),
);