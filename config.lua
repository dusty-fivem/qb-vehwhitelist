Config = {}

-- car wl config for emergency vehicles
Config.emergencyJobs = { -- Put here the job that you want to drive in the emergencyVehicles below
    'police', --Job Name
}

Config.emergencyVehicles = { -- Put here the vehicles that you want only emergency services to be able to get in
    'adder', -- Vehicle spawncode to restrict to the job
    'emskiastinger',
    'nswasiload',
    'nswsorento',
    'sprinter19b',

}

Config.NotifyMessage = 'This vehicle is for emergency services only!' -- The message if the person is kicked out of the vehicle

Config.CheckTime = 1000 -- Check time if person is in emergency vehicle, **don't go under 1000** if you want a good and stable server
