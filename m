Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D3669E89C
	for <lists+freedreno@lfdr.de>; Tue, 21 Feb 2023 20:55:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F71410E35C;
	Tue, 21 Feb 2023 19:55:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76AE710E35C
 for <freedreno@lists.freedesktop.org>; Tue, 21 Feb 2023 19:55:06 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id m11so931632iov.8
 for <freedreno@lists.freedesktop.org>; Tue, 21 Feb 2023 11:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eRYWJJCENa9rPwW/TxtFvE/+1aUPU+VLJ48+b5eakXA=;
 b=HYpvSiiTpTlEbP+d72xPTFxz0Y5boODfa2Unjr2AFinan9k/Rc1cjs757XVmQXuHSV
 XD8jC9LvBytNQwALMSgJ4kPe4E1AS+ubLYplmQrqC6/+wMYzYzpZ4+yjwVzIQlTDeTce
 x6KfUIH1/yToVqW5UffBOm+0ZcuKVISPhUtQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eRYWJJCENa9rPwW/TxtFvE/+1aUPU+VLJ48+b5eakXA=;
 b=1teUBrHlRF849gGoWMrMgdVhRSFtoYW9o26c9tNI/k7Ymdnpl/ySB6/sRD+YmYmp4P
 rjZG4Wp+pvKdkiJSuYjWksYcu5hHqJPOuhcxL6F9RNyKPjTdCWNZ1hB1DJeM4rXireqp
 forrTY90wo1ccsB+FfRKXCJMVJS4GjjhMbNlP16LIWlnPoTjoNjosoJdUw/3n45ns0vy
 yo00+XaJRX5cKK3So1VTWH/GhgsFj0stuQnQ4m+mJ06aG1jQN8MY4gz8QlYN2eJsjt7K
 qAtNb/oUAmTI7fgPgih5t/rNNaxaJ59V0yYQUvOS21sXUilOYT/rsIiR2WViIPyIqEdW
 lEkA==
X-Gm-Message-State: AO0yUKUKpcI5m8UmELK5vHLTR0Opr7RCfqs8WY3o+L/Vs+KMD8N9O45l
 8wpYMdCU64ScMmy9u+HkWQh6qAQFdwhB7Np5QT8T+Q==
X-Google-Smtp-Source: AK7set/w700ouJyUYiXM9kt1jbCAA2NUhIQI8F+mlpYikAHFpTJ67qOvGV3wQETjTP2ci+5CpwYaIYNCoOXnjHtIN2Q=
X-Received: by 2002:a5e:a916:0:b0:71b:df97:1d95 with SMTP id
 c22-20020a5ea916000000b0071bdf971d95mr3705480iod.80.1677009305527; Tue, 21
 Feb 2023 11:55:05 -0800 (PST)
MIME-Version: 1.0
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-11-robdclark@gmail.com>
 <20230220110820.595cfa37@eldfell>
 <CAF6AEGuo-vmW4Va9=RH+kH9KgNvR2vzjJ8meO-oty56xjDhjgg@mail.gmail.com>
 <20230221104551.60d44d1c@eldfell> <Y/TAr64SpxO712RB@intel.com>
In-Reply-To: <Y/TAr64SpxO712RB@intel.com>
From: Rob Clark <robdclark@chromium.org>
Date: Tue, 21 Feb 2023 11:54:55 -0800
Message-ID: <CAJs_Fx7n3QrzusdX5yD=39YZ8MzjuwZTriWz8hVxNYGHO=sJ_Q@mail.gmail.com>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH v4 10/14] drm/vblank: Add helper to get next
 vblank time
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Pekka Paalanen <ppaalanen@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Feb 21, 2023 at 5:01 AM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Tue, Feb 21, 2023 at 10:45:51AM +0200, Pekka Paalanen wrote:
> > On Mon, 20 Feb 2023 07:55:41 -0800
> > Rob Clark <robdclark@gmail.com> wrote:
> >
> > > On Mon, Feb 20, 2023 at 1:08 AM Pekka Paalanen <ppaalanen@gmail.com> =
wrote:
> > > >
> > > > On Sat, 18 Feb 2023 13:15:53 -0800
> > > > Rob Clark <robdclark@gmail.com> wrote:
> > > >
> > > > > From: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > Will be used in the next commit to set a deadline on fences that =
an
> > > > > atomic update is waiting on.
> > > > >
> > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > ---
> > > > >  drivers/gpu/drm/drm_vblank.c | 32 ++++++++++++++++++++++++++++++=
++
> > > > >  include/drm/drm_vblank.h     |  1 +
> > > > >  2 files changed, 33 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_v=
blank.c
> > > > > index 2ff31717a3de..caf25ebb34c5 100644
> > > > > --- a/drivers/gpu/drm/drm_vblank.c
> > > > > +++ b/drivers/gpu/drm/drm_vblank.c
> > > > > @@ -980,6 +980,38 @@ u64 drm_crtc_vblank_count_and_time(struct dr=
m_crtc *crtc,
> > > > >  }
> > > > >  EXPORT_SYMBOL(drm_crtc_vblank_count_and_time);
> > > > >
> > > > > +/**
> > > > > + * drm_crtc_next_vblank_time - calculate the time of the next vb=
lank
> > > > > + * @crtc: the crtc for which to calculate next vblank time
> > > > > + * @vblanktime: pointer to time to receive the next vblank times=
tamp.
> > > > > + *
> > > > > + * Calculate the expected time of the next vblank based on time =
of previous
> > > > > + * vblank and frame duration
> > > >
> > > > Hi,
> > > >
> > > > for VRR this targets the highest frame rate possible for the curren=
t
> > > > VRR mode, right?
> > > >
> > >
> > > It is based on vblank->framedur_ns which is in turn based on
> > > mode->crtc_clock.  Presumably for VRR that ends up being a maximum?
> >
> > I don't know. :-)
>
> At least for i915 this will give you the maximum frame
> duration.
>
> Also this does not calculate the the start of vblank, it
> calculates the start of active video.

AFAIU, vsync_end/vsync_start are in units of line, so I could do something =
like:

  vsync_lines =3D vblank->hwmode.vsync_end - vblank->hwmode.vsync_start;
  vsyncdur =3D ns_to_ktime(vblank->linedur_ns * vsync_lines);
  framedur =3D ns_to_ktime(vblank->framedur_ns);
  *vblanktime =3D ktime_add(*vblanktime, ktime_sub(framedur, vsyncdur));

?

BR,
-R

>
> >
> > You need a number of clock cycles in addition to the clock frequency,
> > and that could still be minimum, maximum, the last realized one, ...
> >
> > VRR works by adjusting the front porch length IIRC.
> >
> >
> > Thanks,
> > pq
> >
> > > BR,
> > > -R
> > >
> > >
> > > >
> > > > Thanks,
> > > > pq
> > > >
> > > > > + */
> > > > > +int drm_crtc_next_vblank_time(struct drm_crtc *crtc, ktime_t *vb=
lanktime)
> > > > > +{
> > > > > +     unsigned int pipe =3D drm_crtc_index(crtc);
> > > > > +     struct drm_vblank_crtc *vblank =3D &crtc->dev->vblank[pipe]=
;
> > > > > +     u64 count;
> > > > > +
> > > > > +     if (!vblank->framedur_ns)
> > > > > +             return -EINVAL;
> > > > > +
> > > > > +     count =3D drm_vblank_count_and_time(crtc->dev, pipe, vblank=
time);
> > > > > +
> > > > > +     /*
> > > > > +      * If we don't get a valid count, then we probably also don=
't
> > > > > +      * have a valid time:
> > > > > +      */
> > > > > +     if (!count)
> > > > > +             return -EINVAL;
> > > > > +
> > > > > +     *vblanktime =3D ktime_add(*vblanktime, ns_to_ktime(vblank->=
framedur_ns));
> > > > > +
> > > > > +     return 0;
> > > > > +}
> > > > > +EXPORT_SYMBOL(drm_crtc_next_vblank_time);
> > > > > +
> > > > >  static void send_vblank_event(struct drm_device *dev,
> > > > >               struct drm_pending_vblank_event *e,
> > > > >               u64 seq, ktime_t now)
> > > > > diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
> > > > > index 733a3e2d1d10..a63bc2c92f3c 100644
> > > > > --- a/include/drm/drm_vblank.h
> > > > > +++ b/include/drm/drm_vblank.h
> > > > > @@ -230,6 +230,7 @@ bool drm_dev_has_vblank(const struct drm_devi=
ce *dev);
> > > > >  u64 drm_crtc_vblank_count(struct drm_crtc *crtc);
> > > > >  u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
> > > > >                                  ktime_t *vblanktime);
> > > > > +int drm_crtc_next_vblank_time(struct drm_crtc *crtc, ktime_t *vb=
lanktime);
> > > > >  void drm_crtc_send_vblank_event(struct drm_crtc *crtc,
> > > > >                              struct drm_pending_vblank_event *e);
> > > > >  void drm_crtc_arm_vblank_event(struct drm_crtc *crtc,
> > > >
> >
>
>
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
