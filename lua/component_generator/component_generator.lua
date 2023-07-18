local function generate_component(name)
  local file_content = string.format([[
import React from 'react';

const %s = () => {
  return (
    <div>
      <h1>Hello, %s!</h1>
    </div>
  );
};

export default %s;
]], name, name, name)

  return file_content
end

local function generate_test(name)
  local test_content = string.format([[
import React from 'react';
import { render } from '@testing-library/react';
import %s from './%s';

test('renders %s component', () => {
  render(<%s />);
});
]], name, name, name, name)

  return test_content
end

local function open_text_box()
  local name = vim.fn.input("Enter the component name: ")

  if name ~= "" then
    local component_dir = "components/" .. name

    -- Check if the component directory exists
    if vim.fn.isdirectory(component_dir) == 0 then
      -- Create the component directory recursively
      vim.fn.mkdir(component_dir, "p")
    end

    local component_file_name = component_dir .. "/" .. name .. ".tsx"
    local test_file_name = component_dir .. "/" .. name .. ".test.tsx"

    -- Generate component file
    local component_content = generate_component(name)
    local component_file = io.open(component_file_name, "w")
    if component_file ~= nil then
      component_file:write(component_content)
      component_file:close()
    else
      print("Failed to create component file: " .. component_file_name)
      return
    end

    -- Generate test file
    local test_content = generate_test(name)
    local test_file = io.open(test_file_name, "w")
    if test_file ~= nil then
      test_file:write(test_content)
      test_file:close()
    else
      print("Failed to create test file: " .. test_file_name)
      return
    end

    print("Component files generated: " .. component_file_name .. ", " .. test_file_name)
  end
end

return {
  open_text_box = open_text_box
}
