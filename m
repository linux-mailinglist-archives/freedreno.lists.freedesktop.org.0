Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80590D161D7
	for <lists+freedreno@lfdr.de>; Tue, 13 Jan 2026 02:14:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D57D10E446;
	Tue, 13 Jan 2026 01:14:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cl3yAOyy";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bAS+R6r8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0480F10E0FA
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 01:14:08 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60CN5j6Q2113327
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 01:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=J/0cnCYpDBos+7nwSFiIuXvo
 +vrGW9jjlT38b0YSnCo=; b=cl3yAOyyWwhcHORodfqsQLgbb7Ch2B7xKZSnlKuR
 t4Qe0xREyUzz2t2V353PmvKDUBZNx50pMikiU0vkqS9Nz0uCvhYGQvMSL2dsW69W
 o2SbgK8ATBv18DcjEx8fa0TNtD9Nqjm8/5vOXg+313zwBbECXQRq+p59B8e+2CPI
 XymJOCYhMfPS/yGQTR/SzTYKE+J8yC6C/WAa8UZ9G3SjlSiVLciyKq0tFy5V/9/J
 SCJwJlxbGNFlDYbNo9Y3wlQh4BSRLQ7dEPasRgyjMwGeJXUKRfpIqKRE0w/VMgC3
 z522A1aWZI4o1PKN/Or9o2kgKwIb+EZPt5fRLGNwKUi/pA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn34g9s1e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 01:14:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b6a9c80038so754224285a.2
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 17:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768266844; x=1768871644;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=J/0cnCYpDBos+7nwSFiIuXvo+vrGW9jjlT38b0YSnCo=;
 b=bAS+R6r8UnOgBOe7BpTjAHc2DuIOay3wZE/NamszEInreMYAkQf46NcQrO61ZjNf0S
 M4g1H1qztVoZyptd/yk9FwHPWk6sMRABRIeGcQp2tpTYCT/8n5GNIoVNvjmLp3iY54sB
 2V+nbfmN4wJ/M8GXskgrkI5Zm485h5kB0SZkjp/u9z9iBjAO4lntGV7dbASshk767BnX
 l8bH37b/7iOZg/J9kAPCoIlVLO0/sFCkJPoDrdtMLe7xn4oEOKL2+ZL0eeFJEj8YRY1V
 uzg1wCpo2i4bVVeUedWIheB3eO/prfTnlk5K0MmtyciWxCZYYJR3E1yirPJqaP94xs6z
 rSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768266844; x=1768871644;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J/0cnCYpDBos+7nwSFiIuXvo+vrGW9jjlT38b0YSnCo=;
 b=dtsKDoKsHOZWtp1X94ZHf77oO4RwDJsom6TriX31ajIMReE5RQOxp8v4acJicI3t7M
 vHDqTPmDumT+2q0V7hYbNktsHmmanhcggCyLswst4L0BxvqTXxVAZagFoPpjrH08WBqF
 jE4Qgs10r73Iw8R45ym1KbaiADLJf2CTzzySjBLmLcy3aljVaGVwlQBAj45iuYtipQTT
 dh9c54/4m7zXpQmX/qXqndhyvXoJcoqAAh39HKnjE02AXxu5GMF0aSikT9SkLnyuLFsJ
 bdq/vwtbCnCHkpLtBdTxbw8C9j5RGIsVRMLgPOn6mNvveX08BNoNlYHaNN8PUncJkqRG
 zzWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5DpiWRvqRtIPApJkXG0+Fo6fSzwesTGEJzp7eXoAb2Rn0TYaFXba0h6+oDh/3QbGWVRmbw3z8B/Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOMOpdte/DHtwhgmkHgWO3OoAeXeugri8lv2tVjrHcWQQ7wy6o
 TgmKsVZtq5S2fbnEsXCh/uP9ouFYHPix1osLglffiB2nqSSvypOZhXon90/uGj9g8cMcIsypnRI
 frD71rx5sfrliDdC53ERhx16S9p1q3vygi5xCC9e8PraWm6ALhvegroH9Pj7PWQVD7SLzqQI=
X-Gm-Gg: AY/fxX7TcLfL5HrFUjDlaybRWa0R+rKPMJB6+vNhITewjhyS86hgKc/OCtQ7PwcpqmU
 69PgbU/YR70qL94v+vsTDZSAZpL2tFjz2Gn+Q+qxfPBpHoPBiaxysGTKv9CmumRSpCycENLK3DW
 S+oJAkZaYpprQ5osbTKl0jcZ5R51bENrRZCHtmwLOFplKUCPgPGIsWTaIoii80ki60nJohT7yj9
 y2OU+G/CR7F/c+78BjCgaqDiYisaeTRyvF48LuYbMK7t5joZ4wiIUKe4qLzBdq2bfnqLuwhJlR/
 2nInJMNaMf/RKt3VEOS5nKQfp7XFB56zfipXp9LsEHBgg/MTFPLxiosKrIrHAvrVgs+1VUSqYul
 xJnOMkLv49wjPrD3zAB3rI2XHEqHX3qUtEGwyc6YtxfdeY/MWgDsadyQIANA2uSMQWieLnFsDkb
 Jo9B69cDdMUNpCYoVzTWqJ16g=
X-Received: by 2002:a05:620a:2a07:b0:8b2:271e:a560 with SMTP id
 af79cd13be357-8c3893e7e2bmr2315926885a.72.1768266844323; 
 Mon, 12 Jan 2026 17:14:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4WlkP4sNqdgzyvpCMNJE4qaOKFUaJCa4aduSzPBbjzyb10EW/oKcBiBwhOQ9DebVVAgpZZg==
X-Received: by 2002:a05:620a:2a07:b0:8b2:271e:a560 with SMTP id
 af79cd13be357-8c3893e7e2bmr2315923785a.72.1768266843790; 
 Mon, 12 Jan 2026 17:14:03 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b6a2b8330sm4926075e87.10.2026.01.12.17.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 17:14:03 -0800 (PST)
Date: Tue, 13 Jan 2026 03:14:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexey Minnekhanov <alexeymin@minlexx.ru>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] drm/msm: drop DPU 3.x support from the MDP5 driver
Message-ID: <yxp6k6bjscuxwm5mz2ev2647ewe7mycus7dszehtrfr7qhxx25@nptailaparnc>
References: <20251228-mdp5-drop-dpu3-v4-0-7497c3d39179@oss.qualcomm.com>
 <bb889140-5ddb-485a-bb50-739f68297838@minlexx.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb889140-5ddb-485a-bb50-739f68297838@minlexx.ru>
X-Authority-Analysis: v=2.4 cv=fbKgCkQF c=1 sm=1 tr=0 ts=69659c60 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZEkBDfZtAAAA:8 a=vlXmtpXO02sfSNYNR6MA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=IqjDwHP2KxQYjTbYCZGP:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDAwOCBTYWx0ZWRfX3FjqrgcYxdXH
 +4+nJrBP+tYdD2Jkp1rAz0fN8BqqpIUUV/j/B7gHbpnmLt/nMvfLDZQocUe5hffNWXptGvxtqXG
 4PkX293asXcckl0pQrf7tPXl4vcR6eIZxd6t3DiNGXU9ieAyQ/s3Axn6Gxwn4VZk2rMHDH0CMmn
 gJjgGnTGwMx19xPsWXvxRheuUTSQmjVuh+lQB4zRtJm82a+FAAB7ruHa7caVJoMgVOiDhMi63RD
 uhdqcZ/BuA3ND1+eW/IMIObKmeM9P3FLNm4Jdf8nGAsIQRCn3yW+H9yoI2Fnubc3X7v+N7sYnF7
 z/Qv3qwIiBVaA84JkMF5YtnUaM2mbII66jODPVKFL2M24SRmjbi2BjXyUANysPFdQcZ44qO8EsF
 OWykN4h+KIZ5VnVSOdnSVXfU6RuTarG123yWmty1uv8x+D6CVMwrMbdCcjgEof7PAUO9UE3A/p/
 /x2yKPtmBQA5/37aL7g==
X-Proofpoint-ORIG-GUID: GbTXjNatodQnzUlV_8nYz2Sy990_hSD1
X-Proofpoint-GUID: GbTXjNatodQnzUlV_8nYz2Sy990_hSD1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_07,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130008
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

On Tue, Jan 13, 2026 at 03:02:33AM +0300, Alexey Minnekhanov wrote:
> On 12/28/25 7:02 AM, Dmitry Baryshkov wrote:
> > Fix commands pannels support on DPU 3.x platforms and drop support for
> > those platforms (MSM8998, SDM660 / SDM636, SDM630) from the MDP5 driver.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > Changes in v4:
> > - Inverted logic in dpu_encoder_phys_cmd_wait_for_commit_done(), check
> >    for the feature rather than the lack of it.
> > - Link to v3: https://lore.kernel.org/r/20251224-mdp5-drop-dpu3-v3-0-fd7bb8546c30@oss.qualcomm.com
> > 
> > Changes in v3:
> > - Fixed commit message (Marijn)
> > - Reordered CTL_START checks to be more logical (Marijn)
> > - Link to v2: https://lore.kernel.org/r/20251218-mdp5-drop-dpu3-v2-0-11299f1999d2@oss.qualcomm.com
> > 
> > Changes in v2:
> > - Fixed CTL_START interrupt handling on DPU 3.x
> > - Link to v1: https://lore.kernel.org/r/20251211-mdp5-drop-dpu3-v1-1-0a0186d92757@oss.qualcomm.com
> > 
> > ---
> > Dmitry Baryshkov (3):
> >        drm/msm/dpu: drop intr_start from DPU 3.x catalog files
> >        drm/msm/dpu: fix CMD panels on DPU 1.x - 3.x
> >        drm/msm/mdp5: drop support for MSM8998, SDM630 and SDM660
> > 
> >   .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |   5 -
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |   5 -
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |   5 -
> >   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   7 +-
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           | 314 ---------------------
> >   drivers/gpu/drm/msm/msm_drv.c                      |  16 +-
> >   6 files changed, 17 insertions(+), 335 deletions(-)
> > ---
> > base-commit: 4ba14a6add891fe9b2564e3049b7447de3256399
> > change-id: 20250926-mdp5-drop-dpu3-38bc04d44103
> > 
> > Best regards,
> 
> Thanks!
> 
> This fixes DPU with command mode panel on Sony Xperia XA2
> (sdm630-sony-nile-pioneer) and still works on video mode panels on
> whole bunch of sdm660/636-xiaomi phones and tablet. The whole series
> 
> Tested-by: Alexey Minnekhanov <alexeymin@minlexx.ru>

Thanks!

-- 
With best wishes
Dmitry
