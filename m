Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EE6802621
	for <lists+freedreno@lfdr.de>; Sun,  3 Dec 2023 19:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F0210E15D;
	Sun,  3 Dec 2023 18:11:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7451B10E08B
 for <freedreno@lists.freedesktop.org>; Sun,  3 Dec 2023 18:10:43 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6d9a1a2fb22so91681a34.0
 for <freedreno@lists.freedesktop.org>; Sun, 03 Dec 2023 10:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701627042; x=1702231842; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hNWrRac9X2HwvORQ757NwocfD1vnHP+xf8IZ/qHDI6Y=;
 b=SDUCeGauOivMcETfmXx6hltODOK6yDoRDHG9EsYL3WkAhLy4HmrO4Vc/aGALRVnTDe
 ZnnIHqlB7p/V0QW7X+mJHM1mB6XWs+sTFUes13S1b5VyWFLALN7y9EFdE6Uv8iJmunYz
 98ihZIgnUKdes1PorVxn9OXq18YtPkzHiH7mMrxMHzBEzTb0QjXB+DezGKArY+44MOjY
 0ERgvGsCjZ/H0f+DyiBxghq5AS37A1PNFbjIWWOrVIqvY8jxADYArUtagyXYkOXP9EwA
 W7RvBfPkadV157zpeD28lHMdZoFBMkJCe/YLw53iNE26jpH3vCS34KhwtLnQRQD79dKe
 D/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701627042; x=1702231842;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hNWrRac9X2HwvORQ757NwocfD1vnHP+xf8IZ/qHDI6Y=;
 b=P3R01LzXNIieXPbKbkgmbagN6zU/CnOEzI2XwUOrH0IE+Cb80nz582XlSL4W+4hHTA
 ur21asNEHiAJM15vBr//m4PiSjWwQIUPk/G7sOokpLlJgChdBk7FkmuDK9ePL3LieWMY
 BjvsszAoT/RqGh69VBGY3bdQ3RJ9dO0uLGX6XKs7uPo4EQOYVBa28Dn3Gu3EjBmckEv2
 koB5kO16VfB+vOZJpG139Q35GArRwHvvDd4j595SAeZFxiNsyS82uawlqAn9To4Wgwjp
 bm5246FVQsGyfLY6UOdU8VohYczp15gBDPoFKsR2IZ/Ah6I3cEMFVjouk1OS7SgHAjxs
 oa0g==
X-Gm-Message-State: AOJu0Yxdmfsg5VV45EXY4Ut4/e+gq9ErXpbhUbuKohO5Oe+YLvfNCgN7
 aow27tqO/zqXDuTALAdKIcASfdm7y7GoQjKfXr8Ddg==
X-Google-Smtp-Source: AGHT+IHb3Z+Gg112hSwn2ALLmEQLugH9ogYS6oGgilydDX+dwhOwywfw0uwnNsBepyMljqTdUfek1dtr5E8c4G2RWMA=
X-Received: by 2002:a05:6358:9214:b0:169:49f7:cb1c with SMTP id
 d20-20020a056358921400b0016949f7cb1cmr3149078rwb.8.1701627042402; Sun, 03 Dec
 2023 10:10:42 -0800 (PST)
MIME-Version: 1.0
References: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com>
 <170155324921.2215646.4829699354481827834.b4-ty@linaro.org>
 <OiX1EToyQ0JBECS-Vs6IOw1vqLTt42PYkTlTCBhsPUi-VXC2UoLjkRfEW-OFucxsTqz93Q3IIXZZ3Lw_Lqs1dFt4YbuFSUGrKfDPnnKDCbw=@emersion.fr>
In-Reply-To: <OiX1EToyQ0JBECS-Vs6IOw1vqLTt42PYkTlTCBhsPUi-VXC2UoLjkRfEW-OFucxsTqz93Q3IIXZZ3Lw_Lqs1dFt4YbuFSUGrKfDPnnKDCbw=@emersion.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 3 Dec 2023 20:10:31 +0200
Message-ID: <CAA8EJpom-guy0p_u2kLhXgLZnJaVXCXaHAUGhv2EH=xyrHtL6A@mail.gmail.com>
To: Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] (subset) [PATCH RFC v7 00/10] Support for Solid
 Fill Planes
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
Cc: dri-devel@lists.freedesktop.org,
 Sebastian Wick <sebastian@sebastianwick.net>,
 laurent.pinchart@ideasonboard.com,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, ville.syrjala@linux.intel.com,
 sebastian.wick@redhat.com, wayland-devel@lists.freedesktop.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Harry Wentland <harry.wentland@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 quic_abhinavk@quicinc.com, Maxime Ripard <mripard@kernel.org>,
 ppaalanen@gmail.com, Sean Paul <sean@poorly.run>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun, 3 Dec 2023 at 14:15, Simon Ser <contact@emersion.fr> wrote:
>
> On Saturday, December 2nd, 2023 at 22:41, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>
> > On Fri, 27 Oct 2023 15:32:50 -0700, Jessica Zhang wrote:
> >
> > > Some drivers support hardware that have optimizations for solid fill
> > > planes. This series aims to expose these capabilities to userspace as
> > > some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
> > > hardware composer HAL) that can be set by apps like the Android Gears
> > > test app.
> > >
> > > In order to expose this capability to userspace, this series will:
> > >
> > > [...]
> >
> >
> > Applied to drm-misc-next, thanks!
>
> Where are the IGT and userspace for this uAPI addition?

Indeed. I checked that there are uABI acks/reviews, but I didn't check
these requirements. Frankly speaking, I thought that they were handled
already, before giving the ack. How should we proceed? Should I land a
revert?

-- 
With best wishes
Dmitry
