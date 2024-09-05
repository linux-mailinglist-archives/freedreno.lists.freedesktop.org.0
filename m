Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB9796DA56
	for <lists+freedreno@lfdr.de>; Thu,  5 Sep 2024 15:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C6E10E8B4;
	Thu,  5 Sep 2024 13:31:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tPeVYyiH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F2710E8B7
 for <freedreno@lists.freedesktop.org>; Thu,  5 Sep 2024 13:31:02 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2f74e468baeso5769861fa.2
 for <freedreno@lists.freedesktop.org>; Thu, 05 Sep 2024 06:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725543061; x=1726147861; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=u3k38Kc8SysJksU5Yyhb2OSFNacT0HPlW64jE0pgeAk=;
 b=tPeVYyiHQE3/u+Y8EydxaK/o9ThWzdSJKp+BDef3raNl67YAf6D8VPA8RHrPBmr1+4
 /WswZrq26H7SZr33HZqF7NagTlYMaVYtg8GtM+RdrpvEvQ2htYI/mbyCEa7VjfAdmExt
 3QefimlfUiF40CajZl1Ff37nnkNHR0SVzahKOTocQe6r39CIdypgWQf4llXZwH9TC2Bz
 4/qsSnaDPpZXLgOD7xYmnq2TSfw0dKqS7k+uLdxmayAMLzrvo4VvPBeybr0TDiBF37ys
 sj/OIJxM740wd1Z+FOnSoram3ISIF1c/9lDTLqoDN5+Q9O3N/zqLprBKZjKD2ZfBqNjP
 /v9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725543061; x=1726147861;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u3k38Kc8SysJksU5Yyhb2OSFNacT0HPlW64jE0pgeAk=;
 b=Sg21Dcs4CcNyiy6YTytpGTwl8POhWw2IFmVdN32f/CxdT5d8Ab+seT6ty1Pdlwn3RX
 NuaD3hnBE7S5o+YNehpTfseQ2rKLBKJg7SbJJ6vPzV+w6fVEp26QeD0mkxe2sKwTtF0S
 qCeVOI/2r7pnS1sPi7htvlA6yu0tQjNNLe9eNTYZWgOKz4VX9r0hDfSbqVLeBuYQ6VPO
 lQoSJyLsFqaQxoyif6Dm44xbD/ktKEOANPGY6TdXZtEpiSHB2QqTSLCRkiz5u4E9kYVj
 ZFhu5J4ERJlPLqbX2926jJfuh7SL6oqA4DCOn8IJlggjGy8m+KGfEN85ERHxKfuEcI6b
 84LQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbQFmIp6vmGG652Pl/uGNw6/nDx5NcaTAtlC4HFKGqvIcWWHqA2rInDrU3W8XZP+KfLERVJBnozDw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNMaD60wG/BQRPjCiASyfyOcnaiwSGvZ2bIB3+ddMaVcB6v3NY
 i5+q+l02z5YM+W6qKs0ucTrBt+4GmViSmRpbWpr/lQaFAh46BXmrk+c1OKFCJmo=
X-Google-Smtp-Source: AGHT+IFSzRPX0vhrJF4hsWI0jD6hUXLgrjoxaCWQKO60u2DVzfx/QrL8RLTYXfoMlWEoHfD0p9vpbg==
X-Received: by 2002:a05:651c:b13:b0:2f1:6cb1:44c0 with SMTP id
 38308e7fff4ca-2f61038c633mr185813771fa.6.1725543060140; 
 Thu, 05 Sep 2024 06:31:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f614eff0d8sm28799801fa.30.2024.09.05.06.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 06:30:59 -0700 (PDT)
Date: Thu, 5 Sep 2024 16:30:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 11/21] drm/msm/dpu: Add RM support for allocating CWB
Message-ID: <7ya6xrvbhdqddkglzzj6mtdxn735j56quguhohd5oid7vqut2w@wygb7ryzkj4r>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-11-502b16ae2ebb@quicinc.com>
 <pf6xgu7yjanzjigfpupons4ud6jbcmbr5icnd7yur6qhh3n5sf@plj4bi3beguw>
 <665da6e9-d9f3-4a28-a53b-0f467967fc78@quicinc.com>
 <CAA8EJpo0X7yRaqYV-tTco9+9WyexiPN_ey8hKivFrE3jTojUpg@mail.gmail.com>
 <0e5dc874-0b50-4a6b-ba98-83cb01f7cce6@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e5dc874-0b50-4a6b-ba98-83cb01f7cce6@quicinc.com>
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

On Tue, Sep 03, 2024 at 06:04:13PM GMT, Jessica Zhang wrote:
> 
> 
> On 8/30/2024 3:16 PM, Dmitry Baryshkov wrote:
> > On Fri, 30 Aug 2024 at 22:28, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 8/30/2024 10:18 AM, Dmitry Baryshkov wrote:
> > > > On Thu, Aug 29, 2024 at 01:48:32PM GMT, Jessica Zhang wrote:
> > > > > Add support for allocating the concurrent writeback mux as part of the
> > > > > WB allocation
> > > > > 
> > > > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > > > ---
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  5 ++++-
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 30 +++++++++++++++++++++++++++--
> > > > >    2 files changed, 32 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > > index c17d2d356f7a..c43cb55fe1d2 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > > @@ -1,5 +1,7 @@
> > > > >    /* SPDX-License-Identifier: GPL-2.0-only */
> > > > > -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> > > > > +/*
> > > > > + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> > > > > + * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> > > > >     */
> > > > > 
> > > > >    #ifndef _DPU_HW_MDSS_H
> > > > > @@ -352,6 +354,7 @@ struct dpu_mdss_color {
> > > > >    #define DPU_DBG_MASK_DSPP     (1 << 10)
> > > > >    #define DPU_DBG_MASK_DSC      (1 << 11)
> > > > >    #define DPU_DBG_MASK_CDM      (1 << 12)
> > > > > +#define DPU_DBG_MASK_CWB      (1 << 13)
> > > > > 
> > > > >    /**
> > > > >     * struct dpu_hw_tear_check - Struct contains parameters to configure
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > > > index bc99b04eae3a..738e9a081b10 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > > > @@ -1,9 +1,10 @@
> > > > >    // SPDX-License-Identifier: GPL-2.0-only
> > > > >    /*
> > > > >     * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
> > > > > - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> > > > > + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> > > > >     */
> > > > > 
> > > > > +#include <drm/drm_managed.h>
> > > > >    #include "msm_drv.h"
> > > > >    #define pr_fmt(fmt)        "[drm:%s] " fmt, __func__
> > > > >    #include "dpu_kms.h"
> > > > > @@ -34,6 +35,7 @@ int dpu_rm_init(struct drm_device *dev,
> > > > >               void __iomem *mmio)
> > > > >    {
> > > > >       int rc, i;
> > > > > +    struct dpu_hw_blk_reg_map *cwb_reg_map;
> > > > > 
> > > > >       if (!rm || !cat || !mmio) {
> > > > >               DPU_ERROR("invalid kms\n");
> > > > > @@ -100,11 +102,35 @@ int dpu_rm_init(struct drm_device *dev,
> > > > >               rm->hw_intf[intf->id - INTF_0] = hw;
> > > > >       }
> > > > > 
> > > > > +    if (cat->cwb_count > 0) {
> > > > > +            cwb_reg_map = drmm_kzalloc(dev,
> > > > > +                            sizeof(*cwb_reg_map) * cat->cwb_count,
> > > > > +                            GFP_KERNEL);
> > > > 
> > > > Please move CWB block pointers to dpu_rm. There is no need to allocate a
> > > > separate array.
> > > 
> > > Hi Dmitry,
> > > 
> > > Sorry, I'm not sure what you mean here. Can you clarify your comment?
> > > 
> > > This is just allocating an array of the CWB register addresses so that
> > > the hw_wb block can use it to configure the CWB mux registers.
> > 
> > Excuse me. I asked to make the cwb_reg_map array a part of the
> > existing dpu_rm structure. This way other subblocks can access it
> > through dpu_rm API.
> 
> Got it, thanks for the clarification. Just wondering, is the intent here to
> add CWB to rm's get_assigned_resourced?
> 
> The CWB registers will be handled by hw_wb and isn't referenced anywhere
> outside of hw_wb (aside from when it's being allocated and passed into
> hw_wb_init) so I'm not sure what's the benefit of adding it to the dpu_rm
> struct.

To have a single point where all the blocks are handled, pretty much
like we have a single catalog where all blocks are allocated. Note how
e.g. how MERGE_3D is handled. Or how we return harware instances for
INTF or WB. 

> 
> > 
> > > 
> > > Thanks,
> > > 
> > > Jessica Zhang
> > > 
> > > > 
> > > > > +
> > > > > +            if (!cwb_reg_map) {
> > > > > +                    DPU_ERROR("failed cwb object creation\n");
> > > > > +                    return -ENOMEM;
> > > > > +            }
> > > > > +    }
> > > > > +
> > > > > +
> > > > > +    for (i = 0; i < cat->cwb_count; i++) {
> > > > > +            struct dpu_hw_blk_reg_map *cwb = &cwb_reg_map[i];
> > > > > +
> > > > > +            cwb->blk_addr = mmio + cat->cwb[i].base;
> > > > > +            cwb->log_mask = DPU_DBG_MASK_CWB;
> > > > > +    }
> > > > > +
> > > > >       for (i = 0; i < cat->wb_count; i++) {
> > > > >               struct dpu_hw_wb *hw;
> > > > >               const struct dpu_wb_cfg *wb = &cat->wb[i];
> > > > > 
> > > > > -            hw = dpu_hw_wb_init(dev, wb, mmio, cat->mdss_ver);
> > > > > +            if (cat->cwb)
> > > > > +                    hw = dpu_hw_wb_init_with_cwb(dev, wb, mmio,
> > > > > +                                    cat->mdss_ver, cwb_reg_map);
> > > > > +            else
> > > > > +                    hw = dpu_hw_wb_init(dev, wb, mmio, cat->mdss_ver);
> > > > > +
> > > > >               if (IS_ERR(hw)) {
> > > > >                       rc = PTR_ERR(hw);
> > > > >                       DPU_ERROR("failed wb object creation: err %d\n", rc);
> > > > > 
> > > > > --
> > > > > 2.34.1
> > > > > 
> > > > 
> > > > --
> > > > With best wishes
> > > > Dmitry
> > 
> > 
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
