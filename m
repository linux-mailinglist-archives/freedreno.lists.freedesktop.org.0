Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D72969A5FAC
	for <lists+freedreno@lfdr.de>; Mon, 21 Oct 2024 11:06:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A792C10E456;
	Mon, 21 Oct 2024 09:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="n/2NbnPe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7AA710E45B
 for <freedreno@lists.freedesktop.org>; Mon, 21 Oct 2024 09:06:53 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-6e5ef7527deso10584937b3.0
 for <freedreno@lists.freedesktop.org>; Mon, 21 Oct 2024 02:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729501613; x=1730106413; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jA3p085WBVZjxthmW00sO8DEVEBHgAHr/aWoPpnBk54=;
 b=n/2NbnPeUDl1YmNA3O5gm66rK/9IwGzz64i88UEi7f2J2/S6ut3gaNXryZtRbU8iCb
 1/0JwuVIHQmlmvrMqGncZTPh2DehWjNIUROBJSzlv1zdE8Hlbq1N6vxw1mlNn9xPgjgs
 7avPVgUijzqyDmxiXGRFqVFT1sz8D8LEfuoWxPhvcoTpwfSKbfkV/QRcxikpVkKrMvNV
 fnQFNtZav2b78d+pphuyC+vc1QFVktbMeaVoOr9Yg1rfbD78XbDW3W01qsSet+dXsNlg
 exw5uFX847WQfZaboK5tVF64ltsOS0ALF+hqlwv2sxwMFKprVuzogyXMVA2ndFHA2tV/
 Qe9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729501613; x=1730106413;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jA3p085WBVZjxthmW00sO8DEVEBHgAHr/aWoPpnBk54=;
 b=m8R9v3t6YQPMGbsT4B0pgNN9wkQg1AwaYaKNmeXCE20fZFqrtL10faREElBAatAhgK
 LQqXF9ReC9r9qE3MXD7NpyOeFAXN5wZIOqWa2HSxiOaQ7C5beINKXTrusxr/sIq43Hgx
 N4gbIV7hbTfLItAZd8CfJcUK6FSJnmBfhVz7+bdDdDxMbzgm+d4v9v7XJyqmwn0wZ9SU
 E9+nIuWoEVDMVODjl7C5FZAmvesaa0Q9dHRSTSrnNvY2ej+pCDzFnklmEVkfpiyqtuLC
 YikarWqG4RdzVablCtZzZ0XGuGs3NczzvhP5k7VAs+N05zdi0ozqdoSzkwVfOH9HkCd4
 offw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJiaxo9h5DRc/d9PHcZ7MZ9whocg04bRIX3UPN35KIt2VFYl9Brf/kCG4hsDraQ29rkx3xYExSing=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGyvn/KQ7MPRcKmRfV+1dIsUMAAE/Q7julealWbc7X9JLVDDpJ
 It8g3dIBZZdKEZA9UG22Ag29F0AirbFh0TcZWF641Vic/ti57azbNrmYu9oPth0YDxOYyLmps07
 AX+Qqq3YVWT8h2jP4g1IrPNWC+LHKqm1eCHjhDA==
X-Google-Smtp-Source: AGHT+IEaP9MJaux+Mvm9jAqxzMdqSn1f+GPVXkxv1I5i5R13Oo9mtvtrHTONlbQt6H8kuW3J8xABR0qDJyPjxkF3F48=
X-Received: by 2002:a05:690c:610a:b0:6e3:36fd:d985 with SMTP id
 00721157ae682-6e5bfc8926emr109528627b3.23.1729501612759; Mon, 21 Oct 2024
 02:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
 <20241019-bridge-yuv420-v1-3-d74efac9e4e6@linaro.org>
 <28fb5aed-0387-4c16-96fb-c2c23ae315b0@linaro.org>
In-Reply-To: <28fb5aed-0387-4c16-96fb-c2c23ae315b0@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 21 Oct 2024 12:06:46 +0300
Message-ID: <CAA8EJprfpKqJBvrS_dLKy40LHOaL4XVSpmXMGP__z1jsOjZ7Ag@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/bridge: display-connector: allow YCbCr 420 for
 HDMI and DP
To: neil.armstrong@linaro.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
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

On Mon, 21 Oct 2024 at 10:29, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 18/10/2024 23:49, Dmitry Baryshkov wrote:
> > Allow YCbCr 420 output for HDMI and DisplayPort connectors. Other
> > bridges in the chain still might limit YCbCr 420 support on the
> > corresponding connector.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/bridge/display-connector.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
> > index ab8e00baf3f1..aab9ce7be94c 100644
> > --- a/drivers/gpu/drm/bridge/display-connector.c
> > +++ b/drivers/gpu/drm/bridge/display-connector.c
> > @@ -270,6 +270,10 @@ static int display_connector_probe(struct platform_device *pdev)
> >       /* All the supported connector types support interlaced modes. */
> >       conn->bridge.interlace_allowed = true;
> >
> > +     if (type == DRM_MODE_CONNECTOR_HDMIA ||
> > +         type == DRM_MODE_CONNECTOR_DisplayPort)
> > +             conn->bridge.ycbcr_420_allowed = true;
> > +
> >       /* Get the optional connector label. */
> >       of_property_read_string(pdev->dev.of_node, "label", &label);
> >
> >
>
> I think we should make sure all HDMI bridges can filter out 420 before
> landing this, no ?

No, it's the other way around: if one of the bridges in a chain
doesn't set 420_allowed, then 420_allowed won't be set for the
connector, disallowing YCbCr 420 modes.
Before this patchset the bridge / platform drivers had to manually set
the flag on the created connector (see dw-hdmi + meson-encoder-hdmi or
msm/dp).

-- 
With best wishes
Dmitry
