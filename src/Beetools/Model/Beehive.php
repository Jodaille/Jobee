<?php
/**
 * Try to represent evolution of bees and varroas
 * inside a honey bee colony in function of days
 */
class Beehive
{
    protected $aTypes = array('bee','mother','drone');

    public function getTypes()
    {
      return $this->aTypes;
    }

    public function getCalendarOfType($type)
    {
      $aBeille = array('title' => "Evolution of $type & varroas");
      for($day = 1; $day <= 31; $day++)
      {
        $state = $this->getState($day, $type);
        $cell = $this->getCell($day, $type);
        $event = $this->getEvent($day, $type);
        $aBeille['datas'][$day] = array(
            'state' => $state,
            'cell' => $cell,
            'event' => $event,
        );
      }
      return $aBeille;
    }

    public function toHtml($aBeille)
    {
        $html   = '<table name="' . $aBeille['title'] . '" >';
        $html  .= '<thead>';
        $html  .= '<caption>'. $aBeille['title'] .'</caption>';
        $html  .= '</thead>';
        $days   = '<tr>';
        $state  = '<tr>';
        $cell   = '<tr>';
        $events = '<tr>';
        foreach($aBeille['datas'] as $day => $d)
        {
            $days   .= '<td>' . $day . '</td>';
            $state  .= '<td>' . $d['state'] . '</td>';
            $cell   .= '<td>' . $d['cell'] . '</td>';
            $events .= '<td>' . $d['event'] . '</td>';
        }
        $state .= '</tr>';
        $cell .= '</tr>';
        $events .= '</tr>';
        $html .= $days . $state . $cell . $events;
        $html .= '<tbody>';
        $html .= '</tbody>';
        $html .= '</table>';
        return $html;
    }

    public function getState($day, $type)
    {
        $state = null;
        if($day <= 3)
        {
            $state = 'egg';
        }
        else
        {
            if($day > 3)
            {
                if($type == 'bee' OR $type ==  'mother')
                {
                    if($day <= 8)
                    {
                      $state = 'larva';
                    }
                    elseif($day <= 11 && $type == 'bee')
                    {
                      $state = 'cocoon';
                    }
                    elseif($day <= 10 && $type == 'mother')
                    {
                      $state = 'cocoon';
                    }
                }
                elseif($type == 'drone')
                {
                    if($day <= 9)
                    {
                      $state = 'larva';
                    }
                    elseif($day <= 12)
                    {
                      $state = 'cocoon';
                    }
                }
            }
        }

        return $state;
    }

    public function getCell($day, $type)
    {
        $cell = null;

        if($day <= 3)
        {
          $cell = 'wax';// cire
        }
        if($day > 3)
        {
            if($type == 'bee' OR $type == 'drone')
            {
                if($day <= 6)
                {
                    $cell = 'jelly';// cire
                }
                else
                {
                    if($day <= 8 && $type == 'bee')
                    {
                        $cell = 'larval boiled';
                    }
                    elseif($day <= 9 && $type == 'drone')
                    {
                        $cell = 'larval boiled';
                    }
                }
            }
            elseif($type == 'mother')
            {
                if($day <= 8)
                {
                    $cell = 'jelly';// cire
                }
            }

        }
        return $cell;
    }

    public function getEvent($day, $type)
    {
      $event   = null;

        if($type == 'bee')
        {
            if($day    == 8)
            {
              $event   = 'varroa inside';//
            }
            if($day    == 9)
            {
              $event   = 'capping';// operculation
            }
            if($day    == 21)
            {
              $event   = 'bee & varroas birth';//
            }
        }

        if($type == 'mother')
        {
            if($day    == 8)
            {
              $event   = 'varroa inside';//
            }
            if($day    == 9)
            {
              $event   = 'capping';// operculation
            }
            if($day    == 16)
            {
              $event   = 'mother birth';//
            }
            if($day    == (16 + 6))
            {
              $event = 'first fly';//
            }
        }
        if($type == 'drone')
        {
            if($day == 9)
            {
                $event = 'varroa inside';//
            }
            if($day == 10)
            {
                $event = 'capping';// operculation
            }
            if($day == 24)
            {
                $event = 'drone & varroas birth ';//
            }
        }
        return $event;
    }
}
