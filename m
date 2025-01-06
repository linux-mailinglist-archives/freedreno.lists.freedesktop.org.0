Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A9EA0312D
	for <lists+freedreno@lfdr.de>; Mon,  6 Jan 2025 21:11:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF97B10E9F2;
	Mon,  6 Jan 2025 20:11:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="VNKYLYNX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA1810E9F1
 for <freedreno@lists.freedesktop.org>; Mon,  6 Jan 2025 20:11:05 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506JOg64024445;
 Mon, 6 Jan 2025 20:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OKShWIVvgC0hd8TSAF8wwXIgWBFjhPDo296N/okMqfU=; b=VNKYLYNXaursvtDr
 QZwRukHb9CM8+iECtftz9azCeyMCPKBNpewzN+AJCQs5a/XUMRoz0brQNaoWHnbL
 r8i6IfeeEwJvS9KzKh7/S6mOMI+LnSMDN0yxhs8+fREkipq10zxWWeKc2++h5hMe
 ZBojQq2bBnOsW758pTz+kq5NHwyL/UA70zWdubqXlu//R7cX7+J3Cnk59dJorDc0
 WwN5mZbpTYS21VvK2yV4/E769GKIowZGEM0yb8bB3LDpsJb69VJwRipRB1iWGYs5
 dv4JtSpKUqJhVlITyfL47hEKfKF+wKapPi4gJJVqcwq5d2gvpfdKLyBjmKq3vx5M
 B6+6lQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 440nadg2p9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2025 20:10:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 506KArrY029637
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 6 Jan 2025 20:10:53 GMT
Received: from [10.216.24.147] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 6 Jan 2025
 12:10:50 -0800
Message-ID: <48373519-2867-419d-9f51-e7bd330b311c@quicinc.com>
Date: Tue, 7 Jan 2025 01:40:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, <iommu@lists.linux.dev>
CC: <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>, Robin
 Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, Rob Clark
 <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250102183232.115279-1-robdclark@gmail.com>
 <76b822f0-c4c5-4d47-8e0b-c1eee513e228@quicinc.com>
Content-Language: en-US
In-Reply-To: <76b822f0-c4c5-4d47-8e0b-c1eee513e228@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 0zZpxDVwd0sIlNSE1sDlJoY_CJ80Fchs
X-Proofpoint-GUID: 0zZpxDVwd0sIlNSE1sDlJoY_CJ80Fchs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0
 mlxlogscore=823 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501060175
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

On 1/3/2025 1:00 AM, Akhil P Oommen wrote:
> On 1/3/2025 12:02 AM, Rob Clark wrote:
>> From: Rob Clark <robdclark@chromium.org>
>>
>> On mmu-500, stall-on-fault seems to stall all context banks, causing the
>> GMU to misbehave.  So limit this feature to smmu-v2 for now.
>>
>> This fixes an issue with an older mesa bug taking outo the system
>> because of GMU going off into the weeds.
>>
>> What we _think_ is happening is that, if the GPU generates 1000's of
>> faults at ~once (which is something that GPUs can be good at), it can
>> result in a sufficient number of stalled translations preventing other
>> transactions from entering the same TBU.
>>
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> 
> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> 

Btw, if stall is not enabled, I think there is no point in capturing
coredump from adreno pagefault handler. By the time we start coredump,
gpu might have switched context.

-Akhil.

> -Akhil
> 
