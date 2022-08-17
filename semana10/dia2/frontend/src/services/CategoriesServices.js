import { API_URL } from '@lib/Enviroments'

export const GetCategories = async () => {
  const response = await fetch(`${API_URL}/productos/categorias`)
  const data = await response.json()
  return data
}

export const PostCategory = async (category) => {
  const response = await fetch(`${API_URL}/productos/categorias`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(category)
  })
  const data = await response.json()
  return data
}
