Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7568A9DE940
	for <lists+freedreno@lfdr.de>; Fri, 29 Nov 2024 16:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A5810E4FB;
	Fri, 29 Nov 2024 15:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mHTC/nPp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9C810E4F8
 for <freedreno@lists.freedesktop.org>; Fri, 29 Nov 2024 15:21:47 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ATCC8tI023467
 for <freedreno@lists.freedesktop.org>; Fri, 29 Nov 2024 15:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IJ5mIRsH3o55KXnabuNYt4mdIaB82lRdAStGmMYH8Ps=; b=mHTC/nPpbmztynUd
 6C3NhK5OlOdVnYswxs2VRl+6zV6i5RC9FMf78gOBnBVPnJQX8Jm2wDMzdSKp6t5b
 Ddt7aRW3cBQJanMh2ss+Y/P155/CEtobtYKNNO18uXSvMFoJuRhj26fDgNCrUqih
 D0MwQUlDU2db3EzGj56Aozvw35MYWG0pbQDfjXHOsHs1NZeFzK9+eQn+VO6+O3Ly
 Nnj20iGK4I3oy5lHh10wvFt0DpnARFf3n3WFvDGGH8E8yk+6R8FpF0QkKsmaTZJh
 OcTZ7cyL+4ggGu/RM8UcYT1F9excORDRVYc6Q2LiiVqdo+8WucmevfRHnq7ufuQh
 I4Gd0g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 436h2mmkyf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 29 Nov 2024 15:21:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-466d3ec228bso433631cf.2
 for <freedreno@lists.freedesktop.org>; Fri, 29 Nov 2024 07:21:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732893705; x=1733498505;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IJ5mIRsH3o55KXnabuNYt4mdIaB82lRdAStGmMYH8Ps=;
 b=KALqpza6a2evGnPl0gn8aYHr2xBWNpjQgIfTkNoj+8fuPNvubkUhVv0TGzksIGBFqG
 JEZrHmdabEF2dHA8g2rZsJoq8ZVPEzmMYb3Atc1gZ8QPvlQTGRfgukAzaZ7ahApoHrPC
 A68F+sa4EF6nQNp7L8Gr1FsHqw8qs4CM3YWhSnz8K5IGKDJLMC/Of/NL0FgeVKIiVqVK
 rh4+jSH3Sr7k3DMZ9ZXb92Nm5jYyOGvmfU3W5kKmSnjAvESBCxKGBrJgkRFBfpAHqNbW
 P3l03UNIIdE/99VWVJ8T98sOkYhDHFBykSfAKrusJSgjqCAC5adiBkY4Shwvx0Ck5Mwh
 gnFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW75CzMeZv/YPA7x6VE8NHhRQFUS25XEkJ6YZZ84VJ4z+tky5hEh6eA46XDrEWoM9JUjZqgmdZGJ+s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydzJW0ibJvQg/eEaJ1Br4lvWKLM66A3S/o+hdEQyFvCYOaagLs
 tCHgeDkeu57eFO3xg9wSCZpM1702UpnlolG2nEJof7OpICEVNK35A0fAr1j266btZiLX321ieTA
 3VAMRH9T5om541/RXBocZcrL0YKIv+oVjD3xTjbhMrU+YNCf+pgf2PuPdaDlXZNx2l0I=
X-Gm-Gg: ASbGncv8DKBArRrEW/lMRWe2nLWv36UzbEgfdVOAz827QrfF01lpNBsUNxxEnSic5Be
 Klf/1dwhPoqitHq/YArPQrDHIbcpOuD4rfgSOz+aCcuuXdM5ZCl/MJKteF4/mt/F1ZkJ+/3ac/3
 RQz7jvkExdPnRvlaa0kP6teZw8pm8Rlsu3JJCnEOi2Z2wtCwr8RhoFnNL5h0HjPbVNWnOEbCa/j
 P5fEgJZnVAHYgh2NcWzhN22gg96OIy/x0qauDEu5FerIJ/C2Xr4cuIho3/nWcihhqXqiJ+4WDLl
 vHvUc1LszDEcQ12qILmVu3cEQKHpmwQ=
X-Received: by 2002:a05:622a:19a2:b0:460:9acd:68be with SMTP id
 d75a77b69052e-466b34ed7b1mr72740201cf.5.1732893705130; 
 Fri, 29 Nov 2024 07:21:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqnFCjvQhGdMrBi/YsC5bYvvrCBQFiBOX8WXQuxWzWQXGXy14AWNHZB3lTPTK/1au+rgfZ1g==
X-Received: by 2002:a05:622a:19a2:b0:460:9acd:68be with SMTP id
 d75a77b69052e-466b34ed7b1mr72739851cf.5.1732893704650; 
 Fri, 29 Nov 2024 07:21:44 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d097d9f6c1sm1913718a12.11.2024.11.29.07.21.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 07:21:43 -0800 (PST)
Message-ID: <0dabac7a-bc7e-4075-86ed-3d4c25908ffb@oss.qualcomm.com>
Date: Fri, 29 Nov 2024 16:21:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] drm/msm: adreno: add plumbing to generate
 bandwidth vote table for GMU
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
 <20241128-topic-sm8x50-gpu-bw-vote-v3-2-81d60c10fb73@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241128-topic-sm8x50-gpu-bw-vote-v3-2-81d60c10fb73@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NBfjSMBtUcDLdWSIwRxgNWdty1ueEf20
X-Proofpoint-ORIG-GUID: NBfjSMBtUcDLdWSIwRxgNWdty1ueEf20
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411290125
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
> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
> the Frequency and Power Domain level, but by default we leave the
> OPP core scale the interconnect ddr path.
> 
> While scaling via the interconnect path was sufficient, newer GPUs
> like the A750 requires specific vote paremeters and bandwidth to
> achieve full functionality.
> 
> In order to calculate vote values used by the GPU Management
> Unit (GMU), we need to parse all the possible OPP Bandwidths and
> create a vote value to be sent to the appropriate Bus Control
> Modules (BCMs) declared in the GPU info struct.
> 
> This vote value is called IB, while on the othe side the GMU also
> takes another vote called AB which is a 16bit quantized value
> of the bandwidth against the maximum supported bandwidth.
> 
> The vote array will then be used to dynamically generate the GMU
> bw_table sent during the GMU power-up.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 174 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  14 +++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h |   1 +
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.h |   5 +
>  4 files changed, 194 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 14db7376c712d19446b38152e480bd5a1e0a5198..ee2010a01186721dd377f1655fcf05ddaff77131 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -9,6 +9,7 @@
>  #include <linux/pm_domain.h>
>  #include <linux/pm_opp.h>
>  #include <soc/qcom/cmd-db.h>
> +#include <soc/qcom/tcs.h>
>  #include <drm/drm_gem.h>
>  
>  #include "a6xx_gpu.h"
> @@ -1287,6 +1288,131 @@ static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
>  	return 0;
>  }
>  
> +/**
> + * struct bcm_db - Auxiliary data pertaining to each Bus Clock Manager (BCM)
> + * @unit: divisor used to convert bytes/sec bw value to an RPMh msg
> + * @width: multiplier used to convert bytes/sec bw value to an RPMh msg
> + * @vcd: virtual clock domain that this bcm belongs to
> + * @reserved: reserved field
> + */
> +struct bcm_db {
> +	__le32 unit;
> +	__le16 width;
> +	u8 vcd;
> +	u8 reserved;
> +};
> +
> +static u64 bcm_div(u64 num, u32 base)
> +{
> +	/* Ensure that small votes aren't lost. */
> +	if (num && num < base)
> +		return 1;
> +
> +	do_div(num, base);
> +
> +	return num;
> +}

This should live in include/soc/qcom/bcm.h, similarly to tcs.h in
that directory

> +static int a6xx_gmu_rpmh_bw_votes_init(const struct a6xx_info *info,
> +				       struct a6xx_gmu *gmu)
> +{
> +	const struct bcm_db *bcm_data[GMU_MAX_BCMS] = { 0 };
> +	unsigned int bcm_index, bw_index, bcm_count = 0;
> +
> +	if (!info->bcms)
> +		return 0;
> +
> +	/* Retrieve BCM data from cmd-db */
> +	for (bcm_index = 0; bcm_index < GMU_MAX_BCMS; bcm_index++) {
> +		size_t count;
> +
> +		/* Stop at first unconfigured bcm */
> +		if (!info->bcms[bcm_index].name)
> +			break;
> +
> +		bcm_data[bcm_index] = cmd_db_read_aux_data(
> +						info->bcms[bcm_index].name,
> +						&count);
> +		if (IS_ERR(bcm_data[bcm_index]))
> +			return PTR_ERR(bcm_data[bcm_index]);
> +
> +		if (!count)
> +			return -EINVAL;
> +
> +		++bcm_count;
> +	}
> +
> +	/* Generate BCM votes values for each bandwidth & BCM */
> +	for (bw_index = 0; bw_index < gmu->nr_gpu_bws; bw_index++) {
> +		u32 *data = gmu->gpu_ib_votes[bw_index];
> +		u32 bw = gmu->gpu_bw_table[bw_index];
> +
> +		/* Calculations loosely copied from bcm_aggregate() & tcs_cmd_gen() */

Ditto, perhaps this should be exported from icc

[...]

Konrad
