Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE9FB869C3
	for <lists+freedreno@lfdr.de>; Thu, 18 Sep 2025 21:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D4810E8E7;
	Thu, 18 Sep 2025 19:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ERQ0hiWd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2324310E8E8
 for <freedreno@lists.freedesktop.org>; Thu, 18 Sep 2025 19:05:28 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IFjeuY003337
 for <freedreno@lists.freedesktop.org>; Thu, 18 Sep 2025 19:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yTnlkubgXN3pvYwP0kv0Ntpu3yy4hFj+2++sr6eyVII=; b=ERQ0hiWdhED1+hVs
 J0/MeEEi0+IZV8Upbxj1WTjsAlPdz02EhLlQiC1Kl11q1uYZjkrutpYzbQHqQGGm
 SSz+DkfXX/RFrDyl8BMDgncFh0Sevew1eS0zCiAsoyPTKK9WuVh+w9AfC8d3eSWg
 ZDA8T4i/nFfFt+miKxjqGJ/Tkh/f5PJBqEniqygBvWhhpoX5zNd794bLRNaP33CT
 1M7muhKKCGGe2XdJyPCyPLO2hqha4UmKpOzF551pkQJObmMNZBzXTGKkMuN502Ez
 dAE7HPAkyvV9ozsenswUZj0uF+JMFusBjOlMj2no4JKU/+i5vK04bHD452chchWQ
 XnuGEg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497wqgw994-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 18 Sep 2025 19:05:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-718cb6230afso23452716d6.0
 for <freedreno@lists.freedesktop.org>; Thu, 18 Sep 2025 12:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758222326; x=1758827126;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yTnlkubgXN3pvYwP0kv0Ntpu3yy4hFj+2++sr6eyVII=;
 b=bRzsBTPbV+OWvQn3n7AsCy58OF6axWcVFYtHP57WUmywokrxd2YZ7sYx2DZXFSu7wE
 WPDbFJTaQdRNCsSIYE+HCkJ3Ym3L17j0iPTOPjq2ogZD59Hab7/zuXXebBYDmhq+YMHK
 HU+t64b19MgMIc4tKLuJanJfX+PKloFbJJAwo/nYsXBrevPyGy4s33Y95tMSdfAcy79N
 PbCBlBD6+uPpovdY4q8+hcMmTIPgg8FWqGFpOaNUFeITsVfLJiD5NhtISTYTZ8ajF4nw
 zIWpjsU0dawD2d3+rTarpZbllgJA6y4ffvdtw6xjv/FEPH99SnSUmJxs2ZOswpdbInpM
 FDLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+v3ODnwsBaxGmJ7i0fOeXFToUJqBisjNUJT//TgHvVdLKWmcnC0tAXLgE6kcIdywzb0VPghVj+oY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSfdK0qnWkEOPpBH8kdvPK2i6mOhEsFVGvI+IZGHyYX3KVEaH/
 7+6oKhNZTsxfZTqo/U+yh2q/DngdlQFwOOcy7Ww7ux0pRuaIYdKMjB2QofJdRT9C6qWQMU5Yk4F
 xCmeC8gOd27ChuTT0fCusCLmKW413ka3AuQMFGuOWG5I6z7s4TTsKlE4NjgQ0bLB5G8Qq2Lk=
X-Gm-Gg: ASbGnctObfdOZ71rHeV2ab4QSd7WeMqTeYfTVUPX0VmHwBiZnlcqo/lsFsMWQceuQba
 zkQVkugS0GPaG6yszQ+yezPA8EDeUalyw9mpBDKs8JWvIi4w2fzajBteUM7u+b61hDirZhMZjlU
 /kcBg066QbrzDEX07jD7LdlpKkeSoOqHsQN4qfpSHbBFq7L7ANsTysEtbGG9toddlQMkKnoo9oE
 lOw6eY6tlBjN41p3JEybu9odss5GXSM0KDoJmC9ms/9BLBlbDQ1V/wihxNegh/DYvbmli2kBGbz
 radd1BOX5xs6/a8Pzqx3yNRxHm0a6QdPyv90kXlZXnre8P9sJoN+SgmjAHG7oaK8DX7bYbEgTvp
 sH62zcXxQl41gRtgMKbvkBMstsmI5zccqwGzgRx09lgiys3ccEYsc
X-Received: by 2002:a05:6214:2482:b0:780:6e19:8ed with SMTP id
 6a1803df08f44-7991e49eb72mr7161866d6.65.1758222325859; 
 Thu, 18 Sep 2025 12:05:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEm4oJ0+aXHSlFoCgy0RIeo++8o8ouiSBaRi8HkPi1nbfIvBuioYVVK0oJj5NFbUoBqHtRQEg==
X-Received: by 2002:a05:6214:2482:b0:780:6e19:8ed with SMTP id
 6a1803df08f44-7991e49eb72mr7161156d6.65.1758222325187; 
 Thu, 18 Sep 2025 12:05:25 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-361a26cb93bsm7775931fa.16.2025.09.18.12.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 12:05:24 -0700 (PDT)
Date: Thu, 18 Sep 2025 22:05:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v5 2/5] drm/msm: split VM_BIND from the rest of GEM VMA
 code
Message-ID: <oepspnsohjueyafzk6c2qp2o7vhh4eax73po4byejacujyoiam@7avjrl6alhq2>
References: <20250918-msm-gpu-split-v5-0-44486f44d27d@oss.qualcomm.com>
 <20250918-msm-gpu-split-v5-2-44486f44d27d@oss.qualcomm.com>
 <CACSVV036k+VwtLEvX4ATG7h7fTpXAzUuOZr9AY4WzwJWFvw0zQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV036k+VwtLEvX4ATG7h7fTpXAzUuOZr9AY4WzwJWFvw0zQ@mail.gmail.com>
X-Proofpoint-ORIG-GUID: rbaMHGRVaytpxFoTRhj_O85kRxL3FaaX
X-Authority-Analysis: v=2.4 cv=HITDFptv c=1 sm=1 tr=0 ts=68cc57f6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=YIf0c4_oue8ogryinRwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: rbaMHGRVaytpxFoTRhj_O85kRxL3FaaX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDEyOCBTYWx0ZWRfX02AJiy49fmyU
 o1jpciME3FoRNtycd4S/OQcQaLHgyAujzRXBdxW5tiO43wqP5cyYwWlXRND8l+L+jLxsxU40qMK
 kCd/xreLjIlIG+rHWGjl+w0aGPinyoc+8rdexPHOld8ASDQCn/Ow0Moxsr6BOTH6fkF7zx0sN6V
 DafHBxbA64MP7+TezXPakHFdzNFkS6YMOumlGj0kJfe+Uo5MmWpOl7CqrqYtK15lo6x5g4+ccMv
 uUQ0lgi1Q7FLEynfW6cKhCN2d1NavhIKDjnhVJgjH4azyFLGkRNqGAbW3/IcxScsv/iF1/pm410
 soXTRqSTcHMJ9kExe/EccJ+tJLJOcB801D/NN2FHuAacq8Lx05XhBcq5hqQpIDkKfckIMm0CrU/
 HjPLHfRP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_02,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170128
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

On Thu, Sep 18, 2025 at 07:46:32AM -0700, Rob Clark wrote:
> On Wed, Sep 17, 2025 at 8:51 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > In preparation to disabling GPU functionality split VM_BIND-related
> > functions (which are used only for the GPU) from the rest of the GEM VMA
> > implementation.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/Makefile          |    1 +
> >  drivers/gpu/drm/msm/msm_gem_vm_bind.c | 1116 +++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/msm/msm_gem_vma.c     | 1177 +--------------------------------
> >  drivers/gpu/drm/msm/msm_gem_vma.h     |  105 +++
> >  4 files changed, 1225 insertions(+), 1174 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> > index 0c0dfb25f01b193b10946fae20138caf32cf0ed2..d7876c154b0aa2cb0164c4b1fb7900b1a42db46b 100644
> > --- a/drivers/gpu/drm/msm/Makefile
> > +++ b/drivers/gpu/drm/msm/Makefile
> > @@ -115,6 +115,7 @@ msm-y += \
> >         msm_gem_shrinker.o \
> >         msm_gem_submit.o \
> >         msm_gem_vma.o \
> > +       msm_gem_vm_bind.o \
> >         msm_gpu.o \
> >         msm_gpu_devfreq.o \
> >         msm_io_utils.o \
> 
> [snip]
> 
> > diff --git a/drivers/gpu/drm/msm/msm_gem_vma.h b/drivers/gpu/drm/msm/msm_gem_vma.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..f702f81529e72b86bffb4960408f1912bc65851a
> > --- /dev/null
> > +++ b/drivers/gpu/drm/msm/msm_gem_vma.h
> > @@ -0,0 +1,105 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (C) 2016 Red Hat
> > + * Author: Rob Clark <robdclark@gmail.com>
> > + */
> > +
> > +#ifndef _MSM_GEM_VMA_H_
> > +#define _MSM_GEM_VMA_H_
> > +
> > +#define vm_dbg(fmt, ...) pr_debug("%s:%d: "fmt"\n", __func__, __LINE__, ##__VA_ARGS__)
> > +
> > +/**
> > + * struct msm_vm_map_op - create new pgtable mapping
> > + */
> > +struct msm_vm_map_op {
> > +       /** @iova: start address for mapping */
> > +       uint64_t iova;
> > +       /** @range: size of the region to map */
> > +       uint64_t range;
> > +       /** @offset: offset into @sgt to map */
> > +       uint64_t offset;
> > +       /** @sgt: pages to map, or NULL for a PRR mapping */
> > +       struct sg_table *sgt;
> > +       /** @prot: the mapping protection flags */
> > +       int prot;
> > +
> > +       /**
> > +        * @queue_id: The id of the submitqueue the operation is performed
> > +        * on, or zero for (in particular) UNMAP ops triggered outside of
> > +        * a submitqueue (ie. process cleanup)
> > +        */
> > +       int queue_id;
> > +};
> > +
> > +/**
> > + * struct msm_vm_unmap_op - unmap a range of pages from pgtable
> > + */
> > +struct msm_vm_unmap_op {
> > +       /** @iova: start address for unmap */
> > +       uint64_t iova;
> > +       /** @range: size of region to unmap */
> > +       uint64_t range;
> > +
> > +       /** @reason: The reason for the unmap */
> > +       const char *reason;
> > +
> > +       /**
> > +        * @queue_id: The id of the submitqueue the operation is performed
> > +        * on, or zero for (in particular) UNMAP ops triggered outside of
> > +        * a submitqueue (ie. process cleanup)
> > +        */
> > +       int queue_id;
> > +};
> > +
> > +static void
> > +vm_log(struct msm_gem_vm *vm, const char *op, uint64_t iova, uint64_t range, int queue_id)
> 
> These would have to be static-inline
> 
> But overall I'm not sure how I feel about this.. I guess the goal is
> to reduce the size of a kms-only driver?  If so, I think you could do
> better with some ugly ifdef (for ex, you could also remove scheduler
> and other fields not used by kernel managed VMs from msm_gem_vm).

More or less so. I also wanted to separate the complicated parts from
the simple GEM parts, but I see your point too.

I was also trying to trim the dependencies, but this can be #ifdef'd.

> I'm not sure how much the savings would be, or if it is worth the pain
> (ie. extra build configurations to test going forward, etc).  Having
> no GPU doesn't seem like a case worth optimizing for, tbh.  You could
> still have a single driver which binds to multiple different devices,
> ie. if # of GPUs != # of DPUs without this with no change in
> footprint.

Counting GPUs and DPUs isn't that easy, because this also makes things
assymmetric: some of the GPU/DPU pairs can be handled natively, some of
them need to have buffers exported and then imported. We also have a
usecase of splitting the GPU driver because for some of the workloads it
would be better to load just the GPU driver or just the display driver
(possibly replacing the other one with the proprietary driver).

> 
> BR,
> -R
> 
> 
> 
> 
> > +{
> > +       int idx;
> > +
> > +       if (!vm->managed)
> > +               lockdep_assert_held(&vm->mmu_lock);
> > +
> > +       vm_dbg("%s:%p:%d: %016llx %016llx", op, vm, queue_id, iova, iova + range);
> > +
> > +       if (!vm->log)
> > +               return;
> > +
> > +       idx = vm->log_idx;
> > +       vm->log[idx].op = op;
> > +       vm->log[idx].iova = iova;
> > +       vm->log[idx].range = range;
> > +       vm->log[idx].queue_id = queue_id;
> > +       vm->log_idx = (vm->log_idx + 1) & ((1 << vm->log_shift) - 1);
> > +}
> > +
> > +static void
> > +vm_unmap_op(struct msm_gem_vm *vm, const struct msm_vm_unmap_op *op)
> > +{
> > +       const char *reason = op->reason;
> > +
> > +       if (!reason)
> > +               reason = "unmap";
> > +
> > +       vm_log(vm, reason, op->iova, op->range, op->queue_id);
> > +
> > +       vm->mmu->funcs->unmap(vm->mmu, op->iova, op->range);
> > +}
> > +
> > +static int
> > +vm_map_op(struct msm_gem_vm *vm, const struct msm_vm_map_op *op)
> > +{
> > +       vm_log(vm, "map", op->iova, op->range, op->queue_id);
> > +
> > +       return vm->mmu->funcs->map(vm->mmu, op->iova, op->sgt, op->offset,
> > +                                  op->range, op->prot);
> > +}
> > +
> > +int msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *_arg);
> > +int msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg);
> > +int msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *_arg);
> > +
> > +int msm_gem_vm_sched_init(struct msm_gem_vm *vm, struct drm_device *drm);
> > +void msm_gem_vm_sched_fini(struct msm_gem_vm *vm);
> > +
> > +#endif
> >
> > --
> > 2.47.3
> >

-- 
With best wishes
Dmitry
