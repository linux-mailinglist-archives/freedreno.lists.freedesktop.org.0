Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D17433B45
	for <lists+freedreno@lfdr.de>; Tue, 19 Oct 2021 17:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41646E159;
	Tue, 19 Oct 2021 15:53:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A336E159
 for <freedreno@lists.freedesktop.org>; Tue, 19 Oct 2021 15:53:03 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id n66so429422qkn.0
 for <freedreno@lists.freedesktop.org>; Tue, 19 Oct 2021 08:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bob0Tm0hIP2HTFKrFxEk/0E7roQxECXmiqtYRxqYzx8=;
 b=txnXSm72izF/umXW7pS/1I1fY1Jm8SKkXyctJzTcb0Ypz1SY6Y3N01Xf7T0uskdus2
 vpt/QqFXb85JhzmEWKSPJ065DLdAfzrl7FgtYQvlJoqEyXY3magNT76XtyHgpBuvzlmZ
 PC0AI3mcA6dJ1kEm4z54+HSKMuFlgThPRm+/d4EysBslovH9xFtpmze9S93eeatqzuSP
 IYHJKqnCNPUeeAJrgA2KS7Zz4O2hguI1/bRajbOUQ35eAa/movR8N5GvJ331lgPCYdvP
 pl1J0F7oZpgHJHBJ/m5PRo4EucqyccM46A4yuQe6R2k38BaAWWECM0qch28IDCevE4qV
 YyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bob0Tm0hIP2HTFKrFxEk/0E7roQxECXmiqtYRxqYzx8=;
 b=6FO1dzxsNnOMvCFnccJqGJ9ifgXkuZkU8GKd+moGoHpdhqssBuflJUsKsHUkPs01og
 0jUJCOvEKgDZSdyrv5DS6vCVS3xYvbqiX/LrOfgNLbcSDKYCZ/41GIzvX7KYVcJ994kI
 ZQZp61Vd32ns0HAeCc70NEQV9wnbo16i9RgHYOJ8fZaWTq43uQM5fTyeVWOCEeN7G30w
 DXoJ9EixUtyc14cJoBA2+//91gCIpX0zExDWxvN/2SfWQqvfCX/qYIjJO1cV2w6dwmw/
 6ZhDx0zLSg/7jB4cbpVcF1AOB/Qbel+adOi/9xhx8Y4+n+LiEKNNFTWR9J5DUDDsZNT3
 VeOQ==
X-Gm-Message-State: AOAM530AIKvA7gUEbTSPbOlM8z/JJcsY6CYUwVbAnCDJ4hgwrZfkdsyo
 LvyGDy8eMfJzbMPzKZGVjMF2sLc2+pj3H6IhTpMgRg==
X-Google-Smtp-Source: ABdhPJwpFNhYWXDb/DzF5v8VV25OUExn8Buf7i5lwqgaX4fpFPV3/6c9goK2M4HSHXCOSKeZxeg7CcSMg0fOiMKxmQ8=
X-Received: by 2002:a05:620a:1a05:: with SMTP id
 bk5mr615795qkb.195.1634658782471; 
 Tue, 19 Oct 2021 08:53:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211007070900.456044-1-vkoul@kernel.org>
 <20211007070900.456044-5-vkoul@kernel.org>
 <d249d880-1137-d5cc-6d96-83a730f7de29@linaro.org> <YW7koEt85EVMcUDs@matsya>
In-Reply-To: <YW7koEt85EVMcUDs@matsya>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Oct 2021 18:52:51 +0300
Message-ID: <CAA8EJprNTUrh66yqaOCoReWdwLcBc9LfMm=WNDi54o9nzd8RRA@mail.gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>, 
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 open list <linux-kernel@vger.kernel.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 04/11] drm/msm/disp/dpu1: Add DSC support
 in RM
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

On Tue, 19 Oct 2021 at 18:30, Vinod Koul <vkoul@kernel.org> wrote:
>
> On 14-10-21, 17:11, Dmitry Baryshkov wrote:
> > On 07/10/2021 10:08, Vinod Koul wrote:
>
> > > +static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> > > +                          struct dpu_global_state *global_state,
> > > +                          struct drm_encoder *enc)
> > > +{
> > > +   struct msm_drm_private *priv;
> > > +
> > > +   priv = enc->dev->dev_private;
> > > +
> > > +   if (!priv)
> > > +           return -EIO;
> > > +
> > > +   /* check if DSC is supported */
> > > +   if (!priv->dsc)
> > > +           return 0;
> > > +
> > > +   /* check if DSC 0 & 1 and allocated or not */
> > > +   if (global_state->dsc_to_enc_id[0] || global_state->dsc_to_enc_id[1]) {
> > > +           DPU_ERROR("DSC 0|1 is already allocated\n");
> > > +           return -EIO;
> > > +   }
> > > +
> > > +   global_state->dsc_to_enc_id[0] = enc->base.id;
> > > +   global_state->dsc_to_enc_id[1] = enc->base.id;
> >
> > Still hardcoding DSC_0 and DSC_1.
>
> Yes!
>
> > Could you please add num_dsc to the topology and allocate the requested
> > amount of DSC blocks? Otherwise this would break for the DSI + DP case.
>
> It wont as we check for dsc and dont proceed, so it cant make an impact
> in non dsc case.
>
> Nevertheless I agree with you, so I am making it based on dsc defined in
> topology. Do we need additional field for num_dsc in topology, num_enc
> should be it, right?

I'd vote for the separate num_dsc.

-- 
With best wishes
Dmitry
