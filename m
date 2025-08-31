Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35910B3D3B9
	for <lists+freedreno@lfdr.de>; Sun, 31 Aug 2025 15:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB4E10E2EA;
	Sun, 31 Aug 2025 13:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="lq+KCuVt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A114210E2EA
 for <freedreno@lists.freedesktop.org>; Sun, 31 Aug 2025 13:46:37 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-7f722cb35fdso318078885a.3
 for <freedreno@lists.freedesktop.org>; Sun, 31 Aug 2025 06:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1756647996; x=1757252796;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jwybc7U/Gu47otp5cNNeYZoMPwQff+yr/8w72U7737w=;
 b=lq+KCuVtzemI7lzmdQpHeXUNMaTIkSy7XgyiFTPsMe2M/uK/C2Z7ZUR2Do28I/oAkt
 Z0P5VRBEo7ydXMQAneOYQ5DBAxl6y9eECB93MWuUKbvkus6qbdqCsNDRei+962yPLPuZ
 lJX6FopBfL5N4YzQ/SrIJD2di4zcIYPoPu681J3GNC6EqHakmX1VDxYYe5I/yldcXDSO
 qG1whAfQTlvJtHyZVsAbFKJH8dxFsnNFaTad7EExnueZwBrMNAmBulqnR3vQaxB4GOsd
 oucPI4YQnMBijxEq6ogjlHt1HdWutdNiBaEjcDlnxkc9KlX7KX+8imy4hhOsoBrUwdSn
 ugzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756647996; x=1757252796;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jwybc7U/Gu47otp5cNNeYZoMPwQff+yr/8w72U7737w=;
 b=YTaPShydwWOj3zdsg+hFEwt4GfJ0//3fxF4Sw8I8qk4hMurDE5o4gVepbAZvOL4TTs
 4w0L+wxllIS9X3aWOG+m8TPioTv2IoDfztmgMyk0h9FIqk/k+3DxnRq/7k6qhzmco4vU
 FrBL7BaNCZ9twcCU1Xh8FMqNzvOYCLWKmw7/zTWmJ+RoXhTbFyKOq0nfVxF1uV0hm3Uc
 P7NZnFQ7JuMJJ99ALWY94YlZUylazZvXldpIZKshOV/r0ZOgH1qKHdoqaxMIs6yBfl3u
 UuGwA6b99o3U+Tw6KApvOoc0Jf3gJmwP8nJJC7u6Q8Oc/a46lxY+n4JTq1hPGUHhIhj7
 B/Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAnaD0nBPlCJ8vLBi152hs1UTFR37Y9Cve5jgVZO97j3ErvpAe9t+AHj7nGF0ylEMgCrOWy0ghX3E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGfWByVcl9FCA9MeavbLHpx6j+es/E+w2XhHCpj+v06AiOD4c+
 mnocr3GXaZX7y1bDIPo7G2tO9gn78X8R8GuKZ6FPyGC7wgAJtnGRZ4lOh9SCve7v1+lzrtSFk4E
 2q6mEgfcI+88tH9qDN7CJqEycDy3VonVlbWyakq58wg==
X-Gm-Gg: ASbGncvCt9sz1v3XWcEBaUJztgv4lf2FHYBHgFkfP9XXTPxCu1ucp0HpeVZQ5r1vB+R
 DJ8PuDNm94olrl0XcayXODzOZX0OdixpXClmKRHDfNmgMphR7tUK71Wn2ESdvxu0KtRmwCnojHf
 c3nYq9c5v9r/Ybh37KhTRqtlBzx3HrHTmJxfVFxTEWIVeea/XSqVdUzMnurctNtGMnYFwqhgoOV
 Vs7HA==
X-Google-Smtp-Source: AGHT+IF0dh6mtaD+ci0SXGWWOl3LWwfmYnKKOgfGlK7FZ7iXiuG8d9Mqq2iCDHrHKRWGSRl6Gppx/kRr2i15hBvQ/kA=
X-Received: by 2002:a05:620a:c43:b0:7f7:c2a3:eaa5 with SMTP id
 af79cd13be357-7ff2b9817c6mr503403385a.68.1756647996439; Sun, 31 Aug 2025
 06:46:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
 <CAPj87rNDtfEYV88Ue0bFXJwQop-zy++Ty7uQ9XfrQ2TbAijeRg@mail.gmail.com>
 <57ekub6uba7iee34sviadareqxv234zbmkr7avqofxes4mqnru@vgkppexnj6cb>
In-Reply-To: <57ekub6uba7iee34sviadareqxv234zbmkr7avqofxes4mqnru@vgkppexnj6cb>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sun, 31 Aug 2025 15:46:25 +0200
X-Gm-Features: Ac12FXyJd7t7ZABF85TqQwXSEhwFfQP0deD84tmrq8IHkkpEGuVOeuzNQcUs-Sw
Message-ID: <CAPj87rOSb90S_TeA8Cu5kd-M8bbfiE0fvPzgr9Gr4e9_rfZeFQ@mail.gmail.com>
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

On Sun, 31 Aug 2025 at 00:29, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> On Sat, Aug 30, 2025 at 09:30:01AM +0200, Daniel Stone wrote:
> > I know that dw-hdmi-qp can support _any_ infoframe, by manually
> > packing it into the two GHDMI banks. So the supported set there is
> > 'all of the currently well-known ones, plus any two others, but only
> > two and not more'. I wonder if that has any effect on the interface
> > you were thinking about for userspace?
>
> I was mostly concerned with the existing debugfs interface (as it is
> also used e.g. for edid-decode, etc).
>
> It seems "everything + 2 spare" is more or less common (ADV7511, MSM
> HDMI also have those. I don't have at hand the proper datasheet for
> LT9611 (non-UXC one), but I think its InfoFrames are also more or less
> generic).  Maybe we should change debugfs integration to register the
> file when the frame is being enabled and removing it when it gets unset.

Oh right, that's really interesting.

> Then in the long run we can add 'slots' and allocate some of the frames
> to the slots. E.g. ADV7511 would get 'software AVI', 'software SPD',
> 'auto AUDIO' + 2 generic slots (and MPEG InfoFrame which can probably be
> salvaged as another generic one)). MSM HDMI would get 'software AVI',
> 'software AUDIO' + 2 generic slots (+MPEG + obsucre HDMI which I don't
> want to use). Then the framework might be able to prioritize whether to
> use generic slots for important data (as DRM HDR, HDMI) or less important
> (SPD).

Yeah, that sounds good! I wonder if we want to surface that from the
debugfs interface: maybe just files named 0..$numslots with the
content of the infoframes, one named 'slots' with the integer index,
which infoframe type it's currently carrying, and which types it's
capable of carrying. Then to preserve the current interface, symlinks
from the infoframe type name to the slot index.

Cheers,
Daniel
