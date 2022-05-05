Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 564DF51C2DE
	for <lists+freedreno@lfdr.de>; Thu,  5 May 2022 16:47:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E3C10E493;
	Thu,  5 May 2022 14:47:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4110610E495
 for <freedreno@lists.freedesktop.org>; Thu,  5 May 2022 14:47:51 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id d6so5472833ede.8
 for <freedreno@lists.freedesktop.org>; Thu, 05 May 2022 07:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+N9gEqu1WkvYNw5+yo890P99LWHgEFq2ugJIKH1/Y2c=;
 b=iIsm1DofvLas9Il8wcWTQZj7FvTHkzneaE3ytMEmGGwdQeL60O/82Fh/sCbP5pGdLT
 2hdFMN9FpQEvruASiokNVsQAMCe/pD/nV2WilCEssTA4Po9j2y+VXhYHS3dW50SwFjmq
 uO9MAy7h4YVCrcLnudyisvtr+NnwTDweIyPaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+N9gEqu1WkvYNw5+yo890P99LWHgEFq2ugJIKH1/Y2c=;
 b=elhVy82WwmUjc74M0IKbTVGN3sSteLgxTCmrYAwzoUT6XQlYk773j1sQRZkRe5NK7o
 XplrdIIsz0Xet2BIzFCPN+RVbTEXIagT7X8+9vOw34GTfeHWl34+2DB2By7yiDCsmCl9
 s7oW6j00rVMT3emNaDPeRItNpR0sutE8nFDEswgM85ksTGjFMRC318Qg6YANsr6X0pVy
 vn1y+VKPVdgVwtEZNOIRqp4fucw5jF6a1J2LZEqprQDffZr8HLdLnldypJT2AZQLClSo
 doZqkch+85cQitotVxze1xe4fV+41N9//6af7oKJsURVgpRYszZrRl+mQSwffBu696lJ
 AvOw==
X-Gm-Message-State: AOAM532wOedJw2Oomhqx/W95BWW6iux3QeMm0ShZXR+IVXCqesM8gnLV
 u59bMbJdA/hhdeCQaE5986mi544VGyInOw3wV2k=
X-Google-Smtp-Source: ABdhPJzEbvUPxozPjFda4nTUabAaNGpYMwEUciafD/NkiZ0PnP8MBXN+emA+/KDRGAWatE/jBW2OCQ==
X-Received: by 2002:a05:6402:5205:b0:427:b431:e0ed with SMTP id
 s5-20020a056402520500b00427b431e0edmr26670461edd.186.1651762069322; 
 Thu, 05 May 2022 07:47:49 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com.
 [209.85.221.52]) by smtp.gmail.com with ESMTPSA id
 p4-20020a17090628c400b006f3ef214e07sm812371ejd.109.2022.05.05.07.47.45
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 07:47:47 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id u3so6446843wrg.3
 for <freedreno@lists.freedesktop.org>; Thu, 05 May 2022 07:47:45 -0700 (PDT)
X-Received: by 2002:adf:f50d:0:b0:20a:e096:ef with SMTP id
 q13-20020adff50d000000b0020ae09600efmr21138648wro.679.1651762065131; 
 Thu, 05 May 2022 07:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220503162033.1.Ia8651894026707e4fa61267da944ff739610d180@changeid>
 <YnJv3B/85hTz54SC@intel.com>
 <CAD=FV=WndmKuEB0=OVQP9YuJaSmD0uxkNs5LE0wWsFj7gBvhBA@mail.gmail.com>
 <1c6c9fde6e85f09cc89ea8dc6e8716fef58f3ee1.camel@redhat.com>
In-Reply-To: <1c6c9fde6e85f09cc89ea8dc6e8716fef58f3ee1.camel@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 May 2022 07:47:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V01S2hKPmA0VR_RedW1SWY3Mor8z9ZGy76NH9Cd3D4Cw@mail.gmail.com>
Message-ID: <CAD=FV=V01S2hKPmA0VR_RedW1SWY3Mor8z9ZGy76NH9Cd3D4Cw@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH] drm: Document that power requirements for
 DP AUX transfers
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Imre Deak <imre.deak@intel.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Jani Nikula <jani.nikula@intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, May 4, 2022 at 11:10 AM Lyude Paul <lyude@redhat.com> wrote:
>
> On Wed, 2022-05-04 at 09:04 -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, May 4, 2022 at 5:21 AM Ville Syrj=C3=A4l=C3=A4
> > <ville.syrjala@linux.intel.com> wrote:
> > >
> > > On Tue, May 03, 2022 at 04:21:08PM -0700, Douglas Anderson wrote:
> > > > When doing DP AUX transfers there are two actors that need to be
> > > > powered in order for the DP AUX transfer to work: the DP source and
> > > > the DP sync. Commit bacbab58f09d ("drm: Mention the power state
> > > > requirement on side-channel operations") added some documentation
> > > > saying that the DP source is required to power itself up (if needed=
)
> > > > to do AUX transfers. However, that commit doesn't talk anything abo=
ut
> > > > the DP sink.
> > > >
> > > > For full fledged DP the sink isn't really a problem. It's expected
> > > > that if an external DP monitor isn't plugged in that attempting to =
do
> > > > AUX transfers won't work. It's also expected that if a DP monitor i=
s
> > > > plugged in (and thus asserting HPD) that it AUX transfers will work=
.
> > > >
> > > > When we're looking at eDP, however, things are less obvious. Let's =
add
> > > > some documentation about expectations. Here's what we'll say:
> > > >
> > > > 1. We don't expect the DP AUX transfer function to power on an eDP
> > > > panel. If an eDP panel is physically connected but powered off then=
 it
> > > > makes sense for the transfer to fail.
> > >
> > > I don't agree with this. I think the panel should just get powred up
> > > for AUX transfers.
> >
> > That's definitely a fair thing to think about and I have at times
> > thought about trying to make it work that way. It always ends up
> > hitting a roadblock.
> >
> > The biggest roadblock that I recall is that to make this work then
> > you'd have to somehow ensure that the bridge chain's pre_enable() call
> > was made as part of the AUX transfer, right? Since the transfer
> > function can be called in any context at all, we have to coordinate
> > this with DRM. If, for instance, DRM is mid way through powering the
> > panel down then we need to wait for DRM to fully finish powering down,
> > then we need to power the panel back up. I don't believe that we can
> > just force the panel to stay on if DRM is turning it off because of
> > panel power sequencing requirements. At least I know it would have the
> > potential to break "samsung-atna33xc20.c" which absolutely needs to
> > see the panel power off after it's been disabled.
> >
> > We also, I believe, need to handle the fact that the bridge chain may
> > not have even been created yet. We do AUX transfers to read the EDID
> > and also to setup the backlight in the probe function of panel-edp. At
> > that point the panel hasn't been linked into the chain. We had _long_
> > discussions [1] about moving these out of probe and decided that we
> > could move the EDID read to be later but that it was going to really
> > ugly to move the AUX backlight later. The backlight would end up
> > popping up at some point in time later (the first call to panel
> > prepare() or maybe get_modes()) and that seemed weird.
> >
> > [1]
> > https://lore.kernel.org/lkml/CAD=3DFV=3DU5-sTDLYdkeJWLAOG-0wgxR49VxtwUy=
UO7z2PuibLGsg@mail.gmail.com/
> >
> >
> > > Otherwise you can't trust that eg. the /dev/aux
> > > stuff is actually usable.
> >
> > Yeah, it's been on my mind to talk more about /dev/aux. I think
> > /dev/aux has some problems, at least with eDP. Specifically:
> >
> > 1. Even if we somehow figure out how to power the panel on as part of
> > the aux transfer, we actually _still_ not guaranteed to be able to
> > talk to it as far as I understand. My colleague reported to me that on
> > a system he was working with that had PSR (panel self refresh) that
> > when the panel was powered on but in PSR mode that it wouldn't talk
> > over AUX. Assuming that this is correct then I guess we'd also have to
> > do even more coordination with DRM to exit PSR and block future
> > transitions of PSR. (NOTE: it's always possible that my colleague ran
> > into some other bug and that panels are _supposed_ to be able to talk
> > in PSR. If you think this is the case, I can always try to dig more).
>
> TBH - the coordination with drm I don't think would be the difficult part=
, as
> we'd just need to add some sort of property (ideally invisible to userspa=
ce)
> that can be used in an atomic commit to disable PSR - similar to how we e=
nable
> CRC readback from sysfs in the majority of DRM drivers. That being said
> though, I think we can just leave the work of solving this problem up to
> whoever ends up needing this to work.
>
> >
> > 2. I'm not totally convinced that it's a great idea, at least for eDP,
> > for userspace to be mucking with /dev/aux. For DP's case I guess
> > /dev/aux is essentially enabling userspace drivers to do things like
> > update firmware on DP monitors or play with the backlight. I guess we
> > decided that we didn't want to add drivers in the kernel to handle
> > this type of stuff so we left it for userspace? For eDP, though, there
>
> The main reason DP AUX got exposed to userspace in the first place was fo=
r
> usecases like fwupd, where some MST docks actually do their firmware upda=
tes
> over DPCD. I don't know of any equivalent usecase for eDP at the moment, =
but I
> can definitely try asking some of the OEM contacts I have whether this is=
/may
> eventually be a thing or not.

Thanks for the history. Even if we want to do firmware updates for eDP
with this, then having the AUX transfer function temporarily power the
panel would almost certainly not be enough. You can't update the
firmware in one AUX transfer and you certainly wouldn't want any
chance of the panel being powered down mid-update.

That means either:

a) Userspace has to have some way itself of ensuring that the panel
stays powered on. If this is true then we don't need to worry about
powering it on as part of the AUX transfer.

b) We shouldn't use the DP AUX transfer function for panel FW updates
and should come up with a solution for eDP where FW updates are
coordinated by the panel driver.

As you said above, this can wait until someone has the need to
implement this. Neither a) nor b) contradicts my documentation.


> > is a panel driver and we if we have an AUX backlight we create a real
> > backlight device. If we needed to do a firmware update of an eDP panel
> > it would make sense for the panel driver to present some interface for
> > the firmware update so that the panel driver could make sure that the
> > panel stayed powered for the duration of the firmware update, not just
> > for the duration of a single AUX transfer.
>
> Yeah, I tried adding this at one point actually but ran into some issues
> finding a nice solution. It wasn't the most important thing at the time, =
so I
> ended up shifting my attention to other things. Honestly the biggest
> complicating factor of this is the fact that we can't synchronously wake =
up a
> device from sysfs without introducing a deadlock due to lock order invers=
ion
> between DRM and sysfs. If this could be solved nicely, I think a lot of t=
his
> would become far easier.
>
> >
> > 3. In general it feels a little awkward for userspace to be directly
> > poking at the same set of registers that a kernel driver is also
> > poking at.
>
> We could always consider limiting the ranges that the DP AUX interface al=
lows
> userspace to read from, although I haven't thought too hard about that si=
nce I
> don't know that would fix the issue entirely.
>
> >
> > To me it feels like /dev/aux is much like the /dev/i2c interface. Yes,
> > userspace can go talk to random i2c devices and can even talk to them
> > after a kernel driver has "claimed" an i2c device, but:
> > a) If an i2c device is powered off, then the i2c transfer won't work.
> > b) If you set a register of a device managed by a kernel driver behind
> > the back of the kernel driver, you're really asking for trouble.
> >
> >
> > So I guess my proposals would be to pick one of:
> >
> > a) Leave things they way they are as I've documented. NOTE that my
> > documentation does document the way things are today. No aux transfer
> > function that I'm aware of powers up an eDP panel. In this case if
> > someone wants to use /dev/aux for an eDP panel it's really up to them
> > not to shoot themselves in the foot.
>
> To be honest, I do totally agree though that /dev/aux has very limited
> usecases for eDP. I do think it's definitely a useful debugging tool, and=
 it's
> been a big help in figuring out how things like backlight interfaces work=
 when
> I'm otherwise lacking in docs (and sometimes it's still useful, since you=
 can
> test various subleties of panel controllers). So at a bare minimum, I'd v=
ery
> much like it if we can at least keep it around in some form (perhaps hidd=
en
> behind a kernel config option). Although, that brings up the question of =
if
> that makes it harder for someone without kernel debugging experience to g=
et me
> DPCD output from a panel outside of what got logged to the kernel=E2=80=
=A6

My opinion is to simply land this documentation patch but otherwise
leave it alone. Any chance you'd be willing to provide a Reviewed-by
(assuming I fix the typo that Dmitry pointed out)?


> > b) Stop populating /dev/aux for eDP panels and only do it for DP and
> > then if/when someone yells we figure out how they were using /dev/aux
> > and why it was safe. This is definitely an ABI change but I have no
> > idea if it would really break anyone. I suppose we could take a first
> > step by spewing a WARN_ON if someone directly uses /dev/aux for eDP?
> >
> > c) Somehow dynamically create / remove the /dev/aux device as the eDP
> > panel turns off and on again. If /dev/aux is there then we know that
> > the panel is on. NOTE: this ignores PSR. I don't think we'd want to
> > delete / create the /dev/aux node that often. So we'd either have to
> > still accept that the transfers will sometimes fail (c1) or make it a
> > requirement that we bring the panel out of PSR for an AUX transfer
> > (c2).
> >
> >
> > Technically we could list option (d) to power the panel up, but as per
> > above I think it's pretty awkward and doesn't feel like the right way
> > to go. Obviously happy to hear other opinions, though.
