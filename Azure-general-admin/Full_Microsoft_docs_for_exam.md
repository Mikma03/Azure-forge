# Microsoft Certified: Azure Administrator Associate (AZ-104) Study Guide

The Microsoft Certified: Azure Administrator Associate certification enables you to learn how to implement, manage, and monitor your or yours organization's Microsoft Azure environment, while leveraging the tools and services available on Azure. This is an _intermediate level_ certification, so I would recommend you to set aside some time to study for the exam and practice using some of the services related to this exam - _'Practice makes perfect'_

In this study guide, I will share with you some of the useful resources you can use to guide you during your learning path to get this certification.

<br>

###### **NOTE:** This study guide is aligned with the content changes implemented on September 24, 2021. To understand the content changes done, please visit [this link](https://docs.microsoft.com/en-us/learn/certifications/exams/az-104?WT.mc_id=AZ-MVP-5004069) and _download the exam skills outline_.

## Certification Path

| Exam Name                                  |                                                    Link                                                    |
| ------------------------------------------ | :--------------------------------------------------------------------------------------------------------: |
| Exam AZ-104: Microsoft Azure Administrator | [Exam Details](https://docs.microsoft.com/en-us/learn/certifications/exams/az-104?WT.mc_id=AZ-MVP-5004069) |

### Exam AZ-104: Microsoft Azure Administrator

The AZ-104 has a length of two hours. There are 50+ questions and you need a minimum of 700 of 1000 points to pass the exam.

First place to go is the [_Microsoft Learn platform_](https://docs.microsoft.com/en-us/users/hugobarona/collections/p0pki4j8reg8ey?WT.mc_id=AZ-MVP-5004069) where a dedicated learning path is available, **for free**.
Also, you should have a look to the _Resources_ section in this study guide where you have useful resources to help you consolidate the knowledge that will help you get the exam and certification. If you prefer to watch videos, instead of read, explaining these core concepts and showing how to get prepared to the exam, then I invite you to have a look at the [Microsoft Azure Administrator (AZ-104)](https://app.pluralsight.com/paths/certificate/microsoft-azure-administrator-az-104), available on Pluralsight.

#### Skills measured

> Manage Azure identities and governance (15–20%)

> Manage Azure Active Directory (Azure AD) objects

- create users and groups
  - [Creating a new user in Azure AD](https://docs.microsoft.com/en-us/powershell/azure/active-directory/new-user-sample?WT.mc_id=AZ-MVP-5004069)
  - [Bulk create users in Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/enterprise-users/users-bulk-add?WT.mc_id=AZ-MVP-5004069)
  - [Add or update a user's profile information using Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-users-profile-azure-portal?WT.mc_id=AZ-MVP-5004069)
  - [Add or remove group owners in Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-accessmanagement-managing-group-owners?WT.mc_id=AZ-MVP-5004069)
  - [Bulk delete users in Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/enterprise-users/users-bulk-delete?WT.mc_id=AZ-MVP-5004069)
  - [Add or delete users using Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/add-users-azure-active-directory?WT.mc_id=AZ-MVP-5004069)
  - [Create a basic group and add members using Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-groups-create-azure-portal?WT.mc_id=AZ-MVP-5004069)
  - [New-AzureADUser](https://docs.microsoft.com/en-us/powershell/module/azuread/new-azureaduser?WT.mc_id=AZ-MVP-5004069)
  - [New-AzureADGroup](https://docs.microsoft.com/en-us/powershell/module/AzureAD/New-AzureADGroup?WT.mc_id=AZ-MVP-5004069)
  - [New-AzureADMSGroup](https://docs.microsoft.com/en-us/powershell/module/AzureAD/New-AzureADMSGroup?WT.mc_id=AZ-MVP-5004069)
- create administrative units
  - [Administrative units in Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/roles/administrative-units?WT.mc_id=AZ-MVP-5004069)
  - [Manage administrative units in Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/roles/admin-units-manage?WT.mc_id=AZ-MVP-5004069)
- manage user and group properties
  - [Add or update a user's profile information using Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-users-profile-azure-portal?WT.mc_id=AZ-MVP-5004069)
  - [Edit your group information using Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-groups-settings-azure-portal?WT.mc_id=AZ-MVP-5004069)
  - [Bulk create users in Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/enterprise-users/users-bulk-add?WT.mc_id=AZ-MVP-5004069)
  - [Powershell - Set-AzureADUser](https://docs.microsoft.com/en-us/powershell/module/AzureAD/Set-AzureADUser?WT.mc_id=AZ-MVP-5004069)
  - [Powershell - Set-AzureADGroup](https://docs.microsoft.com/en-us/powershell/module/AzureAD/Set-AzureADGroup?WT.mc_id=AZ-MVP-5004069)
  - [Powershell - Set-AzureADMSGroup](https://docs.microsoft.com/en-us/powershell/module/AzureAD/Set-AzureADMSGroup?WT.mc_id=AZ-MVP-5004069)
- manage device settings
  - [Manage device identities using the Azure portal](https://docs.microsoft.com/en-us/azure/active-directory/devices/device-management-azure-portal?WT.mc_id=AZ-MVP-5004069)
  - [How To: Manage stale devices in Azure AD](https://docs.microsoft.com/en-us/azure/active-directory/devices/manage-stale-devices?WT.mc_id=AZ-MVP-5004069)
  - [How to manage the local administrators group on Azure AD joined devices](https://docs.microsoft.com/en-us/azure/active-directory/devices/assign-local-admin?WT.mc_id=AZ-MVP-5004069)
- perform bulk user updates
  - [Bulk creation of new users](https://docs.microsoft.com/en-us/powershell/azure/active-directory/importing-data?WT.mc_id=AZ-MVP-5004069#bulk-creation-of-new-users)
  - [Bulk add group members in Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/enterprise-users/groups-bulk-import-members?WT.mc_id=AZ-MVP-5004069)
- manage guest accounts
  - [What is guest user access in Azure Active Directory B2B?](https://docs.microsoft.com/en-us/azure/active-directory/external-identities/what-is-b2b?WT.mc_id=AZ-MVP-5004069)
  - [Quickstart: Add guest users to your directory in the Azure portal](https://docs.microsoft.com/en-us/azure/active-directory/external-identities/b2b-quickstart-add-guest-users-portal?WT.mc_id=AZ-MVP-5004069)
  - [Restrict guest access permissions in Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/enterprise-users/users-restrict-guest-permissions?WT.mc_id=AZ-MVP-5004069)
  - [Add Azure Active Directory B2B collaboration users in the Azure portal](https://docs.microsoft.com/en-us/azure/active-directory/external-identities/add-users-administrator?WT.mc_id=AZ-MVP-5004069)
  - [Manage guest access with Azure AD access reviews](https://docs.microsoft.com/en-us/azure/active-directory/governance/manage-guest-access-with-access-reviews?WT.mc_id=AZ-MVP-5004069)
- configure Azure AD join
  - [Azure AD joined devices](https://docs.microsoft.com/en-us/azure/active-directory/devices/concept-azure-ad-join?WT.mc_id=AZ-MVP-5004069)
  - [How To: Plan your hybrid Azure Active Directory join implementation](https://docs.microsoft.com/en-us/azure/active-directory/devices/hybrid-azuread-join-plan?WT.mc_id=AZ-MVP-5004069)
  - [How to: Plan your Azure AD join implementation](https://docs.microsoft.com/en-us/azure/active-directory/devices/azureadjoin-plan?WT.mc_id=AZ-MVP-5004069)
  - [Controlled validation of hybrid Azure AD join](https://docs.microsoft.com/en-us/azure/active-directory/devices/hybrid-azuread-join-control?WT.mc_id=AZ-MVP-5004069)
  - [Tutorial: Configure hybrid Azure Active Directory join for managed domains](https://docs.microsoft.com/en-us/azure/active-directory/devices/hybrid-azuread-join-managed-domains?WT.mc_id=AZ-MVP-5004069)
- configure self-service password reset
  - [Plan an Azure Active Directory self-service password reset deployment](https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-sspr-deployment?WT.mc_id=AZ-MVP-5004069)
  - [Tutorial: Enable users to unlock their account or reset passwords using Azure Active Directory self-service password reset](https://docs.microsoft.com/en-us/azure/active-directory/authentication/tutorial-enable-sspr?WT.mc_id=AZ-MVP-5004069)
  - [Customize the user experience for Azure Active Directory self-service password reset](https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-sspr-customization?WT.mc_id=AZ-MVP-5004069)
  - [How it works: Azure AD self-service password reset](https://docs.microsoft.com/en-us/azure/active-directory/authentication/concept-sspr-howitworks?WT.mc_id=AZ-MVP-5004069)

> Manage role-based access control (RBAC)

- create a custom role
  - [Azure custom roles](https://docs.microsoft.com/en-us/azure/role-based-access-control/custom-roles?WT.mc_id=AZ-MVP-5004069)
  - [Create or update Azure custom roles using the Azure portal](https://docs.microsoft.com/en-us/azure/role-based-access-control/custom-roles-portal?WT.mc_id=AZ-MVP-5004069)
  - [Create or update Azure custom roles using Azure PowerShell](https://docs.microsoft.com/en-us/azure/role-based-access-control/custom-roles-powershell?WT.mc_id=AZ-MVP-5004069)
  - [Create or update Azure custom roles using Azure CLI](https://docs.microsoft.com/en-us/azure/role-based-access-control/custom-roles-cli?WT.mc_id=AZ-MVP-5004069)
- provide access to Azure resources by assigning roles at different scopes
  - [What is Azure role-based access control (Azure RBAC)?](https://docs.microsoft.com/en-us/azure/role-based-access-control/overview?WT.mc_id=AZ-MVP-5004069)
  - [Azure built-in roles](https://docs.microsoft.com/en-us/azure/role-based-access-control/built-in-roles?WT.mc_id=AZ-MVP-5004069)
  - [Tutorial: Grant a user access to Azure resources using the Azure portal](https://docs.microsoft.com/en-us/azure/role-based-access-control/quickstart-assign-role-user-portal?WT.mc_id=AZ-MVP-5004069)
  - [Tutorial: Grant a group access to Azure resources using Azure PowerShell](https://docs.microsoft.com/en-us/azure/role-based-access-control/tutorial-role-assignments-group-powershell?WT.mc_id=AZ-MVP-5004069)
  - [Assign a user as an administrator of an Azure subscription](https://docs.microsoft.com/en-us/azure/role-based-access-control/role-assignments-portal-subscription-admin?WT.mc_id=AZ-MVP-5004069)
  - [Add or change Azure subscription administrators](https://docs.microsoft.com/en-us/azure/cost-management-billing/manage/add-change-subscription-administrator?WT.mc_id=AZ-MVP-5004069)
  - [Classic subscription administrator roles, Azure roles, and Azure AD roles](https://docs.microsoft.com/en-us/azure/role-based-access-control/rbac-and-directory-admin-roles?WT.mc_id=AZ-MVP-5004069)
  - [List Azure role assignments using the Azure portal](https://docs.microsoft.com/en-us/azure/role-based-access-control/role-assignments-list-portal?WT.mc_id=AZ-MVP-5004069)
  - [Elevate access to manage all Azure subscriptions and management groups](https://docs.microsoft.com/en-us/azure/role-based-access-control/elevate-access-global-admin?WT.mc_id=AZ-MVP-5004069)
- interpret access assignments
  - [Quickstart: Check access for a user to Azure resources](https://docs.microsoft.com/en-us/azure/role-based-access-control/check-access?WT.mc_id=AZ-MVP-5004069)
  - [List Azure role assignments using the Azure portal](https://docs.microsoft.com/en-us/azure/role-based-access-control/role-assignments-list-portal?WT.mc_id=AZ-MVP-5004069)
  - [Understand Azure deny assignments](https://docs.microsoft.com/en-us/azure/role-based-access-control/deny-assignments?WT.mc_id=AZ-MVP-5004069)
  - [List Azure deny assignments using the Azure portal](https://docs.microsoft.com/en-us/azure/role-based-access-control/deny-assignments-portal?WT.mc_id=AZ-MVP-5004069)

> Manage subscriptions and governance

- configure Azure policies
  - [What is Azure Policy?](https://docs.microsoft.com/en-us/azure/governance/policy/overview?WT.mc_id=AZ-MVP-5004069)
  - [Quickstart: Create a policy assignment to identify non-compliant resources](https://docs.microsoft.com/en-us/azure/governance/policy/assign-policy-portal?WT.mc_id=AZ-MVP-5004069)
  - [Tutorial: Create and manage policies to enforce compliance](https://docs.microsoft.com/en-us/azure/governance/policy/tutorials/create-and-manage?WT.mc_id=AZ-MVP-5004069)
  - [Quickstart: Create a policy assignment to identify non-compliant resources using Azure PowerShell](https://docs.microsoft.com/en-us/azure/governance/policy/assign-policy-powershell?WT.mc_id=AZ-MVP-5004069)
  - [Quickstart: Create a policy assignment to identify non-compliant resources with Azure CLI](https://docs.microsoft.com/en-us/azure/governance/policy/assign-policy-azurecli?WT.mc_id=AZ-MVP-5004069)
  - [Quickstart: Create a policy assignment to identify non-compliant resources using Python](https://docs.microsoft.com/en-us/azure/governance/policy/assign-policy-python?WT.mc_id=AZ-MVP-5004069)
- configure resource locks
  - [Understand resource locking in Azure Blueprints](https://docs.microsoft.com/en-us/azure/governance/blueprints/concepts/resource-locking?WT.mc_id=AZ-MVP-5004069)
  - [Lock resources to prevent unexpected changes](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/lock-resources?WT.mc_id=AZ-MVP-5004069)
- apply and manage tags on resources
  - [Resource naming and tagging decision guide](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/decision-guides/resource-tagging/?toc=/azure/azure-resource-manager/management/toc.json?WT.mc_id=AZ-MVP-5004069)
  - [Use tags to organize your Azure resources and management hierarchy](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/tag-resources?WT.mc_id=AZ-MVP-5004069)
  - [Tag support for Azure resources](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/tag-support?WT.mc_id=AZ-MVP-5004069)
  - [Tutorial: Manage tag governance with Azure Policy](https://docs.microsoft.com/en-us/azure/governance/policy/tutorials/govern-tags?WT.mc_id=AZ-MVP-5004069)
- manage resource groups
  - [What is Azure Resource Manager?](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/overview?WT.mc_id=AZ-MVP-5004069)
  - [Manage Azure Resource Manager resource groups by using the Azure portal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups-portal?WT.mc_id=AZ-MVP-5004069)
  - [Manage Azure resources by using Azure CLI](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resources-cli?WT.mc_id=AZ-MVP-5004069)
  - [Move resources to a new resource group or subscription](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/move-resource-group-and-subscription?WT.mc_id=AZ-MVP-5004069)
  - [Move a VM to another subscription or resource group](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/move-vm?WT.mc_id=AZ-MVP-5004069)
  - [Azure Resource Manager resource group and resource deletion](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/delete-resource-group?WT.mc_id=AZ-MVP-5004069)
- manage subscriptions
  - [Pay for your Azure subscription by invoice](https://docs.microsoft.com/en-us/azure/cost-management-billing/manage/pay-by-invoice?WT.mc_id=AZ-MVP-5004069)
  - [Create an additional Azure subscription](https://docs.microsoft.com/en-us/azure/cost-management-billing/manage/create-subscription?WT.mc_id=AZ-MVP-5004069)
  - [Export and view your top-level Subscription information](https://docs.microsoft.com/en-us/azure/cost-management-billing/manage/export-subscriptions?WT.mc_id=AZ-MVP-5004069)
  - [Add or change Azure subscription administrators](https://docs.microsoft.com/en-us/azure/cost-management-billing/manage/add-change-subscription-administrator?WT.mc_id=AZ-MVP-5004069)
  - [Cancel your Azure subscription](https://docs.microsoft.com/en-us/azure/cost-management-billing/manage/cancel-azure-subscription?WT.mc_id=AZ-MVP-5004069)
  - [Transfer billing ownership of an Azure subscription to another account](https://docs.microsoft.com/en-us/azure/cost-management-billing/manage/billing-subscription-transfer?WT.mc_id=AZ-MVP-5004069)
  - [Pluralsight - Managing Microsoft Azure Subscriptions](https://app.pluralsight.com/library/courses/microsoft-azure-subscriptions-managing/table-of-contents?WT.mc_id=AZ-MVP-5004069)
- manage costs
  - [What is Azure Cost Management + Billing?](https://docs.microsoft.com/en-us/azure/cost-management-billing/cost-management-billing-overview?WT.mc_id=AZ-MVP-5004069)
  - [How to optimize your cloud investment with Azure Cost Management](https://docs.microsoft.com/en-us/azure/cost-management-billing/costs/cost-mgt-best-practices?WT.mc_id=AZ-MVP-5004069)
  - [Quickstart: Explore and analyze costs with cost analysis](https://docs.microsoft.com/en-us/azure/cost-management-billing/costs/quick-acm-cost-analysis?WT.mc_id=AZ-MVP-5004069)
- configure management groups
  - [What are Azure management groups?](https://docs.microsoft.com/en-us/azure/governance/management-groups/overview?WT.mc_id=AZ-MVP-5004069)
  - [Quickstart: Create a management group](https://docs.microsoft.com/en-us/azure/governance/management-groups/create-management-group-portal?WT.mc_id=AZ-MVP-5004069)
  - [Quickstart: Create a management group with Azure PowerShell](https://docs.microsoft.com/en-us/azure/governance/management-groups/create-management-group-powershell?WT.mc_id=AZ-MVP-5004069)
  - [https://docs.microsoft.com/en-us/azure/governance/blueprints/overview](https://docs.microsoft.com/en-us/azure/governance/blueprints/overview?WT.mc_id=AZ-MVP-5004069)

> Implement and manage storage (15–20%)

> Secure storage

- configure network access to storage accounts
  - [Require secure transfer to ensure secure connections](https://docs.microsoft.com/en-us/azure/storage/common/storage-require-secure-transfer?toc=/azure/storage/blobs/toc.json?WT.mc_id=AZ-MVP-5004069)
  - [Manage storage account access keys](https://docs.microsoft.com/en-us/azure/storage/common/storage-account-keys-manage?WT.mc_id=AZ-MVP-5004069)
  - [Configure Azure Storage firewalls and virtual networks](https://docs.microsoft.com/en-us/azure/storage/common/storage-network-security?WT.mc_id=AZ-MVP-5004069)
  - [Prevent anonymous public read access to containers and blobs](https://docs.microsoft.com/en-us/azure/storage/blobs/anonymous-read-access-prevent?WT.mc_id=AZ-MVP-5004069)
- create and configure storage accounts
  - [Storage account overview](https://docs.microsoft.com/en-us/azure/storage/common/storage-account-overview?WT.mc_id=AZ-MVP-5004069)
  - [Create a storage account](https://docs.microsoft.com/en-us/azure/storage/common/storage-account-create?WT.mc_id=AZ-MVP-5004069)
  - [Upgrade to a general-purpose v2 storage account](https://docs.microsoft.com/en-us/azure/storage/common/storage-account-upgrade?WT.mc_id=AZ-MVP-5004069)
  - [Manage the default access tier of an Azure Storage account](https://docs.microsoft.com/en-us/azure/storage/common/manage-account-default-access-tier?WT.mc_id=AZ-MVP-5004069)
- generate shared access signature (SAS) tokens
  - [Grant limited access to Azure Storage resources using shared access signatures (SAS)](https://docs.microsoft.com/en-ca/azure/storage/common/storage-sas-overview?WT.mc_id=AZ-MVP-5004069)
  - [Create a user delegation SAS](https://docs.microsoft.com/en-us/rest/api/storageservices/create-user-delegation-sas?WT.mc_id=AZ-MVP-5004069)
  - [Create a service SAS](https://docs.microsoft.com/en-us/rest/api/storageservices/create-service-sas?WT.mc_id=AZ-MVP-5004069)
  - [Delegate access with a shared access signature](https://docs.microsoft.com/en-us/rest/api/storageservices/delegate-access-with-shared-access-signature?WT.mc_id=AZ-MVP-5004069)
  - [Create an account SAS](https://docs.microsoft.com/en-us/rest/api/storageservices/create-account-sas?WT.mc_id=AZ-MVP-5004069)
  - [Getting Started with Shared Access Signatures (SAS)](https://docs.microsoft.com/en-us/samples/azure-samples/storage-dotnet-sas-getting-started/storage-dotnet-sas-getting-started/?WT.mc_id=AZ-MVP-5004069)
- manage access keys
  - [Manage storage account access keys](https://docs.microsoft.com/en-us/azure/storage/common/storage-account-keys-manage?WT.mc_id=AZ-MVP-5004069)
  - [Manage storage account keys with Key Vault and the Azure CLI](https://docs.microsoft.com/en-us/azure/key-vault/secrets/overview-storage-keys?WT.mc_id=AZ-MVP-5004069)
- configure Azure AD authentication for a storage account
  - [Authorize access to blobs using Azure Active Directory](https://docs.microsoft.com/en-us/azure/storage/blobs/authorize-access-azure-active-directory?WT.mc_id=AZ-MVP-5004069)
  - [Choose how to authorize access to blob data in the Azure portal](https://docs.microsoft.com/en-us/azure/storage/blobs/authorize-data-operations-portal?WT.mc_id=AZ-MVP-5004069)
  - [Authorize access to data in Azure Storage](https://docs.microsoft.com/en-us/azure/storage/common/authorize-data-access?WT.mc_id=AZ-MVP-5004069)
- configure access to Azure Files
  - [Part three: configure directory and file level permissions over SMB](https://docs.microsoft.com/en-us/azure/storage/files/storage-files-identity-ad-ds-configure-permissions?WT.mc_id=AZ-MVP-5004069)
  - [Overview of Azure Files identity-based authentication options for SMB access](https://docs.microsoft.com/en-us/azure/storage/files/storage-files-active-directory-overview?WT.mc_id=AZ-MVP-5004069)

###### Manage storage

- export from Azure job
  - [What is Azure Import/Export service?](https://docs.microsoft.com/en-us/azure/import-export/storage-import-export-service?WT.mc_id=AZ-MVP-5004069)
  - [Azure Import/Export system requirements](https://docs.microsoft.com/en-us/azure/import-export/storage-import-export-requirements?WT.mc_id=AZ-MVP-5004069)
  - [Use the Azure Import/Export service to export data from Azure Blob storage](https://docs.microsoft.com/en-us/azure/import-export/storage-import-export-data-from-blobs?WT.mc_id=AZ-MVP-5004069)
- import into Azure job
  - [Use the Azure Import/Export service to import data to Azure Blob Storage](https://docs.microsoft.com/en-us/azure/import-export/storage-import-export-data-to-blobs?WT.mc_id=AZ-MVP-5004069)
  - [Use Azure Import/Export service to import data to Azure Files](https://docs.microsoft.com/en-us/azure/import-export/storage-import-export-data-to-files?WT.mc_id=AZ-MVP-5004069)
  - [Setting up the Azure Import/Export Tool v1](https://docs.microsoft.com/en-us/azure/import-export/storage-import-export-tool-setup-v1?WT.mc_id=AZ-MVP-5004069)
- install and use Azure Storage Explorer
  - [Get started with Storage Explorer](https://docs.microsoft.com/en-us/azure/vs-azure-tools-storage-manage-with-storage-explorer?WT.mc_id=AZ-MVP-5004069)
  - [Quickstart: Use Azure Storage Explorer to create a blob](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-storage-explorer?WT.mc_id=AZ-MVP-5004069)
- copy data by using AZCopy
  - [Get started with AzCopy](https://docs.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10?WT.mc_id=AZ-MVP-5004069)
  - [azcopy copy](https://docs.microsoft.com/en-us/azure/storage/common/storage-ref-azcopy-copy?WT.mc_id=AZ-MVP-5004069)
  - [azcopy sync](https://docs.microsoft.com/en-us/azure/storage/common/storage-ref-azcopy-sync?WT.mc_id=AZ-MVP-5004069)
  - [azcopy make](https://docs.microsoft.com/en-us/azure/storage/common/storage-ref-azcopy-make?WT.mc_id=AZ-MVP-5004069)
  - [Transfer data with AzCopy and file storage](https://docs.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-files?WT.mc_id=AZ-MVP-5004069)
- implement Azure Storage replication
  - [Azure Storage redundancy](https://docs.microsoft.com/en-us/azure/storage/common/storage-redundancy?WT.mc_id=AZ-MVP-5004069)
  - [Change how a storage account is replicated](https://docs.microsoft.com/en-us/azure/storage/common/redundancy-migration?WT.mc_id=AZ-MVP-5004069)
- configure blob object replication
  - [Object replication for block blobs](https://docs.microsoft.com/en-us/azure/storage/blobs/object-replication-overview?WT.mc_id=AZ-MVP-5004069)

###### Configure Azure files and Azure Blob Storage

- create an Azure file share
  - [Create an Azure file share](https://docs.microsoft.com/en-us/azure/storage/files/storage-how-to-create-file-share?WT.mc_id=AZ-MVP-5004069)
  - [Quickstart: Create and manage Azure file shares with Windows virtual machines](https://docs.microsoft.com/en-us/azure/storage/files/storage-files-quick-create-use-windows?WT.mc_id=AZ-MVP-5004069)
- create and configure Azure File Sync service
  - [Planning for an Azure File Sync deployment](https://docs.microsoft.com/en-us/azure/storage/file-sync/file-sync-planning?WT.mc_id=AZ-MVP-5004069)
  - [Tutorial: Extend Windows file servers with Azure File Sync](https://docs.microsoft.com/en-us/azure/storage/file-sync/file-sync-extend-servers?WT.mc_id=AZ-MVP-5004069)
  - [Deploy Azure File Sync](https://docs.microsoft.com/en-us/azure/storage/file-sync/file-sync-deployment-guide?WT.mc_id=AZ-MVP-5004069)
- configure Azure Blob Storage
  - [Introduction to Azure Blob storage](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blobs-introduction?WT.mc_id=AZ-MVP-5004069)
  - [Quickstart: Upload, download, and list blobs with the Azure portal](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-portal?WT.mc_id=AZ-MVP-5004069)
  - [Quickstart: Use Azure Storage Explorer to create a blob](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-storage-explorer?WT.mc_id=AZ-MVP-5004069)
  - [Manage Azure Blob Storage resources with Storage Explorer](https://docs.microsoft.com/en-us/azure/vs-azure-tools-storage-explorer-blobs?WT.mc_id=AZ-MVP-5004069)
- configure storage tiers
  - [Access tiers for Azure Blob Storage - hot, cool, and archive](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-storage-tiers?WT.mc_id=AZ-MVP-5004069)
  - [Performance tiers for block blob storage](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-performance-tiers?WT.mc_id=AZ-MVP-5004069)
- configure blob lifecycle management
  - [Configure a lifecycle management policy](https://docs.microsoft.com/en-us/azure/storage/blobs/lifecycle-management-policy-configure?WT.mc_id=AZ-MVP-5004069)

##### Deploy and manage Azure compute resources (20–25%)

###### Automate deployment of virtual machines (VMs) by using Azure Resource Manager templates

- modify an Azure Resource Manager template
  - [Understand the structure and syntax of ARM templates](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/syntax?WT.mc_id=AZ-MVP-5004069)
  - [Quickstart: Create and deploy ARM templates by using the Azure portal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/quickstart-create-templates-use-the-portal?WT.mc_id=AZ-MVP-5004069)
  - [Resource group deployments with ARM templates](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/deploy-to-resource-group?WT.mc_id=AZ-MVP-5004069)
  - [Resource iteration in ARM templates](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/copy-resources?WT.mc_id=AZ-MVP-5004069)
- configure a virtual hard disk (VHD) template
  - [Create a VM from a VHD by using the Azure portal](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/create-vm-specialized-portal?WT.mc_id=AZ-MVP-5004069)
  - [Upload a generalized Windows VHD and use it to create new VMs in Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/upload-generalized-managed?WT.mc_id=AZ-MVP-5004069)
  - [Create a Windows VM from a specialized disk by using PowerShell](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/create-vm-specialized?WT.mc_id=AZ-MVP-5004069)
- deploy from a template
  - [Create a Windows virtual machine from a Resource Manager template](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/ps-template?WT.mc_id=AZ-MVP-5004069)
  - [Virtual machines in an Azure Resource Manager template](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/template-description?WT.mc_id=AZ-MVP-5004069)
- save a deployment as an Azure Resource Manager template
  - [Use Azure portal to export a template](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/export-template-portal?WT.mc_id=AZ-MVP-5004069)
  - [Use Azure PowerShell to export a template](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/export-template-powershell?WT.mc_id=AZ-MVP-5004069)
  - [Use Azure CLI to export a template](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/export-template-cli?WT.mc_id=AZ-MVP-5004069)
- deploy virtual machine extensions
  - [Azure virtual machine extensions and features](https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/overview?WT.mc_id=AZ-MVP-5004069)
  - [Custom Script Extension for Windows](https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/custom-script-windows?WT.mc_id=AZ-MVP-5004069)
  - [Use the Azure Custom Script Extension Version 2 with Linux virtual machines](https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/custom-script-linux?WT.mc_id=AZ-MVP-5004069)

###### Configure VMs

- configure Azure Disk Encryption
  - [Overview of managed disk encryption options](https://docs.microsoft.com/en-us/azure/virtual-machines/disk-encryption-overview?WT.mc_id=AZ-MVP-5004069)
  - [Azure Disk Encryption for Windows VMs](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/disk-encryption-overview?WT.mc_id=AZ-MVP-5004069)
  - [Azure Disk Encryption for Linux VMs](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/disk-encryption-overview?WT.mc_id=AZ-MVP-5004069)
- move VMs from one resource group to another
  - [Move a Windows VM to another Azure subscription or resource group](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/move-vm?WT.mc_id=AZ-MVP-5004069)
  - [Move Azure resources across resource groups, subscriptions, or regions](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/move-resources-overview?WT.mc_id=AZ-MVP-5004069)
- manage VM sizes
  - [Sizes for virtual machines in Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/sizes?WT.mc_id=AZ-MVP-5004069)
  - [Resize virtual machines](https://azure.microsoft.com/es-es/blog/resize-virtual-machines/?WT.mc_id=AZ-MVP-5004069)
  - [Resize a virtual machine using the Azure portal or PowerShell](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/resize-vm?WT.mc_id=AZ-MVP-5004069)
- add data disks
  - [Attach a managed data disk to a Windows VM by using the Azure portal](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/attach-managed-disk-portal?WT.mc_id=AZ-MVP-5004069)
  - [Attach a data disk to a Windows VM with PowerShell](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/attach-disk-ps?WT.mc_id=AZ-MVP-5004069)
  - [Use the portal to attach a data disk to a Linux VM](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/attach-disk-portal?WT.mc_id=AZ-MVP-5004069)
  - [Add a disk to a Linux VM](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/add-disk?WT.mc_id=AZ-MVP-5004069)
- configure networking
  - [What is Azure Virtual Network?](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview?WT.mc_id=AZ-MVP-5004069)
  - [Quickstart: Create a virtual network using the Azure portal](https://docs.microsoft.com/en-us/azure/virtual-network/quick-create-portal?WT.mc_id=AZ-MVP-5004069)
  - [Quickstart: Create a virtual network using PowerShell](https://docs.microsoft.com/en-us/azure/virtual-network/quick-create-powershell?WT.mc_id=AZ-MVP-5004069)
  - [How to open ports to a virtual machine with the Azure portal](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/nsg-quickstart-portal?WT.mc_id=AZ-MVP-5004069)
  - [Network security groups](https://docs.microsoft.com/en-us/azure/virtual-network/network-security-groups-overview?WT.mc_id=AZ-MVP-5004069)
  - [Virtual Network service endpoints](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-service-endpoints-overview?WT.mc_id=AZ-MVP-5004069)
- redeploy VMs
  - [Redeploy Windows virtual machine to new Azure node](https://docs.microsoft.com/en-us/troubleshoot/azure/virtual-machines/redeploy-to-new-node-windows?WT.mc_id=AZ-MVP-5004069)
  - [Redeploy Linux virtual machine to new Azure node](https://docs.microsoft.com/en-us/troubleshoot/azure/virtual-machines/redeploy-to-new-node-linux?WT.mc_id=AZ-MVP-5004069)
  - [Redeploy a VM in a lab in Azure DevTest Labs](https://docs.microsoft.com/en-us/azure/devtest-labs/devtest-lab-redeploy-vm?WT.mc_id=AZ-MVP-5004069)
- configure high availability
  - [Availability options for Azure Virtual Machines](https://docs.microsoft.com/en-us/azure/virtual-machines/availability?WT.mc_id=AZ-MVP-5004069)
  - [Create and deploy virtual machines in an availability set using Azure PowerShell](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/tutorial-availability-sets?WT.mc_id=AZ-MVP-5004069)
- deploy and configure scale sets
  - [What are virtual machine scale sets?](https://docs.microsoft.com/en-us/azure/virtual-machine-scale-sets/overview?WT.mc_id=AZ-MVP-5004069)
  - [Quickstart: Create a Windows virtual machine scale set with an ARM template](https://docs.microsoft.com/en-us/azure/virtual-machine-scale-sets/quick-create-template-windows?WT.mc_id=AZ-MVP-5004069)
  - [Quickstart: Create a virtual machine scale set in the Azure portal](https://docs.microsoft.com/en-us/azure/virtual-machine-scale-sets/quick-create-portal?WT.mc_id=AZ-MVP-5004069)
  - [Tutorial: Create a virtual machine scale set and deploy a highly available app on Windows with Azure PowerShell](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/tutorial-create-vmss?WT.mc_id=AZ-MVP-5004069)

###### Create and configure containers

- configure sizing and scaling for Azure Container Instances
  - [What is Azure Container Instances?](https://docs.microsoft.com/en-us/azure/container-instances/container-instances-overview?WT.mc_id=AZ-MVP-5004069)
  - [Azure Container Instances and container orchestrators](https://docs.microsoft.com/en-us/azure/container-instances/container-instances-orchestrator-relationship?WT.mc_id=AZ-MVP-5004069)
- configure container groups for Azure Container Instances
  - [Azure Container Instances and container orchestrators](https://docs.microsoft.com/en-us/azure/container-instances/container-instances-orchestrator-relationship?WT.mc_id=AZ-MVP-5004069)
- configure storage for Azure Kubernetes Service (AKS)
  - [Azure Kubernetes Service](https://docs.microsoft.com/en-us/azure/aks/intro-kubernetes?WT.mc_id=AZ-MVP-5004069)
  - [Kubernetes core concepts for Azure Kubernetes Service (AKS)](https://docs.microsoft.com/en-us/azure/aks/concepts-clusters-workloads?WT.mc_id=AZ-MVP-5004069)
  - [Tutorial: Deploy an Azure Kubernetes Service (AKS) cluster](https://docs.microsoft.com/en-us/azure/aks/tutorial-kubernetes-deploy-cluster?WT.mc_id=AZ-MVP-5004069)
- configure scaling for AKS
  - [Scale the node count in an Azure Kubernetes Service (AKS) cluster](https://docs.microsoft.com/en-us/azure/aks/scale-cluster?WT.mc_id=AZ-MVP-5004069)
  - [Scaling options for applications in Azure Kubernetes Service (AKS)](https://docs.microsoft.com/en-us/azure/aks/concepts-scale?WT.mc_id=AZ-MVP-5004069)
- configure network connections for AKS
  - [Network concepts for applications in Azure Kubernetes Service (AKS)](https://docs.microsoft.com/en-us/azure/aks/concepts-network?WT.mc_id=AZ-MVP-5004069)
  - [Configure Azure CNI networking in Azure Kubernetes Service (AKS)](https://docs.microsoft.com/en-us/azure/aks/configure-azure-cni?WT.mc_id=AZ-MVP-5004069)
- upgrade an AKS cluster
  - [Azure Kubernetes Service (AKS) node image upgrade](https://docs.microsoft.com/en-us/azure/aks/node-image-upgrade?WT.mc_id=AZ-MVP-5004069)

###### Create and configure Azure App Service

- create an App Service plan
  - [Azure App Service plan overview](https://docs.microsoft.com/en-us/azure/app-service/overview-hosting-plans?WT.mc_id=AZ-MVP-5004069)
  - [Manage an App Service plan in Azure](https://docs.microsoft.com/en-us/azure/app-service/app-service-plan-manage?WT.mc_id=AZ-MVP-5004069)
- configure scaling settings in an App Service plan
  - [Scale up an app in Azure App Service](https://docs.microsoft.com/en-us/azure/app-service/manage-scale-up?WT.mc_id=AZ-MVP-5004069)
  - [Get started with Autoscale in Azure](https://docs.microsoft.com/en-us/azure/azure-monitor/autoscale/autoscale-get-started?WT.mc_id=AZ-MVP-5004069)
- create an App Service
  - [Quickstart: Deploy an ASP.NET web app](https://docs.microsoft.com/en-us/azure/app-service/quickstart-dotnetcore?tabs=netcore31&pivots=development-environment-vs?WT.mc_id=AZ-MVP-5004069)
  - [Configure an App Service app in the Azure portal](https://docs.microsoft.com/en-us/azure/app-service/configure-common?WT.mc_id=AZ-MVP-5004069)
- secure an App Service
  - [Add a TLS/SSL certificate in Azure App Service](https://docs.microsoft.com/en-us/azure/app-service/configure-ssl-certificate?WT.mc_id=AZ-MVP-5004069)
  - [Set up Azure App Service access restrictions](https://docs.microsoft.com/en-us/azure/app-service/app-service-ip-restrictions?WT.mc_id=AZ-MVP-5004069)
  - [How to use managed identities for App Service and Azure Functions](https://docs.microsoft.com/en-us/azure/app-service/overview-managed-identity?WT.mc_id=AZ-MVP-5004069)
  - [Encryption at rest using customer-managed keys](https://docs.microsoft.com/en-us/azure/app-service/configure-encrypt-at-rest-using-cmk?WT.mc_id=AZ-MVP-5004069)
- configure custom domain names
  - [Buy a custom domain name for Azure App Service](https://docs.microsoft.com/en-us/azure/app-service/manage-custom-dns-buy-domain?WT.mc_id=AZ-MVP-5004069)
  - [Configure a custom domain name in Azure App Service with Traffic Manager integration](https://docs.microsoft.com/en-us/azure/app-service/configure-domain-traffic-manager?WT.mc_id=AZ-MVP-5004069)
- configure backup for an App Service
  - [Back up your app in Azure](https://docs.microsoft.com/en-us/azure/app-service/manage-backup?WT.mc_id=AZ-MVP-5004069)
  - [Restore an app in Azure](https://docs.microsoft.com/en-us/azure/app-service/web-sites-restore?WT.mc_id=AZ-MVP-5004069)
- configure networking settings
  - [Integrate your app with an Azure virtual network](https://docs.microsoft.com/en-us/azure/app-service/web-sites-integrate-with-vnet?WT.mc_id=AZ-MVP-5004069)
- configure deployment settings
  - [Deployment Best Practices](https://docs.microsoft.com/en-us/azure/app-service/deploy-best-practices?WT.mc_id=AZ-MVP-5004069)

##### Configure and manage virtual networking (25–30%)

###### Implement and manage virtual networking

- create and configure virtual networks, including peering
  - [What is Azure Virtual Network?](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview?WT.mc_id=AZ-MVP-5004069)
  - [Create, change, or delete a virtual network](https://docs.microsoft.com/en-us/azure/virtual-network/manage-virtual-network?WT.mc_id=AZ-MVP-5004069)
  - [Virtual network traffic routing](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-udr-overview?WT.mc_id=AZ-MVP-5004069)
  - [Virtual network peering](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview?WT.mc_id=AZ-MVP-5004069)
  - [Create, change, or delete a virtual network peering](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-manage-peering?WT.mc_id=AZ-MVP-5004069)
  - [Tutorial: Connect virtual networks with virtual network peering using the Azure portal](https://docs.microsoft.com/en-us/azure/virtual-network/tutorial-connect-virtual-networks-portal?WT.mc_id=AZ-MVP-5004069)
- configure private and public IP addresses
  - [Public IP addresses](https://docs.microsoft.com/en-us/azure/virtual-network/public-ip-addresses?WT.mc_id=AZ-MVP-5004069)
  - [Private IP addresses](https://docs.microsoft.com/en-us/azure/virtual-network/private-ip-addresses?WT.mc_id=AZ-MVP-5004069)
  - [Create, change, or delete an Azure public IP address](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-public-ip-address?WT.mc_id=AZ-MVP-5004069)
  - [Add, change, or remove IP addresses for an Azure network interface](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-network-interface-addresses?WT.mc_id=AZ-MVP-5004069)
  - [Configure a private IP address for a VM using the Azure portal](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-static-private-ip-arm-pportal?WT.mc_id=AZ-MVP-5004069)
- configure user-defined network routes
  - [Virtual network traffic routing](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-udr-overview?WT.mc_id=AZ-MVP-5004069)
  - [Diagnose a virtual machine routing problem](https://docs.microsoft.com/en-us/azure/virtual-network/diagnose-network-routing-problem?WT.mc_id=AZ-MVP-5004069)
- implement subnets
  - [Add, change, or delete a virtual network subnet](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-manage-subnet?WT.mc_id=AZ-MVP-5004069)
- configure endpoints on subnets
  - [Virtual Network service endpoints](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-service-endpoints-overview?WT.mc_id=AZ-MVP-5004069)
- configure private endpoints
  - [What is Azure Private Endpoint?](https://docs.microsoft.com/en-us/azure/private-link/private-endpoint-overview?WT.mc_id=AZ-MVP-5004069)
  - [Create a Private Endpoint for a secure connection to Azure Cognitive Search](https://docs.microsoft.com/en-us/azure/search/service-create-private-endpoint?WT.mc_id=AZ-MVP-5004069)
  - [Integrate Key Vault with Azure Private Link](https://docs.microsoft.com/en-us/azure/key-vault/general/private-link-service?WT.mc_id=AZ-MVP-5004069)
- configure Azure DNS, including custom DNS settings and private or public DNS zones
  - [What is Azure DNS?](https://docs.microsoft.com/en-us/azure/dns/dns-overview?WT.mc_id=AZ-MVP-5004069)
  - [Overview of DNS zones and records](https://docs.microsoft.com/en-us/azure/dns/dns-zones-records?WT.mc_id=AZ-MVP-5004069)
  - [Overview of reverse DNS and support in Azure](https://docs.microsoft.com/en-us/azure/dns/dns-reverse-dns-overview?WT.mc_id=AZ-MVP-5004069)

###### Secure access to virtual networks

- create security rules
  - [Network security groups](https://docs.microsoft.com/en-us/azure/virtual-network/network-security-groups-overview?WT.mc_id=AZ-MVP-5004069)
  - [How network security groups filter network traffic](https://docs.microsoft.com/en-us/azure/virtual-network/network-security-group-how-it-works?WT.mc_id=AZ-MVP-5004069)
  - [Create, change, or delete a network security group](https://docs.microsoft.com/en-us/azure/virtual-network/manage-network-security-group?WT.mc_id=AZ-MVP-5004069)
- associate a network security group (NSG) to a subnet or network interface
  - [Create, change, or delete a network security group](https://docs.microsoft.com/en-us/azure/virtual-network/manage-network-security-group?WT.mc_id=AZ-MVP-5004069)
- evaluate effective security rules
  - [Diagnose a virtual machine network traffic filter problem](https://docs.microsoft.com/en-us/azure/virtual-network/diagnose-network-traffic-filter-problem?WT.mc_id=AZ-MVP-5004069)
- implement Azure Firewall
  - [What is Azure Firewall?](https://docs.microsoft.com/en-us/azure/firewall/overview?WT.mc_id=AZ-MVP-5004069)
  - [Azure Firewall features](https://docs.microsoft.com/en-us/azure/firewall/features?WT.mc_id=AZ-MVP-5004069)
  - [Deploy an Azure Firewall with Availability Zones using Azure PowerShell](https://docs.microsoft.com/en-us/azure/firewall/deploy-availability-zone-powershell?WT.mc_id=AZ-MVP-5004069)
- implement Azure Bastion
  - [What is Azure Bastion?](https://docs.microsoft.com/en-us/azure/bastion/bastion-overview?WT.mc_id=AZ-MVP-5004069)
  - [Connect to a Windows virtual machine using Azure Bastion](https://docs.microsoft.com/en-us/azure/bastion/bastion-connect-vm-rdp?WT.mc_id=AZ-MVP-5004069)
  - [Quickstart: Configure Azure Bastion from VM settings](https://docs.microsoft.com/en-us/azure/bastion/quickstart-host-portal?WT.mc_id=AZ-MVP-5004069)

###### Configure load balancing

- configure Azure Application Gateway
  - [What is Azure Application Gateway?](https://docs.microsoft.com/en-us/azure/application-gateway/overview?WT.mc_id=AZ-MVP-5004069)
  - [Application gateway components](https://docs.microsoft.com/en-us/azure/application-gateway/application-gateway-components?WT.mc_id=AZ-MVP-5004069)
  - [How an application gateway works](https://docs.microsoft.com/en-us/azure/application-gateway/how-application-gateway-works?WT.mc_id=AZ-MVP-5004069)
- configure an internal or public load balancer
  - [What is Azure Load Balancer?](https://docs.microsoft.com/en-us/azure/load-balancer/load-balancer-overview?WT.mc_id=AZ-MVP-5004069)
  - [Azure Load Balancer algorithm](https://docs.microsoft.com/en-us/azure/load-balancer/concepts?WT.mc_id=AZ-MVP-5004069)
  - [Use a public Standard Load Balancer in Azure Kubernetes Service (AKS)](https://docs.microsoft.com/en-us/azure/aks/load-balancer-standard?WT.mc_id=AZ-MVP-5004069)
  - [Quickstart: Create a public load balancer to load balance VMs using Azure PowerShell](https://docs.microsoft.com/en-us/azure/load-balancer/quickstart-load-balancer-standard-public-powershell?WT.mc_id=AZ-MVP-5004069)
  - [Quickstart: Create an internal load balancer to load balance VMs using the Azure portal](https://docs.microsoft.com/en-us/azure/load-balancer/quickstart-load-balancer-standard-internal-portal?WT.mc_id=AZ-MVP-5004069)
- troubleshoot load balancing
  - [Troubleshoot Azure Load Balancer](https://docs.microsoft.com/en-us/azure/load-balancer/load-balancer-troubleshoot?WT.mc_id=AZ-MVP-5004069)
  - [Troubleshoot common Azure deployment errors with Azure Load Balancer](https://docs.microsoft.com/en-us/azure/load-balancer/load-balancer-common-deployment-errors?WT.mc_id=AZ-MVP-5004069)

###### Monitor and troubleshoot virtual networking

- monitor on-premises connectivity
  - [Network Connectivity Monitoring with Connection Monitor](https://docs.microsoft.com/en-us/azure/network-watcher/connection-monitor-overview?WT.mc_id=AZ-MVP-5004069)
  - [ExpressRoute Monitor](https://docs.microsoft.com/en-us/azure/azure-monitor/insights/network-performance-monitor-expressroute?WT.mc_id=AZ-MVP-5004069)
- configure and use Azure Monitor for Networks
  - [Network Performance Monitor solution in Azure](https://docs.microsoft.com/en-us/azure/azure-monitor/insights/network-performance-monitor?WT.mc_id=AZ-MVP-5004069)
  - [Monitor virtual machines with Azure Monitor: Configure monitoring](https://docs.microsoft.com/en-us/azure/azure-monitor/vm/monitor-virtual-machine-configure?WT.mc_id=AZ-MVP-5004069)
  - [Tutorial: Monitor network communication between two virtual machines using the Azure portal](https://docs.microsoft.com/en-us/azure/network-watcher/connection-monitor?WT.mc_id=AZ-MVP-5004069)
- use Azure Network Watcher
  - [What is Azure Network Watcher?](https://docs.microsoft.com/en-us/azure/network-watcher/network-watcher-monitoring-overview?WT.mc_id=AZ-MVP-5004069)
  - [Quickstart: Diagnose a virtual machine network traffic filter problem using the Azure portal](https://docs.microsoft.com/en-us/azure/network-watcher/diagnose-vm-network-traffic-filtering-problem?WT.mc_id=AZ-MVP-5004069)
- troubleshoot external networking
  - [Introduction to resource troubleshooting in Azure Network Watcher](https://docs.microsoft.com/en-us/azure/network-watcher/network-watcher-troubleshoot-overview?WT.mc_id=AZ-MVP-5004069)
- troubleshoot virtual network connectivity
  - [https://docs.microsoft.com/en-us/azure/virtual-network/nat-gateway/troubleshoot-nat](https://docs.microsoft.com/en-us/azure/virtual-network/nat-gateway/troubleshoot-nat?WT.mc_id=AZ-MVP-5004069)

###### Integrate an on-premises network with an Azure virtual network

- create and configure Azure VPN Gateway
  - [What is VPN Gateway?](https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-about-vpngateways?WT.mc_id=AZ-MVP-5004069)
  - [Tutorial: Create and manage a VPN gateway using Azure portal](https://docs.microsoft.com/en-us/azure/vpn-gateway/tutorial-create-gateway-portal?WT.mc_id=AZ-MVP-5004069)
  - [Configure a VNet-to-VNet VPN gateway connection by using the Azure portal](https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-howto-vnet-vnet-resource-manager-portal?WT.mc_id=AZ-MVP-5004069)
- create and configure Azure ExpressRoute
  - [What is Azure ExpressRoute?](https://docs.microsoft.com/en-us/azure/expressroute/expressroute-introduction?WT.mc_id=AZ-MVP-5004069)
  - [ExpressRoute for Cloud Solution Providers (CSP)](https://docs.microsoft.com/en-us/azure/expressroute/expressroute-for-cloud-solution-providers?WT.mc_id=AZ-MVP-5004069)
  - [ExpressRoute Global Reach](https://docs.microsoft.com/en-us/azure/expressroute/expressroute-global-reach?WT.mc_id=AZ-MVP-5004069)
  - [ExpressRoute connectivity models](https://docs.microsoft.com/en-us/azure/expressroute/expressroute-connectivity-models?WT.mc_id=AZ-MVP-5004069)
- configure Azure Virtual WAN
  - [What is Azure Virtual WAN?](https://docs.microsoft.com/en-us/azure/virtual-wan/virtual-wan-about?WT.mc_id=AZ-MVP-5004069)
  - [Azure Virtual WAN and supporting remote work](https://docs.microsoft.com/en-us/azure/virtual-wan/work-remotely-support?WT.mc_id=AZ-MVP-5004069)

##### Monitor and back up Azure resources (10–15%)

###### Monitor resources by using Azure Monitor

- configure and interpret metrics
  - [Azure Monitor Metrics overview](https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/data-platform-metrics?WT.mc_id=AZ-MVP-5004069)
  - [Azure Monitor Metrics aggregation and display explained](https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/metrics-aggregation-explained?WT.mc_id=AZ-MVP-5004069)
- configure Azure Monitor logs
  - [Azure Monitor Logs overview](https://docs.microsoft.com/en-us/azure/azure-monitor/logs/data-platform-logs?WT.mc_id=AZ-MVP-5004069)
  - [Azure Monitor Logs data security](https://docs.microsoft.com/en-us/azure/azure-monitor/logs/data-security?WT.mc_id=AZ-MVP-5004069)
- query and analyze logs
  - [Overview of Log Analytics in Azure Monitor](https://docs.microsoft.com/en-us/azure/azure-monitor/logs/log-analytics-overview?WT.mc_id=AZ-MVP-5004069)
  - [Sources of monitoring data for Azure Monitor](https://docs.microsoft.com/en-us/azure/azure-monitor/agents/data-sources?WT.mc_id=AZ-MVP-5004069)
- set up alerts and actions
  - [Overview of alerts in Microsoft Azure](https://docs.microsoft.com/en-us/azure/azure-monitor/alerts/alerts-overview?WT.mc_id=AZ-MVP-5004069)
  - [Understand how metric alerts work in Azure Monitor](https://docs.microsoft.com/en-us/azure/azure-monitor/alerts/alerts-metric-overview?WT.mc_id=AZ-MVP-5004069)
- configure Application Insights
  - [What is Application Insights?](https://docs.microsoft.com/en-us/azure/azure-monitor/app/app-insights-overview?WT.mc_id=AZ-MVP-5004069)
  - [Application Insights for Azure cloud services](https://docs.microsoft.com/en-us/azure/azure-monitor/app/cloudservices?WT.mc_id=AZ-MVP-5004069)
  - [Azure Diagnostics extension overview](https://docs.microsoft.com/en-us/azure/azure-monitor/agents/diagnostics-extension-overview?WT.mc_id=AZ-MVP-5004069)
  - [Install and configure Windows Azure diagnostics extension (WAD)](https://docs.microsoft.com/en-us/azure/azure-monitor/agents/diagnostics-extension-windows-install?WT.mc_id=AZ-MVP-5004069)

###### Implement backup and recovery

- create a Recovery Services vault
  - [Recovery Services vaults overview](https://docs.microsoft.com/en-us/azure/backup/backup-azure-recovery-services-vault-overview?WT.mc_id=AZ-MVP-5004069)
  - [Create and configure a Recovery Services vault](https://docs.microsoft.com/en-us/azure/backup/backup-create-rs-vault?WT.mc_id=AZ-MVP-5004069)
  - [Recovery Services vaults overview](https://docs.microsoft.com/en-us/azure/backup/backup-azure-recovery-services-vault-overview?WT.mc_id=AZ-MVP-5004069)
  - [Monitor and manage Recovery Services vaults](https://docs.microsoft.com/en-us/azure/backup/backup-azure-manage-windows-server?WT.mc_id=AZ-MVP-5004069)
- create a Backup vault
  - [Backup vaults overview](https://docs.microsoft.com/en-us/azure/backup/backup-vault-overview?WT.mc_id=AZ-MVP-5004069)
  - [Back up Azure VMs in a Recovery Services vault](https://docs.microsoft.com/en-us/azure/backup/backup-azure-arm-vms-prepare?WT.mc_id=AZ-MVP-5004069)
  - [Manage Azure VM backups with Azure Backup service](https://docs.microsoft.com/en-us/azure/backup/backup-azure-manage-vms?WT.mc_id=AZ-MVP-5004069)
- create and configure backup policy
  - [Azure Policy built-in definitions for Azure Backup](https://docs.microsoft.com/en-us/azure/backup/policy-reference?WT.mc_id=AZ-MVP-5004069)
  - [Manage Azure VM backups with Azure Backup service](https://docs.microsoft.com/en-us/azure/backup/backup-azure-manage-vms?WT.mc_id=AZ-MVP-5004069)
- perform backup and restore operations by using Azure Backup
  - [What is the Azure Backup service?](https://docs.microsoft.com/en-us/azure/backup/backup-overview?WT.mc_id=AZ-MVP-5004069)
  - [Overview of Backup center](https://docs.microsoft.com/en-us/azure/backup/backup-center-overview?WT.mc_id=AZ-MVP-5004069)
  - [Support matrix for Azure Backup](https://docs.microsoft.com/en-us/azure/backup/backup-support-matrix?WT.mc_id=AZ-MVP-5004069)
  - [Back up a virtual machine in Azure](https://docs.microsoft.com/en-us/azure/backup/quick-backup-vm-portal?WT.mc_id=AZ-MVP-5004069)
  - [Manage Azure VM backups with Azure Backup service](https://docs.microsoft.com/en-us/azure/backup/backup-azure-manage-vms?WT.mc_id=AZ-MVP-5004069)
  - [Perform actions using Backup center](https://docs.microsoft.com/en-us/azure/backup/backup-center-actions?WT.mc_id=AZ-MVP-5004069)
  - [Restore Azure file shares](https://docs.microsoft.com/en-us/azure/backup/restore-afs?WT.mc_id=AZ-MVP-5004069)
  - [Restore files to a virtual machine in Azure](https://docs.microsoft.com/en-us/azure/backup/tutorial-restore-files?WT.mc_id=AZ-MVP-5004069)
- perform site-to-site recovery by using Azure Site Recovery
  - [About Site Recovery](https://docs.microsoft.com/en-us/azure/site-recovery/site-recovery-overview?WT.mc_id=AZ-MVP-5004069)
  - [Quickstart: Set up disaster recovery to a secondary Azure region for an Azure VM](https://docs.microsoft.com/en-us/azure/site-recovery/azure-to-azure-quickstart?WT.mc_id=AZ-MVP-5004069)
  - [Tutorial: Set up disaster recovery for Azure VMs](https://docs.microsoft.com/en-us/azure/site-recovery/azure-to-azure-tutorial-enable-replication?WT.mc_id=AZ-MVP-5004069)
  - [Monitor Site Recovery](https://docs.microsoft.com/en-us/azure/site-recovery/site-recovery-monitor-and-troubleshoot?WT.mc_id=AZ-MVP-5004069)
  - [Monitor and manage Recovery Services vaults](https://docs.microsoft.com/en-us/azure/backup/backup-azure-manage-windows-server?WT.mc_id=AZ-MVP-5004069)
  - [Back up Windows Server to Azure](https://docs.microsoft.com/en-us/azure/backup/tutorial-backup-windows-server-to-azure?WT.mc_id=AZ-MVP-5004069)
  - [Recover files from Azure to a Windows Server](https://docs.microsoft.com/en-us/azure/backup/tutorial-backup-restore-files-windows-server?WT.mc_id=AZ-MVP-5004069)
- configure and review backup reports
  - [Overview of security features in Azure Backup](https://docs.microsoft.com/en-us/azure/backup/security-overview?WT.mc_id=AZ-MVP-5004069)
  - [Configure Azure Backup reports](https://docs.microsoft.com/en-us/azure/backup/configure-reports?WT.mc_id=AZ-MVP-5004069)
  - [Email Azure Backup Reports](https://docs.microsoft.com/en-us/azure/backup/backup-reports-email?WT.mc_id=AZ-MVP-5004069)

## Additional resources

Below follows the list of additional resources that you should consider and a quick note to the Microsoft Learn collection shared there. I tried to extend the learning paths you have available on the exam's page with some extra modules that I consider relevant to the exam.

<br/>

Best of Luck and share your results with the community once you get certified! 😊💪

| Resource                                                                                                                                                                               |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --- |
| [Exam AZ-104: Microsoft Azure Administrator](https://docs.microsoft.com/en-us/learn/certifications/exams/az-104?WT.mc_id=AZ-MVP-5004069)                                               |
| [Microsoft Azure Administrator (AZ-104)](https://app.pluralsight.com/paths/certificate/microsoft-azure-administrator-az-104)                                                           |
| [Microsoft Learn Collection: Microsoft Certified: Azure Administrator Associate](https://docs.microsoft.com/en-us/users/hugobarona/collections/p0pki4j8reg8ey?WT.mc_id=DT-MVP-5004069) |     |
