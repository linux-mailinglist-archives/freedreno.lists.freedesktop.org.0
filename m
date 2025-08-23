Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5EDB328DF
	for <lists+freedreno@lfdr.de>; Sat, 23 Aug 2025 15:50:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA25410E009;
	Sat, 23 Aug 2025 13:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nio6dpSU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F30310E009
 for <freedreno@lists.freedesktop.org>; Sat, 23 Aug 2025 13:50:27 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57N3g9ZP005197
 for <freedreno@lists.freedesktop.org>; Sat, 23 Aug 2025 13:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 U6vA7pywJ2vttXsunG5ab7QCq7Dn4Mr2hiEppiVxLW4=; b=nio6dpSUo4+XzYvb
 +g4FAc6M4J86Rqhz8jovolyoTvjXpbL5SvbEeT5bcZGCLfRV1jt7p94B2D8XmKcu
 uVsmbW1JNSfcmo/UgULX9OD/zMNy9DUbM/HbQAlusOIzocf3GbYS9aJ2mMjKsgYM
 hn/mWo+V5FaYFta55RHDn+p3i8rXgZkvUXNLhYI9YGYQdhS8sKJRP55NcgSZWTy2
 t8Gzm424GUGWs2emuFalUSt6LQjYC+SpgJLJI/GeOPEZ2jJ/zjszfJ0XFmyHAQW4
 ju/qT+oiftxCiDsPfV0kw2g+bWwDRGXSyXtXtIQGrbISV0I0iAIV/b7DM5+bm6rW
 2bh2Cg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y58w24-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 23 Aug 2025 13:50:26 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70d903d04dbso54360506d6.0
 for <freedreno@lists.freedesktop.org>; Sat, 23 Aug 2025 06:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755957025; x=1756561825;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U6vA7pywJ2vttXsunG5ab7QCq7Dn4Mr2hiEppiVxLW4=;
 b=Z1wMWrVY2vSS1RVZaFPOdpsuiPHWifuSSCHrwT0XkeauVqi7V+Joq4i15lG0y5JOsh
 pGcffCZ5c4Vxm7Il5LEz/sPM6iI1jHNYpCGO8mMvW1/I/et0x0mLbtSljei8xG7V1f9u
 LMQQ8M4FkApbWI2kRSOqWzKThgyJQjDRdqXaG3kmdTXNexYIdQ0jVuqbOdWQ+gXwVpUs
 zChZWBfW3fDRf5hKPFSnKEw24M7b4XCODlsHTXTjfMGdf6YHf1Ou0h9O4/fGIYbiov2t
 eTSR0DlZYRBVypWpJS3oOaVo/gPtPtphJRdohx0CFBWzdpWzESr2J2y69G/5tJPXPY8f
 yx0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/pIYp2l0lKKzpOPX4RqqLZTNPdOnJLZ2wn6wSeXFIH/nDwvOUsT5NcPYK3S98r133NPxYP352wLc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9+V+rAtxejbgO/4IwUzBPSkkgwH7fejJ4JD1qmVOB/mZzm0cm
 7szBI4hOx02zSlNppNDK/UvWocwLtKGYnb2Pi76A/aRDOvZJUu4YBBBhPbekq05LEKBwwhLKOwH
 SjfeLslpKLduciBxB/zEYYHdhoWPNtqE5+dA1Wdb4Jq91F6j+c4/3HQnoLiWGE1q6k2SWpJM=
X-Gm-Gg: ASbGncvCM2fa8zv4tb3GzbLUVNQlx21BwryJHV/i8IqTFKGGDCFbQiVq9YqNvtdLlDA
 LtZ7dkkUfV3CAe+TY3nQEf8lJnwujXdVHxbMFrmK5pyA+mNGWfL4mcEwIOkvDQseGd9AXbYiOdz
 4vpiwn6GSCB9hv/1XzMM+znVe0/qJYDkjHL2r1gKpYHBDsGSWEtSkCWLUA1xeSufvicUxhUGAdl
 ypIfNWs3S24ig+GaJ+GRWWzOXzJkvLTQyOoeIJycfvij8n9TTOR/EP1QPXxT8kMok3MNC2+0WL9
 pmY4IN0qcyBRFv/bz/ADFm5dUIb41WA3HAc274QMdHcX+MHS6GIQDwL3Ew6FKgPURdC4sigCAjd
 tV7x/GmkcQ04DAQOBxRqDriCt077BeLKYilU9aI5L2aMIEhy8qYTU
X-Received: by 2002:a05:6214:c81:b0:707:4753:bfa0 with SMTP id
 6a1803df08f44-70d971f69ffmr70804686d6.13.1755957025491; 
 Sat, 23 Aug 2025 06:50:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyTpNiIvNNs3fPAEjRcZ3bS7cPtXKDiw2pj/9JSAEBFNfi1voXXeGw+P9flbkF2otl4ev4xQ==
X-Received: by 2002:a05:6214:c81:b0:707:4753:bfa0 with SMTP id
 6a1803df08f44-70d971f69ffmr70804426d6.13.1755957024980; 
 Sat, 23 Aug 2025 06:50:24 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3365e5fc05bsm5159881fa.69.2025.08.23.06.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Aug 2025 06:50:24 -0700 (PDT)
Date: Sat, 23 Aug 2025 16:50:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Danct12 <danct12@disroot.org>
Subject: Re: [PATCH] drm/msm: fix msm_gem_vma_new() allocations for managed
 GPUVMs
Message-ID: <qpde4x3tcultagjpflm6u4xulm5b3xs6ek54kek3sriyrneefk@tgygc5zeoxfk>
References: <20250823-msm-fix-gpuvm-init-v1-1-e199cd5b1983@oss.qualcomm.com>
 <CACSVV005RPPoB=o8-Arvteaqbpr9n_ey7LMp7c6WOg16euxh5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV005RPPoB=o8-Arvteaqbpr9n_ey7LMp7c6WOg16euxh5w@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX5p13ZnfR+yTs
 U03/jFk5N/9wEsdy+BeTVeCVm18HcKyWaVfWgE160vTx8woLD0ot0j0sQ9MlS3/WYFmXtI23rSi
 Aitp9y8hbNWjz67uEA8m8jlSjTSneqQWaQYz1sXGvT29OBGBFOO0m5iov3xErEcJXtc4ed0snwh
 YKI/++I2w1pfm3LvPYvXyYwgjheW8QhThPNqe9LpWb6WgYzXORBOE8kbSdEDMpcW5shfKmjzSa0
 bGY57L3XvKUnkrS29h8t9A8kIZbHYyM3a/niJwcsm3IT8pOnIbbZ6JJrcjo1JwC+GNFT9CyhYor
 sngShnvhVlxIdxWXbszBDxa5TOU3C0hVym2mONqnezYvS/SW5e54WN+LFOPRp9XJN8LQQwXfsPF
 1bEKl15j
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68a9c722 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=LpNgXrTXAAAA:8 a=e-On7NsmxptUPx_5N0QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=LqOpv0_-CX5VL_7kjZO3:22
X-Proofpoint-GUID: uXjvFaqonBqg7DVuc1iokhtAkf_fmLww
X-Proofpoint-ORIG-GUID: uXjvFaqonBqg7DVuc1iokhtAkf_fmLww
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-23_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

On Fri, Aug 22, 2025 at 05:14:02PM -0700, Rob Clark wrote:
> On Fri, Aug 22, 2025 at 5:12 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > Since commit 3309323241fb ("drm/gpuvm: Kill drm_gpuva_init()") MSM
> > driver fails to init, failing with "[drm:msm_gpu_init] *ERROR* could not
> > allocate memptrs: -22" errors. The mentioned commit reworked the
> > function, but didn't take into account that op_map is initialized at the
> > top of the function, while ranges might change if GPUVM is managed by
> > the kernel.
> >
> > Move op_mode initialization after finalizing all addresses and right
> > before the drm_gpuva_init_from_op() call.
> >
> > Reported-by: Danct12 <danct12@disroot.org>
> > Fixes: 3309323241fb ("drm/gpuvm: Kill drm_gpuva_init()")
> > Suggested-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_gem_vma.c | 13 +++++++------
> >  1 file changed, 7 insertions(+), 6 deletions(-)
> >
> 
> Thanks,
> 
> Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>

I'll also need Acked-by to merge through drm-misc-next, where the
offending commit is.


-- 
With best wishes
Dmitry
