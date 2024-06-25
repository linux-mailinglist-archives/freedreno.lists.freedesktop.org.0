Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78455916BC4
	for <lists+freedreno@lfdr.de>; Tue, 25 Jun 2024 17:05:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4176A10E6B1;
	Tue, 25 Jun 2024 15:05:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JInm2ibV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D2210E6A6
 for <freedreno@lists.freedesktop.org>; Tue, 25 Jun 2024 15:05:45 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-643423e914aso24759777b3.0
 for <freedreno@lists.freedesktop.org>; Tue, 25 Jun 2024 08:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719327944; x=1719932744; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JunNWwGKBRTYr5Pcd5O5SWyjr+J71GISSn9v9GBzIls=;
 b=JInm2ibVYAlwPb5LfD2a9goBWK0VKFQZ6NyKq3sDluB94MD4FnThbdqv5qJy93j+rR
 1AVwZHCVQZdIQPj7KLdVyQWv6BOqnSPYlBQg3i6rc7Yqbx5H3H/3GZlHeKkj2kzPfi/k
 5y6Bzcw6ehFz0MMbl9sz2OlMS2bgIpfQOByMya5wJ8BmfrZ43XvnZjWhfX9nYj+rSjwk
 9ZUhjcmEwSuK99A2qZ3wC2NuAy62M4tMRPKrL2lVZ7YrDGc1zjlafguSmT0MIfn3Ku2W
 s8O9prXnXzuZsmPzfzo2zqHO9WtxeJCg82oDpHxoSA8ppS26sQAdhHXLYhFz2Xjhbf1i
 lyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719327944; x=1719932744;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JunNWwGKBRTYr5Pcd5O5SWyjr+J71GISSn9v9GBzIls=;
 b=e5qMvjixaMPST2rKDTGnSn3Z+/oo770yFtFUmWTgyGq84xFvsOUUwnxKh0VeFHgUX6
 93D/cQi0wMBTvCtq4z8fXIa/hRzKotkk5byx5OMbugXQtoH/86UW1FGCPJ2WGS1Jhm/x
 1OuzhgLhUWTTwvM9tfQ9EJcK+xO30SK52lLelBCT/8PDJIbCljCWqKJKmWgFQZK2gGsR
 wjegiLl9/KWeVo+Y6eRCYbgaTz8gzQHIw3IklVgW3tHvt8tUbBjJmGVDz0698jCBOC44
 69Ti2OqGHC9GODeu0waK3OyFPAH/Vkdj8ZXJZFAxdEFSl0RwELz7Zy+XPTy0rzCidUIw
 L46g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwKgPKwKK3LZq/jXVnReiv4NXf3M0eftXM4nX4edJ0b0Vtlm+ZdPiYXzxuro+Pz4szZarXv8UQCyYFtvNu1bcYIJc5OgTC+h6Eac1kttda
X-Gm-Message-State: AOJu0YxENkzdvrLs22FkDQKxEZp0tb3VGCrF3pbyC4TdZvMiQwffx9QB
 9CN4UudaVySy6IFISxxQNohUs3yLDCMR2W0z/wzl/qko2FSAZFil33nx/hSF6VmMgBuk9Cwz5Ur
 bGpaw7eNitw8zy6sGrhV0F9LhID7M0Xm6lQzIBA==
X-Google-Smtp-Source: AGHT+IFe9ebZjIjKe3yw6sqBV3bTmm2If8WOtZ4l30oH3MpOHUQh7AQDYHW3owX9fbwtm1v9DNf0ncg1El4NCsVswYw=
X-Received: by 2002:a81:c313:0:b0:618:2381:2404 with SMTP id
 00721157ae682-643ac72278amr86606087b3.44.1719327944523; Tue, 25 Jun 2024
 08:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240623-drm-bridge-connector-fix-hdmi-reset-v2-0-8590d44912ce@linaro.org>
 <20240623-drm-bridge-connector-fix-hdmi-reset-v2-1-8590d44912ce@linaro.org>
 <20240625-feathered-loon-of-health-ec7e6d@houat>
In-Reply-To: <20240625-feathered-loon-of-health-ec7e6d@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 18:05:33 +0300
Message-ID: <CAA8EJpq314tQFZpkXgL1cYDPfoFRukhB_KiaDvmsqdzHFD512g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/bridge-connector: reset the HDMI connector
 state
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Tue, 25 Jun 2024 at 18:02, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Sun, Jun 23, 2024 at 08:40:12AM GMT, Dmitry Baryshkov wrote:
> > On HDMI connectors which use drm_bridge_connector and DRM_BRIDGE_OP_HDMI
> > IGT chokes on the max_bpc property in several kms_properties tests due
> > to the the drm_bridge_connector failing to reset HDMI-related
> > properties.
> >
> > Call __drm_atomic_helper_connector_hdmi_reset() if there is a
> > the drm_bridge_connector has bridge_hdmi.
> >
> > Note, the __drm_atomic_helper_connector_hdmi_reset() is moved to
> > drm_atomic_state_helper.c because drm_bridge_connector.c can not depend
> > on DRM_DISPLAY_HDMI_STATE_HELPER. At the same time it is impossible to
> > call this function from HDMI bridges, there is is no function that
> > corresponds to the drm_connector_funcs::reset().
>
> Why can't it depend on DRM_DISPLAY_HDMI_STATE_HELPER?

Is it okay to have DRM_KMS_HELPER to depend unconditionally or select
DRM_DISPLAY_HDMI_STATE_HELPER?

-- 
With best wishes
Dmitry
