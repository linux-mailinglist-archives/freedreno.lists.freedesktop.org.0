Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A08B0E49C
	for <lists+freedreno@lfdr.de>; Tue, 22 Jul 2025 22:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6243010E709;
	Tue, 22 Jul 2025 20:14:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="abEMxOQl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD8110E270
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 20:14:06 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MF3NfU017499
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 20:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=8stxXKOwM0cdX2+Hk7JZb+wP6e0PjVEkB1BIKQ6OkUU=; b=ab
 EMxOQlbIye5IyDYIVRYHKHyrh7d0fIUPvDupUlUSzKRJqQ2pKh0IUoYZw8fAqN9R
 fwF0uvNqCOMHssewh0YxGnzxy+OvtAVvj+oUwlCTSJzlhKdJCS1Ms+9a2XcQLOd7
 mK5vW7Qnk5gsXqP1tQJy2tNFbOQCQhh5Fmyl8D89I97h3f5eA7+M7ecwqO89uAJJ
 AzUHah4KylF1a9SUW4aVd2D5Pp/xvDzhdPt6dAU15H7coBQUwNpR7QFrNRJwNA2H
 7WwFz8y0FFW6VNfy7sBxpc7yDStp7Efj2eHzhtve0odiSO0VtVGDjh4nawq4EKnQ
 PYH9N43+QAjpYovmPXFg==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6w3w6p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 20:14:05 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-615bb7de238so3211621eaf.2
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 13:14:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753215244; x=1753820044;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8stxXKOwM0cdX2+Hk7JZb+wP6e0PjVEkB1BIKQ6OkUU=;
 b=WNwi+KdIbUuK4b5TcgDGQgLUmc2DSkLJIEZdrlN4cl5UKl+nfI+MsZX1fM1SGKxSHR
 VtyYTl9XgA/HM6hEZIzsOxXebwGVuNjLGWaFkgQYiPAJ72XleQ9n9VLgK7XYRVh2i+n1
 r0G8Wizjvi0+YLPuirICtR7OJPS8cPJiF9W7Q9JIIo0Srr97UWics10fGw6yriup4Zn7
 UKt5bzdxMTW6gxI1GdaRAyWBOWhjDT0wLw4FnqFMF8pEpVQfWYMyBzUS1slQx10VT20w
 vXDyGobJ9DZcX5YAXxIfWq6zq0tPPy2i2SWmsTEYVahqCfxP+itDHrfmZxvBdv2kPdTV
 ir7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3GC9dsGFOADqc44dmmm38/9TeIT3L+wM6wD5yrMpB2yCMMmd43P5XmOC6JcXQn6n/9EczJ8N+cEQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrT6NYtTjEYJ5gtCgBe4qQMYfY7KpYnro4wlK9xMTCytou84CS
 8whv7m1ISfyF8BkocH43Yi3v6ubCPu09HdXxfEGxGhVds+iartm+K5aar0Eo4QagmjVihjzxhhy
 TlD20YWez2ptTZZmEVPtYKD/4wgIeURsM6RYZwfatArhAzfB3ZXuai3bPF+fzIcYj6XRRuWBjuq
 jxTIJnclMudOJNYroO3sgRLPOqqGi/11JMekejr2nDbIJBiQ==
X-Gm-Gg: ASbGnctCHdqvUL5tqyZwKVFT6c4X1aPHBDJVZdaEzftvUgilQwBz+OnY5UuzoGIaqu+
 IZIZr55vPkjmfR6lFDE6f6xhYQgq7RIC2SBNNhithFX8ix+6KWc2B65eFTYAfENHGNgN/QDs2Ap
 +yFsFlpAAlzvS3YUqJdmA7EKAVbAirKGi/kIcBNY67zu+QBYHSC6pp
X-Received: by 2002:a05:6820:a0b:b0:615:ac59:7613 with SMTP id
 006d021491bc7-6187d8bb150mr216595eaf.5.1753215244331; 
 Tue, 22 Jul 2025 13:14:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRLfuP1mZvVGnFE90xA1qN98KJGEEZE/W+UJS6YZQ2+JoDxvhTQ5iyKIyEb8QPf1XuzCh9CdlUZbBrwge/XuA=
X-Received: by 2002:a05:6820:a0b:b0:615:ac59:7613 with SMTP id
 006d021491bc7-6187d8bb150mr216565eaf.5.1753215243967; Tue, 22 Jul 2025
 13:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-12-9347aa5bcbd6@oss.qualcomm.com>
 <vng6tut4sv3zfbwogsb74omqsbqutpeskqdnezbs4ftsanqyb4@nv35r7mqmcva>
 <CACSVV01EhWWohUDQ8n=FQeDuaDcgmYnMBJDMJ8D1Gist1NR4QQ@mail.gmail.com>
 <800f8c9d-5586-46a7-aa83-dfb3b97633e0@oss.qualcomm.com>
In-Reply-To: <800f8c9d-5586-46a7-aa83-dfb3b97633e0@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 13:13:53 -0700
X-Gm-Features: Ac12FXxPdajDniaWioq_6FbnrOl577Rcgtye0_PYpxo5MDWq0dAn_9MbJWgKs3E
Message-ID: <CACSVV00d4rbNDOLVZJTBNRmUsGyY6Tkwzv0cHRomeYyMXWHZVA@mail.gmail.com>
Subject: Re: [PATCH 12/17] drm/msm: Skip devfreq IDLE when possible
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=687ff10d cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=DNA1iQAdpGljtBPL7O4A:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE3NCBTYWx0ZWRfX6U/DVJXfk+PS
 UrfcdOj6eQ5QBpl4WkDurrHRd3jnV9W9Bh9v6cB0Sp4Ro9WsjZqtLxm1iu779baQGzsuHyrEwxt
 7YvL8I2Onx/VAkmyDaYseG4eiA0kxv4MMVM+EZ8w6R1ssfPg+03FjjA0/QedQ7du9lc9z6pNgjh
 j44gjXvi9rVnng9mY8qM0KjcvZrvI5EpqH3DjzVZ2Qp6kYiNggl0NBy8duhOy8uIJdo55TNX3gI
 ZoQwbjevCebcuKd59whM8LiE0vWzYUx/+69Rtxy6o3apPIOgkq6KPeMMgQBKxJFDIf+M1Qx0t+Z
 sz2XbhkguAxaFyQ/dr/s5m8j9RCGPHoBMgbtpC8wUxsTv82GdMmGpoW+25UUTM/X55U6DN7cFqT
 ydrwWSklpcsXst4JgdHPWNUHNQ83L2PXzJhIYoCvnS8m4LnCWqmr29k77LYadb3kQEjqpluM
X-Proofpoint-ORIG-GUID: 8187dc1u5E66yh7GbQISOR8w2ERw9sUC
X-Proofpoint-GUID: 8187dc1u5E66yh7GbQISOR8w2ERw9sUC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220174
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

On Tue, Jul 22, 2025 at 12:23=E2=80=AFPM Akhil P Oommen
<akhilpo@oss.qualcomm.com> wrote:
>
> On 7/22/2025 9:08 PM, Rob Clark wrote:
> > On Tue, Jul 22, 2025 at 6:50=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>
> >> On Sun, Jul 20, 2025 at 05:46:13PM +0530, Akhil P Oommen wrote:
> >>> When IFPC is supported, devfreq idling is redundant and adds
> >>> unnecessary pm suspend/wake latency. So skip it when IFPC is
> >>> supported.
> >>
> >> With this in place we have a dummy devfreq instance which does nothing=
.
> >> Wouldn't it be better to skip registering devfreq if IFPC is supported
> >> on the platform?
> >
> > devfreq is still scaling the freq.  What is being bypassed is
> > essentially a CPU based version of IFPC (because on sc7180 we didn't
> > have IFPC
> >
> > Currently only a618 and 7c3 enable gpu_clamp_to_idle.. if at some
> > point those grew IFPC support we could remove the trickery to drop GPU
> > to min freq when it is idle altogether.
>
> There are 2 functionalities here:
> 1. Clamp-to-idle: enabled only on a618/7c3
> 2. boost-after-idle: Enabled for all GPUs.
>
> With this patch, we are skipping both when IFPC is supported. In the
> absence of latency due to clamp-to-idle, do you think a618 (relatively
> weaker GPU) would require boost-after-idle to keep with the
> UI/composition workload for its typical configuration (1080p@60hz)? If
> yes, I should probably create a quirk to disable boost-after-idle for
> premium tier GPUs, instead of tying it to IFPC feature.

Hmm, yeah.. I suppose _this_ patch should only skip clamp-to-idle.  It
is a different topic, boost-after-idle.

BR,
-R

> -Akhil.
>
> >
> > BR,
> > -R
> >
> >>>
> >>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>> ---
> >>>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 6 ++++++
> >>>  1 file changed, 6 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/=
msm/msm_gpu_devfreq.c
> >>> index 2e1d5c3432728cde15d91f69da22bb915588fe86..53ef2add5047e7d6b6371=
af949cab36ce8409372 100644
> >>> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> >>> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> >>> @@ -4,6 +4,7 @@
> >>>   * Author: Rob Clark <robdclark@gmail.com>
> >>>   */
> >>>
> >>> +#include "adreno/adreno_gpu.h"
> >>>  #include "msm_gpu.h"
> >>>  #include "msm_gpu_trace.h"
> >>>
> >>> @@ -300,6 +301,8 @@ void msm_devfreq_active(struct msm_gpu *gpu)
> >>>       if (!has_devfreq(gpu))
> >>>               return;
> >>>
> >>> +     if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
> >>> +             return;
> >>>       /*
> >>>        * Cancel any pending transition to idle frequency:
> >>>        */
> >>> @@ -370,6 +373,9 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
> >>>       if (!has_devfreq(gpu))
> >>>               return;
> >>>
> >>> +     if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
> >>> +             return;
> >>> +
> >>>       msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
> >>>                              HRTIMER_MODE_REL);
> >>>  }
> >>>
> >>> --
> >>> 2.50.1
> >>>
> >>
> >> --
> >> With best wishes
> >> Dmitry
>
