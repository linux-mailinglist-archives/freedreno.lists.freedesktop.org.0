Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7854C68B86
	for <lists+freedreno@lfdr.de>; Tue, 18 Nov 2025 11:11:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FC110E47C;
	Tue, 18 Nov 2025 10:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LSqQmsbI";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MdmQ7Igk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16C810E47C
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 10:10:59 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AI3NTOg375655
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 10:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 U02eh9bqJE1p9hqnUKH0dgcb2ZclOzx3BYb9xwfCu5g=; b=LSqQmsbILJ6n/45d
 G0PmH/9BOI69YrXMtodKs6YirqaoZ8Gg0l3TzZVzCW7VyWa9cwY9blv3gIih+Tpd
 daIM8z7QH2SlY9PJCt1Kl8GFtG5O5pLqGeAUiVAPLzYtKCW3v8kzgWsnIqc2bIED
 NYzMp/HVm1/uekJyJkPS1pNYPLG776nJpT+r1VUy5RzKUvV9/yuf9JrRqYtq6Fse
 5LhZmd1l6aox+BCReTwv5pDOKpRNiWl5kmfQQm07HbY9W81nWZ1ry1rAorUlGAsL
 BIN3oXSErPUb5nMlS6gLTiESr/eMSv1o6RoGFrd3wo8Gww25hRjum2wbT5VLslk2
 p8xjVA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag76njrgx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 10:10:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ed6a906c52so13871611cf.2
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 02:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763460658; x=1764065458;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U02eh9bqJE1p9hqnUKH0dgcb2ZclOzx3BYb9xwfCu5g=;
 b=MdmQ7IgkWRZBRrj88G88rdOsDD8dlqjZwD+EJ9BWhLbW8AQ7hPlrl/pk2epcEdRPwC
 HZJgWuN6azANryhvq2SSUlowbrGKwSC3qxPsL6+bDwm2Vd9pB0/cejF+Ms0KQfG7CvQp
 gsuTdzr7XKU8T4DW+m/ZxDAgWsz6EWR3NUw5bFFJK7CvnPphuC295ToTWKeZTiFd1Qvo
 iV7FJtiCMoUS03Pg0mQxn+wdZZ4QAwp5Rcz4G4nA8r1ElhWCH7lU7eWqjnMYp330EVfg
 Oc68MWByPy3oesKj1GWt+aq6qG3G8FRmgHD/Ke5trW3MF3ND1krB1je0KRVE5skkAXVh
 MGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763460658; x=1764065458;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U02eh9bqJE1p9hqnUKH0dgcb2ZclOzx3BYb9xwfCu5g=;
 b=X9dpuUOfWzBL0+CY5/GeAgXpRnWmeC2G/2SKu1Ujh2m6oqjwA2ks94sYu3cWsXS+rn
 Fco0tA08Zv3fInw2lmbz7AkfjG7PLZCcKMDegUFtKyodmL+iuVcHla3aJuPXTt/V7N+P
 xZghk3pJdj0y6PPsRE2QgZcIbX7bChNFQKZpkY7mD3cJKU6Zc65lK7dqW2REase9WH4n
 wdkPNK95LY2Eu0oZvwxD8/PmHy8lYac74dLhWd3FYNqaFiMAgY9zHrolyT8vM9Jz+XBT
 Wx82sg7/IoWw7d4BG1AMamiI3msXkrSqxY9z0Ltn+IIJdVhAM3c62jKEMe5NatvO1959
 B13g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyHMOoFGyHrdXM4ECaBT56bCGqVCCct2/i2fLsyQJeqejUGTRCwWzqor54BqF9vv0pgo/iJ7IXVdk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysNodPI53ml+CMFBhPqDaulfUYeRScSYMoMdEKT4MTNO3B66Ry
 iB6j3ZGRPETf+lpIPVElx/31fFskQ2aDDwNqQZDfwdB1fWU/2qe2Eza3DWOt8cVyxd+p8mvurgE
 77B6Iidtz+ma8bJOebXTffSOfvujKsOM6fhSZUcJKdM8OHYrIAyiXp4fQG/wltysHUueRNOs=
X-Gm-Gg: ASbGnctiZWpzxI/Z/KwwLMpK+vGmnqUQCwq2TAcJs0G5WN4t5I9b5ETz3lKgF4NCb7j
 +gjyHkv3NTcCts68kP9QV4gwmPM9aj2JwQwUDvzNL+OWJR/JxcnN/4yJwF/KXQuyOcbaSjpMoPV
 0kRTfbCzIlfpAOq0td0ywHsNXhXqnBviQ9w+F5CJGXfXWkAIiD1sTQFHsyDnCtiATFFkt9VSa5u
 NFJcxheHTSMs45LU4pBN4w4ZRRxpkPSTGLDtP35+sl1WK1lbEPLtM+L/jC4pGErGPDjf8FENdaQ
 sgNB8KCLOXJlac9NA0UmjIq/GuO1zmcacBISy6FwE7NzFDW6407vxe7CcfUzKxubo8br4fZloVa
 DVoMKi3ncnwmyww1gt629xgz3m5so2o7oInQwKJJo/XJLZ9Ezz6YhpM64VvkkxzotnnY=
X-Received: by 2002:a05:622a:20c:b0:4ed:b409:ca27 with SMTP id
 d75a77b69052e-4ee3182237fmr20160321cf.10.1763460658056; 
 Tue, 18 Nov 2025 02:10:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHz4Ftkem+yYtF3nOBOFFpkdhV6ZE7GbZunxdHTdiyocnrRN9QBCgvxmaVDrzMTewaoOz9MgQ==
X-Received: by 2002:a05:622a:20c:b0:4ed:b409:ca27 with SMTP id
 d75a77b69052e-4ee3182237fmr20159971cf.10.1763460657671; 
 Tue, 18 Nov 2025 02:10:57 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-644f13ff4d4sm2997956a12.12.2025.11.18.02.10.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 02:10:57 -0800 (PST)
Message-ID: <1c438a94-fc9d-4322-918c-b6ec1a4cc5a0@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 11:10:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/22] drm/msm/adreno: Support AQE engine
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
 <20251118-kaana-gpu-support-v4-15-86eeb8e93fb6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-15-86eeb8e93fb6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA4MSBTYWx0ZWRfX2CYhzfvdUGcr
 O9wAIGdt+pjnVZteMoBeJpqvBL0L7sLZvoAhFvw7lIrVLS31r17G7B9JngJUCacOdmIjNe6tYAv
 oCfoLroVAZ/Ztbg6WYXNSJxZkf7IyhZEtLRPtgBseljk+x/PIhV7jwGAXPqIpvIg9JJa/dRlr9G
 wVn/YiNTJae6uodkpGY5z8X8+Oo4xHZ7MJd4/DZ+LtOnZ+pZyTotNPJOvIaOmTCHsVzdk+9uVY9
 T2YYpWIpkj0zcjzovb+ETZZX7lxdvDI7kyWKWvzAi7FUB0q76V84Y5XGByjL0AAoIfd2TRWVmsa
 syGlkvuu0mVuRPIZa/X44Cb/fZ7xUvnaQqKU5HqUbIMKmdaiw4+wEuKiQlnXSBcaTFsskqhaE9v
 2vQtJzMFAaKLbEPQQIhwpHLQz1OF6w==
X-Proofpoint-GUID: voa0s8oC1-8qxnaczA1tF39buOK41qyJ
X-Proofpoint-ORIG-GUID: voa0s8oC1-8qxnaczA1tF39buOK41qyJ
X-Authority-Analysis: v=2.4 cv=a4I9NESF c=1 sm=1 tr=0 ts=691c4632 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=GtNZTxoBlHEkV55hDasA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180081
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

On 11/18/25 9:50 AM, Akhil P Oommen wrote:
> AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
> in Raytracing related workloads. Add support for loading the AQE firmware
> and initialize the necessary registers.
> 
> Since AQE engine has dependency on preemption context records, expose
> Raytracing support to userspace only when preemption is enabled.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
