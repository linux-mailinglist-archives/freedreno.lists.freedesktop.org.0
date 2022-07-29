Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF7C5851CE
	for <lists+freedreno@lfdr.de>; Fri, 29 Jul 2022 16:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1BD10E0BD;
	Fri, 29 Jul 2022 14:50:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05EA10E089
 for <freedreno@lists.freedesktop.org>; Fri, 29 Jul 2022 14:50:37 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id rq15so2947294ejc.10
 for <freedreno@lists.freedesktop.org>; Fri, 29 Jul 2022 07:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=g357UGRf0Iful4TOzguMzCzIJcq6XgTINqo6kA79z4o=;
 b=APHHgWYL3tgaUeSKYYhNcmwEqqgGv9WmoGy/seJ3KbfcSysjrKeQ7jz9d/y7CZxIzr
 KhHjx20mL8cZKbWP2mZjLD3QTqnnAeR7aOTWv0EZwaYVPOIVZT6fyxk3v2DryVWXoYJD
 hgOZY6cjz5nz2PmjMwGfgOJxaxyP0kNcvsQV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=g357UGRf0Iful4TOzguMzCzIJcq6XgTINqo6kA79z4o=;
 b=vzKK/iA9Ybt8TlP+kzxn6Siah/5wOGnIzxlucrlTTOW1UeIGtdTTtFl9ug6LNw1zjF
 qW/ikh7D8iIanNJkZanCdd86qwwKHEB1b4PGUFcPXXyMIJDEb4TESWw8ylZO9GfjredW
 IzqH3Eiqf2InN8Nd93dyHmsSsvG6BiTsWzAJTlNMMEf90Hzneon28iRml6SWge8J1WPE
 1u1ZV74fmfVawxmEYzhyKj5W1LOs35O9oCJ3oysefL3XVsFZfVwW1RHNyOsJIYaW2GQJ
 HKntZr4TR1RRfptsIiqecJ9kKXsxhBhgjTZSsxOUJ8PWdaKyuiMkgpJ/C4fqhsf1ZyZY
 VxFg==
X-Gm-Message-State: AJIora/k/QjV4mmXm1hVwvTeU5NYPdD0vhJ/Fol0tekcUT4w0C3ptsSL
 DjwsOjYnpXWdlIC0+xuIKbU1l3s67TS9q9PkGgk=
X-Google-Smtp-Source: AGRyM1vbu/HJCuhoVEGVU4YwesJ0k82eh+FofksiK3XVjVue2/ekLMmWDxKewR8SF/DNkqVQnbdiSQ==
X-Received: by 2002:a17:907:87b0:b0:72f:8d3d:2010 with SMTP id
 qv48-20020a17090787b000b0072f8d3d2010mr3161225ejc.743.1659106235845; 
 Fri, 29 Jul 2022 07:50:35 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54]) by smtp.gmail.com with ESMTPSA id
 o23-20020a170906769700b00722e5b234basm1807218ejm.179.2022.07.29.07.50.34
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 07:50:34 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id bn9so6294510wrb.9
 for <freedreno@lists.freedesktop.org>; Fri, 29 Jul 2022 07:50:34 -0700 (PDT)
X-Received: by 2002:a05:6000:178f:b0:21e:98ee:f1e6 with SMTP id
 e15-20020a056000178f00b0021e98eef1e6mr2691892wrg.405.1659106233759; Fri, 29
 Jul 2022 07:50:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220721152314.RFC.1.Ie333b3e4aff6e4a5b58c4aa805e030e561be8773@changeid>
 <269f2610-425b-f296-dcfc-89bdc2e1d587@quicinc.com>
 <CAD=FV=XSVXasU5PMR2kL0WQjQ458xDePuTGd1m14_v9JO5B6oA@mail.gmail.com>
 <CAF6AEGv_Vikf80v-7ccz90fvGPrk5pV1tOxRoWKxKHYuEW8=aA@mail.gmail.com>
 <5c8ca71c-5f0b-d5f5-9f16-e312dec0d01b@quicinc.com>
 <CAD=FV=UGYV1mZenDCRrbpC+gpE12-Uis7fm_=H3PeEjK=t36yA@mail.gmail.com>
 <20220729075118.ofnpk52tk4usm3n3@penduick>
In-Reply-To: <20220729075118.ofnpk52tk4usm3n3@penduick>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 29 Jul 2022 07:50:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WUB68-DQ-pAFjGaG-kid33ve4Qc3iqb8OUh61xTBohmg@mail.gmail.com>
Message-ID: <CAD=FV=WUB68-DQ-pAFjGaG-kid33ve4Qc3iqb8OUh61xTBohmg@mail.gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RFC PATCH] drm/edid: Make 144 Hz not preferred on
 Sharp LQ140M1JW46
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Fri, Jul 29, 2022 at 12:51 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Thu, Jul 28, 2022 at 02:18:38PM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Jul 28, 2022 at 10:34 AM Abhinav Kumar
> > <quic_abhinavk@quicinc.com> wrote:
> > >
> > > Hi Rob and Doug
> > >
> > > On 7/22/2022 10:36 AM, Rob Clark wrote:
> > > > On Fri, Jul 22, 2022 at 9:48 AM Doug Anderson <dianders@chromium.org> wrote:
> > > >>
> > > >> Hi,
> > > >>
> > > >> On Fri, Jul 22, 2022 at 9:37 AM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > >>>
> > > >>> + sankeerth
> > > >>>
> > > >>> Hi Doug
> > > >>>
> > > >>> On 7/21/2022 3:23 PM, Douglas Anderson wrote:
> > > >>>> The Sharp LQ140M1JW46 panel is on the Qualcomm sc7280 CRD reference
> > > >>>> board. This panel supports 144 Hz and 60 Hz. In the EDID, the 144 Hz
> > > >>>> mode is listed first and thus is marked preferred. The EDID decode I
> > > >>>> ran says:
> > > >>>>
> > > >>>>     First detailed timing includes the native pixel format and preferred
> > > >>>>     refresh rate.
> > > >>>>
> > > >>>>     ...
> > > >>>>
> > > >>>>     Detailed Timing Descriptors:
> > > >>>>       DTD 1:  1920x1080  143.981 Hz  16:9   166.587 kHz  346.500 MHz
> > > >>>>                    Hfront   48 Hsync  32 Hback  80 Hpol N
> > > >>>>                    Vfront    3 Vsync   5 Vback  69 Vpol N
> > > >>>>       DTD 2:  1920x1080   59.990 Hz  16:9    69.409 kHz  144.370 MHz
> > > >>>>                    Hfront   48 Hsync  32 Hback  80 Hpol N
> > > >>>>                    Vfront    3 Vsync   5 Vback  69 Vpol N
> > > >>>>
> > > >>>> I'm proposing here that the above is actually a bug and that the 60 Hz
> > > >>>> mode really should be considered preferred by Linux.
> > >
> > > Its a bit tricky to say that this is a bug but I think we can certainly
> > > add here that for an internal display we would have ideally had the
> > > lower resolution first to indicate it as default.
> >
> > Yeah, it gets into the vagueness of the EDID spec in general. As far
> > as I can find it's really up to the monitor to decide by what means it
> > chooses the "preferred" refresh rate if the monitor can support many.
> > Some displays may decide that the normal rate is "preferred" and some
> > may decide that the high refresh rate is "preferred". Neither display
> > is "wrong" per say, but it's nice to have some consistency here and to
> > make it so that otherwise "dumb" userspace will get something
> > reasonable by default. I'll change it to say:
> >
> > While the EDID spec appears to allow a display to use any criteria for
> > picking which refresh mode is "preferred" or "optimal", that vagueness
> > is a bit annoying. From Linux's point of view let's choose the 60 Hz
> > one as the default.
>
> And if we start making that decision, it should be for all panels with a
> similar constraint, so most likely handled by the core, and the new
> policy properly documented.
>
> Doing that just for a single panel is weird.

Yeah, though having a "general policy" in the core can be problematic.

In general I think panel EDIDs are only trustworthy as far as you can
throw them. They are notorious for having wrong and incorrect
information, which is why the EDID quirk list exists to begin with.
Trying to change how we're going to interpret all EDIDs, even all
EDIDs for eDP panels, seems like it will break someone somewhere.
Maybe there are EDIDs out there that were only ever validated at the
higher refresh rate and they don't work / flicker / cause digitizer
noise at the lower refresh rate. Heck, we've seen eDP panel vendors
that can't even get their checksum correct, so I'm not sure I want to
make a global assertion that all panels validated their "secondary"
display mode.

In this particular case, we have validated that this particular Sharp
panel works fine at the lower refresh rate.

I would also note that, as far as I understand it, ODMs actually can
request different EDIDs from the panel vendors. In the past we have
been able to get panel vendors to change EDIDs. Thus for most panels
I'd expect that we would discover this early, change the EDID default,
and be done with it. The case here is a little unusual in that by the
time we got involved and started digging into this panel too many were
created and nobody wants to throw away those old panels. This is why
I'm treating it as a quirk/bug. Really: we should have updated the
EDID of the panel but we're unable to in this case.

-Doug
