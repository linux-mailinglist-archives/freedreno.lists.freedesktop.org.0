Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4072B376BA
	for <lists+freedreno@lfdr.de>; Wed, 27 Aug 2025 03:19:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F0E10E307;
	Wed, 27 Aug 2025 01:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oZG3w+l+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4D110E307
 for <freedreno@lists.freedesktop.org>; Wed, 27 Aug 2025 01:19:15 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QFWFjE027214
 for <freedreno@lists.freedesktop.org>; Wed, 27 Aug 2025 01:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1k3UuYecDWpdFzGbi52x4OUD
 ff4svvNikwZBas3LMPs=; b=oZG3w+l+NSu0/SaU2ni/9nsV+u58jUsW8nkB0jDu
 yySDRywRUtipSQksmnb5izUBijIlCvi3MSEpUFksXTBqF363nt8qw1XQmhgZEgzZ
 qGa+iNyLhDIJiG/PWqdd8C1RMAoRjS3Pqc0cK4wan3fK39AKH4DiklnDLwkf3UiH
 4ZgEvHZQqq20+G7Jtmft1MzQP+SHaOCE2qnEF7uNaMLuzAhfmHJ51KzVA51DT9Ou
 ueQCOfI7ho08Bpvdin0f8cC1hplrWmPGciKhehsYFZooy+B3DAOIYXyXxo26GRqz
 KqqhPtMpck+OJ9vmAWwL+VfpAiwGfGyXCT1CuJpsjyvdvw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5we2pww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 27 Aug 2025 01:19:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b28434045aso242166801cf.2
 for <freedreno@lists.freedesktop.org>; Tue, 26 Aug 2025 18:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756257554; x=1756862354;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1k3UuYecDWpdFzGbi52x4OUDff4svvNikwZBas3LMPs=;
 b=ChjWV51iSohDVm2V0HD8JZkfZrb1yTuPOGVpP2EnbTkQqB1+Iqrc0jcPQTVl3ROcsJ
 Z0F/cXsWRjSiUpcctvZB8k5i8tuXueWdgDChknCo6OHVJI9miVFwmslfoAgOfsbB6jrB
 ur/LaMfSU4ZA8/8rsnuja1O2spGPAWtxXPk3hd+UjewuxlGtMJRAXYqMdJdXprAwVXup
 4v65PZtQpA8dPSGyNVMXdu4LV1iCsCNeCyn6pGvkgmAPTa0X1rcpSpRQORv+SL/bJXol
 K8UM5zu/7sx3JXncIUHJfqHltxxdn3X2mSoh9Qgsc5c9JW1Qfk2hCzGEFpHfMG0dxlyZ
 Zzrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9B64DKSis0SqQ4LzVOJ66JZxE6qeLX9jf40NEbyN6NNztmFD6qf4Zsx4vIZqmHJBh8w5tiwuVs5c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxH0y5IwkyNbcZpD9d+stu4rLCB4KZqhGR2Tl1eAGUyqsrtiqAB
 99zKJ+R7GB3PptgEcvBo8xGlVXr19lYGHQ+phMSZzEsX+PopKJcluP5GeIjhw1UZsmG4opaovA1
 8pdz+lYtc3M7jsFJIBrg1N8mwFKuK1rRoy0TSo2xK0Vh2V+KC2vfYp3g91+oQeeHDhr4eqS0=
X-Gm-Gg: ASbGncs9ZCGBg1xTtfEM/xJuarAKce3w/Mfsu2VKtsIvV+kPDMXpb/MbBZkbo1ndOP3
 iAw55fAQiZsHWPTDts6wEsxe5gt3PiAlF4VivSxlSHk8oO3vMmytKVlYGtyCECzRWFE6REHp3wL
 v6E+L5gnrsGV8m3Xq9kz0u/qNjqFhLl7G6B/DZ8p2QtLY3rM0GR5JNdv2V6Yt+TrXKvjxcHQFms
 YsJy116/x5qslSlEdytozsKt0ldrHIAKpkO9PC6czTQ9lJVepRmpNqM4WS4YiZ6VrcQSpLqKo/g
 XcScV1JHlCccnRx3AZ48k6jZZiUJzLC6maueOGXbe8v0vM33NBEsuMthSvYC/RJg4+bdL1suTv8
 FotnlS7DDGQHG1WYT3JARykMXR2ebYfp0k7g2brpPfjzUjoKhAfJt
X-Received: by 2002:ac8:584c:0:b0:4b0:7409:5f4b with SMTP id
 d75a77b69052e-4b2aab4b91bmr216337141cf.48.1756257554006; 
 Tue, 26 Aug 2025 18:19:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHN0lyqNEEWQOXtYVEHBNIyQHn6KCAdgvleKmnUOgyQL8f1kTRBsPaqfqbxGos+0dC9z5t2g==
X-Received: by 2002:ac8:584c:0:b0:4b0:7409:5f4b with SMTP id
 d75a77b69052e-4b2aab4b91bmr216336931cf.48.1756257553317; 
 Tue, 26 Aug 2025 18:19:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c8bc94sm2596556e87.84.2025.08.26.18.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:19:12 -0700 (PDT)
Date: Wed, 27 Aug 2025 04:19:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 38/38] drm/msm/dp: Add MST stream support for SA8775P
 DP controller 0 and 1
Message-ID: <fdwrpaa6cp47i2hvlccjwbzzr4vnhfispuyodollr4fn5oncwl@urt5vaowuz6x>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-38-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-38-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-GUID: vTs50t1rvf4soHa9Y1b2hxy5kxXlcKsB
X-Proofpoint-ORIG-GUID: vTs50t1rvf4soHa9Y1b2hxy5kxXlcKsB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXxFsxdy54Mi6c
 MEMqM++0s38i7XeInV0q3jq80xudYm6N4SD2rsnYiucEnNzF9Zd5XS01t5GIAFpZbdsXMVSUuUn
 inygtCe/pCy5suXkP0HiFyBFhdeS0pywXF2CXYYfCs71APC3bTzaV/PTX9Kie1lxIGk+xhAoGd+
 Jsl3rUVnq/5vgN8bwdzZnAz0W8/JYWeOId9Y4JcZsFRNXWIwfPKFiv1GyyAZh3X9A9xJwN6MYdA
 ma1ZcVMGQozMwmAffMaivVeLaiMZrbHbNPOYo5ztZmg7/E/lRv/lP2yq9KieLCoSgOIr8l3Xwqv
 RXORFd3hLc3sG/uUkH7L9JpE6BGVPGn5kS+6hRi+8ILJvMIg/2Shn2K2eRWA4nl1SZtxaMSV4Vt
 cfjAeyP6
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68ae5d13 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=y2Z3QI12yUTW78QezZYA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033
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

On Mon, Aug 25, 2025 at 10:16:24PM +0800, Yongxing Mou wrote:
> This change enables SA8775P support for Multi-Stream Transport (MST),
> allowing each controller to handle up to two or four DisplayPort streams.
> As all necessary code for MST support was already implemented in the
> previous series of patches.

Why do you update only SA8775P? Please update all the platforms at once.

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 897ef653b3cea08904bb3595e8ac10fd7fcf811f..4a94f37513c21f9a273080b572a1e50a186a45ce 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -108,8 +108,10 @@ struct msm_dp_desc {
>  };
>  
>  static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
> -	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> -	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> +	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
> +	  .mst_streams = 4},
> +	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true,
> +	  .mst_streams = 2},
>  	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
>  	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
>  	{}
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
