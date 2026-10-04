using ListerAPI.Helpers;
using ListerAPI.Models;
using ListerAPI.Repository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Controllers
{
    [Route("lister/[controller]")]
    [ApiController]
    public class SearchEngineController : ControllerBase
    {
        private readonly SearchEngine searchEngine;
        private readonly IItemsRepository _itemsRepository;
        private readonly IRestaurantsRepository _restaurantsRepository;
        private readonly ITypesRepository _typesRepository;

        public SearchEngineController(IItemsRepository itemsRepository, IRestaurantsRepository restaurantsRepository, ITypesRepository typesRepository)
        {
            _itemsRepository = itemsRepository;
            _restaurantsRepository = restaurantsRepository;
            _typesRepository = typesRepository;
            searchEngine = new SearchEngine(_itemsRepository, _typesRepository, _restaurantsRepository);
        }

        [HttpGet("{KeyWord}")]
        public async Task<IActionResult> Search(string KeyWord)
        {
            SearchData searchData = await searchEngine.Search(KeyWord);
            return Ok(searchData);
        }
    }
}
