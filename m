Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE95B29A95
	for <lists+freedreno@lfdr.de>; Mon, 18 Aug 2025 09:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AB510E3D5;
	Mon, 18 Aug 2025 07:13:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="glmIizsz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 144A210E3D4
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 07:13:46 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HLUQfb005494
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 07:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eO7wadraGhre+LJhTfVeJor488W/8ImtdDnMyxSeuN8=; b=glmIizszRqn3/+U+
 AQB6xcC8EP+OqOJ7w+DsAbFyuSIbb5/21T7AShl/+fevJU6Z2rOWZxz2SpccdLe5
 oqcdd4L5ua0fZZqDr7GPdOPWpph+zDF49+S/Q5OkOoGkMV/iMgfVkenf0vRapAKc
 yVuMIthwebhXF9OBg40/SrJiLng9n5MuhPrePLkKBcqkJ4hWYf444lReEOkEfWkR
 pSf1OBbqx6o6CNGgY5/g2+9MXxhGMDOzILaBIBF3Ad4mEOcdoxgo6xtxcQ3NIEFp
 wM01PcoiibPISy38rnrAxcaJUotGB/eqHBfo8679ErvBGg2efl6+HkpoeJ2OpUYR
 1OUPKQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jgxtbumt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 07:13:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-24458264c5aso38202785ad.3
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 00:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755501224; x=1756106024;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eO7wadraGhre+LJhTfVeJor488W/8ImtdDnMyxSeuN8=;
 b=I3rFzycLqhOVMxlOTCqbguycMbJzyEiPjaFEcC3nGW9GwZBU84E9RS+J4rjidBguat
 LWtav/+cXMD0su16QpyTf1WvB4puFVhtI5dk5mfkIn8fdnUQtoLiJWjdtRbicThFG4sZ
 SdfXimbISh19ep7+fkSTTUiBjgCvBr2SA/B3d+KYuWxcoBcUSNFQEszTbEpOrrpHWn82
 5WOdhZflXqQsRthqePKIoouSVD0AK0UDa75MhdZVwKIB+4pfBCsKJiBhz0zymR6fjeFY
 XDt9+mYrukwVzpI6BUFh9UOFY1FCMo6fmRYQhhlVZixMwtZwRWt75HoejK7iCElGfAle
 cMkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLN0aX6Pq4X8+YNbP+03NGQOSDDZ9wbwRmvW7Ncid/MdlWwVEWPCRsaxovr8L9A6RQvg8GJTDZ+pM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4qcPzEYXuoyGipdzwLyz5ICSeciYvkQPNCQyioytNsxFBqlPJ
 l4ug84gMkEJeIDRWmOd8UcEbjNohqSvpmBKkqW8phlUiUaKA1s2Q2we1S+EdijQLBo0eoy3CdHs
 p+GzLdyyPdiGKGsEI7aJeSABL1jU/gLHslJzI8IseTup30ZuAs5K4Ax+wo3nccsxU0tE6Q+dDUG
 NdZ4c=
X-Gm-Gg: ASbGncsyjC7sdbJvF4T97orG4ZKZJkTkbFTNjeroc2aAPRk4x9metxbvH4/76lKN76m
 pIF9g5IfzxeGs9nqFJN4EAGlLn9PKZxvnUTFrSy50sAaTWNDLM3VO5VVTTuf5E8yOt8ic6rEN7o
 /HIfDNse5WIMAVP8CVbV+WT2x6C+71AvoTkaAO8MxNgoxHwupnfGo+hrUesYffPRr5tYGU+Vh+S
 3Z+acAeC8jdPoS5HSssSt0o80n7XcpN9F9QpcdtKhn/EM3DxaGckeTZowOEXakMLOWN3Blec9w8
 WEjgdFPkLzZ8xEUj97xNxt7YVMxEVFD3+dUav98J/JKlz6IpD5cfPuI16C44h7on
X-Received: by 2002:a17:903:2d0:b0:226:38ff:1d6a with SMTP id
 d9443c01a7336-2446d6e4c8fmr162951755ad.7.1755501224254; 
 Mon, 18 Aug 2025 00:13:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKK/VsGw2K363BINLgo4z0OW/kcKqNy2Al0tPXrsMMCPgwF+XIrPg9LBdfU+0MmAtu3XKsaA==
X-Received: by 2002:a17:903:2d0:b0:226:38ff:1d6a with SMTP id
 d9443c01a7336-2446d6e4c8fmr162951415ad.7.1755501223816; 
 Mon, 18 Aug 2025 00:13:43 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.229.157])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446ca9d043sm71010145ad.12.2025.08.18.00.13.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 00:13:43 -0700 (PDT)
Message-ID: <026b1a09-c8db-4a5d-af43-3be4fe24a824@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 12:43:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: U7chrXVZxmh6Bj-RWa7nXPHMj_0t71DN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX/4dWgC0AuTTW
 rYSRYIuejbvczDESMLZIEJ9ig/YCELCxsHQNgBVPHTSVJ7KG4MFjLDvHEHgd+fgPsAlXPJd6njQ
 Aqu44JRdMuzh1owH3QA37c0snoZujSjlN2Hr4n7YxdNg7+nkKaZpsNNTrM9lT4KNTx5RSkeNHCA
 vhoeHd6u6KaU56feTDcjnTa6lUoX+jk+7E4kfXFi2sQqBLjplYWcq02V3AENs9PVUJzPw5Q9IGz
 Ysk8gOG6EF8gJ0i7cL7ZAeB4CxBipxN88TSr9PVU6ZrCaT8EAX748fr7KsL5/NORuvADdTTpnnP
 WQJfDn9mTjhdE8JhkXs8nsPDsEt5UVhd4BxSa2MAV6SDUaWtw+tKIg7ywf/sVNzcZ/R7zMOxe7E
 76bQ5P/p
X-Proofpoint-GUID: U7chrXVZxmh6Bj-RWa7nXPHMj_0t71DN
X-Authority-Analysis: v=2.4 cv=V7B90fni c=1 sm=1 tr=0 ts=68a2d2a9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=9Q8gPALlkHEzzDxkdHlyxw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=1B6o04Z4kyHWbw-D5gsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160020
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

On 7/25/2025 2:05 PM, Neil Armstrong wrote:
> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
> the Frequency and Power Domain level, but by default we leave the
> OPP core scale the interconnect ddr path.
> 
> Declare the Bus Control Modules (BCMs) and the corresponding parameters
> in the GPU info struct to allow the GMU to vote for the bandwidth.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
> Changes in v2:
> - Used proper ACV perfmode bit/freq
> - Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>  			.pwrup_reglist = &a7xx_pwrup_reglist,
>  			.gmu_chipid = 0x7050001,
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
>  		},
>  		.preempt_record_size = 4192 * SZ_1K,
>  		.speedbins = ADRENO_SPEEDBINS(
> 
> ---
> base-commit: 97987520025658f30bb787a99ffbd9bbff9ffc9d
> change-id: 20250721-topic-x1e80100-gpu-bwvote-9fc4690fe5e3
> 
> Best regards,

