Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B480A9F342
	for <lists+freedreno@lfdr.de>; Mon, 28 Apr 2025 16:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3048E10E041;
	Mon, 28 Apr 2025 14:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SEHvFxYt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F287C10E041
 for <freedreno@lists.freedesktop.org>; Mon, 28 Apr 2025 14:17:25 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5f7ec0e4978so2641024a12.1
 for <freedreno@lists.freedesktop.org>; Mon, 28 Apr 2025 07:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745849844; x=1746454644; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MAB7MM/5KcPgVIvsQ7jcOLB1Q0JL1wGvVRTO+fCZY6E=;
 b=SEHvFxYtiR5RTJp73QNMuZ0R/UhuPw7l8nCup//q8xL/9ksvTOv09uk075r/JzqIO0
 rKM2SkMwcD+vbrUDPdJN42gXpeVc1Fzv28kyp1GshCOBc/pn/lbInhb0GvYugCUM3IFa
 bgRIaJAR3yqx35LGcaR6jpG6IsUcQnK0R5d33i45AuP1f47MDMhO/vCGsU8Hz25wLwbC
 658dBDlw5JUvAKpsXaDQ7TWZXitQJVSjhykQbWgxUGzUbJB/456c5I+t5VNSO/3jLsXB
 7jMxS7z0Fl1EYYuPBaeH3wIojYLUiJoWJLF4FoGpVsJRHmg8T9lc79aHDW44Qh9hJEcr
 sxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745849844; x=1746454644;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MAB7MM/5KcPgVIvsQ7jcOLB1Q0JL1wGvVRTO+fCZY6E=;
 b=s6geOud5liAS3m0IkMDINhfkWNTwPdjlwab5265Xp6+APZqPx1/3hnSV+3Bb+aMTUa
 X+gb/sP4eVIRJsJuhrqogvaF8GvNOPOQTpLzvFFERB7cTdK5N75R3TB3uYehoy6glTxq
 MQ0jEWmqShOFmsTjTUzZTMK6Qc0V2VslHbYv6BW4egju0T2bYcXcAZpRMIzuvf9wbDtL
 NVbtNH6ldn1419/joc9jDzkaz3ortC4SGprjbXFoCR57RLoeGtPjWbZazBl9kNpLf+EH
 jKQ0a1/vjOv3xKMrIrYBI5W0ZlUVQEM7ntb+Vr8oPDf+PHt1kA5DDoGvp8K/XD3m6YGr
 NNPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6vPEAnUsSAZYQR4qnExaKuvFJRjtgR3ELEXbc6fFwAKYZ6Po2VdKaqImAedqdh/TFDcmKk0Yrd9E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHdO3rPg8yj00hd+eJYfV7ii7DVP5PoSpSV/4Dn/1CzqGNtpob
 sslyNLp32OwyfjaHxlJVC34FTAxf/uxAX7sD9Ejyu/EZpDYKH188th9ZiHjTwto=
X-Gm-Gg: ASbGnctGxZnby0Tb655yK8wyGfBto5lVGuSU5XwdN5yntss3bREqW7QaH4BUfu4Lh0Z
 UlSgtj+53zhD8pgiJo+ofExxlbK3vf84LLO18oQCS8w1fKlb33JW1Ne8Ow1iHeqJeQvxPdDSeRz
 fKwKosFiqTr9AVyCUJ24AxXzzmlZIjF4JsRKea7A/+eggMZjXMt+cdQHIJSBLz9RA7rQYiHv3EU
 rWQUFr6GTieIDSfGVbpf/cHQ/pzcfYEPDMjrZIke+eP9hRQMpni2XytrZtiI/LyF8XWM0gUwq/i
 gojhIcKIdZ4CbbQ9WlZ48rFlGveH1y1RxVA0XA==
X-Google-Smtp-Source: AGHT+IEbdwFeeDsBIl2er2pHFgP5t9WIvItB5t8KO8vYPa4TRLVU01MHNtVHzK/JvZ2FwrGG5uN74g==
X-Received: by 2002:a17:907:9816:b0:aca:cac6:3ca9 with SMTP id
 a640c23a62f3a-ace71107381mr1124921366b.27.1745849844383; 
 Mon, 28 Apr 2025 07:17:24 -0700 (PDT)
Received: from linaro.org ([62.231.96.41]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e4e69d9sm642199166b.50.2025.04.28.07.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 07:17:23 -0700 (PDT)
Date: Mon, 28 Apr 2025 17:17:21 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
Message-ID: <aA+N8YHX0DZ6h9Uj@linaro.org>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <aA8yFI2Bvm-lFJTl@hovoldconsulting.com>
 <CAMcHhXpmii=Rc9YVeKXaB17mYv0piSFs02K=0r8kWe5tQGk7eA@mail.gmail.com>
 <aA94yOjsayZHNDpx@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aA94yOjsayZHNDpx@hovoldconsulting.com>
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

On 25-04-28 14:47:04, Johan Hovold wrote:
> On Mon, Apr 28, 2025 at 11:06:39AM +0200, Aleksandrs Vinarskis wrote:
> > On Mon, 28 Apr 2025 at 09:45, Johan Hovold <johan@kernel.org> wrote:
> > > On Thu, Apr 17, 2025 at 04:10:31AM +0200, Aleksandrs Vinarskis wrote:
> > > > Recently added Initial LTTPR support in msm/dp has configured LTTPR(s)
> > > > to non-transparent mode to enable video output on X1E-based devices
> > > > that come with LTTPR on the motherboards. However, video would not work
> > > > if additional LTTPR(s) are present between sink and source, which is
> > > > the case for USB Type-C docks (eg. Dell WD19TB/WD22TB4), and at least
> > > > some universal Thunderbolt/USB Type-C monitors (eg. Dell U2725QE).
> > >
> > > Does this mean that the incomplete LTTPR support in 6.15-rc1 broke
> > > adapters or docks with retimers in transparent mode?
> > 
> > I am actually not 100% sure.
> > - If without LTTPR initialization, they default to transparent mode,
> > then yes, incomplete LTTPR support sets them to non-transparent
> > without per-segment training and breaks docks with retimers, while it
> > would've worked if LTTPR(s) would've been left in default transparent
> > mode. Note that in this case, X1E devices with ps883x are somehow an
> > exception, because without LTTPR initialization at all the training
> > always fails.
> 
> Right, I'm concerned about breaking working setups for users of machines
> like the X13s.
> 
> > - If LTTPR has to be initialized either way, and explicitly set to
> > transparent mode if we do not want non-transparent, then no,
> > incomplete LTTPR support in 6.15-rcX did not explicitly break docks
> > with retimers, as those never worked in the first place. As per my
> > understanding, this is the case, unless something (firmware?) has
> > already placed LTTPR to transparent mode before the driver takes over
> > - then 1st case would be applicable.
> > 
> > Docks with retimers do not work in 6.15-rcX, but I am unable to verify
> > if it did work before, as I do not have a Qualcomm based device
> > without LTTPR on the baseboard.
> 
> Abel (or anyone else), do you have one of these docks that you could
> test with the X13s to confirm whether this series fixes a regression or
> not?

Before the support for LTTPRs has been merged, if you would have one of
those docks (I do not own one) with LTTPRs, link training would've just
failed if the LTTPRs were not by default in transparent mode, which IIRC
is what the standard dictates.

X13s doesn't have LTTPRs on-board so when reading the caps, LTTPRs count
would return 0 and none of the of the transparent/non-transparent setup
would happen. Now, as already mentioned, DP would be considered already
broken (or rather not supported) if you would connect a dock with LTTPRs in it.

With the support in, if one such dock is used, the training should be
successful as all LTTPRs are set in transparent mode. This I was not
able to test myself as I do not own such a dock.

> 
> > > You describe at least one of this patches as a fix but I'm not seeing
> > > any Fixes tags or indication that these need to go into 6.15-rc to fix
> > > a regression.
> > 
> > You are right, I will add Fixes tag to the 1st patch to make it clear:
> > Fixes 72d0af4accd (drm/msm/dp: Add support for LTTPR handling)
> > 
> > Or should I mark the entire series with Fixes, so that the docking
> > stations with retimers can be fixed in 6.15 already? Landing only the
> > 1st patch will fix inconsistency with DP spec, but will not fix
> > docking stations with retimers. I guess this comes down to whether
> > existing LTTPR (but not multiple LTTPRs) support is considered a bug
> > (and patches 2,3,4 are a fix) or lack of functionality (and patches
> > 2,3,4 are a new feature).
> 
> Indeed. If LTTPR support broke existing setups, then I think all should
> be marked with a Fixes tag and merged for 6.15. If we can't get it into
> 6.15 we may consider just disabling LTTPR support in 6.15 to address the
> regression and then enable it again once fixed in 6.16.

The LTTPR support did not break existing (working) setups because on these
setups, LTTPR count would read 0 and would be basically a no-op.

> 
> But if this series is just enabling support for docks (and USB-C ports)
> that did not used to work, then I guess this can all wait for 6.16.

I'm not sure about what this actually fixes. It might be that is
specific to a dock or something. But as far as X Elite boards go, even
without this "fix" display has been working fine.

The change itself makes sense though and I think makes sense to be marked as a fix.

> 
> Johan

Abel
