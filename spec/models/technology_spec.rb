require 'rails_helper'

RSpec.describe Technology, type: :model do
  context 'Associations' do
    describe Project do
      it 'has_and_belongs_to_many :projects' do
        tech1 = create :technology, 1
        tech2 = create :technology, 2

        p1 = create :project, 1
        p2 = create :project, 2

        tech1.projects.should eq []
        tech2.projects.should eq []

        tech1.projects << p1
        tech1.projects << p2

        tech1.projects.should eq [p1, p2]
        tech2.projects.should eq []

        tech2.projects << p1
        tech2.projects << p2

        tech1.projects.should eq [p1, p2]
        tech2.projects.should eq [p1, p2]
      end
    end
  end

  context 'Factories' do
    it 'has a valid factory' do
      technology = build :technology
      technology.should be_valid
      assert technology.save
    end

    it 'has a valid "1" trait' do
      technology = build :technology, 1
      technology.name.should eq 'tech1'
      technology.link.should eq 'http://github.com/cnunez/tech1'
      technology.should be_valid
      assert technology.save
    end

    it 'has a valid "2" trait' do
      technology = build :technology, 2
      technology.name.should eq 'tech2'
      technology.link.should eq 'http://github.com/cnunez/tech2'
      technology.should be_valid
      assert technology.save
    end
  end

  context 'Validations' do
    describe ':link' do
      it 'presence: true' do
        t1 = build :technology, link: nil
        t2 = build :technology, link: ''
        t3 = build :technology, link: '    '
        t4 = build :technology, link: 'test'

        t1.should_not be_valid
        t2.should_not be_valid
        t3.should_not be_valid
        t4.should be_valid

        t1.errors.to_a.should eq ["Link can't be blank"]
        t2.errors.to_a.should eq ["Link can't be blank"]
        t3.errors.to_a.should eq ["Link can't be blank"]
        t4.errors.to_a.should eq []

        refute t1.save
        refute t2.save
        refute t3.save
        assert t4.save
      end

      it 'uniqueness: true' do
        t1 = build :technology, name: 1, link: 'test1'
        t2 = build :technology, name: 2, link: 'test1'
        t3 = build :technology, name: 3, link: 'test2'

        t1.should be_valid
        t2.should be_valid
        t3.should be_valid

        assert t1.save
        refute t2.save
        assert t3.save

        t1.errors.to_a.should eq []
        t2.errors.to_a.should eq ['Link has already been taken']
        t3.errors.to_a.should eq []
      end
    end

    describe ':name' do
      it 'presence: true' do
        t1 = build :technology, name: nil
        t2 = build :technology, name: ''
        t3 = build :technology, name: '    '
        t4 = build :technology, name: 'test'

        t1.should_not be_valid
        t2.should_not be_valid
        t3.should_not be_valid
        t4.should be_valid

        t1.errors.to_a.should eq ["Name can't be blank"]
        t2.errors.to_a.should eq ["Name can't be blank"]
        t3.errors.to_a.should eq ["Name can't be blank"]
        t4.errors.to_a.should eq []

        refute t1.save
        refute t2.save
        refute t3.save
        assert t4.save
      end

      it 'uniqueness: true' do
        t1 = build :technology, link: 1, name: 'test1'
        t2 = build :technology, link: 2, name: 'test1'
        t3 = build :technology, link: 3, name: 'test2'

        t1.should be_valid
        t2.should be_valid
        t3.should be_valid

        assert t1.save
        refute t2.save
        assert t3.save

        t1.errors.to_a.should eq []
        t2.errors.to_a.should eq ['Name has already been taken']
        t3.errors.to_a.should eq []
      end
    end
  end
end
