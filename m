Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EC09DEB54
	for <lists+freedreno@lfdr.de>; Fri, 29 Nov 2024 17:56:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D2C10E2AE;
	Fri, 29 Nov 2024 16:56:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SRjC66XG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0555110E2AE
 for <freedreno@lists.freedesktop.org>; Fri, 29 Nov 2024 16:56:14 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ATDEGHP030822
 for <freedreno@lists.freedesktop.org>; Fri, 29 Nov 2024 16:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9N9+0StuwjFo78qzxGpA7gT4M9KWRW0S+SLyWV8Ydm4=; b=SRjC66XG6ukxUnql
 QAhvEXXLmYdoqEywLif+5a3pD/fEzyeJuaE0KBFTyGuG1X+ROPeAHW7006tzhx1l
 f9udFt63+k7gOJuAr+Mc+zVUSZ5f7NBfzvExm443ilGKpTkSSu5TN8LIpnPYZ6O1
 osmCx1REcNLc9/9SBWPmRVHX6kDBmL/zXwY1HMimUH4Qc7vWmGcsA9cYqrMH7dZa
 TbYxQN9uEe479CJDCsHoWQtAU4/t2f8V/LOJ70kMhqyjlKHMzIhAolRiTrXwibC2
 9UKh85kPXc/1SwY7hg49nqJDvgzXwmHTulsifK4301kz1u7eKafttQGiiyPIOk1G
 H0dyRg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xw6719-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 29 Nov 2024 16:56:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-46692fb862bso2173341cf.1
 for <freedreno@lists.freedesktop.org>; Fri, 29 Nov 2024 08:56:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732899373; x=1733504173;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9N9+0StuwjFo78qzxGpA7gT4M9KWRW0S+SLyWV8Ydm4=;
 b=xIOW6qOl1khu8C6YH8TFf7uooGBPi/snjYzRcDVTBMSTBzQRMxbJyCdqpxy+WfCNsu
 3KmXtwPwxuaYm1lqJnTF9VgFt9hf//ddigLRi7xi3NgXiNHT4W4B/Uepm3qXNoI2Mjt9
 XuvrEFpOOkPpc6WjS+5qAOf8EBpQYsQbdqRvqCd5/ZfTBhKAx1XTuv6FoUMoOi6wOAjP
 7YvJwDKfPoUwkXnVQ71+jWN6Te7js8TD1flHVX+epdEcmXbdqp/AG47x86sQYhVMAF/L
 2yoA530FDNGxzbFrEi4bv5LpdUzaONf6m3/7RfdVbybbdyG56wehsy2yRpoqQgRKkurV
 U4Xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2UVyWCSMyEghD5YpWIDOIeEol5ymW0y+K6v7g32x63Nrk27rDvXXNj9lUkj9CkkYiX0xyqO0dQdc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzr1BtNYoW9xmgW9kPyGBOwVpaie27X5jWtfPtPwGtUCnnD1dYz
 hcp/7TU+6Z4f8Li5wTX2Zzadx/sbkQ8bjSz1plYF8s+GUneZy/q/yzueDH+E+CFAem8qfPVtAZT
 Nfpf359tfSjlhQ3umIH9XhhkBN3F2PRUiJY65A6nbPIImcA4HwqmLVJ3Dk/8LzckuWpo=
X-Gm-Gg: ASbGncsbovQPkmBx79oAL8+Tw6ntwZLn0HYq+2fjguHHRCqBubRunWuL6daoOHrddJ/
 gzpp1WMyJdZxTt9XmFO99d3nf+dMRbPPYymuwwJ7Art/RjbbUvuCjZsgmlGSTDaaPUZq35OnXA1
 XAeQzIbUf0eakRfZEp2TbBA+QpL6w5iEcCSoq7VrF1yKCxcPO1W/q71iD1V1uu/5q2d/SkQPIL5
 j88AuWLHPTaAqvUzDOzrA+edi80lPILwYTmxMtyWn5Le7CTPw9J0XnT2xoZIeuUAfjSqWwzWisY
 E2EvrTIKWEwRpZvukocEdilCPOaQDyE=
X-Received: by 2002:a05:622a:389:b0:462:fb65:cbb5 with SMTP id
 d75a77b69052e-466b36886b8mr76651371cf.16.1732899372941; 
 Fri, 29 Nov 2024 08:56:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVQSLO78wLDzRLA3VpDJ6fBlRPS9lgHqu+R15VZlArJvaDZj5w/JO/kqnnSs0mQp12UhVnIQ==
X-Received: by 2002:a05:622a:389:b0:462:fb65:cbb5 with SMTP id
 d75a77b69052e-466b36886b8mr76651111cf.16.1732899372416; 
 Fri, 29 Nov 2024 08:56:12 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5998e64c4sm190708566b.97.2024.11.29.08.56.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 08:56:11 -0800 (PST)
Message-ID: <00941d91-7366-4836-9d3a-7e505528a4e8@oss.qualcomm.com>
Date: Fri, 29 Nov 2024 17:56:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] drm/msm: adreno: dynamically generate GMU bw table
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
 <20241128-topic-sm8x50-gpu-bw-vote-v3-3-81d60c10fb73@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241128-topic-sm8x50-gpu-bw-vote-v3-3-81d60c10fb73@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TxB_JLJs4CmbwsthMct7yPatYgR3XWJz
X-Proofpoint-ORIG-GUID: TxB_JLJs4CmbwsthMct7yPatYgR3XWJz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411290137
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
> The Adreno GPU Management Unit (GMU) can also scale the ddr
> bandwidth along the frequency and power domain level, but for
> now we statically fill the bw_table with values from the
> downstream driver.
> 
> Only the first entry is used, which is a disable vote, so we
> currently rely on scaling via the linux interconnect paths.
> 
> Let's dynamically generate the bw_table with the vote values
> previously calculated from the OPPs.
> 
> Those entried will then be used by the GMU when passing the

entries

> appropriate bandwidth level while voting for a gpu frequency.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

[...]

>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 39 ++++++++++++++++++++++++++++++++---
>  1 file changed, 36 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index cb8844ed46b29c4569d05eb7a24f7b27e173190f..fe1946650425b749bad483dad1e630bc8be83abc 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -621,6 +621,35 @@ static void a740_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  	msg->cnoc_cmds_data[1][0] = 0x60000001;
>  }
>  
> +static void a740_generate_bw_table(const struct a6xx_info *info, struct a6xx_gmu *gmu,
> +				   struct a6xx_hfi_msg_bw_table *msg)

This should work for all targets

> +{
> +	unsigned int i, j;
> +
> +	msg->ddr_wait_bitmask = 0x7;

GENMASK; also should be generated based on BCM data dynamically, there's
logic for it in bcm-voter.c : tcs_list_gen()

> +
> +	for (i = 0; i < GMU_MAX_BCMS; i++) {
> +		if (!info->bcms[i].name)
> +			break;
> +		msg->ddr_cmds_addrs[i] = cmd_db_read_addr(info->bcms[i].name);

A7xx share a common list of BCMs, the buswidth may differ per soc and it's
something already stored in ICC drivers

> +	}
> +	msg->ddr_cmds_num = i;
> +
> +	for (i = 0; i < gmu->nr_gpu_bws; ++i)
> +		for (j = 0; j < msg->ddr_cmds_num; j++)
> +			msg->ddr_cmds_data[i][j] = gmu->gpu_ib_votes[i][j];
> +	msg->bw_level_num = gmu->nr_gpu_bws;
> +
> +	/* TODO also generate CNOC commands */

We only do on/off (0/100 units - kbps?), it seems

> +
> +	msg->cnoc_cmds_num = 1;
> +	msg->cnoc_wait_bitmask = 0x1;
> +
> +	msg->cnoc_cmds_addrs[0] = cmd_db_read_addr("CN0");
> +	msg->cnoc_cmds_data[0][0] = 0x40000000;
> +	msg->cnoc_cmds_data[1][0] = 0x60000001;
> +}
> +
>  static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  {
>  	/* Send a single "off" entry since the 630 GMU doesn't do bus scaling */
> @@ -664,6 +693,7 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>  	struct a6xx_hfi_msg_bw_table *msg;
>  	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>  	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> +	const struct a6xx_info *info = adreno_gpu->info->a6xx;
>  
>  	if (gmu->bw_table)
>  		goto send;
> @@ -690,9 +720,12 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>  		a690_build_bw_table(msg);
>  	else if (adreno_is_a730(adreno_gpu))
>  		a730_build_bw_table(msg);
> -	else if (adreno_is_a740_family(adreno_gpu))
> -		a740_build_bw_table(msg);
> -	else
> +	else if (adreno_is_a740_family(adreno_gpu)) {
> +		if (info->bcms && gmu->nr_gpu_bws > 1)
> +			a740_generate_bw_table(info, gmu, msg);

This if should come before the hardcoded if-else chain, as it
applies to all platforms

Konrad
