class Event < ApplicationRecord


    #  ---  RELATIONS ---

    has_many :participations
    has_many :users, through: :participations
    belongs_to :admin, class_name: 'User'
    

    #  ---  VALIDATIONS --- 


    #  START-DATE : sa présence est obligatoire, et il est impossible de créer ou modifier un événement dans le passé
    validates :start_date, 
        #sa présence est obligatoire
        presence: true
        #il est impossible de créer ou modifier un événement dans le passé
        validate :time_in_futur
    
        def time_in_futur
            if start_date != nil
            if Time.now > start_date
              errors.add(:start_date, "Impossible, la date est passée!")
            end
          end
        end



    #  DURATION : Sa présence est obligatoire et le nombre de minutes doit être un multiple de 5, et est strictement positif 
    
    validates :duration, 
        #Sa présence est obligatoire
        presence: true, 
        #est strictement positif
        numericality: { only_integer: true, greater_than: 0 }
        #nombre de minutes doit être un multiple de 5
        validate :multiple_of_5
        def multiple_of_5
            if duration != nil
                if duration % 5 != 0
                    errors.add(:duration, "Impossible, la durée doit être un multiple de 5")
                end
            end
          end



    #  TITLE : Sa présence est obligatoire et doit faire au moins 5 caractères et maxi 140 caractères.
    
    validates :title, 
        #Sa présence est obligatoire
        presence: true, 
        #doit faire au moins 5 caractères et maxi 140 caractères
        length: { minimum: 5, maximum: 140 }



    #  DESCRIPTION : Sa présence est obligatoire et la description doit faire entre 20 et 1000 caractères.
    
    validates :description, 
        #Sa présence est obligatoire
        presence: true, 
        #doit faire entre 20 et 1000 caractères.
        length: { minimum: 20, maximum: 1000 }



    #  PRICE : Sa présence est obligatoire et cet integer doit être compris entre 1 et 1000.
    
    validates :price, 
        #Sa présence est obligatoire
        presence: true, 
        #cet integer doit être compris entre 1 et 1000.
        numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000}
    


    #  LOCATION : Sa présence est obligatoire
    
    validates :location, 
        #Sa présence est obligatoire
        presence: true 


end
