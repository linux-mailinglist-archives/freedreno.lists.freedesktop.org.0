Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A38A07FAE3B
	for <lists+freedreno@lfdr.de>; Tue, 28 Nov 2023 00:17:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A56710E407;
	Mon, 27 Nov 2023 23:17:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6A610E407
 for <freedreno@lists.freedesktop.org>; Mon, 27 Nov 2023 23:17:47 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-5cdc0b3526eso30996327b3.1
 for <freedreno@lists.freedesktop.org>; Mon, 27 Nov 2023 15:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701127066; x=1701731866; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8iD+osMJH4miMmYt9ABPXwXzud5eZygTeF+Khzq6tJ8=;
 b=rzllx5OhkUa9ojuMOV5Tll10XUrITc8L6fCM3jL86OwOWqSCfl9WaymIvXqqLMkvLL
 Mp78mHVVXYBF+hfjj6+tYbc5/bWbOpJbusDQfdRXqxWP0Qg7j87uVtIXjnZJIg/dgV8Q
 C/VZEpTr/yKSKRJHZCplxv+7nhd7ee2fL3xnfGKfloJMyGnHFe1l8flx/2Jc7BHESFhV
 gXQ9/1U81IaYxZ9Gc8NvdL3sGcTmx9/Y2YyhRQvbjul3P4sLAqrwapsnlJhOk0gcMdKo
 fHyTU3xcacGYIpFDdPQ72hWwwtz7+JaYnLprDHF0vIXXyxszHqsY2Rd6Kc1BZVc30Nyn
 l8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701127066; x=1701731866;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8iD+osMJH4miMmYt9ABPXwXzud5eZygTeF+Khzq6tJ8=;
 b=pbpMLkvZnuXeEPcn+x6qA4nm+Wz/gl7rvyEBHRjjnwU4fsByn9pLcEcxYStnRD+27U
 QNS8gMg8F6SWn/41666/utJlsfAWk+QvAvuzFipGV4MX9LJFLERuyPjk3hySQpp7QEPP
 4O0dHELt2OBYzYdj4yFLXHUqZefFZWicqKuv3gqpHVpqEdyCXGfbk7eeeYFDSPXcF3VK
 UGFMT0qNEtdVuTbsrDGgn3cdlWjgbJKiyKneHKVE71TNnrT3gqDaYwD9heHUSX9ltzVW
 Lvm51rddGFw+0i2c69Xni+ZW+PyydO92p0Lz4Ml9CxxPI8F2TLknKptHeSeg4uDOHTlL
 I1TQ==
X-Gm-Message-State: AOJu0YyfjW7iPqSDsUAMy/gIYgLSgOkFSBPGEMIkBAl0DT7si5ynTax3
 /rvRE1Sg+0SB6/ktOHt1inOnhP3Bj2bGlDC7D6zeZA==
X-Google-Smtp-Source: AGHT+IGt0klIWrzaFcrbKa/sHaNCkRqwr4aenl7fiamwe5np9aLxr58NKslxaAawBwEHn9aDhfp9afP2HS3lr6Ny8yM=
X-Received: by 2002:a05:690c:2886:b0:5d0:11b:e9c3 with SMTP id
 ee6-20020a05690c288600b005d0011be9c3mr4765613ywb.7.1701127066496; Mon, 27 Nov
 2023 15:17:46 -0800 (PST)
MIME-Version: 1.0
References: <20231127215401.4064128-1-dmitry.baryshkov@linaro.org>
 <60dc2b72-188f-7b6e-4e14-b90f10997a44@quicinc.com>
In-Reply-To: <60dc2b72-188f-7b6e-4e14-b90f10997a44@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 Nov 2023 01:17:35 +0200
Message-ID: <CAA8EJpoKOPVLC9n_2MC2Es7XssEs5G5O4ESJ_-krA8aGG_fb0Q@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/mdp4: flush vblank event on disable
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 28 Nov 2023 at 00:00, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 11/27/2023 1:54 PM, Dmitry Baryshkov wrote:
> > Flush queued events when disabling the crtc. This avoids timeouts when
> > we come back and wait for dependencies (like the previous frame's
> > flip_done).
> >
> > Fixes: c8afe684c95c ("drm/msm: basic KMS driver for snapdragon")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> > index 169f9de4a12a..3100957225a7 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> > @@ -269,6 +269,7 @@ static void mdp4_crtc_atomic_disable(struct drm_crtc *crtc,
> >   {
> >       struct mdp4_crtc *mdp4_crtc = to_mdp4_crtc(crtc);
> >       struct mdp4_kms *mdp4_kms = get_kms(crtc);
> > +     unsigned long flags;
> >
> >       DBG("%s", mdp4_crtc->name);
> >
> > @@ -281,6 +282,14 @@ static void mdp4_crtc_atomic_disable(struct drm_crtc *crtc,
> >       mdp_irq_unregister(&mdp4_kms->base, &mdp4_crtc->err);
> >       mdp4_disable(mdp4_kms);
> >
> > +     if (crtc->state->event && !crtc->state->active) {
> > +             WARN_ON(mdp4_crtc->event);
>
> Do you need a WARN_ON() here? Just wondering how often this might happen
> and spam.

Well, it is atomic_disable(), so it happens only on modesets or output
disable. Also, this is a port of mdp5 code, see commit e765ea77b0fd
("drm/msm: Issue queued events when disabling crtc"). We don't have
reports from MDP5 code, so there should be no comparable reports for
MDP4.

> otherwise LGTM.
>
> > +             spin_lock_irqsave(&mdp4_kms->dev->event_lock, flags);
> > +             drm_crtc_send_vblank_event(crtc, crtc->state->event);
> > +             crtc->state->event = NULL;
> > +             spin_unlock_irqrestore(&mdp4_kms->dev->event_lock, flags);
> > +     }
> > +
> >       mdp4_crtc->enabled = false;
> >   }
> >



-- 
With best wishes
Dmitry
