class UniverseCreator
  CLUSTERS = 5
  GALAXIES_PER_CLUSTER = [3, 5]
  SYSTEMS_PER_GALAXY = [7, 13]
  PLANETS_PER_SYSTEM = [5, 11]

  def initialize
    @cluster_names = %w(bullet abell pandora musket phoenix)
    @galaxy_names  = %w(andromeda cigar centaur omega virgo canis delta augustus corney wasp)
    @system_names  = %w(alpha beta gamma corado zonda testa colamo token kipato nobu peruto kilo gamma rodeo kerstril brent sonic mario)
    @planet_names  = %w(mercury venus mars earth jupiter saturn uranus neptune pluto krypton tsubasi factor gibor anamo europa titan vir
                        kepler gilias tau zeta cobalt postor vivani colombo kanuti gespora volvea audito cosbeto kalisto kormar periva solta
                        cornicolus olymp penet kostado uran kerun silvoran kelina )

    @known_galaxies = []
    @known_systems = []
    @known_planets = []
  end

  def create
    universe = Universe.create(name: "miruna")

    (1..5).each {
      cluster = Cluster.create(name: @cluster_names.pop, universe: universe)

      puts cluster.name

      create_galaxies_for(cluster)
    }
  end

  private

  def create_galaxies_for(cluster)
    galaxies = get_random(GALAXIES_PER_CLUSTER)
    (1..galaxies).each do
      name = create_name(@galaxy_names, @known_galaxies)

      @known_galaxies << name
      galaxy = Galaxy.create(name: name, cluster: cluster)

      puts "  #{name}"

      create_systems_for(galaxy)
    end
  end

  def create_systems_for(galaxy)
    systems = get_random(SYSTEMS_PER_GALAXY)
    (1..systems).each do
      name = create_name(@system_names, @known_systems)

      @known_systems << name
      system = SolarSystem.create(name: name, galaxy: galaxy)

      puts "    #{name}"

      create_planets_for(system)
    end
  end

  def create_planets_for(system)
    planets = get_random(PLANETS_PER_SYSTEM)
    (1..planets).each do
      name = create_name(@planet_names, @known_planets)

      puts "      #{name}"

      @known_planets << name
      Planet.create(name: name, solar_system: system)
    end
  end

  def get_random(range)
    rand(range[0]..range[1])
  end

  def create_name(source, known)
    name = source.sample
    return name unless known.include?(name)

    i = 1
    new_name = name + "-#{i}"
    while known.include?(new_name)
      i = i+1
      new_name = name + "-#{i}"
    end
    new_name
  end
end
