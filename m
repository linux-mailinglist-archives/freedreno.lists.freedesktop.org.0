Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E3C854234
	for <lists+freedreno@lfdr.de>; Wed, 14 Feb 2024 05:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F7E10E334;
	Wed, 14 Feb 2024 04:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="VAAgy3v+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A15D10E334
 for <freedreno@lists.freedesktop.org>; Wed, 14 Feb 2024 04:59:30 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41E4lLWY016894; Wed, 14 Feb 2024 04:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=J5dw5NdwV5Wy8v/c5P6wBJjzKMEYcDWvV01sDtAgRUY=; b=VA
 Agy3v+Kb51xaStEdrJWwC/NAEDFG6+VQ2EHb4mjX75xKOV8KxlN0hcAYA9WBUIwj
 vGMa79XzAmNWelkDQ+X53QVRwcb11Cryn84R9keVr0Jty2J77gx+oBr/NywLRDoj
 y2B3pwZ7v0zMbn/Pq4b12pXW+gIG3JACRHTGgI7k36l5LrtBiJ79pj0vb5loS2yP
 MU2TfJhjeD4Hy9O02X747IaDnnGG3amO8VHkbXj5ePBxUsAgKld+tevAbU/8Nbx4
 RY0B++0QveHQbzeeHjMdTwpXazjfmtiEpD7AIiblzgTKCniNhstu22O2TNgnWnDv
 Bhb5fiD44X7zwiMrdffA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w8448t7tp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Feb 2024 04:59:15 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41E4xE5k026181
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Feb 2024 04:59:14 GMT
Received: from [10.214.25.202] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 13 Feb
 2024 20:59:09 -0800
Message-ID: <8a2a4ae4-26d3-40f2-b87b-336093a1ec8f@quicinc.com>
Date: Wed, 14 Feb 2024 10:29:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/10] iommu/arm-smmu-qcom: Merge table from
 arm-smmu-qcom-debug into match data
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <devicetree@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <iommu@lists.linux.dev>,
 <konrad.dybcio@somainline.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-arm-msm@vger.kernel.org>, <quic_saipraka@quicinc.com>,
 <robdclark@gmail.com>, <robh+dt@kernel.org>, <robin.murphy@arm.com>,
 <vkoul@kernel.org>, <will@kernel.org>, <joro@8bytes.org>,
 <quic_guptap@quicinc.com>, Pavan Kondeti <quic_pkondeti@quicinc.com>
References: <20221114170635.1406534-9-dmitry.baryshkov@linaro.org>
 <a61a3561-0dde-472b-b8a5-451703f6d8ee@quicinc.com>
 <CAA8EJpoJUZDUxpA1+LJTEVRaMQJrpZ7iU9_dZ3uQvzPKE_UUfg@mail.gmail.com>
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
In-Reply-To: <CAA8EJpoJUZDUxpA1+LJTEVRaMQJrpZ7iU9_dZ3uQvzPKE_UUfg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: cMw8gIWXHn67I5PMbVm_WYWQlK0UxZUH
X-Proofpoint-GUID: cMw8gIWXHn67I5PMbVm_WYWQlK0UxZUH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-13_16,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402140036
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On 2/13/2024 4:40 PM, Dmitry Baryshkov wrote:
> On Tue, 13 Feb 2024 at 12:29, Pratyush Brahma <quic_pbrahma@quicinc.com> wrote:
>> Hi
>>
>> Patch [1] introduces a use after free bug in the function
>> "qcom_smmu_create()" in file: drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> wherein devm_krealloc() frees the old pointer marked by "smmu" but it is
>> still being accessed later in qcom_smmu_impl_data() in the same function
>> as:
>>
>> qsmmu->cfg = qcom_smmu_impl_data(smmu);
>>
>> The current patchset [2] implicitly fixes this issue as it doesn't
>> access the freed ptr in the line:
>>
>> qsmmu->cfg = data->cfg;
>>
>> Hence, can this patchset[2] be propagated to branches where patchset[1]
>> has been propagated already? The bug is currently present in all branches
>> that have patchset[1] but do not have patchset[2].
Can you please comment on your thoughts on this as well?
>>
>> RFC:
>>
>> This bug would be reintroduced if patchset [3] is accepted. This makes
>> the path prone to such errors as it relies on the
>> developer's understanding on the internal implementation of devm_krealloc().
> realloc is a basic function. Not understanding it is a significant
> problem for the developer.
>
>> Hence, a better fix IMO, would be to remove the confusion around the
>> freed "smmu" ptr in the following way:
> Could you please post a proper patch, which can be reviewed and
> accepted or declined?
Sure, will do.
>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> index 549ae4dba3a6..6dd142ce75d1 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> @@ -463,11 +463,12 @@ static struct arm_smmu_device
>> *qcom_smmu_create(struct arm_smmu_device *smmu,
>>           qsmmu = devm_krealloc(smmu->dev, smmu, sizeof(*qsmmu), GFP_KERNEL);
>>           if (!qsmmu)
>>                   return ERR_PTR(-ENOMEM);
>> +       smmu = &qsmmu->smmu;
>>
>>           qsmmu->smmu.impl = impl;
>>           qsmmu->cfg = data->cfg;
>>
>> -       return &qsmmu->smmu;
>> +       return smmu;
>>    }
>>
>> This is similar to the patch[4] which I've sent in-reply-to patch[3].
>> Will send a formal patch if you think this approach is better.
>>
>> Please let me know your thoughts.
> None of the other implementations does this. If you are going to fix
> qcom implementation, please fix all implementations.
Ohh okay. Wasn't aware that this may be an issue in other 
implementations as well.
Will check and raise a formal patch.
>   However a better
> option might be to change arm-smmu to remove devm_krealloc() usage at
> all.
>
Can you please elaborate on your thoughts on how removing devm_krealloc()
usage would be better? Is it because this implementation is error prone 
or do you
think this isn't required at all?


I agree on your previous comment that realloc is a basic function and 
developers
should understand that before using it. But as you've pointed out that 
implementations other than
qcom may also have this issue, I'm inclined to think that the usage of 
the api is quite error prone and
there may be some room for improving the usage text perhaps or some 
other way.
>
> --
> With best wishes
> Dmitry
Thanks,
Pratyush
