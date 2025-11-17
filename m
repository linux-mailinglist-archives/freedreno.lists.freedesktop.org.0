Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F1DC644FE
	for <lists+freedreno@lfdr.de>; Mon, 17 Nov 2025 14:17:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6757A10E092;
	Mon, 17 Nov 2025 13:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yo1HwbgP";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1zpsqCL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CCB10E09B
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 13:16:50 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AHB663k4107630
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 13:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Vj5ZcMOs3KsLHT8Zdi03abv/
 VC07dPRnuxMbrQ23NEE=; b=Yo1HwbgPT0K1lIgI7/ws2S/Gme5GT3BE70Jy/BbL
 L3qHAHm2tdmv6m2qTWF+uJgwegqXkQlrj4nozq9+0uraKnQrXvRjMrjBSq/kqMTz
 yfwRAb2/qKHAxT/aHn8sKP8Ge19exTAr6Xt9PUvkKqkFtNDgVKcyWCAqjFYDG/Nh
 bPIg68DqOi9TbF3wHcxTyxfY9ZKj6+NQCdaeuTZt35UDEPcGAKydX0dG+6Ui/8eP
 I1D9ZF1eZvQVkdZ25JbQ2pqH7L9lVpkGTgTN/yrlFQDopeM6pcmMdSHye7u3yTyy
 V1WNuC73hFqzLRbY4gm+CjeSRHT5nwX/956V0NVKzaCPHw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2hp8b8h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 13:16:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b969f3f5c13so3480679a12.0
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 05:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763385409; x=1763990209;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Vj5ZcMOs3KsLHT8Zdi03abv/VC07dPRnuxMbrQ23NEE=;
 b=d1zpsqCLWjzKdUr0DeGPb6oikLxZQuYSSO/Yh35vr+GPphys2wckd7xVS2uze8B8oi
 +fCieSzDjwNOKToZMXjVVwzw3ZU4Fx4ORPWOO+OUXcGnzllPn8gmxDx5QEluESzzIAaK
 RD1nB0zQiC0VMb2xOSy20SlI5eWzRxDmyMzPF89wwzkJDAxZRE4qOGPMMrZj+QuJv0wN
 lKSwFe43gV3ZTZ9YieOJXmykkiqLNmeosEQqJj5PHoLup8H8Nz+TJbf3sDFPUZH+jNtc
 X5KDn2mSuQF+TnucPOSTsFd1mSLpdrVYNM6cYrQc/w43GlnqIaUC4ZugZvgjaaXU8MBF
 WImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763385409; x=1763990209;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vj5ZcMOs3KsLHT8Zdi03abv/VC07dPRnuxMbrQ23NEE=;
 b=j8554B9QUxKUvyh+ka6Mfz6qU+55DI70PJoUCvZGX7Cn5oHXRfsBPOjHEB5Hxzn6YM
 d/xztSUjQ0OWwrLpem7Hycann4MzGTN1jKENaJzr8uIzgxoOkorTVUehslEROG1p127n
 2I1/pWdIyWSaW+pqQ08yIZkmcUiw0/9bBCi7niQMLiPY1YY0Fw/mXPpyQjpH9o6lISS2
 Di9qQGU3SNLPg79ql+Z8fw0UToCHCU30yJqytJNwllY+qPehyz3CtG/TLP87iWMEJBmM
 WuyrdvKvW2qLGWFSH59Gpg1aHnEP5b7vUdaAqoBm54NobMHQuVJgnI7URiNYKUhQRbAe
 R7lA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULIhSs0hvicpVjBrS8/+vL0+XwgJP3YhhTgY1kjx/5tlw3bnj746UrgY+Svo95Z9KYZXeVtVKLgeg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyA7z7EvjEo/g36jCo942zJacMsoRrQE8iCMTq5M3AzZSGFMAaF
 pCbLpEJGWZ7wFaJIXMiVhRMDqN0MhqOklogRmmvhf1FCaBLSvuMDP0suHXGtU0lO4J9nq+USjDd
 rONwJwJKNRotphFpiqIebBW6qDWG6QUYh5ZhsMHBCDNCay9tG7m9t1Dl9FyKa50lbKw1iiJeuW5
 vkeo40dtpxtPRS5TaI9IfhW8KExRlxyTb+MWTPNrJ6sEnl/g==
X-Gm-Gg: ASbGncsSNyz9nm84UpPCbAi7qtjaf5vuX6IoS7y0C9O0Lw3w3DFJiyE6ZkGdWYTSZvn
 urbLVS2+DhxMgp3Yxew3qvhXWe7DBQ2HwkWSavvyQqYmxpX6s+gnitZbc98MRh64kXiKfJhjmvy
 IH6DWTaJAXviJNlPniH+uaKtvnGU9ghcoXGxvZEemgIGBYTO+kO5HszoP2LwC6QALrCIOylsk+w
 zOYiaVip966RNk=
X-Received: by 2002:a17:90b:1647:b0:33e:30e8:81cb with SMTP id
 98e67ed59e1d1-343f9eb3971mr13201773a91.13.1763385408520; 
 Mon, 17 Nov 2025 05:16:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFihb7teyupjKqIBCMh+TDYSyILYGMrEp4gWjInkFX5Zos5pwMEb0Fz1Uc0Vjzvg2oHO3cVkntD3anF1J/+5y8=
X-Received: by 2002:a17:90b:1647:b0:33e:30e8:81cb with SMTP id
 98e67ed59e1d1-343f9eb3971mr13201713a91.13.1763385407848; Mon, 17 Nov 2025
 05:16:47 -0800 (PST)
MIME-Version: 1.0
References: <20251115-dpu-fix-gc-v1-1-0a4fd718208d@oss.qualcomm.com>
 <6457c60a-2ede-4df8-ad82-d974690eba89@oss.qualcomm.com>
 <CAO9ioeUfZQVy7VFUp8FEVHN2_uL0ZB9jbkuexWY4D12YN_O3Jw@mail.gmail.com>
 <8541a10d-99ca-43d2-bafa-8e33bba01382@oss.qualcomm.com>
In-Reply-To: <8541a10d-99ca-43d2-bafa-8e33bba01382@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 15:16:36 +0200
X-Gm-Features: AWmQ_bldWn3qGJhpGBYv-2oYFmnlXXeCyzixQ_jXnUrblALzLNWv8mieP4Sa1iM
Message-ID: <CAO9ioeVT_1qGedvdACkE4pqbsP8VReeArbe=-zaH-SHfhi3pkQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: disable gamma correction unit on SC7180
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Federico Amedeo Izzo <federico@izzo.pro>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: mnUsx7SPA2CmWa1hDGDAN6W4sgNWg19G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDExMyBTYWx0ZWRfXyS2WsCMfM7Gv
 iOzsSVnM5oS7X3u0shPIaUKjTGPbiANIk8mUke+xbuVnXer5gv/22YxE/6eD7iEwXVdy7VjaSor
 wNU5MruRERycR8p5XtzqsUieLgevc5CcLg5h+8JGuEOvV2B65VOJeqpqaWxHKP6gEKxd+ECrtUG
 aO24MmRXUWKuu4A47ufXKh0mdNeD82aM/hzEdOLuO4qcYf64hTSg9ISBLQtMtdpTpM6F2ByelJP
 6IVDoHLD6pLqPn3TjYyuIo9/ZZQcoz8boDL0Cbbni2r76GzbaTd4RXUiiZZJ8LJNJAql9fentfK
 WJ2gRzJeh5oycrdZbAwqfkgOen8CBP3qp7Ebpzmg08SJRQt1RF8UR5LNOk0hYJAI4UK/Kzgg9V1
 QLrN+tHs9x/Kr2i+tj+c7/Y9bF3u4Q==
X-Proofpoint-ORIG-GUID: mnUsx7SPA2CmWa1hDGDAN6W4sgNWg19G
X-Authority-Analysis: v=2.4 cv=Y5L1cxeN c=1 sm=1 tr=0 ts=691b2041 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=srVbb6NRTgbgkvQ9qfIA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170113
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

On Mon, 17 Nov 2025 at 14:10, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/17/25 12:51 PM, Dmitry Baryshkov wrote:
> > On Mon, 17 Nov 2025 at 13:25, Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 11/15/25 4:08 AM, Dmitry Baryshkov wrote:
> >>> IGT reported test failures with Gamma correction block on SC7180.
> >>> Disable GC subblock on SC7180 until we trage the issue.
> >>>
> >>> Cc: Federico Amedeo Izzo <federico@izzo.pro>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> ---
> >>> Most likely I will squash this into the GC patch
> >>> ---
> >>
> >> Peeking at downstream, 7180 and 845 should have the exact same GC
> >> (v1.8).. it seems like there's an attempt to program it through
> >> REGDMA instead of regular reg access. Not sure if it's actually
> >> necessary or just an optimization
> >
> > I think it's mostly an optimization.
> >
> >> What tests are exactly failing? I couldn't track it down on FDO GL
> >
> > See [1] and other failed SC7180 jobs from the same pipeline. I haven't
> > triaged it yet, but I assume this might be related to platform
> > resources (it has only 2 LM blocks and only 1 DSPP).
> > Another possibility is that maybe we need higher CFG bus bandwidth
> > when writing LUT registers.
> >
> > [1] https://gitlab.freedesktop.org/drm/msm/-/jobs/87878393
>
> igt.kms_color@gamma.log fails, we get an ENAVAIL (-119) (which doesn't
> seem like a good return value for this error but anyway..), dmesg says
>
> 05:42:13.199: [   75.472174] [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu error]failed to get dspp on lm 0
> 05:42:13.199: [   75.481487] [drm:_dpu_rm_make_reservation] [dpu error]unable to find appropriate mixers
> 05:42:13.199: [   75.490235] [drm:dpu_rm_reserve] [dpu error]failed to reserve hw resources: -119
>
> which comes from:
>
> idx = lm_cfg->dspp - DSPP_0;
> if (idx < 0 || idx >= ARRAY_SIZE(rm->dspp_blks)) {
>         // misleading error message, it's not LM%d, but DSPP%d
>         DPU_ERROR("failed to get dspp on lm %d\n", lm_cfg->dspp);
>         return false;
> }
>
> which comes from:
>
> static const struct dpu_lm_cfg sc7180_lm[] = {
>         {
>                 .name = "lm_0", .id = LM_0,
>                 .base = 0x44000, .len = 0x320,
>                 .features = MIXER_MSM8998_MASK,
>                 .sblk = &sc7180_lm_sblk,
>                 .lm_pair = LM_1,
>                 .pingpong = PINGPONG_0,
>                 .dspp = DSPP_0,
>         }, {
>                 .name = "lm_1", .id = LM_1,
>                 .base = 0x45000, .len = 0x320,
>                 .features = MIXER_MSM8998_MASK,
>                 .sblk = &sc7180_lm_sblk,
>                 .lm_pair = LM_0,
>                 .pingpong = PINGPONG_1,
>                 // no dspp here, errors out
>         },
> };
>
> would simply binding .dspp = DSPP_0 to the other one just work here?

Only LM_0 can use DSPP_0, that part is not flexible.

> Also, would that mean we can only have gamma control on a single active
> LM at a time?

We can only control gamma on LM_0 on this platform.

BTW, the other log is more interesting:

[3] https://gitlab.freedesktop.org/drm/msm/-/jobs/87895515/viewer


-- 
With best wishes
Dmitry
