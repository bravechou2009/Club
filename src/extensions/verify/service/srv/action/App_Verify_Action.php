<?php

abstract class App_Verify_Action{
	
	public $unique = true;
	
	abstract function checkVerify($check);
	
	abstract function buildDetail($check);
}