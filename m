Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 579DFA06AC7
	for <lists+freedreno@lfdr.de>; Thu,  9 Jan 2025 03:16:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3F810E1B9;
	Thu,  9 Jan 2025 02:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jPMINF3k";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D1810E1B9
 for <freedreno@lists.freedesktop.org>; Thu,  9 Jan 2025 02:15:59 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-e398484b60bso560988276.1
 for <freedreno@lists.freedesktop.org>; Wed, 08 Jan 2025 18:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736388899; x=1736993699; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eotnh/rc2GT5BSx+dJLr2x53Uri3bInhkP1K+WZoSwU=;
 b=jPMINF3kB6r6i3O8aQaKy201V9Hra7xkjQW9S2P5/AlCa8XwLw4MFijQvFLQH6gD10
 CnhRKLkP+pvJg2j+zULTkdWaN2G/wIwAmbmJyLHdhvl14mBtj4klwOUYw+M+AtNtPf5m
 cSE49VFlmJVCKAy24TGHAgewLwtRZBcJ9xXkn6ieowpmJhRVDVXlSi4FzI08q3nxMztX
 Cohib97U60yuTsFyp51HuGIMcjcJeAr1WqoVpEJqxR5mBpckDgqLWKYngKMH5ADgAP0h
 i3pIkGA2wQ6Lss9vRxabWjRUEXoUC9pfmJ1jbnFUdpj2ZgXEoceRR63VNOMQi13bM0hV
 vSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736388899; x=1736993699;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eotnh/rc2GT5BSx+dJLr2x53Uri3bInhkP1K+WZoSwU=;
 b=gvK5xziDRdHzWywzIS9G9FtQmWRdOtTF+ueEwmsn1eDPrDq9pQaMPQSNPI6StWjlGF
 pR53AwJ0YV/izB0MKUTsKUbwsrqFRam7lJPG7cdFn3RIboZjZhc96MI9eH9Frc/A09g5
 H5MmjJC/xtcrYF2rMlavnaRZAy77I87qdPvaHJ/iqm5E3yIoSkNVPggbpSGXRNd5vQ4f
 YKNbtmsJEgWaj+VqdKeAU0Y704rfXkLTwIAvORUf9VSRZ3wjZUdraQ9qXE3tmyQZqZd0
 lSnGzO3CdWi2RspNaMDGVxiCkL5jNLHiirMMSfzC0cXZdAo41bJ7NlWlotOIqFJWPUtz
 4uwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPfIEr1n1Fm5wDhOpccwwxNzdMM9WLInSdaNPz138py+LFTuDyyUIZw/ML+vDwMQSNyyRKA57nlkY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZm83daUxJrE//cLczEuKDrrCiO9R4pLJ+teMUraG6FLCjSVVd
 ijy9PTZTFFd7HeKw1wsDqyKCCZ/z76vOBgDtiTtQ5AsgwPuygNmk5r2ebgZ6HreU+q5/WM7kMVa
 j+cAUoc0Jki+KBQDNJjWI+BLkSKXl9XAt/m1VIg==
X-Gm-Gg: ASbGncuwCLrNKVACUTPDZX+X9Q7x7080ybAYuL8bl4H935+CfhrKc8W+4nk6YAuoNCV
 qTiWbyjakbeUFcIzxaBsLXuFwGVxAMx+5LbMCYOGkMMxXD7Du6fpq
X-Google-Smtp-Source: AGHT+IGjfqKZ6z5xvthsUHml25xipTkvDZPvjr+OG2gBVqutU+a7E7waIrDTvnI5P56r2mBBU38O0qYe4GAOhnLFRCw=
X-Received: by 2002:a05:690c:b99:b0:6ef:668a:e55b with SMTP id
 00721157ae682-6f53124fb46mr33896227b3.15.1736388898942; Wed, 08 Jan 2025
 18:14:58 -0800 (PST)
MIME-Version: 1.0
References: <20250108-async-disable-fix-v1-1-3f93eb600a3a@quicinc.com>
 <CAF6AEGtksLq5jpizGMj4t248rbNScgDvrxpxv09==b3DmpkLuQ@mail.gmail.com>
In-Reply-To: <CAF6AEGtksLq5jpizGMj4t248rbNScgDvrxpxv09==b3DmpkLuQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 9 Jan 2025 04:14:48 +0200
X-Gm-Features: AbW1kvYI3FHAGXC6HOXi2oPwfHy5-ovM4aYoEFGmwgV5YlmN5CAk-FmWEstrCbY
Message-ID: <CAA8EJpqPZc7DNOb6WcRVtH0cFs9mUziL-dPgyakEJGO73=B6gA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Force disabling commits to take non-async
 path
To: Rob Clark <robdclark@gmail.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, quic_abhinavk@quicinc.com, 
 Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, 9 Jan 2025 at 03:45, Rob Clark <robdclark@gmail.com> wrote:
>
> On Wed, Jan 8, 2025 at 2:58=E2=80=AFPM Jessica Zhang <quic_jesszhan@quici=
nc.com> wrote:
> >
> > Force commit that are disabling a plane in the async_crtc to take the
> > non-async commit tail path.
> >
> > In cases where there are two consecutive async cursor updates (one
> > regular non-NULL update followed by a disabling NULL FB update), it is
> > possible for the second NULL update to not be queued (due to the
> > pending_crtc_mask check) or otherwise not be run before the cursor FB i=
s
> > deallocated by drm_atomic_helper_cleanup_planes(). This would cause a
> > context fault since the hardware would try to fetch the old plane state
> > with the stale FB address.
> >
> > Avoid this issue by forcing cursor updates that will disable the cursor
> > plane to be blocking commits. This will ensure that hardware clears and
> > stops fetching the FB source address before the driver deallocates the =
FB
> >
> > Fixes: 2d99ced787e3 ("drm/msm: async commit support")
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/msm_atomic.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm=
_atomic.c
> > index 9c45d641b5212c11078ab38c13a519663d85e10a..ddc74c68148c643d34ca631=
dd28d4cdc2b8c7dc0 100644
> > --- a/drivers/gpu/drm/msm/msm_atomic.c
> > +++ b/drivers/gpu/drm/msm/msm_atomic.c
> > @@ -142,6 +142,7 @@ static bool can_do_async(struct drm_atomic_state *s=
tate,
> >         struct drm_connector_state *connector_state;
> >         struct drm_connector *connector;
> >         struct drm_crtc_state *crtc_state;
> > +       struct drm_plane_state *plane_state;
> >         struct drm_crtc *crtc;
> >         int i, num_crtcs =3D 0;
> >
> > @@ -162,6 +163,18 @@ static bool can_do_async(struct drm_atomic_state *=
state,
> >                 *async_crtc =3D crtc;
> >         }
> >
> > +       /*
> > +        * Force a blocking commit if the cursor is being disabled. Thi=
s is to
> > +        * ensure that the registers are cleared and hardware doesn't t=
ry to
> > +        * fetch from a stale address.
> > +        */
> > +       if (*async_crtc) {
> > +               plane_state =3D drm_atomic_get_new_plane_state(state,
> > +                                                            (*async_cr=
tc)->cursor);
> > +               if (plane_state && !plane_state->fb)
> > +                       return false;
>
> hmm, I suppose we want the same even if the fb changes?  Or
> alternatively somewhere hold an extra ref to the backing obj until hw
> has finished scanout?

I think a more correct approach would be to run a worker, waiting for
the commit to happen and then freeing the FBs.

>
> BR,
> -R
>
> > +       }
> > +
> >         return true;
> >  }
> >
> >
> > ---
> > base-commit: 866e43b945bf98f8e807dfa45eca92f931f3a032
> > change-id: 20250108-async-disable-fix-cc1b9a1d5b19
> >
> > Best regards,
> > --
> > Jessica Zhang <quic_jesszhan@quicinc.com>
> >



--=20
With best wishes
Dmitry
