Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D75C2271E
	for <lists+freedreno@lfdr.de>; Thu, 30 Oct 2025 22:42:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D89510EA3F;
	Thu, 30 Oct 2025 21:42:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nB5i1vu0";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hTWKBETU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E7910EA3F
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 21:42:25 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59UFERwK084019
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 21:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tzlUFB86mAlTUURMeKWMWkUk71VirJXlKOjLKibgrMs=; b=nB5i1vu0NdPS2wPx
 eoVqkrmQogyhWYaOs20hxamRBiclaCE1rJP/ANv1/v66gfysCp87g8B0X6yAfDVG
 tBBv5x0wietJnBXQMZaMn+xUcUikSp7wzsR09UlMBuxFz7ND/5jjoxg8Ji1d/jeT
 f1Ibr1HMacj/mYR0bk+n+P1NWw0B9BteWOemHdm4KlMW5Q5M44k8dNVDXt1V22GI
 r3y0rOO2pK2Xb0sJsM+NII+umkQUahqhzai6A3uf06FGHWZAmDtd0rjjERqwrHIF
 bIpb3G5Bsy+ppJpefCSyQAhCKnYZ9nRwuiX2UaEG2P7WGW9N1d3H1MsaDyTm2JP2
 VIc9JA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ag392te-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 21:42:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e8a387d01bso54590431cf.3
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 14:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761860544; x=1762465344;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tzlUFB86mAlTUURMeKWMWkUk71VirJXlKOjLKibgrMs=;
 b=hTWKBETUo9XJKjWHPIEXgA281bBgY/QAasF01huUFvz8VyhEq2nqh03AtNqWyecHSz
 1AueTUHR055Q2AXwxG2EvzY2Tu2aacX4HDfhzFvSvI0Ui0/DepAXqzyMfdDfvckO/qYH
 ixUjKVKWBB9Ju0ujB5LVbUN00bAkYpYZuKp1ME/g/YcGh5XEoG2Mmf0HMky8MPrI1/M4
 Wo+z75GMk3obyH5aImE1fAAetl84jLH8mcClx2879XtzAV6UwAuK1uzH04SttoWRfEVU
 kzTMXi6t/Klr1nYfIn+Q3fz9eAEzfjg2zQvv1nGFyNWycunOl5iSOdCWJVL+c3giciLj
 Ndmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761860544; x=1762465344;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tzlUFB86mAlTUURMeKWMWkUk71VirJXlKOjLKibgrMs=;
 b=N1nc/RJHWxe3zrBexw64osJ2qXno90x7SWW48WNVHXBaB5ktXS4prrQQx+lbFhEbCj
 2HCYPF4ElR8SqnVDq/X9GFV2okF9fAfmqF/8AUsgevvXnsyj5yqlWbGloMOCqoZmCLmF
 CCwIu7Mf8OUr/mra5TDxTPHROdQLwKOFBUh+w86WfBbCy1ElZvzGeHcsFpkE40ACGw4u
 01gr5HAgpxb4qCP3gb51CAa13/Yp32YRI4PbmQGLg67wKTWj7/gMKozpTc84/VbRmc38
 6rPSjCHuiDNcYERrT4cR6PnLUAAxb/MTwngDvTVrlrd4z3WMMmIEuJgXRtS9YNmRgANa
 KqCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVz9xJr1C8dzcqZ3IB0usKAb3Yc2hu6TpDNR3YfQK9bDWJPJAjLg6sE6w3i5VG5b9UfaJ5/RzkqYAA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGtADy0cTrMRqlvJGBJOj72d6jtvJ4WTYS2gTSSx7jTLKlvAMx
 OzVImsGlBwjN7o1U0p6+qpunXV6HA7b5tRjtBEqvAHvb+03aJGuasif9QBzMN+D3f+vpF6d4bvu
 klQ+41Y01fyGrwsI22pBLGrX9WFBOy4bPT7yr96W5DZY2ZfAeAz5NCbaYkM/aKS93lcYx31o=
X-Gm-Gg: ASbGncuRkyk7ZyCrqkN+/+Whr4cYdj01a4q3YzCFngHfV3nPDRoJvDm0jNjIt/uy+Nc
 FbOErIGK8vU/b2yk27Dwi3t+1FOzBhJt+xzKDruHARqxRxcz8EXUxdso1GoHm4GsS/N5gAyGtSg
 /LiWRzabZRAAXY+75e+YhwSh1V3FCFOs0Ix0nAPrlnPIB57Jtk0BcmDp3aXQLz74bqAA+QFV0tl
 CihK0BYJtyfC1QzLZ7D5lBZPTofetEOLV2X79u4ntx1njmEQ0eWuE0JXNibl+tWPRQtCUTLUceL
 5ZFJlpL1AI5O4mtwQTwAGXQUB69GUyZRxVVOcaF3cru0u6GzF0lcwm81k+E/TuMAuj5Rlsn419z
 I9qHkcX8WJM8E08L3wpfjsAw=
X-Received: by 2002:a05:6a00:8d1:b0:7a2:7bdd:cbf4 with SMTP id
 d2e1a72fcca58-7a77a9ca32dmr956530b3a.27.1761859787094; 
 Thu, 30 Oct 2025 14:29:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7gJS7A8SHkbq5oKF6sDj7A6I6fhFxuB0Lxorh9exZXB3/O9HNGHkmZRZA8yyMj7usEqcVoQ==
X-Received: by 2002:a05:6a00:8d1:b0:7a2:7bdd:cbf4 with SMTP id
 d2e1a72fcca58-7a77a9ca32dmr956495b3a.27.1761859786477; 
 Thu, 30 Oct 2025 14:29:46 -0700 (PDT)
Received: from [192.168.1.6] ([106.222.233.132])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a414012d13sm19972568b3a.9.2025.10.30.14.29.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 14:29:46 -0700 (PDT)
Message-ID: <c8058713-b126-461b-8ae6-19c4574a8105@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 02:59:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: Re: [PATCH RFC RFT] drm/msm: adreno: attach the GMU device to a driver
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
Content-Language: en-US
In-Reply-To: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE4MyBTYWx0ZWRfX9I6W00ROHbC8
 D+CUb7fuI2XuOva2RhH+HfMHMkFChENSlZBrR5JZI31l2Yo4dVN76nPKli0y67CLwFP8yoOnVLT
 Tevcc/MBWBJUj+jaHeB+I2VtBAgVuwWtPV4AtZpSAt0iYJ0CTG+EnfajT7mOiepFLi8wVLNe2el
 Q9MsEx3edrrMtvQpiJxhXgQKGYQZZgCq12xibj8a56diNBYey/3nB6h8rpgGQWCh5xlBNh/aRyg
 eTIyMyvKbYkQoQK9h24I0hGj2vrAwN5GBxmgysEY/XV5E4QY4h652aA6WAmmALxf1e/XYgI4Tw9
 yFNO8HAigN7+9rsl+gpkMNDFlQSv3a/1opedDxfAiVe5QC6s0YlTMFOaUcKGPhUaQLingNdfAXA
 j6oly1Gysr6WeWwPhR6N8KTcvIFUnA==
X-Authority-Analysis: v=2.4 cv=TrnrRTXh c=1 sm=1 tr=0 ts=6903dbc0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=rTtKBu4o5onlnI9juXDqsQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=ZJ4cUMe89lpGfuoIxrAA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: bAfHd8r_sGxneSiJeX8D_lc5qd6je2kw
X-Proofpoint-GUID: bAfHd8r_sGxneSiJeX8D_lc5qd6je2kw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_07,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300183
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

On 10/22/2025 6:14 PM, Neil Armstrong wrote:
> Due to the sync_state is enabled by default in pmdomain & CCF since v6.17,
> the GCC and GPUCC sync_state would stay pending, leaving the resources in
> full performance:
> gcc-x1e80100 100000.clock-controller: sync_state() pending due to 3d6a000.gmu
> gpucc-x1e80100 3d90000.clock-controller: sync_state() pending due to 3d6a000.gmu
> 
> In order to fix this state and allow the GMU to be properly
> probed, let's add a proper driver for the GMU and add it to
> the MSM driver components.
> 
> Only the proper GMU has been tested since I don't have
> access to hardware with a GMU wrapper.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 354 ++++++++++++++---------------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |   6 -
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |   3 -
>  drivers/gpu/drm/msm/adreno/adreno_device.c |   4 +
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   4 +
>  drivers/gpu/drm/msm/msm_drv.c              |  16 +-
>  6 files changed, 192 insertions(+), 195 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index fc62fef2fed8..6e7c3e627509 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1859,11 +1859,14 @@ void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu)
>  	pm_runtime_put(&gpu->pdev->dev);
>  }
>  
> -void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
> +static void a6xx_gmu_unbind(struct device *dev, struct device *master, void *data)
>  {

I feel we should keep gmu and gmu_wrapper implementations separate. It
is already overloaded. How about adding a separate gmu_wrapper_bind_ops
and keep it in the match data?

> -	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct msm_drm_private *priv = dev_get_drvdata(master);
> +	struct msm_gpu *gpu = priv->gpu;

<< snip >>

>  static inline uint32_t get_wptr(struct msm_ringbuffer *ring)
>  {
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 7e977fec4100..0618da7e8b40 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -998,18 +998,30 @@ static const struct of_device_id msm_gpu_match[] = {
>  	{ },
>  };
>  
> +static const struct of_device_id msm_gmu_match[] = {
> +	{ .compatible = "qcom,adreno-gmu" },
> +	{ .compatible = "qcom,adreno-gmu-wrapper" },
> +	{ },
> +};
> +
>  static int add_gpu_components(struct device *dev,
>  			      struct component_match **matchptr)
>  {
> -	struct device_node *np;
> +	struct device_node *np, *gmu;
>  
>  	np = of_find_matching_node(NULL, msm_gpu_match);
>  	if (!np)
>  		return 0;
>  
> -	if (of_device_is_available(np) && adreno_has_gpu(np))
> +	if (of_device_is_available(np) && adreno_has_gpu(np)) {
>  		drm_of_component_match_add(dev, matchptr, component_compare_of, np);
>  
> +		gmu = of_find_matching_node(NULL, msm_gmu_match);

Instead of this, we can probably use the gmu phandle from "qcom,gmu"
property? That is quicker and also doesn't assume that there is only a
single GPU.

> +		if (of_device_is_available(gmu))
> +			drm_of_component_match_add(dev, matchptr, component_compare_of, gmu);
> +		of_node_put(gmu);
I think you missed the recently added headless support. Please check
separate_gpu_kms modparam and msm_gpu_probe().

-Akhil

> +	}
> +
>  	of_node_put(np);
>  
>  	return 0;
> 
> ---
> base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
> change-id: 20251022-topic-adreno-attach-gmu-to-driver-e47025fd7ebb
> 
> Best regards,
