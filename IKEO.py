import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt
import pymysql

try:
    conn = pymysql.connect(host='localhost', user='Ikeo', password='ikeo', database='IKEO', port=3307)
    cursor = conn.cursor()
except pymysql.Error as e:
    st.error(f"Erreur lors de la connexion à la base de données : {e}")
    st.stop()

# Function to execute SQL queries and return a DataFrame
def execute_query(query):
    cursor.execute(query)
    result = cursor.fetchall()
    columns = [desc[0] for desc in cursor.description]
    df = pd.DataFrame(result, columns=columns)
    return df

try:
    # Load products data
    produits_query = "SELECT * FROM Produits"
    produits_df = execute_query(produits_query)

    # Load factories data
    usines_query = "SELECT * FROM Usines"
    usines_df = execute_query(usines_query)

    # Load orders data
    commandes_query = "SELECT * FROM FactureProduits"
    commandes_df = execute_query(commandes_query)

    # Load clients data
    clients_query = "SELECT * FROM Clients"
    clients_df = execute_query(clients_query)

    # Display all products and their production sites
    st.subheader("Liste des produits avec leurs sites de production")
    st.dataframe(produits_df)

    # Filter by production site
    selected_site = st.selectbox("Filtrer par site de production", usines_df['Ville'].unique())
    filtered_produits_df = produits_df[produits_df['Usine'].str.contains(selected_site, case=False)]
    st.subheader(f"Produits du site de production : {selected_site}")
    st.dataframe(filtered_produits_df)

    # Graph of orders per products
    orders_per_product = commandes_df.groupby('ProduitID')['Quantite'].sum()
    st.subheader("Graphique des commandes par produits")
    fig, ax = plt.subplots()
    ax.bar(orders_per_product.index, orders_per_product.values)
    st.pyplot(fig)

    # Jointure entre FactureProduits et Factures
    commandes_factures_query = "SELECT fp.ProduitID, fp.Quantite, f.ClientID FROM FactureProduits fp INNER JOIN Factures f ON fp.FactureID = f.FactureID"
    commandes_factures_df = execute_query(commandes_factures_query)

    # Jointure entre commandes_factures_df et Clients
    commandes_clients_df = commandes_factures_df.merge(clients_df, on='ClientID')

    # Graphique des commandes par clients
    orders_per_client = commandes_clients_df.groupby('RaisonSocial')['Quantite'].sum()

    st.subheader("Graphique des commandes par clients")
    fig, ax = plt.subplots()
    ax.bar(orders_per_client.index, orders_per_client.values)
    st.pyplot(fig)

finally:
    cursor.close()
    conn.close()
