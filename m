Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB78B492D9
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 17:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C154D10E54D;
	Mon,  8 Sep 2025 15:18:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O0WGRrFx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAE010E54F
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 15:18:17 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5889OS3J004353
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 15:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /9G8YIX33m2SGtXUdjDCf/RB5vwDmC7O7BN/b342XFs=; b=O0WGRrFxyvZuZZ2T
 RfklNROy07xaXL3a+3GKtYslpD6widCTQ/LzeF4k4bsWd3umfIBWcIqPFKgSJgKE
 ZEIPm67WccjAAaK56vDSiNn2EIQ6XtMeZgpKM0pqTPhNFo3QT38B2LwU28kMNhJ+
 AZSpCkqDoCPmJsbjYX+wvIkltw8hkUJEDBbw4udQo7iFrH5UIoEkyQPuFAvfg6qc
 FOfcLIN7uOS9DvG+ChT4Azfo9ugB0PJqMmlnD2qlhwrUjWtigV+8zzkVnKdj/9iX
 4NA0IZHycYnFvPbgmMtyHD8AAnXZiYhEjW1ZKQZrE0EaR4cJ9MUs/OXYFWZ3+BV1
 fs+OYA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4kvvsx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 15:18:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b601ceb41cso9381751cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 08:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757344696; x=1757949496;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/9G8YIX33m2SGtXUdjDCf/RB5vwDmC7O7BN/b342XFs=;
 b=EUnNlPiYgywLO3k/f8spKePSuhh5zMvusM/xwcDx9wycMseSEY+LUJt3yIfCt9B7GR
 Vxt8OLpF8D9+mwmPrXFPrf83Red3Gzrgepf7h4MUA0UZM/d5jlHTEzSX/Cwp1b0Y4XAO
 wgfOAcZpcDpt/aQT6Jqbry7OfPL83+OE1lnvuSOg+qiKBUgxARIZenCZh4V2NCg74lHx
 QLp5ge6zkGzFjK2Gw9WmqYf3MTJu0sl2leVH40fs956EXTHqyW+YkZ16Wxmj+LLnE1LI
 FSjD3+WMUgIoLaSvxXmHOLD0pWS333QyDPC46Agulmi6IITx2wMWcGYOCzB4cLrp3CwL
 H/Zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEec1PXiRStEsuHqNHVcmq1SKnsqxciL1QvEy7JsKMiA/cjSkRNOmXEFzm0WySBiGUWr8mMS2DLpc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw718kg0Ukc0nZuohiL6wX0houBXnwOS7KPk9o3pL2SaKGNCTx2
 gPs65Mcme96u9qtaPNT9Qj8VWNfNpz73fNHep4tQwyVfUqeGv+x5546bzeCGf+WWu6tayScO3Ob
 eKCbf2LH7VRbp+q0pxrL1oOlBu6EU2+yZXGbqcaLg6Y3r19qyR+eyDg7eOnCSzpE/fknmccQ=
X-Gm-Gg: ASbGncs4jZSyDoxKo/3Zovl9ph0xwBWLaFmDh+baw9x1bEA3Q/x1z54bWdTxQ1uLd34
 FbzGFqJQUwT2UOISqhjJbwl3hqWzX1B6No+xeUb4lXKUYAZwWI/SGSWcEf8CgKlsFj77W4Ei7OI
 B1X9N0ElwIll0vU3kv8PgchXEvYausUqBqxqvJC7M6p40EePuIbZjQgyPUYS260jtv24aNlHzNO
 13aDkY833lBCKrRIu/sNMN9+47DISOgtRT6HHBA7Gzq3HUIEwABir4o2pUx5vtlQoUrPgdcaOq+
 IDg4MLEoK5k87eZf4t5DKygEg7805CdkNQqIhOKzMSsBVKmKmeZn/VuNeHKiq5YNF94XOMhjc9r
 Gzu5VVWzpECyyyH3SKzseqQ==
X-Received: by 2002:a05:622a:f:b0:4b3:d2c:f2a0 with SMTP id
 d75a77b69052e-4b5f84608a1mr53837881cf.11.1757344695734; 
 Mon, 08 Sep 2025 08:18:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHv3mcsIkkBXMP29rwffS5CTfl5UUIWU9i9fBerRPfpgMIylwxkbElL5PVh9knG1HqQmUlAXg==
X-Received: by 2002:a05:622a:f:b0:4b3:d2c:f2a0 with SMTP id
 d75a77b69052e-4b5f84608a1mr53837521cf.11.1757344695047; 
 Mon, 08 Sep 2025 08:18:15 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b043fd772bcsm1761417666b.14.2025.09.08.08.18.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 08:18:14 -0700 (PDT)
Message-ID: <77cfd9d7-c3f1-4e0b-8cf4-8567611c3a9d@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 17:18:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/16] drm/msm/a6xx: Poll additional DRV status
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
 <20250908-ifpc-support-v2-3-631b1080bf91@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-3-631b1080bf91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX4qTLPmJyy8O+
 rvLND76/gTBjJ5SUuEPaiVfsmafdVueyCFKrtOaw4Ee+w1/fkUfpcAVRQYhBnHdRNPM6bU1mM0/
 nRJjeEA4kMevbW3sO/lwmnYBSlJVM7CRp9CfsTd501yuOgIHWEXZkcYxN7fBXHhY3Ttyp9S2f5U
 eGobTy18u8rsCb8RPBZAPwVe6vMyTXFVitp4CiRbnT7D3aBu38unHmhBfy8J2zssbdnC93JZeNm
 tVSJsZUPHc38/I+6dp6Q0UY7FAU8YnP91YEaBtueoAEvAdwx6iJnrx8UWrfWI34Yat06dUyn7gK
 FRFvD3ft5ZpngICZqD0bskZC9RUqiapkm/F8VvDUEQpQa6bODAVYdjk6I+SKmP8X7CzyKENevet
 dBah1JPZ
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68bef3b9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=DmgBUSfskXSfToJwqCEA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: h7l-2dRLkXcOBqzfr_7dgXhxP9LL-uA8
X-Proofpoint-ORIG-GUID: h7l-2dRLkXcOBqzfr_7dgXhxP9LL-uA8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_05,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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

On 9/8/25 10:26 AM, Akhil P Oommen wrote:
> A7XX_GEN2 generation has additional TCS slots. Poll the respective
> DRV status registers before pm suspend.
> 
> Fixes: 1f8c29e80066 ("drm/msm/a6xx: Add A740 support")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index bb30b11175737e04d4bfd6bfa5470d6365c520fa..06870f6596a7cb045deecaff3c95fba32ee84d52 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -987,6 +987,22 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
>  		val, (val & 1), 100, 10000);
>  	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
>  		val, (val & 1), 100, 1000);
> +
> +	if (!adreno_is_a740_family(adreno_gpu))
> +		return;
> +
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS4_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 10000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS5_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 10000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS6_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 10000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS7_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 1000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS8_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 10000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS9_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 1000);

https://lore.kernel.org/linux-arm-msm/002eb889-87cb-4b8c-98fb-6826c6977868@oss.qualcomm.com/

Konrad
