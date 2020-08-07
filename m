Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F32FB23E9A0
	for <lists+freedreno@lfdr.de>; Fri,  7 Aug 2020 10:57:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F4C6E981;
	Fri,  7 Aug 2020 08:57:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053E86E146
 for <freedreno@lists.freedesktop.org>; Fri,  7 Aug 2020 08:57:45 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g8so1047191wmk.3
 for <freedreno@lists.freedesktop.org>; Fri, 07 Aug 2020 01:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=H73Msn3ig8oo+rXLBRFR40qhkjSySvB7pfbrGJDIkto=;
 b=P5BLbM7NaQMP5e2hJpp/jGb9n9cEXDqguDO01xB7EI9UcQR7OyzK98j0PVhTipFk+W
 TQ70UzqxnBDEJangW88G9Dq+lqyXD9Rf/jm+IVd7toPT5l6IrZDIoKO127KmFgkwabTs
 W14uS0QIQXZq8BKcRvIVDm4eJj+ZOC+728qNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=H73Msn3ig8oo+rXLBRFR40qhkjSySvB7pfbrGJDIkto=;
 b=KUrPbeaTviiW+u27+zwhiHG/++Bzt5wsO1R6HPi6nXhAROhvEqW5Q9BxBtj72LTOUc
 J3yWw+AjYP1DWj7Wu4xfbGMF1j/m5TldZc1YVs3RiuM5j/4E5Q2gjazMXK7vi9kKx1vA
 YP7dB5/l9+VBVcG5JxDxfs/tf2Ooqt/YlAgVG049y0pKtRK8mykO02zCFEy8BLRVszij
 +8VLS5SL+4LGPki9O1gUHEcq4pHaXRIqcOGbLqHOTkIDAxj6DaKAnvJ+B2quGVl4CZIL
 Z3p2f1TNnseACI9pV2+PvGNPB29wDugofdESWxublQrk5zRqwq1ZpPD5wez7ZnJiQRN6
 CMWg==
X-Gm-Message-State: AOAM530GwtVwp058SuLibsGZQZhGHa8m+AWaB65cROZJ3BSAVePRMgSO
 6/iC86rt4Rq+PYTvr9yJrktIeA==
X-Google-Smtp-Source: ABdhPJynkqQfgSYGXyIhXXRsLuU2JaYCqT62Ezi3rAu3TCxoggostYXPfA0lWy6VQU0lDkGUgE8khA==
X-Received: by 2002:a1c:df02:: with SMTP id w2mr12869666wmg.137.1596790663593; 
 Fri, 07 Aug 2020 01:57:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o30sm9643520wra.67.2020.08.07.01.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 01:57:42 -0700 (PDT)
Date: Fri, 7 Aug 2020 10:57:40 +0200
From: daniel@ffwll.ch
To: 
Message-ID: <20200807085740.GR6419@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Krishna Manikandan <mkrishn@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Raviteja Tamatam <travitej@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>,
 Sean Paul <seanpaul@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Drew Davenport <ddavenport@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
References: <1596634446-1413-1-git-send-email-kalyan_t@codeaurora.org>
 <CAF6AEGtWNDGDsUBVk-Ud5OpretHA4qKDKtE+3mS=C8DAa=+Heg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGtWNDGDsUBVk-Ud5OpretHA4qKDKtE+3mS=C8DAa=+Heg@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Subject: Re: [Freedreno] [v1] drm/msm/dpu: Fix reservation failures in
 modeset
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Krishna Manikandan <mkrishn@codeaurora.org>,
 Raviteja Tamatam <travitej@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Drew Davenport <ddavenport@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Aug 05, 2020 at 08:48:34AM -0700, Rob Clark wrote:
> On Wed, Aug 5, 2020 at 6:34 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
> >
> > In TEST_ONLY commit, rm global_state will duplicate the
> > object and request for new reservations, once they pass
> > then the new state will be swapped with the old and will
> > be available for the Atomic Commit.
> >
> > This patch fixes some of missing links in the resource
> > reservation sequence mentioned above.
> >
> > 1) Creation of a duplicate state in test_only commit (Rob)
> > 2) Allow resource release only during crtc_active false.
> >
> > For #2
> > In a modeset operation, swap state happens well before disable.
> > Hence clearing reservations in disable will cause failures
> > in modeset enable.
> >
> > Sequence:
> >     Swap state --> old, new
> >     modeset disables --> virt disable
> >     modeset enable --> virt modeset
> >
> > Allow reservations to be cleared only when crtc active is false
> > as in that case there wont be any modeset enable after disable.
> >
> > Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 63976dc..b85a576 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -582,7 +582,7 @@ static int dpu_encoder_virt_atomic_check(
> >         dpu_kms = to_dpu_kms(priv->kms);
> >         mode = &crtc_state->mode;
> >         adj_mode = &crtc_state->adjusted_mode;
> > -       global_state = dpu_kms_get_existing_global_state(dpu_kms);
> > +       global_state = dpu_kms_get_global_state(crtc_state->state);
> >         trace_dpu_enc_atomic_check(DRMID(drm_enc));
> >
> >         /*
> > @@ -1172,6 +1172,7 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
> >         struct msm_drm_private *priv;
> >         struct dpu_kms *dpu_kms;
> >         struct dpu_global_state *global_state;
> > +       struct drm_crtc_state *crtc_state;
> >         int i = 0;
> >
> >         if (!drm_enc) {
> > @@ -1191,6 +1192,7 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
> >         priv = drm_enc->dev->dev_private;
> >         dpu_kms = to_dpu_kms(priv->kms);
> >         global_state = dpu_kms_get_existing_global_state(dpu_kms);
> > +       crtc_state = drm_enc->crtc->state;
> >
> >         trace_dpu_enc_disable(DRMID(drm_enc));
> >
> > @@ -1220,7 +1222,8 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
> >
> >         DPU_DEBUG_ENC(dpu_enc, "encoder disabled\n");
> >
> > -       dpu_rm_release(global_state, drm_enc);
> > +       if (crtc_state->active_changed && !crtc_state->active)
> > +               dpu_rm_release(global_state, drm_enc);
> 
> I still think releasing the state in the atomic_commit() path is the
> wrong thing to do.  In the commit path, the various state objects
> should be immutable.. ie. in the atomic_test() path you derive the new
> hw state (including assignment/release of resources), and
> atomic_commit() is simply pushing the state down to the hw.
> 
> Otherwise, this looks better than v1.

Yeah this races and is total no-go. If you touch your state in commit
(except some very specific exceptions), then a next TEST_ONLY atomic_check
might duplicate the atomic state object in an incosistent state, and fail.

Worse, this looks like if you race like that then you might duplicate an
object with old reservations still in place, and then we've essentially
leaked those resources and need to reboot. Yes most compositors use
blocking modesets, but some actually do full nonblocking modesets.

This stuff needs to be moved into the atomic_check code, and your commit
code needs to be careful to use the right state (old or new) when pushing
it into hw.

Cheers, Daniel

> 
> BR,
> -R
> 
> >
> >         mutex_unlock(&dpu_enc->enc_lock);
> >  }
> > --
> > 1.9.1
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
