Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 493BEAFAE7C
	for <lists+freedreno@lfdr.de>; Mon,  7 Jul 2025 10:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F06410E279;
	Mon,  7 Jul 2025 08:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hjvh7/Q7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED3F10E2E6
 for <freedreno@lists.freedesktop.org>; Mon,  7 Jul 2025 08:20:27 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566Nj2LE008338
 for <freedreno@lists.freedesktop.org>; Mon, 7 Jul 2025 08:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 C4EMkoNbmivFQaZ38vGT0oUjiHc0kOLYnITvaWfz0JI=; b=Hjvh7/Q7eIK2cXzd
 iEpH0RXyeo2qPJ6R/Whb1vxgmucC8U0LEwI6sICWiYnDX/rvBRBOobOluIPAiYLx
 DVr8kqBJw/GIjXhhsCAZCjMstYsDqWfXbW0/B7NQ0i1iaA9hM1DC3uT5nUEk/j+I
 +6XAl+W1phlk9oN97CAl0q2v+U1Pc0B2SeOl+hHiyxWRdjyIzRFARi139yoPCN28
 gKtseI/xa88u+3tEEXBTZBQjzMZpJT9xhKE7iMSjuYbfi2S1we+zmoYvYtlgojIv
 oAWm0NO3uS9k9oBFF4QFMGQMuVFbBbE3tL9OcFH63QBmuTpc2O06FVdi8VLG7dB0
 zbSQOg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv4xkkdr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 07 Jul 2025 08:20:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f539358795so13153526d6.3
 for <freedreno@lists.freedesktop.org>; Mon, 07 Jul 2025 01:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751876426; x=1752481226;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C4EMkoNbmivFQaZ38vGT0oUjiHc0kOLYnITvaWfz0JI=;
 b=N+iaiQdmCzDs6yuDjktRVA2ug5y/F8DEa0QQM6SHVs04nbQcEEmR5czo5DPWr+Qn6Z
 dIQ/eyFQ/z35LbDe2ry6J8u2kuufmEF2WIWFdYu4WTVkovFq7pX1PJmCWVBRcGntvEir
 ZoGjS+et9Lqabw852BSsAc6L2jA46l5S0mPS6N8tPD/WHHtZ300+IZJjJXci2UnYmGxa
 YtsG9qWD4qBZgdJJmAAvJjqpY3PYuCJEqP4CgnMThFes6ZE+RAD/8EX5CnOUw5XqHSSy
 YoPaXoRoJ8rw6d7XDzAB58PZDmvNDcLzVWrRajX6ppZMyd1ERXpc2EBYDFt5LU2EBI43
 Di5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA0wTjeE0kT1+lfUuPCWWlq1F5plnStVkwfJdOsrrpasfjY+qGoiPx7gfDuHe41YKeeMY4R0PPmgA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTaE6lqGdZU26GewrNHFlwGhjr6KIbRv5Tuq1mXF1BTfH2fUUD
 W3y7FvlsIhZ6qMWy46NWniHIU14RYPsjtbGC8JvELCeIgZWsInijjUciEWLTnwBbDkoiIitaNYS
 F8yuXS8bi8qXmC+8QHyqTvN7m2K81IcjDXQe6SodvsV4KqW/GuS8AykoaY/5q2AgxB+rT5y4=
X-Gm-Gg: ASbGnctxIakip0RMz9HaaMSIkR4f3f/g94ChoMbaSECeyjHjTv+FLdFKFKx5FhDhS9x
 j//dPRyPwd2ldZ9OAfUt8grDWkGy9+RZp7vJQq1KtR80+8FfvPy2Bn3TpbYtONy1kvdROu5FBbF
 TKeQB3Hd8VW5Dw3LIZ7BZgxogyjGrM32zM8zADBGxHhzXjtvvzDg6DN91cHLj1Wnw8VWLbeVvCQ
 JS4gBudZ0JEqP2yLwRdEsY9xJHqrYWnK+uNzFg5ynh584KI1a1s7s03sxrZ1LRmoYrtoDLXokYO
 yyuzWSx+PkAG4b+mIchL0v3qSEmA+HXolsUl3NBMfx4brCQ++j7ZNbipw7WUIue5oeJvcsn9+uD
 8vSk=
X-Received: by 2002:ac8:7d84:0:b0:48a:80e5:72be with SMTP id
 d75a77b69052e-4a99760e68fmr67128681cf.2.1751876425650; 
 Mon, 07 Jul 2025 01:20:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPGxVHMXi+GqI4wQKS4e4w813HXxLKWhB28EavSoGs1CWC9w2RB9JctfqOOsv4gyMoFzYKXw==
X-Received: by 2002:ac8:7d84:0:b0:48a:80e5:72be with SMTP id
 d75a77b69052e-4a99760e68fmr67128551cf.2.1751876425100; 
 Mon, 07 Jul 2025 01:20:25 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f6b5e7c2sm665160066b.148.2025.07.07.01.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 01:20:24 -0700 (PDT)
Message-ID: <6f3af18f-6c39-4d48-ac87-abbdc905b896@oss.qualcomm.com>
Date: Mon, 7 Jul 2025 10:20:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: ubwc: provide no-UBWC configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250706-ubwc-no-ubwc-v1-1-e39552aa04df@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250706-ubwc-no-ubwc-v1-1-e39552aa04df@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA0NyBTYWx0ZWRfXxo4AaoxgjlP6
 vn12v0MTAYlAmu47HkwfKG3S6ghn7nzTyCejjCu5PVjDJ94gkhfFFYS6jsOBpGQ7o2veq/kJ6wk
 gA+jJmsk5ynBYgChYbrXV4CmWp0hL29QYIkBiFHsKTZUueYiKbC/DxvpPaxIyXRhQYnHblEj8R/
 /ip8gw4aqlqI1Cs6fRrXr2uu7Hr1RvhySV6gThX82FSEZyFNPhd0cnecl7BvFEYasK4P6p3pr3L
 EbrKQ+RogUaGJiBWdw7lYcSM/mEQf4alSlpBJBAx46ueX4TOT9S50cuT6cLwgf9Cyc6JnCrGotD
 2V4fIlzczEDEamsEjpd+AUd7SJdsV0WOqvo5M3Uq5q6LdUHoeN64S0h6dRcyYPUE8Teh/OfEo0m
 AMlTMCl4CokJmL5QFKWO81r1hZvVJFNb7UfRa1ouD4X9CbYCK2AZ8N89nFL3kEZbQfW4Xq03
X-Proofpoint-ORIG-GUID: EqGIBFrMmoKBuAQOLc0I_NldnsPeQBDt
X-Authority-Analysis: v=2.4 cv=DNCP4zNb c=1 sm=1 tr=0 ts=686b834a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=5JVmSJ65WXatj3hz380A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: EqGIBFrMmoKBuAQOLc0I_NldnsPeQBDt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1011 phishscore=0
 malwarescore=0 mlxlogscore=752 mlxscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070047
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

On 7/6/25 1:01 PM, Dmitry Baryshkov wrote:
> After the commit 45a2974157d2 ("drm/msm: Use the central UBWC config
> database") the MDSS driver errors out if UBWC database didn't provide it
> with the UBWC configuration. Make UBWC database return zero data for
> MSM8916 / APQ8016, MSM8974 / APQ8074, MSM8226 and MSM8939.
> 
> Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
