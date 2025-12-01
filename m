Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A710C95B0A
	for <lists+freedreno@lfdr.de>; Mon, 01 Dec 2025 05:15:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43ABB10E0D6;
	Mon,  1 Dec 2025 04:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cxG7mIjN";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KTsDpl9d";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E16D10E0D1
 for <freedreno@lists.freedesktop.org>; Mon,  1 Dec 2025 04:15:04 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AUMW5dF2679652
 for <freedreno@lists.freedesktop.org>; Mon, 1 Dec 2025 04:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FseXoC0UFPlFn2ULWDdIiyt46WABe6AmHmF+Jh8csI4=; b=cxG7mIjN0G6Qg7w4
 Cwf08ehzDm6SC3vW9cpp8U/lePiRhaVPpUYhkiy9M5WjhjOsHUVViRLo8ASFd5yP
 Rq3WU7GfJNGH6kT9YhBxyodw7fz6CD629tYswMr0Gxxt/c8U7ia213qXYC98IvhH
 QGH0ZArqFpOEkviRb9d4FUQ/zWwpJ4WN33tpaBwj7fUcHdXTf96Qwnj6a+6EKSzy
 4QAldNd2ro54HSmQG/3KsCyLHWxgAHXNB32JsSQ+rdWWEumjrHS6genE1MuBtqWv
 oJz1wdRuFqTGd19QuzLVYgY6VF7Pr5kDysdRFqB3OfeQZ6E52ven27Jp6PVrzblr
 5v1rkQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqskf39vu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 01 Dec 2025 04:15:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-295915934bfso45531035ad.0
 for <freedreno@lists.freedesktop.org>; Sun, 30 Nov 2025 20:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764562503; x=1765167303;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FseXoC0UFPlFn2ULWDdIiyt46WABe6AmHmF+Jh8csI4=;
 b=KTsDpl9dOdb/La7NGj/DS1tfy23UinfJH7zN67ucltRljrTteOvSC62w83snhAp16z
 3qqXUTEhZkBH/1Rbjfw4MFgzR+Qbflf4sapv/vYO2w/tvf3LqOKWDR35xCTgNxkJOl6M
 hm8cSr8V5YdewTx2e4tWwMqX11kEoTHuscsCQR5OXJooFwxhLGnvnI7rffbAe3iSwZAd
 vAcrw4vlsELNwmK0vSSJwg84D5EX3nEnPdcm08XsOWdLMCSa70mP8nT76dtj9nCVjtWQ
 fb7zpRSaW80J80MnBl2XO9dJ1Xv8vJnxp3BjhsNdScAsr8qtZHSnILuqAIKOkEwHRdy0
 8k0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764562503; x=1765167303;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FseXoC0UFPlFn2ULWDdIiyt46WABe6AmHmF+Jh8csI4=;
 b=CM2zmkRsNm0deJfcRLKjGJ3PUZk2VaPLQojdyNykJf7IUANoIdg71y5lypCVoTKKWi
 el6E6SNZCV63m0EJ+u7owbdyVLhKlpxdknYWuA9xP+C9fYvIzRFTvZTL0KRpGvSzh+2S
 MLGRQGshSw2GXnkI2XNFA20r3h6LcScwckn+AiwHXx5KlrVqL1QY4TLJya1o7c25VBWP
 WloqLzo9H4YZ7HKH0KOCBhXIU8K706Xy6/ThiU6vbhmgDLygntV/qh2tEXW6ARKgYqFK
 /0F80Y5uTkFLPphn8GcoafLZm0pD+1qB27ed+Kiv0Q5cQFUO2pxGLMtcj75fdWJXE0Yj
 m87A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8KLoFXKd6H+yfTmZe2mIneobSgP2dfqbgxy3aycjD8HRqLfrZz9Y8GdLIaXJA2fz7kMNk6wt+VKg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJNJI54XPW6I3GDpHI01IGKaMp6IMj94lpe2rzIx5iZmDzotbu
 O8k7p8xnaTST3HSFEJrRls1yoPTmbRv15vJH56ZGfO21q9/qmKtGMHEX2niAywM7XvvUH62arxj
 OowyMN/ZkgGa+ZyZd2vVGKiAr6nac1RZV+HC2lSmwIAnLAfjhrl39xZQCUzP7ksVlTedCzoo=
X-Gm-Gg: ASbGncsGY0vxbKRC+uqSdVIOBZ9mZTZszNVHYcZoA3CdIIs15OcAwvqAfNA994I5pfi
 TxRC7dJeCupyyzo4iUqrGhCMo7ZidnIHeSbLOvaG7W/QqvAJ7DS2aXTDe7mDQfCJcXE7FCy9kK6
 WzsRjYax9BuxNuPKOOk6f16q0d0DhxbGD0EY8mknQ5P2Bk9fertCmXbvOEi53hKsdF3gn5e0BGl
 9EJPVgeSgc7v2Ew3L33dOgJbwC+qApZgbrlwhSE6fIvAqCbdoPas37Oxv3ot6ccZ+gquiD+IGEF
 yMjFfwZgfzF7IvghJj12fNSYMEGoKR9WyOMSNybzrRV4/0i8zrjv9JCc7ynAZnRDoj1TCxEKAfA
 xEu8QtMwZ0Ow85toVUhmH60cN5eZEfkyk
X-Received: by 2002:a17:903:1b2b:b0:298:43f4:cc49 with SMTP id
 d9443c01a7336-29b6c5225f0mr420884455ad.24.1764562502852; 
 Sun, 30 Nov 2025 20:15:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUvdYqQdcAB8wtQ4iFi6hdrLX7WH1Zr/sDxqFvq3nFRKk9zpvXvS8fz9AvXPWK52opFXU2Cw==
X-Received: by 2002:a17:903:1b2b:b0:298:43f4:cc49 with SMTP id
 d9443c01a7336-29b6c5225f0mr420884085ad.24.1764562502354; 
 Sun, 30 Nov 2025 20:15:02 -0800 (PST)
Received: from [192.168.1.9] ([117.211.36.176])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29bce47096csm106669955ad.44.2025.11.30.20.14.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Nov 2025 20:15:02 -0800 (PST)
Message-ID: <17b0f475-6c67-4cef-9277-251f45c1837c@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 09:44:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: Fix a7xx per pipe register programming
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20251128-gras_nc_mode_fix-v2-1-634cda7b810f@gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251128-gras_nc_mode_fix-v2-1-634cda7b810f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X7Nf6WTe c=1 sm=1 tr=0 ts=692d1647 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=bQZbETVgiEA5ROTFRdaCHA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=ScosPgwaH3TmPZige8AA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: uuy--yoej3qwfWzjMfOaqvDazVwQ_HrJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDAzMSBTYWx0ZWRfX7D1zSZz5e6mQ
 c81SITkfyB42vmHxgTPAc+Xivy+9NgIPX8AX/9hSrqfp5H8lcG0WUgceS/PAWsEYYKDVPWOU2LQ
 jLJ0kgR0D9E/N5xwB1QvLa+O2OqoWcfRa6m1a1rZ/om4XTfhijCh/8/J2FnsW20kzQExcIrhVlL
 unWLzgEouBrWV7DwBXa7ehXxq+gVE/xKUo3zrW0BoWtu0IEa66LfUn3zeOmSDzYh9M7z44886Ip
 9lGPl/VVqwVMfCY6Rr5YdLdhOeI9QbQYByOlwO+gijRtPiH9EtafxQ3bK7+blg3R+r55H+xI7jH
 gan8W1k3vW+62xoZ/SkEn8va+BLe3ihDLCf6Kp7jH+i0br0K5UNKSKLkkIevZbMN8Vj0S4JbZ1Y
 Ma567oWIF6KESC4RDEf/DJ4cE8Er9Q==
X-Proofpoint-ORIG-GUID: uuy--yoej3qwfWzjMfOaqvDazVwQ_HrJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512010031
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

On 11/28/2025 10:47 PM, Anna Maniscalco wrote:
> GEN7_GRAS_NC_MODE_CNTL was only programmed for BR and not for BV pipe
> but it needs to be programmed for both.
> 
> Program both pipes in hw_init and introducea separate reglist for it in
> order to add this register to the dynamic reglist which supports
> restoring registers per pipe.
> 
> Fixes: 91389b4e3263 ("drm/msm/a6xx: Add a pwrup_list field to a6xx_info")
> Cc: stable@vger.kernel.org
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
> Changes in v2:
> - Added missing Cc: stable to commit
> - Added pipe_regs to all 7xx gens
> - Null check pipe_regs in a7xx_patch_pwrup_reglist
> - Added parentheses around bitwise and in a7xx_patch_pwrup_reglist
> - Use A7XX_PIPE_{BR, BV, NONE} enum values
> - Link to v1: https://lore.kernel.org/r/20251127-gras_nc_mode_fix-v1-1-5c0cf616401f@gmail.com
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 12 ++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 34 +++++++++++++++++++++++++++----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 13 ++++++++++++
>  4 files changed, 55 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 29107b362346..10732062d681 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1376,7 +1376,6 @@ static const uint32_t a7xx_pwrup_reglist_regs[] = {
>  	REG_A6XX_UCHE_MODE_CNTL,
>  	REG_A6XX_RB_NC_MODE_CNTL,
>  	REG_A6XX_RB_CMP_DBG_ECO_CNTL,
> -	REG_A7XX_GRAS_NC_MODE_CNTL,
>  	REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE,
>  	REG_A6XX_UCHE_GBIF_GX_CONFIG,
>  	REG_A6XX_UCHE_CLIENT_PF,
> @@ -1448,6 +1447,12 @@ static const u32 a750_ifpc_reglist_regs[] = {
>  
>  DECLARE_ADRENO_REGLIST_LIST(a750_ifpc_reglist);
>  
> +static const struct adreno_reglist_pipe a7xx_reglist_pipe_regs[] = {
> +	{ REG_A7XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +};
> +
> +DECLARE_ADRENO_REGLIST_PIPE_LIST(a7xx_reglist_pipe);
> +
>  static const struct adreno_info a7xx_gpus[] = {
>  	{
>  		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
> @@ -1491,6 +1496,7 @@ static const struct adreno_info a7xx_gpus[] = {
>  			.hwcg = a730_hwcg,
>  			.protect = &a730_protect,
>  			.pwrup_reglist = &a7xx_pwrup_reglist,
> +			.pipe_reglist = &a7xx_reglist_pipe,
>  			.gbif_cx = a640_gbif,
>  			.gmu_cgc_mode = 0x00020000,
>  		},
> @@ -1513,6 +1519,7 @@ static const struct adreno_info a7xx_gpus[] = {
>  			.hwcg = a740_hwcg,
>  			.protect = &a730_protect,
>  			.pwrup_reglist = &a7xx_pwrup_reglist,
> +			.pipe_reglist = &a7xx_reglist_pipe,
>  			.gbif_cx = a640_gbif,
>  			.gmu_chipid = 0x7020100,
>  			.gmu_cgc_mode = 0x00020202,
> @@ -1548,6 +1555,7 @@ static const struct adreno_info a7xx_gpus[] = {
>  			.protect = &a730_protect,
>  			.pwrup_reglist = &a7xx_pwrup_reglist,
>  			.ifpc_reglist = &a750_ifpc_reglist,
> +			.pipe_reglist = &a7xx_reglist_pipe,
>  			.gbif_cx = a640_gbif,
>  			.gmu_chipid = 0x7050001,
>  			.gmu_cgc_mode = 0x00020202,
> @@ -1590,6 +1598,7 @@ static const struct adreno_info a7xx_gpus[] = {
>  			.protect = &a730_protect,
>  			.pwrup_reglist = &a7xx_pwrup_reglist,
>  			.ifpc_reglist = &a750_ifpc_reglist,
> +			.pipe_reglist = &a7xx_reglist_pipe,
>  			.gbif_cx = a640_gbif,
>  			.gmu_chipid = 0x7090100,
>  			.gmu_cgc_mode = 0x00020202,
> @@ -1623,6 +1632,7 @@ static const struct adreno_info a7xx_gpus[] = {
>  			.hwcg = a740_hwcg,
>  			.protect = &a730_protect,
>  			.pwrup_reglist = &a7xx_pwrup_reglist,
> +			.pipe_reglist = &a7xx_reglist_pipe,
>  			.gbif_cx = a640_gbif,
>  			.gmu_chipid = 0x70f0000,
>  			.gmu_cgc_mode = 0x00020222,
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 0200a7e71cdf..422ce4c97f70 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -849,9 +849,16 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  		  min_acc_len_64b << 3 |
>  		  hbb_lo << 1 | ubwc_mode);
>  
> -	if (adreno_is_a7xx(adreno_gpu))
> -		gpu_write(gpu, REG_A7XX_GRAS_NC_MODE_CNTL,
> -			  FIELD_PREP(GENMASK(8, 5), hbb_lo));
> +	if (adreno_is_a7xx(adreno_gpu)) {
> +		for (u32 pipe_id = A7XX_PIPE_BR; pipe_id <= A7XX_PIPE_BV; pipe_id++) {
> +			gpu_write(gpu, REG_A7XX_CP_APERTURE_CNTL_HOST,
> +				  A7XX_CP_APERTURE_CNTL_HOST_PIPE(pipe_id));
> +			gpu_write(gpu, REG_A7XX_GRAS_NC_MODE_CNTL,
> +				  FIELD_PREP(GENMASK(8, 5), hbb_lo));
> +		}
> +		gpu_write(gpu, REG_A7XX_CP_APERTURE_CNTL_HOST,
> +			  A7XX_CP_APERTURE_CNTL_HOST_PIPE(A7XX_PIPE_NONE));
> +	}
>  
>  	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL,
>  		  min_acc_len_64b << 23 | hbb_lo << 21);
> @@ -865,9 +872,11 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>  	const struct adreno_reglist_list *reglist;
> +	const struct adreno_reglist_pipe_list *pipe_reglist;
>  	void *ptr = a6xx_gpu->pwrup_reglist_ptr;
>  	struct cpu_gpu_lock *lock = ptr;
>  	u32 *dest = (u32 *)&lock->regs[0];
> +	u32 pipe_reglist_count = 0;
>  	int i;
>  
>  	lock->gpu_req = lock->cpu_req = lock->turn = 0;
> @@ -907,7 +916,24 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
>  	 * (<aperture, shifted 12 bits> <address> <data>), and the length is
>  	 * stored as number for triplets in dynamic_list_len.
>  	 */
> -	lock->dynamic_list_len = 0;
> +	pipe_reglist = adreno_gpu->info->a6xx->pipe_reglist;
> +	if (pipe_reglist) {
> +		for (u32 pipe_id = A7XX_PIPE_BR; pipe_id <= A7XX_PIPE_BV; pipe_id++) {

This patch is probably not rebased on msm-next. On msm-next tip, we have
removed A7XX prefix for pipe enums.

> +			gpu_write(gpu, REG_A7XX_CP_APERTURE_CNTL_HOST,
> +				  A7XX_CP_APERTURE_CNTL_HOST_PIPE(pipe_id));
> +			for (i = 0; i < pipe_reglist->count; i++) {
> +				if ((pipe_reglist->regs[i].pipe & BIT(pipe_id)) == 0)
> +					continue;
> +				*dest++ = A7XX_CP_APERTURE_CNTL_HOST_PIPE(pipe_id);
> +				*dest++ = pipe_reglist->regs[i].offset;
> +				*dest++ = gpu_read(gpu, pipe_reglist->regs[i].offset);
> +				pipe_reglist_count++;
> +			}
> +		}
> +		gpu_write(gpu, REG_A7XX_CP_APERTURE_CNTL_HOST,
> +			  A7XX_CP_APERTURE_CNTL_HOST_PIPE(A7XX_PIPE_NONE));
> +	}
> +	lock->dynamic_list_len = pipe_reglist_count;
>  }
>  
>  static int a7xx_preempt_start(struct msm_gpu *gpu)
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index 6820216ec5fc..0a1d6acbc638 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -46,6 +46,7 @@ struct a6xx_info {
>  	const struct adreno_protect *protect;
>  	const struct adreno_reglist_list *pwrup_reglist;
>  	const struct adreno_reglist_list *ifpc_reglist;
> +	const struct adreno_reglist_pipe_list *pipe_reglist;

nit: Maybe dyn_pwrup_reglist is a better name.

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil


>  	const struct adreno_reglist *gbif_cx;
>  	const struct adreno_reglist_pipe *nonctxt_reglist;
>  	u32 max_slices;
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 0f8d3de97636..1d0145f8b3ec 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -188,6 +188,19 @@ static const struct adreno_reglist_list name = {		\
>  	.count = ARRAY_SIZE(name ## _regs),		\
>  };
>  
> +struct adreno_reglist_pipe_list {
> +	/** @reg: List of register **/
> +	const struct adreno_reglist_pipe *regs;
> +	/** @count: Number of registers in the list **/
> +	u32 count;
> +};
> +
> +#define DECLARE_ADRENO_REGLIST_PIPE_LIST(name)	\
> +static const struct adreno_reglist_pipe_list name = {		\
> +	.regs = name ## _regs,				\
> +	.count = ARRAY_SIZE(name ## _regs),		\
> +};
> +
>  struct adreno_gpu {
>  	struct msm_gpu base;
>  	const struct adreno_info *info;
> 
> ---
> base-commit: 7bc29d5fb6faff2f547323c9ee8d3a0790cd2530
> change-id: 20251126-gras_nc_mode_fix-7224ee506a39
> 
> Best regards,
