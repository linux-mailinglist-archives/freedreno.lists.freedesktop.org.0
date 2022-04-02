Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF7C4F052E
	for <lists+freedreno@lfdr.de>; Sat,  2 Apr 2022 19:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E509C10E2F1;
	Sat,  2 Apr 2022 17:12:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C937B10E2F1
 for <freedreno@lists.freedesktop.org>; Sat,  2 Apr 2022 17:12:36 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id i27so4774415ejd.9
 for <freedreno@lists.freedesktop.org>; Sat, 02 Apr 2022 10:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5VLKCCSpyLmISzla9N+/XjTX+JlDxz/a8/Khh5Jtd44=;
 b=EBQqUAyAT2mFgxAKYH2mUSOPgB8C0WKxoSl2rV5zFX5XrqYk/q4IfaW3dN8mTnyRaK
 6GqdOmrmI+L2/7nD1BufbrQsZ9zwdhDQ43hGb4cJD8bbwF4a2c0hp1ZpB2K0ikTBCCm1
 Qas1Q/6mJyz1+zmx9g8I5NTiOnNndaJ0Fh+pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5VLKCCSpyLmISzla9N+/XjTX+JlDxz/a8/Khh5Jtd44=;
 b=dNQJ4jaAvSB/Me0cHN4q35HQps0oqMW8KHyRY1/q0wXwqIBkpcFPeH2sRIJr/VUb/N
 3JBy8sanTlbbi+q91l2tttbIkLMVKvKRFKu7z5Ochbk8E+lvHMQVNOPnqGWHvU65V0vS
 93xLORzX2scF6U24cRRHfCjejafrR9dyWXyiMFNuOO6ZMpWoa4eYf+gqvXoEzWurDB6r
 RQW2b/DNx9ctPh8jK0LGUImwYKJFADITqARxXQYcRRmHx+cfnJ5FgWHEt5Js7/VIfB+S
 y7DE7VV70U1iSW3F99/OmHQ9FkT/3ndgaGlAyHdBdJnkCYDh0dvx/Z0mKsq+/ItIXhge
 R4bA==
X-Gm-Message-State: AOAM532Q80WWj3x4H7HFE3NHftgguQolmBr+9MtqG03KJpFwSMynmDMx
 BYS1SyxpDK0KdLP19ZwlyOhT8OWxOtcvNuQ8Pnk=
X-Google-Smtp-Source: ABdhPJze2rHpixG3kVdZZBiQkB+Drw5IdLAZQsb2djJ2XUoOsKwCYSL8R3eu9KdwF0sqxOOTUkqv2A==
X-Received: by 2002:a17:906:7307:b0:6da:92e1:9c83 with SMTP id
 di7-20020a170906730700b006da92e19c83mr4526413ejc.459.1648919555009; 
 Sat, 02 Apr 2022 10:12:35 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com.
 [209.85.218.53]) by smtp.gmail.com with ESMTPSA id
 e26-20020a50ec9a000000b004193fe50151sm2766008edr.9.2022.04.02.10.12.34
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Apr 2022 10:12:34 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id k23so8455223ejd.3
 for <freedreno@lists.freedesktop.org>; Sat, 02 Apr 2022 10:12:34 -0700 (PDT)
X-Received: by 2002:a5d:5551:0:b0:203:f916:e319 with SMTP id
 g17-20020a5d5551000000b00203f916e319mr11736269wrw.422.1648919197780; Sat, 02
 Apr 2022 10:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=X+QvjwoT2zGP82KW4kD0oMUY6ZgCizSikNX_Uj8dNDqA@mail.gmail.com>
 <392b933f-760c-3c81-1040-c514045df3da@linaro.org>
In-Reply-To: <392b933f-760c-3c81-1040-c514045df3da@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 2 Apr 2022 10:06:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W4PYK-t607yjRbfjDjjEZX0KdgHDRukw_vSH8E8EDH6w@mail.gmail.com>
Message-ID: <CAD=FV=W4PYK-t607yjRbfjDjjEZX0KdgHDRukw_vSH8E8EDH6w@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6 1/8] drm/msm/dp: Add eDP support via
 aux_bus
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, quic_aravindh@quicinc.com,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Sat, Apr 2, 2022 at 3:37 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 01/04/2022 02:22, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Mar 30, 2022 at 9:03 AM Sankeerth Billakanti
> > <quic_sbillaka@quicinc.com> wrote:
> >>
> >> @@ -1547,6 +1593,10 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
> >>
> >>          dp_display->encoder = encoder;
> >>
> >> +       ret = dp_display_get_next_bridge(dp_display);
> >> +       if (ret)
> >> +               return ret;
> >
> > It feels weird to me that this is in a function called "modeset_init",
> > though I certainly don't know the structure of the MSM display code
> > well enough to fully comment.
>
> It's called modeset_init() as it initializes KMS objects used by DP
> driver. We have similar functions for dsi and hdmi

Sorry, I wasn't meaning to imply that modeset_init() was a bad name or
anything. Mostly saying that I wasn't sure that modeset init was the
proper time to populate the aux bus. ...but then again, perhaps it is
given the current structure of this driver?


> > My expectation would have been that
> > devm_of_dp_aux_populate_ep_devices() would have been called from your
> > probe routine and then you would have returned -EPROBE_DEFER from your
> > probe if you were unable to find the panel afterwards.
>
> I don't think it's possible to call it from probe() since
> drm_dp_aux_register() is called only from dp_display_bind().
> The PHY also isn't initialized at that moment, so we can not probe AUX
> devices.
>
> The overall semantics of the AUX bus is not clear to me.
> Typically the bus is populated (and probed) when devices are accessible.
> But for the display related buses this might not be the case.

In general the AUX bus is modeled much like the i2c bus. You probe the
sub-device when you're able to transfer. Then you can confirm that the
device is actually there and init the device.


> For example for the DSI bus we clearly define that DSI transfer are not
> possible before the corresponding bridge's (or panel's) enable call.
>
> Maybe the same approach should be adopted for the AUX bus. This would
> allow us to populate the AUX bus before hardware access is actually
> possible, thus creating all the DRM bridges before the hardware is
> actually up and running.

So I guess what you're proposing is that you could probe the devices
under the AUX bus and they could acquire resources (and possibly
return EPROBE_DEFER) at a point in time _before_ it's actually
possible to transfer. Then I guess you'd later do the transfer?

I guess conceivably one could re-design the DRM subsystem like that,
but I don't think it's trivial. Why? I believe that we need to know
things about the panel at probe time. For instance, we need to be able
to populate the panel's modes. To get this information we need the
EDID which means we need to be able to do a transfer. If we're using
an AUX backlight we also need to add info about the backlight at probe
time and that also needs the transfer to work.


So I guess the net result is maybe we should just keep it where it is.
Long term I'd be interested in knowing if there's a reason why we
can't structure the driver so that AUX transfers can happen with less
intertwining with the rest of the code, but that can happen later. I
would expect that you'd basically just need clocks and regulators on
and maybe your PHY on. Ideally with some pm_runtime fun we should be
able to do that independently with anything else the driver needs to
do?

-Doug
