Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD9EB3C8B4
	for <lists+freedreno@lfdr.de>; Sat, 30 Aug 2025 09:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E32410E1AA;
	Sat, 30 Aug 2025 07:30:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="XSY91wXb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA95410E23D
 for <freedreno@lists.freedesktop.org>; Sat, 30 Aug 2025 07:30:13 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-4b30f73ca43so10486441cf.3
 for <freedreno@lists.freedesktop.org>; Sat, 30 Aug 2025 00:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1756539012; x=1757143812;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=u5ZG8/bv7fEyY7/sBaZXohrNcXIrZPRq+HcTim4TiEo=;
 b=XSY91wXb1yJ6X+wUjuEzetW2VA1JfudmCQaj5WOgxbDx7iUpT7M96X5qNHDxNNnI4l
 2JOzLQ5lZOPEW4SDuI0yTz5LqVqKZo+mEetREEwRcizSbElOgSufvWwmQYThoAgRUu+Y
 jLz7id2v4nkkTYqJL4LEhJVdaIMdFf0wdLVNoAvuDonnuXC8jY+dMkxgFxyL92PKWmma
 kK6jV1QlWzZTbAhny8WeXz+QTe1RHiiv12yk0GIDMARHnC7QjwKQTE66+zbgZL9PwAs2
 r8IFt2Oia7LuXy/akisi1R2jvDOj1b9oo0sxgaDC6os40FrlIROzj9XlSCv8IXJgzY/Y
 +/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756539012; x=1757143812;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u5ZG8/bv7fEyY7/sBaZXohrNcXIrZPRq+HcTim4TiEo=;
 b=XuTOgb3+Jj+6eeOhbcOFHqBFbB4h1ywlZ5THtJ7S33AiB3oLvPxGZ7O2fQ1elKF4is
 ZPN2CKafxWwPmweWUdGVyMhws+PZNsXuN3Fz82dAHCK6Obx5VoDwadAKj4IguMpfalMU
 PHi4vDDVwO0RXPgJEEWG83hEJmaTj0DPZTIy9CXAm4hqQ8J1yHOHeAaG2o8Idt9+P7re
 1Ipg4kN7nKojHAQYUbEPUxsfdSizQtn5Z/LPjf9g22Og2tNmD+M4Tq1ofcZ1A9do0LEZ
 KUD6GIKd4WdX/Ule2Nu3k4L9qwtLi0azEBsKu+a46Ti2JA1l+HbkYpb2dFGaQAL+3Q22
 /mEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7oADLC5wny0gQyOfFGbX2PvkIATsGODtsfeAbg8NN6u3Gq8JA3Yx13Bj3u2bM4ZnckqShKj5wJto=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYImosmd30h/BGRiHmOPRj3fkjG/8NoSiri6EtBLg03hpy8uXk
 lVQE1h2keEMl34oXvZUL9ZpNP+L0W4zWSoT33VgQ3a4RBrgmvHw+LdRuDalGswRx+3jQsYFVXOH
 h7ruBTjy6ZPBG5f17AMezrPhImUkZ0EOBYoXc/ibGXA==
X-Gm-Gg: ASbGncuVyrGr6VUmnoDdLw2UQtc6a1ztlCfX9UUB+AFP6s/w8/LXvpYSo70oXF5h5nN
 uWQyK8znvCc/33D2mPReAZIGnlklofVe+INT3fqKki0R0HpfTWaDJ90q8pZ9CQCg81kdIUlAGOs
 EA/lxC5KmdxUkVM2/lhXJbQgY9lvDKZxUnAMBx1s4SUUoEYbnO3pN+jFoDL+RjYQNVNIlGWBvi3
 o3p8sJ4xF2ojq0H
X-Google-Smtp-Source: AGHT+IEoXuFZJwCV9cwGNvRYz37SGk7fTBsYXDUKkjm0VNio3cHCVlLucdjG7nkDJhE227CIqVsjn4jhHmK64RhHXes=
X-Received: by 2002:ac8:5a12:0:b0:4b2:d607:16cb with SMTP id
 d75a77b69052e-4b31d855a89mr14707801cf.22.1756539012519; Sat, 30 Aug 2025
 00:30:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
In-Reply-To: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sat, 30 Aug 2025 09:30:01 +0200
X-Gm-Features: Ac12FXwherP7pCCw1eIolUuD4CaoGI8lRnTYIDVTJZ8XE8BvqysFq5xqSgK9g3A
Message-ID: <CAPj87rNDtfEYV88Ue0bFXJwQop-zy++Ty7uQ9XfrQ2TbAijeRg@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per driver
 capabilities
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Liu Ying <victor.liu@nxp.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org
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

Hi Dmitry,

On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> It's not uncommon for the particular device to support only a subset of
> HDMI InfoFrames. It's not a big problem for the kernel, since we adopted
> a model of ignoring the unsupported Infoframes, but it's a bigger
> problem for the userspace: we end up having files in debugfs which do
> mot match what is being sent on the wire.
>
> Sort that out, making sure that all interfaces are consistent.

Thanks for the series, it's a really good cleanup.

I know that dw-hdmi-qp can support _any_ infoframe, by manually
packing it into the two GHDMI banks. So the supported set there is
'all of the currently well-known ones, plus any two others, but only
two and not more'. I wonder if that has any effect on the interface
you were thinking about for userspace?

Cheers,
Daniel
