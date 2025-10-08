Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1825BBC655E
	for <lists+freedreno@lfdr.de>; Wed, 08 Oct 2025 20:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8AF010E8A5;
	Wed,  8 Oct 2025 18:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ShAk860b";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E7A10E8A5
 for <freedreno@lists.freedesktop.org>; Wed,  8 Oct 2025 18:49:02 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5HPq020541
 for <freedreno@lists.freedesktop.org>; Wed, 8 Oct 2025 18:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ODPOfu15xqG3giQgLQz8qy9q
 u7JTNTnroFNBqpeEc4M=; b=ShAk860bLdkRDmTXy9xSkwY5CSyE5qzM9u9Obzk6
 rcDMUNkLFauoBMVVA0bati67BruEFTLu+I0S+xLFxerQOU1DCmvejBHTC7Dgf3Eb
 jOxUu/ewFeqQOnp6J451/oZUU0GRrFT9b+wVB91S+CUFfeFX7Azmw1MxFVNoK/xp
 ncWA0gbrsrP/Tv0LiEzhbWjnAIkTuW2GpqvogFJxs+CIj1CxezZi93lUHg9KTBwR
 r3hSgMPJqvmk9tghmfuhKe9WAhIYjaWkTuUt77W0pf71mpfE1hlDs9W9r/2nvZ7s
 f1ofXV2SW18ZmrtMQ4ZW2ZgNGUlT/qhxK9e8ew2Zi+eqhw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kg991-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 08 Oct 2025 18:49:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4d8b8c3591fso4311731cf.2
 for <freedreno@lists.freedesktop.org>; Wed, 08 Oct 2025 11:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759949341; x=1760554141;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ODPOfu15xqG3giQgLQz8qy9qu7JTNTnroFNBqpeEc4M=;
 b=HFQqjXQdV573blhQhz26eJwP46pdBVn/yjNI6iAVfBipI93BHuQwh0qK68ZKsCleHj
 Tn9irwv7UmBjkIWWP+T0wgb3fCpS67Vvz7PDMjorZMD4xBAVpDBk/JOWqUXMmrtdDWym
 2nYzPEfxEYkT7Ic+54yZFg7El0/PiPlMLiImKQt+GMRLnhP/bOCTh6LLokPYUCjIyfr5
 8mePY13QnXUpXkPsICDSL2N7NSU32GMVYSKcSkQQNtU+vFxFO1ohOyN5cj+vWxvEtuI+
 j3w766k2nKvAgiAdqrKgkY3R6bwwsfYllkoCGH6/wGAohcNwQZC61IqW9pW6MSWbhoyW
 rr+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6SUHLBm2IzJwCM/H0ZUX5ngeRmtRhquHyHNKf8PfAXsrdhtdKl8MNFgkmmhsseTae4aKf+v6kN0Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykkbJQInpGmhy/v4gC0CQGusg3dDR2LOvrhxqDUMJ67HW9857y
 Yzm6F4NcrEd1HPh4gUYK37yGD0VhYrkBNiG63XeIGDkY0316hgCnWUnTAE8b2uHY7atvz2QiTuN
 dvrXV6FaA+ajAWIsr2tRX5Jlu041ogBkib2PVOdScU3KGqG05IySimuus2OZla2nc2makJ2M=
X-Gm-Gg: ASbGncvhxuR2SjDsEPf0v5aG+9yAzaQTDeXq+58zmJD2fx17NcQ0Yq4C1qR3YFUznNo
 yLoO55Raig9V4aTrHG5b/pwB5tWFQjXlSzd3XISDERgzYC1iPKfx3tlNQoxOfcxSCn2Oe0MBf7T
 o1BciXQeMwYbg+OynwS8CaTc38Aiczf2I0AblJVCgYeszTrCJsY9T7OaSiIIwW3LEwSblo3mC1N
 JttTJKQbYJF/ar6hEdX8sIAh6hn+ZFoKlcZZ5zpkPhxDoT0P4DonpAGd3ioUZVKcrbOiqfdniw+
 3tSyWK37YMK25GiT3NkbM5Vi48hayaEjY5w9d/E9PtaKqHxoSFfXmyt6026kGHXhuJEYONPeZlC
 9843ILPVErAu5pno3W4HkXPe8rWzv1arCwFped55F0ff5cRQS/dGL6nZWbA==
X-Received: by 2002:ac8:57c3:0:b0:4de:10a5:2c7f with SMTP id
 d75a77b69052e-4e6eada7dfamr74154101cf.84.1759949340764; 
 Wed, 08 Oct 2025 11:49:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB3TEGZ+Gflu/39qNY+/p7xX+0/YYfiskGcmubHdrhtp3slU9kmFASOY5QbLqqoFf3Gd89DA==
X-Received: by 2002:ac8:57c3:0:b0:4de:10a5:2c7f with SMTP id
 d75a77b69052e-4e6eada7dfamr74153531cf.84.1759949340077; 
 Wed, 08 Oct 2025 11:49:00 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-375f3b833d2sm22261501fa.51.2025.10.08.11.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 11:48:59 -0700 (PDT)
Date: Wed, 8 Oct 2025 21:48:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 10/16] drm/msm: mdp5: Switch private_obj initialization
 to reset
Message-ID: <m3c3thrjbajskitjnkktmvp624v7qqfyluggcbmol5axvjno5n@aqnqk5nsu2zw>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
 <20251008-drm-private-obj-reset-v1-10-805ab43ae65a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008-drm-private-obj-reset-v1-10-805ab43ae65a@kernel.org>
X-Authority-Analysis: v=2.4 cv=dojWylg4 c=1 sm=1 tr=0 ts=68e6b21e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tVI0ZWmoAAAA:8
 a=e5mUnYsNAAAA:8 a=MY5GpsA41Snrp9pqcaIA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: Gf6ta6uIyIbOta-4JG622EsrmBXITWzo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX/oihc18lhpr/
 bVqf0+plouRBYLKuuRO9H8ZCxD5p+CwormPN3tYeFK0UOuB5Q26LyMwPMgXv9CNA3NWoD6LAQfP
 fX4Du4W9vGKKm+VStMFIWvCUvXbHMPNT69n0ktT+1iLP0WF1mR53hl+5yl+H1cF44fpBhaXI42v
 MDfMlSU8NsBxTDNy8N8HFLk64s8qsuoe9EsJ527F6odtrGHTtw8qdG7tPEvpjduYjpc+AcT+rWR
 SrWs4iHpu2zhV8pbfl86zZVfphJVB1nxmwtu2vjcas7PxjL5vxKbs4wzR6bOJGmr6VxnwtOFBCk
 Kpkm/efn6RsIC0prerVhOB0MEc88979jVlKaIw/cZd4kwaUgab9B4JDLyqID1AuIE75FnSMHynT
 DRtOmqtCKtLRFC2YnuGXfz1ya84/Mg==
X-Proofpoint-ORIG-GUID: Gf6ta6uIyIbOta-4JG622EsrmBXITWzo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
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

On Wed, Oct 08, 2025 at 02:04:08PM +0200, Maxime Ripard wrote:
> The MSM mdp5 driver relies on a drm_private_obj, that is initialized by
> allocating and initializing a state, and then passing it to
> drm_private_obj_init.
> 
> Since we're gradually moving away from that pattern to the more
> established one relying on a reset implementation, let's migrate this
> instance to the new pattern.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> 
> ---
> 
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
> Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 31 ++++++++++++++++++++++---------
>  1 file changed, 22 insertions(+), 9 deletions(-)
> 
>  
>  static int mdp5_global_obj_init(struct mdp5_kms *mdp5_kms)

static void (up to you). Or just inline it.

>  {
> -	struct mdp5_global_state *state;
> -
> -	state = kzalloc(sizeof(*state), GFP_KERNEL);
> -	if (!state)
> -		return -ENOMEM;
> -
> -	state->mdp5_kms = mdp5_kms;
> -
>  	drm_atomic_private_obj_init(mdp5_kms->dev, &mdp5_kms->glob_state,
> -				    &state->base,
> +				    NULL,
>  				    &mdp5_global_state_funcs);
>  	return 0;
>  }
>  
>  static void mdp5_enable_commit(struct msm_kms *kms)
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry
