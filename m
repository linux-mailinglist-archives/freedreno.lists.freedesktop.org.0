Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 109D96F0D18
	for <lists+freedreno@lfdr.de>; Thu, 27 Apr 2023 22:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C7610E0CD;
	Thu, 27 Apr 2023 20:26:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C882210E0CD
 for <freedreno@lists.freedesktop.org>; Thu, 27 Apr 2023 20:26:22 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 6C5D41FA82;
 Thu, 27 Apr 2023 22:26:20 +0200 (CEST)
Date: Thu, 27 Apr 2023 22:26:19 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Message-ID: <lbd7vhrjbl5lsno2gc2pdd56rp7n4lfhmr5xvbxnjwaacn4nub@7p27sam6t6gp>
References: <20230426192246.5517-1-quic_abhinavk@quicinc.com>
 <20230426192246.5517-3-quic_abhinavk@quicinc.com>
 <a1a4f31e-b591-498d-d99e-872661d154d1@linaro.org>
 <5b0fb557-482b-a3df-613e-371eddfee93b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5b0fb557-482b-a3df-613e-371eddfee93b@quicinc.com>
Subject: Re: [Freedreno] [PATCH v2 3/4] drm/msm/dpu: remove GC related code
 from dpu catalog
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, quic_jesszhan@quicinc.com,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-04-27 13:20:28, Abhinav Kumar wrote:
<snip>

> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >> @@ -127,12 +127,10 @@ enum {
> >>   /**
> >>    * DSPP sub-blocks
> >>    * @DPU_DSPP_PCC             Panel color correction block
> >> - * @DPU_DSPP_GC              Gamma correction block
> >>    * @DPU_DSPP_IGC             Inverse gamma correction block
> >>    */
> >>   enum {
> >>       DPU_DSPP_PCC = 0x1,
> >> -    DPU_DSPP_GC,
> >>       DPU_DSPP_IGC,
> > 
> > Don't we need to remove this one too (in the previous patch)?
> 
> Yes, we should. I thought of it right after sending this. will push a v3 
> which fixes it in the prev patch.

Yes please.  Don't forget to mention that dpu_dspp_sub_blks didn't even
have an igc member describing the block.

- Marijn

> >>       DPU_DSPP_MAX
> >>   };
> >> @@ -433,22 +431,18 @@ struct dpu_sspp_sub_blks {
> >>    * @maxwidth:               Max pixel width supported by this mixer
> >>    * @maxblendstages:         Max number of blend-stages supported
> >>    * @blendstage_base:        Blend-stage register base offset
> >> - * @gc: gamma correction block
> >>    */
> >>   struct dpu_lm_sub_blks {
> >>       u32 maxwidth;
> >>       u32 maxblendstages;
> >>       u32 blendstage_base[MAX_BLOCKS];
> >> -    struct dpu_pp_blk gc;
> >>   };
> >>   /**
> >>    * struct dpu_dspp_sub_blks: Information of DSPP block
> >> - * @gc : gamma correction block
> >>    * @pcc: pixel color correction block
> >>    */
> >>   struct dpu_dspp_sub_blks {
> >> -    struct dpu_pp_blk gc;
> >>       struct dpu_pp_blk pcc;
> >>   };
> > 
