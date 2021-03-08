require 'rails_helper'

RSpec.describe Project, type: :model do
  context 'Associations' do
    describe Technology do
      it 'has_and_belongs_to_many :technologies' do
        # we want to figure out if 2+ projects can be associated to 2+ technologies
        p1 = create :project, 1
        p2 = create :project, 2

        tech1 = create :technology, 1
        tech2 = create :technology, 2

        p1.technologies.should eq []
        p2.technologies.should eq []

        p1.technologies << tech1
        p1.technologies << tech2

        p1.technologies.should eq [tech1, tech2]
        p2.technologies.should eq []

        p2.technologies << tech1
        p2.technologies << tech2

        p1.technologies.should eq [tech1, tech2]
        p2.technologies.should eq [tech1, tech2]
      end
    end

    pending 'Image'
  end

  context 'Factories' do
    it 'has a valid factory' do
      project = build :project
      project.should be_valid
      assert project.save
    end

    it 'has a valid "1" trait' do
      project = build :project, 1
      project.name.should eq 'test1'
      project.order.should eq 1
    end

    it 'has a valid "2" trait' do
      project = build :project, 2
      project.name.should eq 'test2'
      project.order.should eq 2
    end
  end

  context 'Instance Methods' do
    describe ':technologies_left' do
      before do
        @project = create :project
        @tech1 = create :technology, name: 'test1', link: '123'
        @tech2 = create :technology, name: 'test2', link: '456'
      end

      it 'returns technologies not associated with projects yet' do
        @project.technologies_left.should eq [@tech1, @tech2]

        @project.technologies << @tech2

        @project.technologies_left.should eq [@tech1]

        @project.technologies << @tech1

        @project.technologies_left.should eq []
      end
    end
  end

  context 'Validations' do
    describe ':description' do
      it 'presence: true' do
        p1 = build :project, description: nil
        p2 = build :project, description: ''
        p3 = build :project, description: '    '
        p4 = build :project, description: 'test'

        p1.should_not be_valid
        p2.should_not be_valid
        p3.should_not be_valid
        p4.should be_valid

        p1.errors.to_a.should eq ["Description can't be blank"]
        p2.errors.to_a.should eq ["Description can't be blank"]
        p3.errors.to_a.should eq ["Description can't be blank"]
        p4.errors.to_a.should eq []

        refute p1.save
        refute p2.save
        refute p3.save
        assert p4.save
      end
    end

    pending ':image default & content_type'

    describe ':live_site' do
      it 'presence: true' do
        p1 = build :project, live_site: nil
        p2 = build :project, live_site: ''
        p3 = build :project, live_site: '    '
        p4 = build :project, live_site: 'test'

        p1.should_not be_valid
        p2.should_not be_valid
        p3.should_not be_valid
        p4.should be_valid

        p1.errors.to_a.should eq ["Live site can't be blank"]
        p2.errors.to_a.should eq ["Live site can't be blank"]
        p3.errors.to_a.should eq ["Live site can't be blank"]
        p4.errors.to_a.should eq []

        refute p1.save
        refute p2.save
        refute p3.save
        assert p4.save
      end
    end

    describe ':name' do
      it 'presence: true' do
        p1 = build :project, name: nil
        p2 = build :project, name: ''
        p3 = build :project, name: '    '
        p4 = build :project, name: 'test'

        p1.should_not be_valid
        p2.should_not be_valid
        p3.should_not be_valid
        p4.should be_valid

        p1.errors.to_a.should eq ["Name can't be blank"]
        p2.errors.to_a.should eq ["Name can't be blank"]
        p3.errors.to_a.should eq ["Name can't be blank"]
        p4.errors.to_a.should eq []

        refute p1.save
        refute p2.save
        refute p3.save
        assert p4.save
      end

      it 'uniqueness: true' do
        p1 = build :project, order: 1, name: 'portfolio'
        p2 = build :project, order: 2, name: 'portfolio'
        p3 = build :project, order: 3, name: 'where we dream'

        p1.should be_valid
        p2.should be_valid
        p3.should be_valid

        p1.errors.to_a.should eq []
        p2.errors.to_a.should eq []
        p3.errors.to_a.should eq []

        assert p1.save
        refute p2.save
        assert p3.save

        p1.errors.to_a.should eq []
        p2.errors.to_a.should eq ['Name has already been taken']
        p3.errors.to_a.should eq []
      end
    end

    describe ':order' do
      it 'uniqueness: true' do
        p1 = build :project, name: 'portfolio1', order: 1
        p2 = build :project, name: 'portfolio2', order: 1
        p3 = build :project, name: 'portfolio3', order: 2

        p1.should be_valid
        p2.should be_valid
        p3.should be_valid

        p1.errors.to_a.should eq []
        p2.errors.to_a.should eq []
        p3.errors.to_a.should eq []

        assert p1.save
        refute p2.save
        assert p3.save

        p1.errors.to_a.should eq []
        p2.errors.to_a.should eq ['Order has already been taken']
        p3.errors.to_a.should eq []
      end
    end

    describe ':repo_url' do
      it 'presence: true' do
        p1 = build :project, repo_url: nil
        p2 = build :project, repo_url: ''
        p3 = build :project, repo_url: '    '
        p4 = build :project, repo_url: 'test'

        p1.should_not be_valid
        p2.should_not be_valid
        p3.should_not be_valid
        p4.should be_valid

        p1.errors.to_a.should eq ["Repo url can't be blank"]
        p2.errors.to_a.should eq ["Repo url can't be blank"]
        p3.errors.to_a.should eq ["Repo url can't be blank"]
        p4.errors.to_a.should eq []

        refute p1.save
        refute p2.save
        refute p3.save
        assert p4.save
      end
    end
  end
end
