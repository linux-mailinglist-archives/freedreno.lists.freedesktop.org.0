Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E3F9DE94C
	for <lists+freedreno@lfdr.de>; Fri, 29 Nov 2024 16:25:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C7610E4FD;
	Fri, 29 Nov 2024 15:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iEYPCr1f";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA47D10E4FD
 for <freedreno@lists.freedesktop.org>; Fri, 29 Nov 2024 15:25:31 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ATCrMsQ029780
 for <freedreno@lists.freedesktop.org>; Fri, 29 Nov 2024 15:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 haQsGWihOdgHm4cv5yvNRsaav8iMlhpfGgWfIpKo4Wc=; b=iEYPCr1fqoQ3Wi5Y
 CXrAggcLVT2euy7mczczoIT0BzQsxw8rkN1cmFsurS0uEC+yOeko5kQKUpyvcrEF
 7k6Ld8NUJmtWq7K0fmxIw3h+rPodR8+ftfSfkCxEHB1KEC829xS7N2rAtMEfvutY
 xiRGE1rxNiWyIEwJ/7nZRxd+Q+B4A9/AZGqOWsMb6NxJXKIKgSZYk7hpyQXikWVF
 ao4yZzZmJCY9Ay+CBUwnccKicPMxIBY7qiHconnbZySQMXs4O7ws3PbhLVRXlUoF
 HMFjDhqmCQHsfCwpdo1ccxoK9Kwue2LhOoyPsPkD+wUH+491eSKWoF7QosQwK6K1
 wK9bVQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366y05u4t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 29 Nov 2024 15:25:30 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6d407624cedso4575516d6.1
 for <freedreno@lists.freedesktop.org>; Fri, 29 Nov 2024 07:25:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732893930; x=1733498730;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=haQsGWihOdgHm4cv5yvNRsaav8iMlhpfGgWfIpKo4Wc=;
 b=Sme+j36Y63mdw6ruKkUsIwFyoxTMoulgVtxkQ5X1PBw32SLw8xcMysLJz+ux4h64NW
 JP3CIrAAdCoajo19hDyLLU9hRY19BJQpCn8AwSPZEYb+PVUrfk3UeJ+t0vzkKzOY7dzC
 IWyTnnjymLQ+Tg1FvLdPWPo7RCYvcPM7tJISlizuqUfCHF5OQgg4f1lKkLkZun37a0nB
 Qq1L7ZL+/fLLCw6ujhWqh4ZkAjAolTlIU1C1NmqlgeKSAI/PpdIP+GzqfzJAmcmaXnQr
 EnJ+z+eAK1P9toUKuA2/BZGPaDsb+yxL31dvOgjegWD3Kbw708NTNMtGi4XLoy1j6TKw
 OUOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIEBIuxSi/FwnWhXqUdVYRMAbaiX9JBM6cMJJ8hiIierVnA1cT/iCunro4Z7O4SeVPEFALue07gMc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzE489RlSBxaBd8+uP+NB+RulcWjgszYwI5GPI7TJn1gw/esFrq
 6y9Uj6T0VL2sVtsA8j/e924jJ3xp1HxHRnYqH1KNCEQA499dvgUMJMNwfbwXY5kII0iNYjn3lAN
 9eufVrssHwTB+ohyDdJ5FeMpz7Ag/xrdwoAyT/nbeYOkMPW0BL/ZWDaA9QXldWJ0rT08=
X-Gm-Gg: ASbGncvuj8y1knebBfiSXx07mrg3aO1woiS01J8PV0o7gvIz8RRFXAR6p6fAu67yWSg
 VMX7gXYxFweysHo1BJwgzP4aBkgDDowLTasY1dTKrFW/IKf7m9F1ZLo+90minHF6ADLgoBh3azz
 t37A2bSw2wmKhnzTO2wLSXC4X31vfkzYXn26p44VhPpQ8Zss/TsLuEA93wQq1lUZd64ioziST1C
 L7W9UCrXp0nx85xbElWHWUiOdwL+eir66JcDTcIDMA4OUpeRF5Qp4CqQK1Ft8Zgex44cinOOgLK
 mmU38PXiyyiGUu2rQJKNVOpiOOUmMas=
X-Received: by 2002:a05:620a:3712:b0:7a9:c0f2:75fc with SMTP id
 af79cd13be357-7b67c44101dmr572685385a.12.1732893929882; 
 Fri, 29 Nov 2024 07:25:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFABGScqGObURNhImJC7fBXLYcd5e8zHADeSrSRhflVdSkOsywE+7CtqbmRoBAFkettLxWeug==
X-Received: by 2002:a05:620a:3712:b0:7a9:c0f2:75fc with SMTP id
 af79cd13be357-7b67c44101dmr572682585a.12.1732893929440; 
 Fri, 29 Nov 2024 07:25:29 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5997ff0d5sm181758366b.85.2024.11.29.07.25.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 07:25:29 -0800 (PST)
Message-ID: <5fc71011-7a67-47b9-b372-b5e52ffea757@oss.qualcomm.com>
Date: Fri, 29 Nov 2024 16:25:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] drm/msm: adreno: enable GMU bandwidth for A740 and
 A750
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
 <20241128-topic-sm8x50-gpu-bw-vote-v3-5-81d60c10fb73@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241128-topic-sm8x50-gpu-bw-vote-v3-5-81d60c10fb73@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fgRWkDc8t-ZR-4jpFCfQGnRBfi1vPBoP
X-Proofpoint-GUID: fgRWkDc8t-ZR-4jpFCfQGnRBfi1vPBoP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411290125
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

On 28.11.2024 11:25 AM, Neil Armstrong wrote:
> Now all the DDR bandwidth voting via the GPU Management Unit (GMU)
> is in place, declare the Bus Control Modules (BCMs) and the
> corresponding parameters in the GPU info struct and add the
> GMU_BW_VOTE feature bit to enable it.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 0c560e84ad5a53bb4e8a49ba4e153ce9cf33f7ae..edffb7737a97b268bb2986d557969e651988a344 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1388,6 +1388,17 @@ static const struct adreno_info a7xx_gpus[] = {
>  			.pwrup_reglist = &a7xx_pwrup_reglist,
>  			.gmu_chipid = 0x7020100,
>  			.gmu_cgc_mode = 0x00020202,
> +			.bcms = (const struct a6xx_bcm[]) {
> +				{ .name = "SH0", .buswidth = 16 },
> +				{ .name = "MC0", .buswidth = 4 },
> +				{
> +					.name = "ACV",
> +					.fixed = true,
> +					.perfmode = BIT(3),
> +					.perfmode_bw = 16500000,
> +				},
> +				{ /* sentinel */ },
> +			},

This is not going to fly the second there's two SoCs implementing the
same GPU with a difference in bus topology. I think we could add
something like drvdata to ICC nodes and use it for BCMs on icc-rpmh.
Then, we could retrieve it from the interconnect path we get from the
dt node. It would also reduce duplication.

Konrad
