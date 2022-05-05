Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F096C51BAF1
	for <lists+freedreno@lfdr.de>; Thu,  5 May 2022 10:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D01EA10EB8C;
	Thu,  5 May 2022 08:49:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1477010E183
 for <freedreno@lists.freedesktop.org>; Thu,  5 May 2022 08:49:00 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id r11so6472004ybg.6
 for <freedreno@lists.freedesktop.org>; Thu, 05 May 2022 01:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=op5ROKe2ZN3R178e7Bu8w5MlRYrTA2IJQ63KYbg67x0=;
 b=PlQULGTSlWNcIR7xPZDYQG2Pa8eSpGTcolUplNhYBX/Nm4Yp95pd7BYFPUtf606YSc
 19v4xDJJ2QlHi9c8bGxAbCXYQTQFHyq7pIKSguxg/MgiGd+KOBZ7oKl2NdmUibY6Sga2
 MSDvMGQuMD8pP62o08MoI5rkuY46WTL0P2XwhogDtkZ5lpbSBYjW6bByhbP82EHKj60n
 /sxfuNmOh7XcwQ+qGNS0gqxZL8TM0VC0Wc5XhwryNxv4NFtWsGrgUKaoA4YKSvNS5SOv
 Wj2zJRTpSCu/batd46b1k2S5otWGZzb/W54OY1D0r1ia/0C5CXDbiTQnhZhnstTJryTU
 8RfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=op5ROKe2ZN3R178e7Bu8w5MlRYrTA2IJQ63KYbg67x0=;
 b=vEsGQiSaYEEtl+7bV+lA3MbqNVv6EFHgg21u/DfoKShx+hvG89XIlUnMR6rO1gszW1
 oBi2HmfeWNXATcUVcSsSac2h6b9X9VUVO3xPetPDknFWP2zF07cYw2ItxlapdVV4oRZl
 DIgCAHm4HJ657onayH3GWUSTQYYqpJs2QMFfg9r242qWEZNorAQUyV7RgsPEgkIbgWkk
 UGdJomAxteQ/vJn56clzTpIyi1vkM5T0spxbnebFHBCx3VU7RlAFKpKnpAEw3Z4baU1P
 osyi4SGLhJrjegm+5S2Q0PP3flMiZGN11iTmnQvCpeVnR638j5k7CWYRcV941hOr7KiU
 P5Fg==
X-Gm-Message-State: AOAM5311/oiJdNBBnJcQzIFEFvovRVkPfbUH69LhG6FS6+8T5LbzavVg
 W8+LgGnPepvhE/ZWOgK8deWSS+/noZB92lteWpUWYRXrpfo=
X-Google-Smtp-Source: ABdhPJz2AMrVv3CJIjrI6pJqL+b8hzT+Mj4fdxway48kUTXDu4QxBUWQrSy+dKStzWQ5d1zkk8f5o+rC9IbeqBsiFQ8=
X-Received: by 2002:a25:3455:0:b0:648:44db:51e0 with SMTP id
 b82-20020a253455000000b0064844db51e0mr19579704yba.314.1651740539255; Thu, 05
 May 2022 01:48:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220505015528.344-1-quic_jesszhan@quicinc.com>
 <CAF6AEGt1uFAgAo1+sp7KbamTb4DAn_MU-NR+UvGHLUGfm3oQ=A@mail.gmail.com>
In-Reply-To: <CAF6AEGt1uFAgAo1+sp7KbamTb4DAn_MU-NR+UvGHLUGfm3oQ=A@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 5 May 2022 11:48:48 +0300
Message-ID: <CAA8EJpraDRzBevNPC6H9ZAaLAXFq2aOkdoD9NGo-DpgsXoCm=g@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm/mdp5: Return error code in
 mdp5_pipe_release when deadlock is detected
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, quic_aravindh@quicinc.com,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 5 May 2022 at 05:06, Rob Clark <robdclark@gmail.com> wrote:
>
> On Wed, May 4, 2022 at 6:55 PM Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> >
> > mdp5_get_global_state runs the risk of hitting a -EDEADLK when acquiring
> > the modeset lock, but currently mdp5_pipe_release doesn't check for if
> > an error is returned. Because of this, there is a possibility of
> > mdp5_pipe_release hitting a NULL dereference error.
> >
> > To avoid this, let's have mdp5_pipe_release check if
> > mdp5_get_global_state returns an error and propogate that error.
> >
> > Changes since v1:
> > - Separated declaration and initialization of *new_state to avoid
> >   compiler warning
> > - Fixed some spelling mistakes in commit message
> >
>
> Note that mdp5_mixer_release() needs the same treatment.. one more comment below
>
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c  | 15 +++++++++++----
> >  drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h  |  2 +-
> >  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 20 ++++++++++++++++----
> >  3 files changed, 28 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
> > index ba6695963aa6..97887a2be082 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
> > @@ -119,18 +119,23 @@ int mdp5_pipe_assign(struct drm_atomic_state *s, struct drm_plane *plane,
> >         return 0;
> >  }
> >
> > -void mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe)
> > +int mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe)
> >  {
> >         struct msm_drm_private *priv = s->dev->dev_private;
> >         struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
> >         struct mdp5_global_state *state = mdp5_get_global_state(s);
> > -       struct mdp5_hw_pipe_state *new_state = &state->hwpipe;
> > +       struct mdp5_hw_pipe_state *new_state;
> >
> >         if (!hwpipe)
> > -               return;
> > +               return -EINVAL;
>
> At least per the current code, !hwpipe is "normal".. I think that fits
> the model of things like kfree(NULL), so lets make this just return 0

Especially since we release the r_hwpipe w/o additional check. And
r_hwpipe frequently is NULL.

>
> > +
> > +       if (IS_ERR(state))
> > +               return PTR_ERR(state);
> > +
> > +       new_state = &state->hwpipe;
> >
> >         if (WARN_ON(!new_state->hwpipe_to_plane[hwpipe->idx]))
> > -               return;
> > +               return -EINVAL;
> >
> >         DBG("%s: release from plane %s", hwpipe->name,
> >                 new_state->hwpipe_to_plane[hwpipe->idx]->name);
> > @@ -141,6 +146,8 @@ void mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe)
> >         }
> >
> >         new_state->hwpipe_to_plane[hwpipe->idx] = NULL;
> > +
> > +       return 0;
> >  }
> >
> >  void mdp5_pipe_destroy(struct mdp5_hw_pipe *hwpipe)
> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
> > index 9b26d0761bd4..cca67938cab2 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
> > @@ -37,7 +37,7 @@ int mdp5_pipe_assign(struct drm_atomic_state *s, struct drm_plane *plane,
> >                      uint32_t caps, uint32_t blkcfg,
> >                      struct mdp5_hw_pipe **hwpipe,
> >                      struct mdp5_hw_pipe **r_hwpipe);
> > -void mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe);
> > +int mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe);
> >
> >  struct mdp5_hw_pipe *mdp5_pipe_init(enum mdp5_pipe pipe,
> >                 uint32_t reg_offset, uint32_t caps);
> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> > index 228b22830970..979458482841 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> > @@ -311,12 +311,24 @@ static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
> >                                 mdp5_state->r_hwpipe = NULL;
> >
> >
> > -                       mdp5_pipe_release(state->state, old_hwpipe);
> > -                       mdp5_pipe_release(state->state, old_right_hwpipe);
> > +                       ret = mdp5_pipe_release(state->state, old_hwpipe);
> > +                       if (ret)
> > +                               return ret;
> > +
> > +                       ret = mdp5_pipe_release(state->state, old_right_hwpipe);
> > +                       if (ret)
> > +                               return ret;
> > +
> >                 }
> >         } else {
> > -               mdp5_pipe_release(state->state, mdp5_state->hwpipe);
> > -               mdp5_pipe_release(state->state, mdp5_state->r_hwpipe);
> > +               ret = mdp5_pipe_release(state->state, mdp5_state->hwpipe);
> > +               if (ret)
> > +                       return ret;
> > +
> > +               ret = mdp5_pipe_release(state->state, mdp5_state->r_hwpipe);
> > +               if (ret)
> > +                       return ret;
> > +
> >                 mdp5_state->hwpipe = mdp5_state->r_hwpipe = NULL;
> >         }
> >
> > --
> > 2.35.1
> >



-- 
With best wishes
Dmitry
