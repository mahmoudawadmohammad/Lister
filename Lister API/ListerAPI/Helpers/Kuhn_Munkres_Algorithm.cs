using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Helpers
{
    public class Kuhn_Munkres_Algorithm
    {
        private readonly int[,] _costMatrix;
        private int _inf;
        private int number_of_elements;
        private int[] labels_for_workers;
        private int[] labels_for_jobs;
        private bool[] _s;
        private bool[] _t;
        private int[] vertex_matched_with_x;
        private int[] vertex_matched_with_y;
        private int _maxMatch;
        private int[] _slack;   
        private int[] _slackx;
        private int[] memorizing_paths;

        public Kuhn_Munkres_Algorithm(int[,] costMatrix)
        {
            _costMatrix = costMatrix;
        }
        public int[] Run()
        {
            number_of_elements = _costMatrix.GetLength(0);

            labels_for_workers = new int[number_of_elements];
            labels_for_jobs = new int[number_of_elements];
            _s = new bool[number_of_elements];
            _t = new bool[number_of_elements];
            vertex_matched_with_x = new int[number_of_elements];
            vertex_matched_with_y = new int[number_of_elements];
            _slack = new int[number_of_elements];
            _slackx = new int[number_of_elements];
            memorizing_paths = new int[number_of_elements];
            _inf = int.MaxValue;


            InitMatches();
            // hangaren method need same numb no all arrys
            if (number_of_elements != _costMatrix.GetLength(1))
                return null;

            InitLbls();

            _maxMatch = 0;

            InitialMatching();

            var q = new Queue<int>();

            #region augment

            while (_maxMatch != number_of_elements)
            {
                q.Clear();
                InitSt();
                //parameters for keeping the position of root node and two other nodes
                var root = 0;
                int x;
                var y = 0;

                //find root of the tree
                for (x = 0; x < number_of_elements; x++)
                {
                    if (vertex_matched_with_x[x] != -1) continue;
                    q.Enqueue(x);
                    root = x;
                    memorizing_paths[x] = -2;
                    _s[x] = true;
                    break;
                }

                //init slack
                for (var i = 0; i < number_of_elements; i++)
                {
                    _slack[i] = _costMatrix[root, i] - labels_for_workers[root] - labels_for_jobs[i];
                    _slackx[i] = root;
                }

                //finding augmenting path
                while (true)
                {
                    while (q.Count != 0)
                    {
                        x = q.Dequeue();
                        var lxx = labels_for_workers[x];
                        for (y = 0; y < number_of_elements; y++)
                        {
                            if (_costMatrix[x, y] != lxx + labels_for_jobs[y] || _t[y]) continue;
                            if (vertex_matched_with_y[y] == -1) break; //augmenting path found!
                            _t[y] = true;
                            q.Enqueue(vertex_matched_with_y[y]);

                            AddToTree(vertex_matched_with_y[y], x);
                        }
                        if (y < number_of_elements) break; //augmenting path found!
                    }
                    if (y < number_of_elements) break; //augmenting path found!
                    UpdateLabels(); //augmenting path not found, update labels

                    for (y = 0; y < number_of_elements; y++)
                    {
                        //in this cycle we add edges that were added to the equality graph as a
                        //result of improving the labeling, we add edge (slackx[y], y) to the tree if
                        //and only if !T[y] &&  slack[y] == 0, also with this edge we add another one
                        //(y, yx[y]) or augment the matching, if y was exposed

                        if (_t[y] || _slack[y] != 0) continue;
                        if (vertex_matched_with_y[y] == -1) //found exposed vertex-augmenting path exists
                        {
                            x = _slackx[y];
                            break;
                        }
                        _t[y] = true;
                        if (_s[vertex_matched_with_y[y]]) continue;
                        q.Enqueue(vertex_matched_with_y[y]);
                        AddToTree(vertex_matched_with_y[y], _slackx[y]);
                    }
                    if (y < number_of_elements) break;
                }

                _maxMatch++;

                //inverse edges along the augmenting path
                int ty;
                for (int cx = x, cy = y; cx != -2; cx = memorizing_paths[cx], cy = ty)
                {
                    ty = vertex_matched_with_x[cx];
                    vertex_matched_with_y[cy] = cx;
                    vertex_matched_with_x[cx] = cy;
                }
            }

            #endregion

            return vertex_matched_with_x;
        }
        //set all valus to -1 n the main tow arry
        private void InitMatches()
        {
            for (var i = 0; i < number_of_elements; i++)
            {
                vertex_matched_with_x[i] = -1;
                vertex_matched_with_y[i] = -1;
            }
        }

        private void InitSt()
        {
            for (var i = 0; i < number_of_elements; i++)
            {
                _s[i] = false;
                _t[i] = false;
            }
        }

        private void InitLbls()
        {
            //find the smaller num in row and set it to -1 
            for (var i = 0; i < number_of_elements; i++)
            {
                var minRow = _costMatrix[i, 0];
                for (var j = 0; j < number_of_elements; j++)
                {
                    if (_costMatrix[i, j] < minRow) minRow = _costMatrix[i, j];
                    if (minRow == 0) break;
                }
                labels_for_workers[i] = minRow;
            }
            //find the smaller num in coluomn and sub tract it from the smaller row and saving it 
            for (var j = 0; j < number_of_elements; j++)
            {
                var minColumn = _costMatrix[0, j] - labels_for_workers[0];
                for (var i = 0; i < number_of_elements; i++)
                {
                    if (_costMatrix[i, j] - labels_for_workers[i] < minColumn) minColumn = _costMatrix[i, j] - labels_for_workers[i];
                    if (minColumn == 0) break;
                }
                labels_for_jobs[j] = minColumn;
            }
        }

        private void UpdateLabels()
        {
            var delta = _inf;
            for (var i = 0; i < number_of_elements; i++)
                if (!_t[i])
                    if (delta > _slack[i])
                        delta = _slack[i];
            for (var i = 0; i < number_of_elements; i++)
            {
                if (_s[i])
                    labels_for_workers[i] = labels_for_workers[i] + delta;
                if (_t[i])
                    labels_for_jobs[i] = labels_for_jobs[i] - delta;
                else _slack[i] = _slack[i] - delta;
            }
        }

        private void AddToTree(int x, int prevx)
        {
            //x-current vertex, prevx-vertex from x before x in the alternating path,
            //so we are adding edges (prevx, matchX[x]), (matchX[x],x)

            _s[x] = true; //adding x to S
            memorizing_paths[x] = prevx;

            var lxx = labels_for_workers[x];
            //updateing slack
            for (var y = 0; y < number_of_elements; y++)
            {
                if (_costMatrix[x, y] - lxx - labels_for_jobs[y] >= _slack[y]) continue;
                _slack[y] = _costMatrix[x, y] - lxx - labels_for_jobs[y];
                _slackx[y] = x;
            }
        }

        private void InitialMatching()
        {
            for (var x = 0; x < number_of_elements; x++)
            {
                for (var y = 0; y < number_of_elements; y++)
                {
                    if (_costMatrix[x, y] != labels_for_workers[x] + labels_for_jobs[y] || vertex_matched_with_y[y] != -1) continue;
                    vertex_matched_with_x[x] = y;
                    vertex_matched_with_y[y] = x;
                    _maxMatch++;
                    break;
                }
            }
        }
    }
}
