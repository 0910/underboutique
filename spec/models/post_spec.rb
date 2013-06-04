require 'spec_helper'

describe Post do
  it 'creates a standard post correctly' do
    expect do
      create(:post)
      create(:post, :published)
      create(:post, :video)
      create(:post, :video, :published)
    end.not_to raise_exception
  end
  
  describe 'when using pre-calculated categories' do
    subject{ Post.category_fieldnames }

    it{ should be_an Array }

    its(:size){ should == 3 }

    it 'fieldnames' do
      subject.all?{|k| k.is_a?(Symbol)}.should be_true
      subject.all?{|k| k =~ /^on_(bikes|travel)_[a-z_].*$/}.should be_true
    end
  end
  
  it 'gets all posts for a given blog' do
    create(:post)
    post = create(:post, on_bikes_featured: true)
    Post.find_by_blog('bikes').should == [post]
  end
  
  it 'gets a categories label' do
    Post.category_labels[:on_bikes_featured].should == 'bikes/featured'
  end
  
  it 'has an accessor for all the categories it was published on' do
    create(:post, :published, :video, on_travel_remote: true)
      .published_in.should == 'bikes/featured, travel/remote'
  end
end
