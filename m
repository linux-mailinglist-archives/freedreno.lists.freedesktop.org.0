Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A6D6E8AEA
	for <lists+freedreno@lfdr.de>; Thu, 20 Apr 2023 09:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451C010EB76;
	Thu, 20 Apr 2023 07:08:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB29610EB84
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 07:08:54 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id vc20so4047602ejc.10
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 00:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20221208.gappssmtp.com; s=20221208; t=1681974533; x=1684566533;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bvojUsR5pwErXxzLqJHjlEXoz6gI0576CmK0oCJxdpc=;
 b=EAo2Ow3XS1RZ8Q6tdvY+KMv4wd4ak0f8BPocMInIOOFHNFIvuNFzOPCuf90+iwfEgQ
 ZHspYHA6cUYNt5Wgy8/DALjenpgaoNsZVVnOeFM4wbnG+KcFyqLnPb4Rhq/O0yweYnl7
 CYMo+WGq2i8VlcfntymZq6LjZZfDAUQbqMNQcVueagYpplsjB/G9itlTHLHsRArA2mzy
 Y7cpIE39ZVutrHQ/bwm3Ya6cScf537u6tSqFC7ssXf6QLH2GRKojshXPUAMFzyF2fG8H
 FwVgOBTnypFAHXr2yXHmpJz+FOoQQeqpZWXF6PzlTiIoWGkYu8toSbCAON6nc2xY+5xS
 5uog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681974533; x=1684566533;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bvojUsR5pwErXxzLqJHjlEXoz6gI0576CmK0oCJxdpc=;
 b=autXRKEFMXGOhZ368iU1jOAEblr2nHtMimwhz45z7K5TR50pMHsNt28/cwP4hBbWZl
 /2g3YlpOuc3LG17maYpqnkBmcI0PDDoBM4iTFaAtRGjE43RFFdLujpudeQxcP28gQTAv
 t5iQ4JlJjN/2m4s6L3qpcMwjeXgp+2lTmGBKIWZ7Etejy98selWa1JCfZZl3LNuMML+B
 MtA+wHEHmHa1VsmYqyCrOBcww/9exBE3hkahrsHqNQ5nhQTLSaSaBvV/vfbVB+T7uWRR
 R6OHHkzqzvXadJxv5XIA8qkidse1y6knQeDqj6sUt7BlYU8rvwjkWu3WwaH+duWVC5a1
 mMxQ==
X-Gm-Message-State: AAQBX9fDm5awnETCnD/gGrH/bd4qKjQAna1I4cjjaLp77aIhorF+/ruQ
 5nrQBN1Oj/RoIb40MromZwitjd1QGRfEYnd2OXPb
X-Google-Smtp-Source: AKy350YkIRiL6/g0txyPQcEysULNj8gjrNyWWXcoEDSMWOaKX/YTC+6vqefm8B56QsKbeEQmmG9BwMkojEpTRumRSyg=
X-Received: by 2002:a17:907:980a:b0:94f:c1f:6d09 with SMTP id
 ji10-20020a170907980a00b0094f0c1f6d09mr214789ejc.7.1681974533034; Thu, 20 Apr
 2023 00:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
 <20230419-dpu-tweaks-v1-11-d1bac46db075@freebox.fr>
 <08e79278-ad30-73e3-a56c-f569b3fea407@linaro.org>
In-Reply-To: <08e79278-ad30-73e3-a56c-f569b3fea407@linaro.org>
From: Arnaud Vrac <avrac@freebox.fr>
Date: Thu, 20 Apr 2023 09:08:42 +0200
Message-ID: <CAG9NU68AqX3P1MrrLvfSKMyw+OsfZ7tyk9F9zU7qvA-QzzqO5g@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH 11/11] drm/msm/dpu: do not use mixer that
 supports dspp when not required
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Le jeu. 20 avr. 2023 =C3=A0 01:18, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> a =C3=A9crit :
>
> On 19/04/2023 17:41, Arnaud Vrac wrote:
> > This avoids using lm blocks that support DSPP when not needed, to
> > keep those resources available.
>
> This will break some of the platforms. Consider qcm2290 which has a
> single LM with DSPP. So, _dpu_rm_check_lm_and_get_connected_blks should
> be performed in two steps: first skip non-DSPP-enabled LMs when DSPP is
> not required. Then, if the LM (pair) is not found, look for any suitable
> LM(pair).

Good point, I'll add the change.

>
> >
> > Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/m=
sm/disp/dpu1/dpu_rm.c
> > index f4dda88a73f7d..4b393d46c743f 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > @@ -362,7 +362,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks=
(struct dpu_rm *rm,
> >       *pp_idx =3D idx;
> >
> >       if (!reqs->topology.num_dspp)
> > -             return true;
> > +             return !lm_cfg->dspp;
> >
> >       idx =3D lm_cfg->dspp - DSPP_0;
> >       if (idx < 0 || idx >=3D ARRAY_SIZE(rm->dspp_blks)) {
> >
>
> --
> With best wishes
> Dmitry
>
