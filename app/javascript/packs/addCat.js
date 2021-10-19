function addCategoryFS(e) {
  e.preventDefault()
  const nf = document.querySelector(".nested-forms")
  const fs = document.createElement('fieldset')
  fs.className = "category-fs"
  const index = nf.querySelectorAll('.category-fs').length
  console.log(index)

  fs.innerHTML = generateFSFields(index)

  nf.append(fs)
  

}

const generateFSFields = index => `<legend>Category:</legend>
<label for="post_categories_attributes_name">Name</label>
<input type="text" name="post[categories_attributes][][name]" id="post_categories_attributes_name" />
`

const addCatBtn = document.querySelector('#add-cat')
addCatBtn.addEventListener('click', addCategoryFS)
