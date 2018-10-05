<?php
declare(strict_types=1);

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 */
class Example
{
    /** @ORM\Id @ORM\Column(type="integer")*/
    private $id;

    /** @ORM\Column(type="string", length=50, nullable=true) */
    private $test;
}
