Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 038034DCC73
	for <lists+freedreno@lfdr.de>; Thu, 17 Mar 2022 18:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3BA310E717;
	Thu, 17 Mar 2022 17:29:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9584810E71D
 for <freedreno@lists.freedesktop.org>; Thu, 17 Mar 2022 17:29:33 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id u10so8321785wra.9
 for <freedreno@lists.freedesktop.org>; Thu, 17 Mar 2022 10:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=8bKHLTXLh3Prk0x7Kjt1KuDZoyhkHjZ+7FeBGH5Uapo=;
 b=KGxafnM3qSYdU4CWYMi0SB6NNYPDBifAXbe2jqJL/qXULaaQ+MT9nrXnwx6FBn4e7X
 ESQY1KvTvkAnL8cj9hWkHb5PKlmdM5BFnaP4dgIUu6pD7+G1hEyRdZZZs8US0zhnKmEi
 fSiqWxuJQV5wCsL6OUaXZbDvIXAVamf91ff6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=8bKHLTXLh3Prk0x7Kjt1KuDZoyhkHjZ+7FeBGH5Uapo=;
 b=MUBiSOkHFLmFj8SJjg19rigx+nFzB6DdtGS/2q56I60JurJ+SFg2QVGn7cNKFOUiQk
 GQ9qZWhx5I99i5KyqN/c+Ectq+5u4u6nM9fO4xfCSTsnnM633lMvbpgy59An7v31Xdis
 stPINoXwget1Ag22RY5f9ahiiEQp55O2h6f7tqeAgFEbHRcyeLOkner6KKpGC3nrK97W
 1U70Zeuxxt/3wgaZljyiH09/745EsF0ZGRX3jxzPG5uUqkXbWYZ1mqzESooSsvyFNwOi
 9KTCT5ArTIn4Y/S3wjO4ZURQ7SkOWKVteC/7BmcitFJiOOQW9Nvkzfam7c3q1wsX7FGS
 blzg==
X-Gm-Message-State: AOAM531vPErf22t2GwfdFKvRCWgjhn0I+hGQmoYdXuDMcnx7NvakC2BP
 aakwJtgeA1E5k+Aqjz2J2mO0Qg==
X-Google-Smtp-Source: ABdhPJzoRAo3np0fazhW9XxJ7KsRXfdgnZ3L0q1YWfSdtT6Ap0qveKDccvepjyTYUjg/8j2AHQh5Hg==
X-Received: by 2002:a5d:528b:0:b0:203:d928:834c with SMTP id
 c11-20020a5d528b000000b00203d928834cmr5178984wrv.500.1647538172004; 
 Thu, 17 Mar 2022 10:29:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05600c0a4b00b0037c91e085ddsm9709824wmq.40.2022.03.17.10.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 10:29:31 -0700 (PDT)
Date: Thu, 17 Mar 2022 18:29:29 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Message-ID: <YjNv+csmFyjNYc5b@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Rob Clark <robdclark@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 freedreno <freedreno@lists.freedesktop.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220310234611.424743-1-robdclark@gmail.com>
 <20220310234611.424743-3-robdclark@gmail.com>
 <YjMGac4Hnjmg1wE8@phenom.ffwll.local>
 <3945551d-47d2-1974-f637-1dbc61e14702@amd.com>
 <CAF6AEGv36V8bLoDn5O1SW3iTUtzd3O1XeuT5gJxyLMxd1E-o3Q@mail.gmail.com>
 <865abcff-9f52-dca4-df38-b11189c739ff@amd.com>
 <CAF6AEGuoBeYoMTR6-KM9xGZ05XSSnSJWMDciawczi7qtiLN9Vw@mail.gmail.com>
 <915537e2-ac5b-ab0e-3697-2b16a9ec8f91@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <915537e2-ac5b-ab0e-3697-2b16a9ec8f91@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Subject: Re: [Freedreno] [PATCH 2/3] drm/msm/gpu: Park scheduler threads for
 system suspend
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, freedreno <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Mar 17, 2022 at 05:44:57PM +0100, Christian K�nig wrote:
> Am 17.03.22 um 17:18 schrieb Rob Clark:
> > On Thu, Mar 17, 2022 at 9:04 AM Christian K�nig
> > <christian.koenig@amd.com> wrote:
> > > Am 17.03.22 um 16:10 schrieb Rob Clark:
> > > > [SNIP]
> > > > userspace frozen != kthread frozen .. that is what this patch is
> > > > trying to address, so we aren't racing between shutting down the hw
> > > > and the scheduler shoveling more jobs at us.
> > > Well exactly that's the problem. The scheduler is supposed to shoveling
> > > more jobs at us until it is empty.
> > > 
> > > Thinking more about it we will then keep some dma_fence instance
> > > unsignaled and that is and extremely bad idea since it can lead to
> > > deadlocks during suspend.
> > Hmm, perhaps that is true if you need to migrate things out of vram?
> > It is at least not a problem when vram is not involved.
> 
> No, it's much wider than that.
> 
> See what can happen is that the memory management shrinkers want to wait for
> a dma_fence during suspend.
> 
> And if you stop the scheduler they will just wait forever.
> 
> What you need to do instead is to drain the scheduler, e.g. call
> drm_sched_entity_flush() with a proper timeout for each entity you have
> created.

Yeah I think properly flushing the scheduler and stopping it and cutting
all drivers over to that sounds like the right approach. Generally suspend
shouldn't be such a critical path that this will hurt us, all the other io
queues get flushed too afaik.

Resume is the thing that needs to go real fast.

So a patch set to move all drivers that open code the kthread_park to the
right scheduler function sounds like the right idea here to me.
-Daniel

> 
> Regards,
> Christian.
> 
> > 
> > > So this patch here is an absolute clear NAK from my side. If amdgpu is
> > > doing something similar that is a severe bug and needs to be addressed
> > > somehow.
> > I think amdgpu's use of kthread_park is not related to suspend, but
> > didn't look too closely.
> > 
> > And perhaps the solution for this problem is more complex in the case
> > of amdgpu, I'm not super familiar with the constraints there.  But I
> > think it is a fine solution for integrated GPUs.
> > 
> > BR,
> > -R
> > 
> > > Regards,
> > > Christian.
> > > 
> > > > BR,
> > > > -R
> > > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
