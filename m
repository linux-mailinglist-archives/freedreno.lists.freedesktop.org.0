Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B77FF5351C6
	for <lists+freedreno@lfdr.de>; Thu, 26 May 2022 18:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E5CF10E14B;
	Thu, 26 May 2022 16:01:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3163810E141
 for <freedreno@lists.freedesktop.org>; Thu, 26 May 2022 16:01:21 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id f21so3762538ejh.11
 for <freedreno@lists.freedesktop.org>; Thu, 26 May 2022 09:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=muVoFK53cly8UGkO/IVCCGOOWf4SlvW8Ah8wz/JuMYA=;
 b=AxVXi03p5UNt0Fr/8FDLRPX5zQexwuRutI6hUxd4KJvSUBo+WTG0kvpmKKylKzPIqu
 1lWSrumYqzhq0Cvn7on/Uq/4WfbWeYVdE7dtbnD8vjC/Wi9w3PVjCHwFmAPpsJsqZJqp
 jcyV/+yVBLz9Ii3IVSUC8uEj79X4+PYhrVtbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=muVoFK53cly8UGkO/IVCCGOOWf4SlvW8Ah8wz/JuMYA=;
 b=j4QEUaMIvF5ctnuJyZ+BSjDyf7oTwBdw+OJ3k6jw1Nf2IKAr//veFct/RaX1VQAGxO
 7QQ2mz7bzltP0UuiDaLnJQq9gZDgtOj11JSuOo6I9oROeYfCgvMwPg0hC6tPkRdJH+Zq
 zYcldLwx6rtV8LqkTPVzOfWHNWaZ4ZF9gsJpj3in4wZe1XjFGj4jI25qHBEEvTsDfz1f
 pcZz9n3GEZk7acTJGQx+izgAPW2qMZ9Ckr7iTm+U2QvQymTHAE9VPt44rSLkVBsUVSUw
 R2UCKLkev1KULuwIf6NmY3GR5/UKShtZCINZuRAluWA3nnT1nA6FtxBRsomsF/pmDqtc
 d5ZQ==
X-Gm-Message-State: AOAM531HCDnBTfcMvfjp6WpRb8zAGS5E41/vjenyZk0LY+WHxl9EivnE
 uOEdKIaeFTgEV6bAmj4SNFLU4uiVrh4svzZccrA=
X-Google-Smtp-Source: ABdhPJwLcNlHXtf/OROI4PxXW99GD4pEuH7iSDYEuXbftuPIh7t+ACZ0pIc4CL31N3fwzSItFyGfQA==
X-Received: by 2002:a17:907:3fa2:b0:6fe:d043:3fd1 with SMTP id
 hr34-20020a1709073fa200b006fed0433fd1mr20556333ejc.700.1653580879199; 
 Thu, 26 May 2022 09:01:19 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51]) by smtp.gmail.com with ESMTPSA id
 m3-20020a056402430300b0042bc7635534sm1005765edc.62.2022.05.26.09.01.16
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 May 2022 09:01:16 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id z15so2669425wrg.11
 for <freedreno@lists.freedesktop.org>; Thu, 26 May 2022 09:01:16 -0700 (PDT)
X-Received: by 2002:a5d:5085:0:b0:20d:5f6:63fa with SMTP id
 a5-20020a5d5085000000b0020d05f663famr31419542wrt.679.1653580875415; Thu, 26
 May 2022 09:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220513130533.v3.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
 <5857c510-9783-a483-8414-65d7350618d6@suse.de>
 <CAD=FV=X99EWmRk82ako7cL7BWPEsTG=L7VVBVDFX5qKc1MifSA@mail.gmail.com>
 <CAD=FV=U3Wywjev9tEhkL_zE1cV5NwEknH2YwHqyhd5TQtiJ=AQ@mail.gmail.com>
 <Yo4ufWm5WiXsnRX8@phenom.ffwll.local>
 <CAOw6vbLu7TzTppUYv1cynMvn+ykTuGiYBCNhN7FO2kYqZj4DUg@mail.gmail.com>
 <CAKMK7uHTkQjQ5=HOb0MtXD4JZRj3Szt5vm9gQZ6BixZ8LtUpxQ@mail.gmail.com>
In-Reply-To: <CAKMK7uHTkQjQ5=HOb0MtXD4JZRj3Szt5vm9gQZ6BixZ8LtUpxQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 26 May 2022 09:01:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WgRjW2yFKvRkcKoj-nGEAhku6_d3kgs9WhTC6bVrzxeQ@mail.gmail.com>
Message-ID: <CAD=FV=WgRjW2yFKvRkcKoj-nGEAhku6_d3kgs9WhTC6bVrzxeQ@mail.gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH v3] drm/probe-helper: Make 640x480 first if
 no EDID
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 LKML <linux-kernel@vger.kernel.org>, Sean Paul <seanpaul@google.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Thu, May 26, 2022 at 8:42 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, 26 May 2022 at 03:28, Sean Paul <seanpaul@chromium.org> wrote:
> >
> > On Wed, May 25, 2022 at 9:26 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Mon, May 23, 2022 at 05:59:02PM -0700, Doug Anderson wrote:
> > > > Hi,
> > > >
> > > > On Fri, May 20, 2022 at 5:01 PM Doug Anderson <dianders@chromium.or=
g> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Mon, May 16, 2022 at 3:28 AM Thomas Zimmermann <tzimmermann@su=
se.de> wrote:
> > > > > >
> > > > > > Hi Douglas,
> > > > > >
> > > > > > I understand that you're trying to tell userspace that the mode=
list has
> > > > > > been made up, but it's not something that should be done via fr=
agile
> > > > > > heuristics IMHO.
> > > > > >
> > > > > > I looked at the Chromium source code that you linked, but I can=
not say
> > > > > > whether it's doing the correct thing. It all depends on what yo=
ur
> > > > > > program needs.
> > > > > >
> > > > > > In that function, you could also search for 'DRM_MODE_TYPE_USER=
DEF'.
> > > > > > It's the mode that the user specified on the kernel command lin=
e. If
> > > > > > Chromium's automatic mode selection fails, you'd give your user=
s direct
> > > > > > control over it.
> > > > >
> > > > > That doesn't really work for Chrome OS. Certainly a kernel hacker
> > > > > could do this, but it's not something I could imagine us exposing=
 to
> > > > > an average user of a Chromebook.
> > > > >
> > > > >
> > > > > > When there's no flagged mode or if
> > > > > > /sys/class/drm/card<...>/status contains "unconnected", you can=
 assume
> > > > > > that the modelist is artificial and try the modes in an appropr=
iate order.
> > > > >
> > > > > So "no flagged" means that nothing is marked as preferred, correc=
t?
> > > > >
> > > > > ...so I guess what you're suggesting is that the order that the k=
ernel
> > > > > is presenting the modes to userspace is not ABI. If there are no
> > > > > preferred modes then userspace shouldn't necessarily assume that =
the
> > > > > first mode returned is the best mode. Instead it should assume th=
at if
> > > > > there is no preferred mode then the mode list is made up and it s=
hould
> > > > > make its own decisions about the best mode to start with. If this=
 is
> > > > > the ABI from the kernel then plausibly I could convince people to
> > > > > change userspace to pick 640x480 first in this case.
> > > > >
> > > > > > If we really want the kernel to give additional guarantees, we =
should
> > > > > > have a broader discussion about this topic IMHO.
> > > > >
> > > > > Sure. I've added St=C3=A9phane Marchesin to this thread in case h=
e wants to
> > > > > chime in about anything.
> > > > >
> > > > > Overall, my take on the matter:
> > > > >
> > > > > * Mostly I got involved because, apparently, a DP compliance test=
 was
> > > > > failing. The compliance test was upset that when it presented us =
with
> > > > > no EDID that we didn't default to 640x480. There was a push to ma=
ke a
> > > > > fix for this in the Qualcomm specific driver but that didn't sit =
right
> > > > > with me.
> > > > >
> > > > > * On all devices I'm currently working with (laptops), the DP is =
a
> > > > > secondary display. If a user was trying to plug in a display with=
 a
> > > > > bad EDID and the max mode (1024x768) didn't work, they could just=
 use
> > > > > the primary display to choose a different resolution. It seems
> > > > > unlikely a user would truly be upset and would probably be happy =
they
> > > > > could get their broken display to work at all. Even if this is a
> > > > > primary display, I believe there are documented key combos to cha=
nge
> > > > > the resolution of the primary display even if you can't see anyth=
ing.
> > > > >
> > > > > * That all being said, defaulting to 640x480 when there's no EDID=
 made
> > > > > sense to me, especially since it's actually defined in the DP spe=
c. So
> > > > > I'm trying to do the right thing and solve this corner case. That
> > > > > being said, if it's truly controversial I can just drop it.
> > > > >
> > > > >
> > > > > So I guess my plan will be to give St=C3=A9phane a little while i=
n case he
> > > > > wants to chime in. If not then I guess I'll try a Chrome patch...
> > > > > ...and if that doesn't work, I'll just drop it.
> > > >
> > > > OK, this userspace code seems to work:
> > > >
> > > > https://crrev.com/c/3662501 - ozone/drm: Try 640x480 before picking
> > > > the first mode if no EDID
> > > >
> > > > ...so we'll see how review of that goes. :-)
> >
> > Mirroring some of my comments on that review here :-)
> >
> > IMO, this should be addressed in the kernel, or not at all. The kernel
> > ensures other aspects of DisplayPort implementation are compliant, so
> > I don't think this would be any exception. Further, the kernel is the
> > one creating the "safe" mode list, so it seems odd that userspace
> > would override that. Finally, relying on every userspace to do the
> > right thing is asking for trouble (we have 3 places which would need
> > this logic in CrOS).
>
> Oh I missed the part that this is defined in the DP spec as _the_ fallbac=
k mode.
>
> I think the probe helpers could check whether it's a DP connector and
> then dtrt per DP spec? I think that should have a solid chance of
> avoiding the regression mess, since the really shoddy stuff tends to
> be VGA/HDMI.

I'm fine with making this DP-specific if that's what people think is best.


> Also if DP says only 640x480 should be the fallback if there's no
> other mode list source, then I think we should trim it down to only
> that. But also only for DP.

So the DP spec says that 640x480 is _the_ default fallback, but it
also says that we're also allowed to have some implementation-specific
fall-back modes as well, so I'd rather not fully trim the list and
just make it clear (somehow) that 640x480 ought to be the default.
Would you be OK going back to v2 of this patch [1] but adding a check
that the connector type is DP and also making sure that the spec is
referenced?


> Also ofc that patch should reference the right DP spec sections :-)

My original patch description for this patch (v3) did reference
section 4.2.2.6 (EDID Corruption Detection) of the DP 1.4a Link CTS.
...or did you want this in inline comments in the patch itself?


[1] https://lore.kernel.org/r/20220510135101.v2.1.I31ec454f8d4ffce51a7708a8=
092f8a6f9c929092@changeid
