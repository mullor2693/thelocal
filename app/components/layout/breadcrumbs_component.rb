class Layout::BreadcrumbsComponent < ViewComponent::Base
  def initialize(links:)
    @links = links
  end

  def call
    <nav aria-label="breadcrumb" role="navigation">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
        <li class="breadcrumb-item active" aria-current="page">Library</li>
      </ol>
    </nav>
  end

end
