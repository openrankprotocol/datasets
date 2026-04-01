# OpenRank Protocol Datasets

This repository contains example seed and trust datasets used by the [OpenRank Protocol](https://github.com/openrankprotocol).

## Repository Structure

```
datasets/
├── seed/           # Seed trust datasets
│   ├── degen.csv
│   ├── jamfrens.csv
│   ├── openrank.csv
│   └── small.csv
└── trust/          # Local trust datasets
    ├── degen.csv
    ├── jamfrens.csv
    ├── openrank.csv
    └── small.csv
```

## Dataset Formats

### Seed Trust (`seed/`)

Seed trust files define the initial trust scores for nodes. Each file is a CSV with the following format:

| Column | Type    | Description                    |
|--------|---------|--------------------------------|
| `i`    | string  | Node identifier                |
| `v`    | numeric | Trust score value              |

Example:
```csv
i,v
1,0.1
2,0.5
3,0.4
```

### Local Trust (`trust/`)

Local trust files define the trust relationships between nodes. Each file is a CSV with the following format:

| Column | Type    | Description                    |
|--------|---------|--------------------------------|
| `i`    | string  | Source node identifier         |
| `j`    | string  | Target node identifier         |
| `v`    | integer | Trust score value              |

Example:
```csv
i,j,v
1,2,30
1,3,40
2,1,10
2,3,50
3,1,5
3,2,25
```

## Available Datasets

| Dataset    | Description                              |
|------------|------------------------------------------|
| `degen`    | Degen tipping database                   |
| `jamfrens` | JamFrens community trust data            |
| `openrank` | OpenRank protocol trust data             |
| `small`    | Small test dataset for development       |

## Usage

### Cloning the Repository

This repository uses [Git LFS](https://git-lfs.github.com/) for storing large CSV files. Make sure you have Git LFS installed before cloning:

```bash
# Install Git LFS (if not already installed)
git lfs install

# Clone the repository
git clone https://github.com/openrankprotocol/datasets.git
cd datasets
```

### Using with OpenRank SDK

These datasets can be used with the [OpenRank SDK](https://github.com/openrankprotocol) for computing trust scores:

```bash
# Request computation
openrank-sdk meta-compute-request trust/degen.csv seed/degen.csv --out-path="scores/degen.csv" --alpha=0.25 --delta=0.000001
```

## Contributing

To add new datasets:

1. Prepare your seed trust CSV file with `i,v` columns
2. Prepare your local trust CSV file with `i,j,v` columns
3. Add both files to the appropriate directories (`seed/` and `trust/`)
4. Submit a pull request

## Contact

For questions or whitelist requests, contact: devs@karma3labs.com

## License

See the [OpenRank Protocol](https://github.com/openrankprotocol) for license information.
