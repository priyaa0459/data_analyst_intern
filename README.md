**Task 1: Data Cleaning and Preprocessing Dataset Used: netflix_titles.csv**

**Objective:** Clean and prepare the Netflix dataset by handling missing values, duplicates, inconsistent formatting, and data types to make it ready for analysis.

**Steps Performed:**

1. Loaded the dataset using Python and Pandas.

2. Checked for missing values using .isnull().sum() and filled them appropriately:

3. director and cast: Filled with 'Unknown' due to high uniqueness.

4. country and rating: Filled with the most frequent value using mode().

5. date_added: Converted to datetime format; invalid entries handled using errors='coerce'.

6. Removed duplicate rows using .drop_duplicates().

7. Renamed column headers to lowercase and replaced spaces with underscores for uniformity.

8. Standardized text formats where applicable.

9. Converted column data types:

        -> release_year: Confirmed as integer.

        -> date_added: Converted to datetime.

10. Exported the cleaned dataset as cleaned_netflix_titles.csv.

**Outcome:** The dataset is now cleaned, well-structured, and ready for further analysis or visualization.
