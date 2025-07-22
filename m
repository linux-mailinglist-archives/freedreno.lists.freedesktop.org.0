Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B586B0E0B2
	for <lists+freedreno@lfdr.de>; Tue, 22 Jul 2025 17:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E611910E294;
	Tue, 22 Jul 2025 15:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DWBVwOIA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5946010E132
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 15:38:29 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MCralU018032
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 15:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=5v7ZQEbIAiB0+2jIBiZJ/zlAz5qzyamJW6N+8IwXK2g=; b=DW
 BVwOIAfZamAYOhpztOGGNnXgLreZMfJCH5mBPagIOcmoQtv0nLI8Pa0HO0quJCLN
 6Wi5edUrWF31LX6kjoCOtQuQhE43+E0HUqaXGGKjot+d3RpcjeDgjnf4lxKYGK/J
 MlP643aCQbvi0Adpa3rW9FFu9ZiNWV06gvJGXWAwV96fJ65UGvl8y6WxC/IKl38u
 JDbG08GBvw5qD1ohkOR1YoJVUFd6qD9vS0dlCal0awFo4rMqfifnEVS9g45Gfbq3
 tpjwgde6iVAr6OIro43Q73w/4iatt9HgaWmod/QXC7tPo3x1ua6DEDlDm201eHMm
 OfX1PfU/HsHKvQzByM/w==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1u8hsa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 15:38:28 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-40cf6614bceso4656257b6e.2
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 08:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753198708; x=1753803508;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5v7ZQEbIAiB0+2jIBiZJ/zlAz5qzyamJW6N+8IwXK2g=;
 b=c7aXSL/B2vWIrRKzs7nCDNaowR4/JC8xoHFCu5lgDtg/XsWpPP9ci+klA2W+iRTMx3
 2HJxrVyZFJI/+NDArowDtwnfZex8rV7W+HWRnHvDiaeQkEfQGO+hYOtyAahBZyuKQoQC
 653tj2Kjy9CBNvqOWMvreXLiX/vfuYOowyl0Cl1/39jHMBiqg3w/bvf09SomV88jfTcm
 kLAhoed4UDImldub+ys+3o18zyiuw4ncF3igZefQQiQq5YR6LFyVdZCx4uf/OzfL1DWK
 0i52SkseNwoCIlwUGbIAPLkEIVQ9CCL4G+L+mOj90sfGiG41oYQbzRj+cf6mAGt0q+nE
 7hGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXX60au9Do1Vls3umEUfsa/qlb+1Ihoh+o8WtF1MWEMKR0Z+sf6P13XE1d9I3XHZFYNMsxslwq4SOg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzmvb5mMsgx95m5AEEELmJQQ0W28Pvwg47C8Q96Lr5SZiNE85pt
 xrd6eQw1xhVJfFNs0aBQXZDq8mSMXZFMIOL1WQEkbknsPgcjGnujUquSU+FuPetfatoDSqV9yLL
 TuKyVeBf+j3XevlFyGHXjBYzQ7YfKxGEvB/4tjiQfmtfl7VZuqPc7oq/PoI3gmNRYEkKQQ/iZ9a
 tN875DTJKxDdcdOuh8+KjTNRIuHWM8A2mI2JewPQd+rvSm9A==
X-Gm-Gg: ASbGnctOMnfvvk12zqr3B1+l5FrHnQ+Zrfbf22LAL25XZ1jjpHi23g9LTdzr0oi79tv
 waCcxOj/BwdnptY82jZ6E3iSfo+lUEfttUcrc345D5ESdlL75PEQHB2pHON/JTQSCZfL9XaYplr
 GYJqlsZ+4kTGBgMrazyiemUmyd7E1yxg2dCq+EmotHI52kZHSVX2gK
X-Received: by 2002:a05:6808:680a:b0:40b:2566:9569 with SMTP id
 5614622812f47-41d04c92c9cmr13430193b6e.24.1753198707605; 
 Tue, 22 Jul 2025 08:38:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1GJFYfKEf/2vfcM24SVmmRuQ+5KIZBxPBd7aDQfDJlhTZLhTkv+JowWe/tlkItYgNDaaLaguNHER2f1sJAMA=
X-Received: by 2002:a05:6808:680a:b0:40b:2566:9569 with SMTP id
 5614622812f47-41d04c92c9cmr13430177b6e.24.1753198707155; Tue, 22 Jul 2025
 08:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-12-9347aa5bcbd6@oss.qualcomm.com>
 <vng6tut4sv3zfbwogsb74omqsbqutpeskqdnezbs4ftsanqyb4@nv35r7mqmcva>
In-Reply-To: <vng6tut4sv3zfbwogsb74omqsbqutpeskqdnezbs4ftsanqyb4@nv35r7mqmcva>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 08:38:16 -0700
X-Gm-Features: Ac12FXyqViKjRhthyqXadlDIINRduJGIQgMSW9SK6xnSnnCzfXGivfqsWQaTERE
Message-ID: <CACSVV01EhWWohUDQ8n=FQeDuaDcgmYnMBJDMJ8D1Gist1NR4QQ@mail.gmail.com>
Subject: Re: [PATCH 12/17] drm/msm: Skip devfreq IDLE when possible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=687fb074 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=19W1w_CfSDR24Ta8X3MA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEzMSBTYWx0ZWRfXz9bpTNppKoiZ
 sDsJWDjdS0Gc6YeZXBHXDiWWipH2g6IGrljZhV+kbfKps4Ppwq2g4ZdHrCB4Ib1m+Pxu9o2ChOa
 BGyscisRnFQ9qwmRvq1M6xriWJ8Na56o4LtCEBnkvvrU3QCH+UbotICeWTt6qbXKsGjXAj/KEFw
 fYtg6oC7OHyzwFGMecgujdqEN1x7Po27HprtcA+k110MIfXHXc3YapWslIa2WJN1dMD6BdxEn9v
 f6T0zT7acrvnP5qcWs8I/O80yC8Nh1BrF4sZcQ4BKylwV4q5Ao0Isb+ZYm5MfksRbRTpTYQGk5s
 f6oRHuBxej6XBfmUzfkl2KVu/ybgXzMcYDRZHAGDX0okC0GfKzeahzavmmr2a+nbX/5AsyQ0XdF
 cwP8VzEOMUZ7UwNXsX7HB5zAtWW4XQEVz0MR/+3xQZfdyIVMKQlNQEdD3uQYZiGW6sQSCOuK
X-Proofpoint-ORIG-GUID: X4UusQDskC5JyGFUWOoV1U3zJedvPaTg
X-Proofpoint-GUID: X4UusQDskC5JyGFUWOoV1U3zJedvPaTg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220131
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Jul 22, 2025 at 6:50=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sun, Jul 20, 2025 at 05:46:13PM +0530, Akhil P Oommen wrote:
> > When IFPC is supported, devfreq idling is redundant and adds
> > unnecessary pm suspend/wake latency. So skip it when IFPC is
> > supported.
>
> With this in place we have a dummy devfreq instance which does nothing.
> Wouldn't it be better to skip registering devfreq if IFPC is supported
> on the platform?

devfreq is still scaling the freq.  What is being bypassed is
essentially a CPU based version of IFPC (because on sc7180 we didn't
have IFPC

Currently only a618 and 7c3 enable gpu_clamp_to_idle.. if at some
point those grew IFPC support we could remove the trickery to drop GPU
to min freq when it is idle altogether.

BR,
-R

> >
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/ms=
m/msm_gpu_devfreq.c
> > index 2e1d5c3432728cde15d91f69da22bb915588fe86..53ef2add5047e7d6b6371af=
949cab36ce8409372 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> > @@ -4,6 +4,7 @@
> >   * Author: Rob Clark <robdclark@gmail.com>
> >   */
> >
> > +#include "adreno/adreno_gpu.h"
> >  #include "msm_gpu.h"
> >  #include "msm_gpu_trace.h"
> >
> > @@ -300,6 +301,8 @@ void msm_devfreq_active(struct msm_gpu *gpu)
> >       if (!has_devfreq(gpu))
> >               return;
> >
> > +     if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
> > +             return;
> >       /*
> >        * Cancel any pending transition to idle frequency:
> >        */
> > @@ -370,6 +373,9 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
> >       if (!has_devfreq(gpu))
> >               return;
> >
> > +     if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
> > +             return;
> > +
> >       msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
> >                              HRTIMER_MODE_REL);
> >  }
> >
> > --
> > 2.50.1
> >
>
> --
> With best wishes
> Dmitry
