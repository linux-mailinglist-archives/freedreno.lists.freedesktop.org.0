Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0351CB0DBAE
	for <lists+freedreno@lfdr.de>; Tue, 22 Jul 2025 15:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C210D10E687;
	Tue, 22 Jul 2025 13:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Onz7x3Pe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE3A10E687
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 13:52:16 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7P0Xt013299
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 13:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Kw9ZzSYekP4jnMMDcD6u6zPA
 55Dkfs0wyd2ey7LJ+D8=; b=Onz7x3Pedf5elMf/z6wd1xlgRL/J1CJ9BxfEi9Do
 FS3EDeFEgiu2i06HRNNfzJNeNjNkeTCk+AEUm1vmMa3ci/IoMf/1IGmQ90qcARy0
 SWrh9BhIo7i0+otRHvLZhsxk3ti/7DL+PvQEhfqRMrOaEw/HSPcPgoy7P3BE2od5
 2r6PRKjy2/M0/ch9+iavqkIqieKBSQ70McWiirrNSA0Zy5W5LRhOplyIOTjaoL0N
 bzrnmCCezGcoL6XsVegZqsklNiFAvlC0l1aRgjfhXNh8zn4m38l+hm+dBDf3qT6R
 oph5hjbnFFznkQSfOzoxuwP0BJMJGOaM7NDwiyJq+ZMPRg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3eme6y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 13:52:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e350826d99so835236985a.2
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 06:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753192335; x=1753797135;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kw9ZzSYekP4jnMMDcD6u6zPA55Dkfs0wyd2ey7LJ+D8=;
 b=iejRka6aa8pYSSP3Ydgr1ON0iYGupDGEk7CQpEoWzaWbhDhAxfBpAmx0rYPlAJn72W
 OMQTDsqDqV800m+n6dGjMc0l4z8eqzHXNJ3o2YAaB7bulofN0b4EetMYrE3uVjNlFNw9
 Zg6t5oeGiaVu0R63SOgOgre2QZ7+6muaQyrNRbhPOM9Ltq6lL2f41gpGmJeaf508+tPV
 LwItqXo2JDQ9wqStjc0E0NdoIaUaultpsvo6Goz17EqWXBkF9mTHMoag+D8o57/41ZFL
 PKcBafEm6Pk4EcFZPBK3e0TSXqriu8/kdwmMJX++ZvJSVtYoEUFEGuVyb3EhQFj6BBfQ
 hgZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUI99tUBHsbr/IFAQ2i7rtJ4JXq7RvvRrxbXgZEmYGkrD8OLWaIvyQxaIe1ogsCOsJAKMesyVXa2A8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVi/7BdFONjM0Y3/mZsT+FJyEFwfTfUuxsS925FbbqokfnOUJH
 xBZv59KZI3XXtYjW11OZm9CV8QR0JnR9cIA1JRQf9KrE2Y0G6X9mqj/Gg2e9oP1m+785cZXuNem
 +Uas5N34LVDpLkTqVmAfGkWKfOwVMgbRUGHyVlEhICzLaO+H1FrTMIpatFaRdn0UHD17l5fE=
X-Gm-Gg: ASbGncuvMC6vZqGu1vJfWuVY0j9nhl2IaEqR/D+SXChOu6WKWE/sasvDb0IS1+CBIaF
 vBYTmnDDo1CNsDtqfclTABG2lgwQjVCRXNFQXo2pVrO3o5Gifd/PtlCcBbzf/2SA+mu7OWy2EAr
 SsJyqiW5idHYSrlf+yf3Se+RRqDww5of91RT8XOJxaW0Fjr8g9emxtUJKrt3rJ0usCVEfuNHrmx
 0R7YtFg2kAiM+6QzAezYPSTAxNK8jd7zPCVDyty1msgd5Swio+WgxkuAd+6VQMX7K0O3oEu1Jq9
 8K6z3JphSiKPer24ZMAHzJBRXpiONBiAHKb1aPHEWYEgbqxRq/oExo1HBu+eAGegfuoX0upsfS7
 GHKUDRQYqgfu8Dw3bTprTBUCY2ZbK3RkRQ/ZovIq/SE9PSdqjknMf
X-Received: by 2002:a05:620a:4088:b0:7e1:872a:50fc with SMTP id
 af79cd13be357-7e34356cb7bmr3600634585a.15.1753192334845; 
 Tue, 22 Jul 2025 06:52:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZcOEKfXjfbMZ69Gm3WsZ5DAtXxY4VO7zJgh6a1vFVgcI9uk4+0wZ083YoYs+e4/Wgr2kP+A==
X-Received: by 2002:a05:620a:4088:b0:7e1:872a:50fc with SMTP id
 af79cd13be357-7e34356cb7bmr3600630485a.15.1753192334345; 
 Tue, 22 Jul 2025 06:52:14 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-330a91f1f4bsm17890721fa.105.2025.07.22.06.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 06:52:13 -0700 (PDT)
Date: Tue, 22 Jul 2025 16:52:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/17] drm/msm/a6xx: Fix hangcheck for IFPC
Message-ID: <i4o3ivearks7gwg37ywyqyl4jpmbwnuczac6h7dscrmlepawag@jhedlyj2hzps>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-13-9347aa5bcbd6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720-ifpc-support-v1-13-9347aa5bcbd6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: I1KOULjhjOpmW4bu4IPYkq90OhylK7Zj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDExMyBTYWx0ZWRfX3KSyYsiQpK/o
 g5rCU+l/XyX0Mxkrjt3TN4fxbIgeLJdBUai42CGIQSvxNnPDWAQzRRnaCFxctuQVMB+EoXXZS3r
 GSm4v/byiYJswb5SUlAK6X6ikvU6RjCMdCH3IWVZvtBtORpe7cPeKG8DmdFOko85WZQ2U8FDQmA
 ZHSdj2YzQ+0VMPK89UUn86V4/k/4hdXREoWUneUC+NwshGuJcVqJWm/VHTESw7T9A8bH5/3NZ6X
 fNRvqdXGgGaY5wmN4VShgqlr1+/ANQ3yyapLzEI60AsjcPhzcfNai049PvJL8gh8MlcYUui+Ryj
 6eIdCrtUgtyScV+/vebqbnjPaoWVNPnzqt8Jtki4OWNctTEMp+a65I6xMEFqVnKaOSU+gwuX/P0
 jeek+XzQx3AVev7215ONCbLplVINfu3hW8hrFdtfpKST6aj9augAO76xt/UVFXhfvVZEP6XM
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=687f9790 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=eWe-OnA97Zcb8zRWG70A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: I1KOULjhjOpmW4bu4IPYkq90OhylK7Zj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=910 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220113
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

On Sun, Jul 20, 2025 at 05:46:14PM +0530, Akhil P Oommen wrote:
> From the hangcheck handler, KMD checks a few registers in GX
> domain to see if the GPU made any progress. But it cannot access
> those registers when IFPC is enabled. Since HW based hang detection
> is pretty decent, lets rely on it instead of these registers when
> IFPC is enabled.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index e331cbdb117df6cfa8ae0e4c44a5aa91ba93f8eb..b3becb230a94163cccff4eaffb8eed44f1c29ad0 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2399,13 +2399,23 @@ static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>  
>  static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>  {
> -	struct msm_cp_state cp_state = {
> +	struct msm_cp_state cp_state;
> +	bool progress;
> +
> +	/*
> +	 * With IFPC, KMD doesn't know whether GX power domain is collapsed or not. So, we can't
> +	 * blindly read the below registers in GX domain. Lets trust the hang detection in HW and
> +	 * lie to the caller that there was progress.

I know that we've relaxed code line width to 100 chars. Would it be
possible to reformat the comment to 72-75 chars?

> +	 */
> +	if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
> +		return true;
> +
> +	cp_state = (struct msm_cp_state) {
>  		.ib1_base = gpu_read64(gpu, REG_A6XX_CP_IB1_BASE),
>  		.ib2_base = gpu_read64(gpu, REG_A6XX_CP_IB2_BASE),
>  		.ib1_rem  = gpu_read(gpu, REG_A6XX_CP_IB1_REM_SIZE),
>  		.ib2_rem  = gpu_read(gpu, REG_A6XX_CP_IB2_REM_SIZE),
>  	};
> -	bool progress;
>  
>  	/*
>  	 * Adjust the remaining data to account for what has already been
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry
