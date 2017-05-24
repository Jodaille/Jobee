<?php

namespace Beetools\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

use Beetools\Model\Beehive;

class IndexController extends AbstractActionController
{
    public function indexAction()
    {
        $view   = new ViewModel();
        $oRuche = new Beehive();

        $aCalendars = array();
        foreach($oRuche->getTypes() as $type)
        {
          $aCalendars["$type"] = $oRuche->getCalendarOfType($type);
          echo $oRuche->toHtml($aCalendars["$type"]);
        }
        $view->aCalendars = $aCalendars;
        $view->oRuche     = $oRuche;

        return $view;
    }

}
