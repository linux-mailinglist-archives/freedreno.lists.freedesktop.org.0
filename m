Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23507B1EDC6
	for <lists+freedreno@lfdr.de>; Fri,  8 Aug 2025 19:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABDBE10E1EB;
	Fri,  8 Aug 2025 17:22:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SENV1KcE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3698B10E03A
 for <freedreno@lists.freedesktop.org>; Fri,  8 Aug 2025 17:22:28 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578GLPWO025073
 for <freedreno@lists.freedesktop.org>; Fri, 8 Aug 2025 17:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jyBcXhZj2R8UGlkk97Lt6qighcQ9HpYxu7rqj/QliiY=; b=SENV1KcELHeGZRqf
 IjVMPy8ZWUeiLQ9+XVXT2Zp/RN2dvaXHHww0ldnOYODlJn+b1e4NdpvZ8Ey2bKZB
 2Lpvvn7SkQs1xRzHkfMY8AujzQ256aLJEb/fu09g77Xg/7znQPZw3y7Roa2v166I
 kVdyoDW6bRGVl1mRIV5tYIXvGqG/InfGDP3sKL9AXYFjpMHnM2B2f4m4ctKPJiDm
 mMySRYZvJoslz8SBkVrZ0U9fQ6HpgiPBI7/0OWBmts9g1wVsxCJoebg9WVMrXbBn
 4iODIWDyfbeLZaNPu9OuzRbzcUPr8BRHFzFy62/v2/TpvLSFvMdsf0nn9MOa1V1A
 VmuGhg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw1jm8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 08 Aug 2025 17:22:26 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-76bb326ad0bso2592079b3a.0
 for <freedreno@lists.freedesktop.org>; Fri, 08 Aug 2025 10:22:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754673746; x=1755278546;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jyBcXhZj2R8UGlkk97Lt6qighcQ9HpYxu7rqj/QliiY=;
 b=ExibA2kn9yEougVvMB8OyG4VNGbb8qt/OAcpJtJv7mqF6jYI9xk3c0QkLNhZid+eE/
 TPwU3dh/mA6FaZ8gcFKlvkgjuretfn5dyJ0l+410aeUW4a4JS2hi0ZbuezuGSJZWn+lG
 9O/jFTpRw2WOzJM8UPYaMOuce+4Asf+6zdhZKnoVXlHg4KIs3DsC0lyaXYZqvGDGu4+S
 pHIt08J4lf5Xdi0tdPM1vQ31EpyN+CVZqAYzcsT6Pv2DkxNoT5zsl1/pC3KMuzr14w1V
 +3R5X2ho1a6hTXdXFChqvIC2z8w2hODji2Gx5btlcWrrnc2PTu7gvYYwzEymdcpoey/C
 niPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+lMrsO18V54/ykSDfvwl1CuY2ZgPPcTYoU9JghMb/SCGF4FiPH37NpajlySwmq1j0Gnja713nZaI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5bGEwU8mxSAodxZsAPScmfkHrSC/brIq4GweM1Fuq5yxfyQ4a
 dzHguLUOFM+NSJXF5npixrNLoJxnecyH8ns5/MRl3wzU1jhK33g/Qq2SuReKowRnGDor5Zwk4xR
 91FiJSe+AFBWX2dDiPYbh6w/QNirkLdWRFUrl5GN36D30+pwmwlzi6zyPlrZS9LfMUrjmIS4=
X-Gm-Gg: ASbGnctmr51w0VMEN5hQEMzJ35H0FLZ5jhow7v3esTeMV4Dcxy0A+viQQn55qzcXtum
 bB70cS74WXKxfe2b6O6K0TKwT3SxyfixH9e3m+gACBGcs9t67f8fkG5oFeWLoLHf8lYgRUkiY8i
 v1mErlxbusv8uXI+kvP/ufWjLJALozg7rJJrh5qmZ/VFwFNraEkMkJGlhOELt9LJiGaliFLW+oH
 CZD0q+S5qZPl3qOKmwuyOWHUqNVa48ihvKoKImNe/KuDajghekm3N8+9+TyupCGu3T/IZGxFI87
 cU6OMB4E6zF6NP89uBohvDJ0y5hqu9sj76CWkqyzeA/x269S1SIbFOz193J25Jyy
X-Received: by 2002:a05:6a20:7d9f:b0:240:1132:6f0 with SMTP id
 adf61e73a8af0-240551eeac0mr6475859637.43.1754673745691; 
 Fri, 08 Aug 2025 10:22:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFi0ezLAvd5RkULpFWK7WLTaadsd+/Ps2gsqlHJKq3156s96y5T3Pq4HOvg12o43Wrff+vHAA==
X-Received: by 2002:a05:6a20:7d9f:b0:240:1132:6f0 with SMTP id
 adf61e73a8af0-240551eeac0mr6475822637.43.1754673745264; 
 Fri, 08 Aug 2025 10:22:25 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.234.151])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b422bac0d14sm18058211a12.41.2025.08.08.10.22.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 10:22:24 -0700 (PDT)
Message-ID: <ba1d97d0-3420-4cca-8823-4d27cbe7bae6@oss.qualcomm.com>
Date: Fri, 8 Aug 2025 22:52:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/17] drm/msm/a6xx: Fix PDC sleep sequence
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-5-9347aa5bcbd6@oss.qualcomm.com>
 <937197e9-09dd-4f3c-bdb4-4001f5217c07@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <937197e9-09dd-4f3c-bdb4-4001f5217c07@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX28pfg9fqr9aY
 cKY4Nm/6k2DfUQb4xJVMt3MVGxH3HMmCfT0CoiAt/7AmtFyXM+nZELbn9STGmARVKKokSXFFKfC
 WmJMD1SJtx7ttgR7NL/lisgVzYwjk5pvuZ8ywATBak2tbh6R9dVCfdS1JF5rSR3nMEAcv5CfxD3
 zqCAyynOHq00C+hlG1VwRbwGmqnwg0hUZHmTfG8wuUnnLJf3WUzAPVgOTwUTypyTYh8CLgABuv+
 xqMNOE2ym7l9dh2WC6vkVqmax8pNcGCIcVYWgFlQ2lD6783MefqnP7w6+z3sMPdoUFV1VJHGQUG
 1d5xTVV1/K5Flt8eQVc6qFYXM4KRHYiyyOlUMej4gPwmt/KkirvrZIGSSW6b/8DczLiKQsjWMVt
 UWwya/EQ
X-Authority-Analysis: v=2.4 cv=Ha4UTjE8 c=1 sm=1 tr=0 ts=68963253 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=YZlS21pjlsXJIaRBoB+Oqw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=g_v6zqOf2VaQD3ULXM8A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: PU45fPKwOn25FC3apZuPHN95c3wfct_W
X-Proofpoint-GUID: PU45fPKwOn25FC3apZuPHN95c3wfct_W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
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

On 8/7/2025 7:21 PM, Konrad Dybcio wrote:
> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
>> Since the PDC resides out of the GPU subsystem and cannot be reset in
>> case it enters bad state, utmost care must be taken to trigger the PDC
>> wake/sleep routines in the correct order.
>>
>> The PDC wake sequence can be exercised only after a PDC sleep sequence.
>> Additionally, GMU firmware should initialize a few registers before the
>> KMD can trigger a PDC sleep sequence. So PDC sleep can't be done if the
>> GMU firmware has not initialized. Track these dependencies using a new
>> status variable and trigger PDC sleep/wake sequences appropriately.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> FWIW some time ago I made this patch, which tackles a similar issue,
> perhaps it's a good idea to merge both:
> 
> From 7d6441fc6ec5ee7fe723e1ad86d11fdd17bee922 Mon Sep 17 00:00:00 2001
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Date: Thu, 20 Feb 2025 10:28:51 +0100
> Subject: [PATCH] drm/msm/adreno: Delay the Adreno RPMh startup to HFI init
> 
> There's no use in trying to power up the GX logic before we're almost
> ready to fire up the GPU. In fact, with A8xx the PDC and RSC uCode are
> loaded by the GMU firmware, so we *must* wait for the GMU to fully
> initialize before trying to do so.
> 

iirc, this wake up sequence should be done before fw start. That aligns
with downstream sequence order too.

-Akhil

> Move it to right before HFI init.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 12 ++----------
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c |  2 +-
>  3 files changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 28e6705c6da6..3335583ada45 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -513,7 +513,7 @@ static int a6xx_gmu_notify_slumber(struct a6xx_gmu *gmu)
>  	return ret;
>  }
>  
> -static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
> +int a6xx_rpmh_start(struct a6xx_gmu *gmu)
>  {
>  	int ret;
>  	u32 val;
> @@ -842,19 +842,11 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
>  	else
>  		gmu_write(gmu, REG_A6XX_GMU_GENERAL_7, 1);
>  
> -	if (state == GMU_WARM_BOOT) {
> -		ret = a6xx_rpmh_start(gmu);
> -		if (ret)
> -			return ret;
> -	} else {
> +	if (state == GMU_COLD_BOOT) {
>  		if (WARN(!adreno_gpu->fw[ADRENO_FW_GMU],
>  			"GMU firmware is not loaded\n"))
>  			return -ENOENT;
>  
> -		ret = a6xx_rpmh_start(gmu);
> -		if (ret)
> -			return ret;
> -
>  		ret = a6xx_gmu_fw_load(gmu);
>  		if (ret)
>  			return ret;
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index d1ce11131ba6..309305298a45 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -216,5 +216,6 @@ bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu);
>  bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu);
>  void a6xx_sptprac_disable(struct a6xx_gmu *gmu);
>  int a6xx_sptprac_enable(struct a6xx_gmu *gmu);
> +int a6xx_rpmh_start(struct a6xx_gmu *gmu);
>  
>  #endif
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index 8e69b1e84657..9ea01daf2995 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -910,7 +910,7 @@ int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state)
>  	if (ret)
>  		return ret;
>  
> -	return 0;
> +	return a6xx_rpmh_start(gmu);
>  }
>  
>  void a6xx_hfi_stop(struct a6xx_gmu *gmu)

