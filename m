Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0401D89CD43
	for <lists+freedreno@lfdr.de>; Mon,  8 Apr 2024 23:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E66E10E70B;
	Mon,  8 Apr 2024 21:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="txRIq4fg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C96210E391
 for <freedreno@lists.freedesktop.org>; Mon,  8 Apr 2024 21:14:01 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-dcc71031680so4631341276.2
 for <freedreno@lists.freedesktop.org>; Mon, 08 Apr 2024 14:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712610840; x=1713215640; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9H/wJYl3v6Nf1hcV5ZGzgLNZ6Hl7Vc5YVwplWIJ86fg=;
 b=txRIq4fgmyPvdAVjaIwk9j/V5y9lp+DwetUB7Q9EjELd7Gxon50RmDN9tQp4lmslMe
 RJsXLEu5oyYYIIF1Sxgl5/O1fsuG16PzYeFL+Z1wwT6gq+iBbJcDAPJs7i1eMVSSISJV
 O4AwqIA4SmP25X0CJ5rC0QLQaigQkjH6UDkpN8UGpmlY4jcNneorkqNw121MdMFjG/df
 XyHjgVZfQWBKEaWUSx+9nWiQSjjII2CFDlPOsfqA7KkMlqeBpJ/BxfuTgQStdYysQ3N0
 uT0RRhzf2ErRAuBQQ/MQDVoxTjqb3vETeL8f5VSkzt5vnBpY5sLDzERtvEUNjeDExkgE
 6Osw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712610840; x=1713215640;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9H/wJYl3v6Nf1hcV5ZGzgLNZ6Hl7Vc5YVwplWIJ86fg=;
 b=cPBp/2QcXkXzYWRRLl1G9JTf/lCYvKq6F/vILuJkl54dWi8Nx1JJNBWhAdYlJcGFEC
 iHLwi2qFqklc9Y8xFtePtXz0cvvFuVNUv2Oqynr7TX6kQXUUzZJSheysG9FuuDBJ/5a5
 tCjF20t4UizYPtDzD9ffTw+Jpr5XEz/FAvCi1OdfMPpzRtg+G4StH9gfc04otPVOsT8G
 koWTGOGkdMjc/BDFHdyJGAzEhswv2ZxE0FkEiNVeQcwGjNdaVaxQJg4WelBLrKxNoJiL
 XFYxzm4Fo0fVDQpbhf7bY5344hvAFPjPVdQuCGKI32PSbMwsbSJTo7/dQ8q2PYttrrtR
 byCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6gQzRk1owL0ssyrmgLRMC/4gJ0PIe6UiiefV89UAX0y1K86Vkw3vk8ijPUb2Ldp9FuGQ9mE30GJ7Q0sutEPMTOLRihcF9W1MXyDEAhoYy
X-Gm-Message-State: AOJu0YyuKJNPTVoZr8Z+E9Bq6Duv/mMJI81frEIdFK7+byk42B+x1biv
 8tdLVyoJpDXa2bFT53rd99Jt15Mhn62f36cbmjNVm/cVIn7WnAw2TuyDKSNFarjpeOQnkZyeb3d
 WJW+1mu2oVKukHFZexTxF0ze0IgRsoot/kfdMPQ==
X-Google-Smtp-Source: AGHT+IHXQ+bA+Y2zmisBo7GBSUwb5kuuO1IoG7nvhUH198RXgyldfz/Lvk4EBBBE3RI7gbBloKytkwb0/Oo957i0dQQ=
X-Received: by 2002:a25:5f42:0:b0:dca:59a7:896b with SMTP id
 h2-20020a255f42000000b00dca59a7896bmr7293567ybm.50.1712610839753; Mon, 08 Apr
 2024 14:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240406031548.25829-1-quic_abhinavk@quicinc.com>
 <ale6wbwzkfagcg2q6glb4vsxu3pthhkk3tquv2ixlatbdryqvh@xscsq2h6emho>
 <01cb1c0d-a801-37f9-2f55-2bbd8d3a68b9@quicinc.com>
 <k7f22hyltul4h4o4vqe6prc2yx3mm2q4dzk66j3xrsdpdtqllb@3c6ul4fpimwz>
 <b7ed299d-4cf7-8829-fd7f-e518aef05fb2@quicinc.com>
In-Reply-To: <b7ed299d-4cf7-8829-fd7f-e518aef05fb2@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 9 Apr 2024 00:13:48 +0300
Message-ID: <CAA8EJpqYWXs+KzZcrJA0zL2KNhpHQ+5xNpVNPmepztujmVJf=w@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dp: call dp_hpd_plug_handle()/unplug_handle()
 directly for external HPD
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org, swboyd@chromium.org, 
 quic_jesszhan@quicinc.com, quic_bjorande@quicinc.com, johan@kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 9 Apr 2024 at 00:08, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 4/8/2024 1:41 PM, Bjorn Andersson wrote:
> > On Mon, Apr 08, 2024 at 12:43:34PM -0700, Abhinav Kumar wrote:
> >>
> >>
> >> On 4/7/2024 11:48 AM, Bjorn Andersson wrote:
> >>> On Fri, Apr 05, 2024 at 08:15:47PM -0700, Abhinav Kumar wrote:
> >>>> From: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >>> [..]
> >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> index d80f89581760..bfb6dfff27e8 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> @@ -1665,7 +1665,7 @@ void dp_bridge_hpd_notify(struct drm_bridge *bridge,
> >>>>                    return;
> >>>>            if (!dp_display->link_ready && status == connector_status_connected)
> >>>> -          dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
> >>>> +          dp_hpd_plug_handle(dp, 0);
> >>>
> >>> If I read the code correctly, and we get an external connect event
> >>> inbetween a previous disconnect and the related disable call, this
> >>> should result in a PLUG_INT being injected into the queue still.
> >>>
> >>> Will that not cause the same problem?
> >>>
> >>> Regards,
> >>> Bjorn
> >>>
> >>
> >> Yes, your observation is correct and I had asked the same question to kuogee
> >> before taking over this change and posting.
> >>
> >> We will have to handle that case separately. I don't have a good solution
> >> yet for it without requiring further rework or we drop the below snippet.
> >>
> >>          if (state == ST_DISCONNECT_PENDING) {
> >>                  /* wait until ST_DISCONNECTED */
> >>                  dp_add_event(dp, EV_HPD_PLUG_INT, 0, 1); /* delay = 1 */
> >>                  mutex_unlock(&dp->event_mutex);
> >>                  return 0;
> >>          }
> >>
> >> I will need sometime to address that use-case as I need to see if we can
> >> handle that better and then drop the the DISCONNECT_PENDING state to address
> >> this fully. But it needs more testing.
> >>
> >> But, we will need this patch anyway because without this we will not be able
> >> to fix even the most regular and commonly seen case of basic
> >> connect/disconnect receiving complementary events.
> >>
> >
> > I did some more testing on this patch. Connecting and disconnecting the
> > cable while in fbcon works reliably, except for:
>
> Thanks for the tests !
>
> > - edid/modes are not read before we bring up the link so I always end up
> >    with 640x480
> >
>
> hmmm, I wonder why this should be affected due to this patch. We always
> read the EDID during hpd_connect() and the selected resolution will be
> programmed with the modeset. We will retry this with our x1e80100 and see.

BTW, why is EDID read during HPD handling? I always supposed that it
can be read much later, when the DRM framework calls the get_modes /
get_edid callbacks.

>
> > - if I run modetest -s <id>:<mode> the link is brought up with the new
> >    resolution and I get my test image on the screen.
> >    But as we're shutting down the link for the resolution chance I end up
> >    in dp_bridge_hpd_notify() with link_ready && state = disconnected.
> >    This triggers an unplug which hangs on the event_mutex, such that as
> >    soon as I get the test image, the state machine enters
> >    DISCONNECT_PENDING. This is immediately followed by another
> >    !link_ready && status = connected, which attempts to perform the plug
> >    operation, but as we're in DISCONNECT_PENDING this is posted on the
> >    event queue. From there I get a log entry from my PLUG_INT, every
> >    100ms stating that we're still in DISCONNECT_PENDING. If I exit
> >    modetest the screen goes black, and no new mode can be selected,
> >    because we're in DISCONNECT_PENDING. The only way out is to disconnect
> >    the cable to complete the DISCONNECT_PENDING.
> >
>
> I am going to run this test-case and see what we can do.
>
> > Regards,
> > Bjorn
> >
> >>
> >>>>            else if (dp_display->link_ready && status == connector_status_disconnected)
> >>>> -          dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
> >>>> +          dp_hpd_unplug_handle(dp, 0);
> >>>>    }
> >>>> --
> >>>> 2.43.2
> >>>>



-- 
With best wishes
Dmitry
