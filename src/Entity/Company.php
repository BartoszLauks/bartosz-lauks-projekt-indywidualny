<?php

namespace App\Entity;

use App\Repository\CompanyRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\HasLifecycleCallbacks()]
#[ORM\Entity(repositoryClass: CompanyRepository::class)]
class Company
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $city = null;

    #[ORM\Column(length: 255)]
    private ?string $postCode = null;

    #[ORM\Column(length: 255)]
    private ?string $street = null;

    #[ORM\Column(length: 255)]
    private ?string $placeNumber = null;

    #[ORM\Column]
    private ?\DateTimeImmutable $createdAt = null;

    #[ORM\Column]
    private ?\DateTimeImmutable $updatedAt = null;

    #[ORM\OneToMany(mappedBy: 'company', targetEntity: Departament::class)]
    private Collection $departaments;

    #[ORM\Column(length: 255)]
    private ?string $name = null;

    public function __construct()
    {
        $this->departaments = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCity(): ?string
    {
        return $this->city;
    }

    public function setCity(string $city): static
    {
        $this->city = $city;

        return $this;
    }

    public function getPostCode(): ?string
    {
        return $this->postCode;
    }

    public function setPostCode(string $postCode): static
    {
        $this->postCode = $postCode;

        return $this;
    }

    public function getStreet(): ?string
    {
        return $this->street;
    }

    public function setStreet(string $street): static
    {
        $this->street = $street;

        return $this;
    }

    public function getPlaceNumber(): ?string
    {
        return $this->placeNumber;
    }

    public function setPlaceNumber(string $placeNumber): static
    {
        $this->placeNumber = $placeNumber;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeImmutable
    {
        return $this->createdAt;
    }

    public function getUpdatedAt(): ?\DateTimeImmutable
    {
        return $this->updatedAt;
    }

    /**
     * @return Collection<int, Departament>
     */
    public function getDepartaments(): Collection
    {
        return $this->departaments;
    }

    public function addDepartament(Departament $departament): static
    {
        if (!$this->departaments->contains($departament)) {
            $this->departaments->add($departament);
            $departament->setCompany($this);
        }

        return $this;
    }

    public function removeDepartament(Departament $departament): static
    {
        if ($this->departaments->removeElement($departament)) {
            // set the owning side to null (unless already changed)
            if ($departament->getCompany() === $this) {
                $departament->setCompany(null);
            }
        }

        return $this;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): static
    {
        $this->name = $name;

        return $this;
    }

    public function __toString(): string
    {
        return $this->name;
    }

    #[ORM\PrePersist()]
    public function initialObject(): static
    {
        $this->updatedAt = new \DateTimeImmutable('now');
        $this->createdAt = new \DateTimeImmutable('now');

        return $this;
    }

    #[ORM\PreUpdate()]
    public function updateObject(): static
    {
        $this->updatedAt = new \DateTimeImmutable('now');

        return $this;
    }
}
