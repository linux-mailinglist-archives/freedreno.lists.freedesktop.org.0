Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B06B0DB66
	for <lists+freedreno@lfdr.de>; Tue, 22 Jul 2025 15:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DDE10E694;
	Tue, 22 Jul 2025 13:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="a9Xcietf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A3D10E684
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 13:49:06 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7LTfU013263
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 13:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/ahKHSJjWMR0JbnnzzPNZ/NL
 nOfa1sJ/Sol3h9sN5wM=; b=a9Xcietf16qBoxAuyJPAfrjcHNDQDra2LGSMqgef
 bGQqhe9k+vrs9KdM6Yz9Rlx5LRe62h9iR+WTXcEyGlwQE3L19/FF8v3Zd28/oKFX
 X20sDuBg34LYSnTmcE3qrZeHOcqZzgnU7LAtM03g4+FAT6214FIleIlSBjg5/t81
 vpPpE++N8NPg3opoxyxqoHvYlxejg0osrFFze3b81XSFqomtO+Ab9mkpfYpmoAmF
 nFiNd9EBZwnh3adnWTN8QuaHxbuXYXbOOEMaTHMVzb5rE5o64TWaa9I1XpvdWYui
 PjQ5neNSOD8rVAdvHjTnfCz67jkT5E/yWuaMhpw5iRri+Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3emdw5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 13:49:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7e03ac1bf79so448950585a.3
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 06:49:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753192144; x=1753796944;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ahKHSJjWMR0JbnnzzPNZ/NLnOfa1sJ/Sol3h9sN5wM=;
 b=haDnC+fhyXPdVLUmnQzjSt3EMU1lXeknn+zkQU0s5FO3aif8SWnKW+aNp7YNk7gwfD
 4SPGHxHdIZMsKmAenzgYmjgDvqfWq6L4lqeu+4ABOYF/6r16x7AriuZajUuAzkUL2eG0
 /S8bV2Yq4Z6VqEApKIeZf1Wkqi5r3xkt6ythflO4Mv/wQvEi9tinUXwk514p1FswOCHi
 8JHYkB3wH+IiTxDvFFfgJl3w80sI24LW3l3r4sf0jS/3+WOpDA6siBHAJBRjS/TEx9Qb
 Lsh8KLF/j9c94c1obv0B9sQwopq9ATEmSG+960Os7pdmKPbNjwYS3125yVCaO4+NlLV8
 w0IA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCLyqF9hjfjlC/IYrGtbzod0zsHb91RGC7BypIrFuvvLe6AY3jz5juaF2P5e9Qk0VPwRMGuhZt/VE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+eezmLJNOWCybsPstcrSEaIRsjLqEqPgzeAWkvqLRM0e4QIje
 fT91Y8P4cRoi9vT4doAFMuAgJUsgdCJCU0nOUC0J7Ib0kHgftY07p46hlrYKl20nZw9E0fSz9HA
 c9eXc+vlooVLntq512qsTmv9ujHtWhL9YNkK+U/rvo6rN3LvDmY0YpkVu7G4FxJ7vhSS7JnI=
X-Gm-Gg: ASbGncsYcoBSMByKnv+wavRS67xF459Tkt5iUskECGEdcp87x8VRXABhu7egdKUBKOU
 7oQPjJUhT+KEIp383cf8Vnj9M9RGpEDpYZKdkb23kaPsAExXOm+26lP171Fk9wuuxIKTZKKpeTQ
 PWChcKgwdgk/cBVT0plv0ftc05qbVzh9iO/ltaPKYVQY3RnpAA+GFj1cgX+0VpNJMbj6xgHb/7M
 wIV6MuNFIWYzxx3S7XA5sk12m9R2OUobWGclnPZEyjEX2g4PCozKP1S4JmBE8mbNmemtC32dc0a
 Foq2/1DjP5Ix1nGUC6FuIXGF8ME2Rqna2KUkMl+VGI9/yemokTmxhXjqqL93DGEfHRz10qSR7Lt
 r7BRj9IRSTg5D9WBfmrjGXHdzeDWC+drlCPcu/cGAyZwviad/Xjpb
X-Received: by 2002:a05:620a:178d:b0:7d3:8f51:e80c with SMTP id
 af79cd13be357-7e343571240mr3158198685a.22.1753192143563; 
 Tue, 22 Jul 2025 06:49:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmmaQ1krTHbmcZorYzIOGhW5X5c+FKz8RqQxyMYTrcBqK8TnKqrJzlUyB3wkUh2DI0SekV8Q==
X-Received: by 2002:a05:620a:178d:b0:7d3:8f51:e80c with SMTP id
 af79cd13be357-7e343571240mr3158192785a.22.1753192142813; 
 Tue, 22 Jul 2025 06:49:02 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31d91134sm1959164e87.145.2025.07.22.06.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 06:49:02 -0700 (PDT)
Date: Tue, 22 Jul 2025 16:49:00 +0300
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
Subject: Re: [PATCH 11/17] drm/msm: Add support for IFPC
Message-ID: <k653qq6a4xkvwadeum5kbr7cheje773vobehpzq33ec44vyxjj@vi3ekv4jwext>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-11-9347aa5bcbd6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720-ifpc-support-v1-11-9347aa5bcbd6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ISnqieRunIt7EmMe7oMDksP8eyg5br1h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDExMyBTYWx0ZWRfX2P3wZFJB/twx
 J7R035wWZRJHGA1FlljL02+bml4rcJVH11krR+ngJtmGAeXf6QA2D5OEMs7GimEG7eE3LckVB4q
 IpB11O3kCS40NXTYci8kjfWjKvDhei7Rrh3qOcwPVvKZV/Sf4EH6siVDjuJZRbx1YDtkwV/XBrT
 Z5ZKXmCr8DPpvc2WO5AOk7z1LijWR05SnStIbcSOj9rUTM/fsRtFRIKu4QQtfEwdrcznApd0k3Q
 3vbdeBp6vABgJGNZI+rfAjfMr2xgS7Z9jyNlSxXJy/i7jUNNicei1G3EeFKCPziCcIa0JiX456V
 MleTUTM+whqn8lE7aiImmAvgrl8K13hfgIg6abZf3ET+NlHy7k0Euknv/UB09Eh/CbuclZEu5MK
 oyuiETZIoa1TtLSOKd1ApIaE5PXwQPQi58PLnvFPmn7a12Tla+yFeVIsCn0raEj/zyYHqh3a
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=687f96d1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=i_i2Vd3NPHTucyE0f70A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: ISnqieRunIt7EmMe7oMDksP8eyg5br1h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
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

On Sun, Jul 20, 2025 at 05:46:12PM +0530, Akhil P Oommen wrote:
> Add a new quirk to denote IFPC (Inter-Frame Power Collapse) support
> for a gpu. Based on this flag send the feature ctrl hfi message to
> GMU to enable IFPC support.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c   |  5 +++--
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c   | 33 +++++++++++++++++++++++++++------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
>  3 files changed, 31 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 4d6c70735e0892ed87d6a68d64f24bda844e5e16..3bbcc78179c1cf1bfa21ff097e9350eb2f554011 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1961,8 +1961,9 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  	if (ret)
>  		return ret;
>  
> -	/* Fow now, don't do anything fancy until we get our feet under us */
> -	gmu->idle_level = GMU_IDLE_STATE_ACTIVE;
> +	/* Set GMU idle level */
> +	gmu->idle_level = (adreno_gpu->info->quirks & ADRENO_QUIRK_IFPC) ?
> +		GMU_IDLE_STATE_IFPC : GMU_IDLE_STATE_ACTIVE;
>  
>  	pm_runtime_enable(gmu->dev);
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index 8e69b1e8465711837151725c8f70e7b4b16a368e..20ade6b0558b016b581078f5cf7377e7e7c57f8e 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -21,6 +21,7 @@ static const char * const a6xx_hfi_msg_id[] = {
>  	HFI_MSG_ID(HFI_H2F_MSG_PERF_TABLE),
>  	HFI_MSG_ID(HFI_H2F_MSG_TEST),
>  	HFI_MSG_ID(HFI_H2F_MSG_START),
> +	HFI_MSG_ID(HFI_H2F_FEATURE_CTRL),
>  	HFI_MSG_ID(HFI_H2F_MSG_CORE_FW_START),
>  	HFI_MSG_ID(HFI_H2F_MSG_GX_BW_PERF_VOTE),
>  	HFI_MSG_ID(HFI_H2F_MSG_PREPARE_SLUMBER),
> @@ -765,23 +766,39 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>  		NULL, 0);
>  }
>  
> +static int a6xx_hfi_feature_ctrl_msg(struct a6xx_gmu *gmu, u32 feature, u32 enable, u32 data)
> +{
> +	struct a6xx_hfi_msg_feature_ctrl msg = {
> +		.feature = feature,
> +		.enable = enable,
> +		.data = data,
> +	};
> +
> +	return a6xx_hfi_send_msg(gmu, HFI_H2F_FEATURE_CTRL, &msg, sizeof(msg), NULL, 0);
> +}
> +
> +#define HFI_FEATURE_IFPC 9

Can we please have an enum or at least a set of defines rather than
havign them scattered through the code?

> +
> +static int a6xx_hfi_enable_ifpc(struct a6xx_gmu *gmu)
> +{
> +	if (gmu->idle_level != GMU_IDLE_STATE_IFPC)
> +		return 0;
> +
> +	return a6xx_hfi_feature_ctrl_msg(gmu, HFI_FEATURE_IFPC, 1, 0x1680);

magic number?

> +}
> +
>  #define HFI_FEATURE_ACD 12
>  
>  static int a6xx_hfi_enable_acd(struct a6xx_gmu *gmu)
>  {
>  	struct a6xx_hfi_acd_table *acd_table = &gmu->acd_table;
> -	struct a6xx_hfi_msg_feature_ctrl msg = {
> -		.feature = HFI_FEATURE_ACD,
> -		.enable = 1,
> -		.data = 0,
> -	};
>  	int ret;
>  
>  	if (!acd_table->enable_by_level)
>  		return 0;
>  
>  	/* Enable ACD feature at GMU */
> -	ret = a6xx_hfi_send_msg(gmu, HFI_H2F_FEATURE_CTRL, &msg, sizeof(msg), NULL, 0);
> +	ret = a6xx_hfi_feature_ctrl_msg(gmu, HFI_FEATURE_ACD, 1, 0);
>  	if (ret) {
>  		DRM_DEV_ERROR(gmu->dev, "Unable to enable ACD (%d)\n", ret);
>  		return ret;
> @@ -898,6 +915,10 @@ int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state)
>  	if (ret)
>  		return ret;
>  
> +	ret = a6xx_hfi_enable_ifpc(gmu);
> +	if (ret)
> +		return ret;
> +
>  	ret = a6xx_hfi_send_core_fw_start(gmu);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index bc063594a359ee6b796381c5fd2c30e2aa12a26d..1135beafac464f3162a3a61938a7de0c7920455a 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -58,6 +58,7 @@ enum adreno_family {
>  #define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
>  #define ADRENO_QUIRK_PREEMPTION			BIT(5)
>  #define ADRENO_QUIRK_4GB_VA			BIT(6)
> +#define ADRENO_QUIRK_IFPC			BIT(7)
>  
>  /* Helper for formating the chip_id in the way that userspace tools like
>   * crashdec expect.
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry
