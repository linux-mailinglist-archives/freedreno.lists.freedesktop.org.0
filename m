Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E046B3C8B9
	for <lists+freedreno@lfdr.de>; Sat, 30 Aug 2025 09:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D9D10E1AA;
	Sat, 30 Aug 2025 07:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="dZl0uj8U";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8858B10E237
 for <freedreno@lists.freedesktop.org>; Sat, 30 Aug 2025 07:30:45 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-4b31201d331so16598921cf.0
 for <freedreno@lists.freedesktop.org>; Sat, 30 Aug 2025 00:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1756539044; x=1757143844;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3vk4uw/k5t/ngjT55OkWyZFL8hHut4oedMZiTZnhFuY=;
 b=dZl0uj8UTlYGpwV8KHSBsDTe/HbplD/v8YfxGbSItCpInEac5xBFP/UxyNxz3/hWD6
 WsuLRI/OB8L/gQ5X95aF178pq7oKOCbfj+AJSS5kuZI8ke1TCn/5adNQwlv/SGiR8DZE
 ci8vYwiHnlKP0yAuFe2l1gLrvcolDkQzvSBbCLyWw5rw1hw/51YGzurxpp7u2Y9S4YbA
 M8FrKN2evV92m2SoPtuODHUhyhAkfkU5UQdrMoEWSuLvrHNiT0AyBbu5EtG6ltY1ee/g
 NMF6AEgYlSWiI/TgoR32fKwguwEUAMxue3O6xjjvvUmPJZPyn5oWc9wcQ4GsfUDhg1yj
 IqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756539044; x=1757143844;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3vk4uw/k5t/ngjT55OkWyZFL8hHut4oedMZiTZnhFuY=;
 b=Pe5ipkB9BT3FVaIdgQ841rrgfEByggXRD1vjkhydljGIvTkKkni247hyDXGGdhp188
 B1TUhDavQLGHUeBZnfhGFEPULFzwn3rHC5JkCrizD1o9R89m2N4x1fRyNNEmY3IybfEe
 MUmuC9ABT+MMbAhga6jZ1GSD7kt82Vzh/6GXdE+48aBvxqZGeTxS/3oOHrZTLllIp8j1
 EK4rJDEt80IU/a+2cteCy3mKV3Jsbusi3AlaYhnGVJogQZG0M3xAPXp+q91lczANI5Xn
 LeOuxT2H7wF3lsma/qjLVIHh4bgp8lPJMs50tkPH6VJa10I1pZ3hRQJdshTzBkIQIEDn
 Lujw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1UE+RnTeZ3u30cloMQ1qnij4kFrvUmaLdsGfuF/NvcPBWatrX9FureJBGOt4zMgqv8Cpejl+bqHU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0x+shv5aKWqPeznl305dZVuBqVcmDC68nM2zoTK0PhaY5PEXK
 QAjWAWc649cjKZ6SJxo/+hELvZtXWA0hOVsQYc/FE2b2C0Um2oLXAkw67Z/bZUuuqzK84RrZQGT
 KuyPUaklQUTBZPaT29llm+1UVd84C322l6S1ik8iqDA==
X-Gm-Gg: ASbGncv0CqiQOaVYnL5A3dZNucM++Piegh32vKHYyNK0SGND+Ziw8+liwARPTAQkP7k
 8XcHLxydv5eNsQ1i+ItgcyS2AjOESl/cDX28EviVJ3WnfcJYd4znyaVy5DPG8NE0ZjmDMk7Mypw
 OFJ60SqKyiBSSAxElZSUs40Rbo6Zf3ySfQ2PhuKg+IGb1c4L5W9qTXyRf6rbesKCabu166XnCA4
 hi89Q==
X-Google-Smtp-Source: AGHT+IGOnM65THr0nrJ2LPLTiMMlk+HvsXaVUyczPlRtZjJ7WLdbodWtVaS7JfPnD9Na2PcQiHxYrYNu+VnO9BqbaFo=
X-Received: by 2002:a05:622a:1448:b0:4b1:103b:b67a with SMTP id
 d75a77b69052e-4b31b9c3777mr22814681cf.32.1756539044617; Sat, 30 Aug 2025
 00:30:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
 <20250830-drm-limit-infoframes-v3-5-32fcbec4634e@oss.qualcomm.com>
In-Reply-To: <20250830-drm-limit-infoframes-v3-5-32fcbec4634e@oss.qualcomm.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sat, 30 Aug 2025 09:30:33 +0200
X-Gm-Features: Ac12FXzpE91ILUTwZS_ZwZMq6UoPhvxeYv_akLo7dKmrA-yDSe19rsUZejc4hcM
Message-ID: <CAPj87rPSqJoJnUoP11qzWXuqvYPb_=vP-5-p7SEVA6JCfcYCuA@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] drm/bridge: synopsys/dw-hdmi-qp: declare
 supported infoframes
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

On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> Declare which infoframes are supported via the .hdmi_write_infoframe()
> interface.

Reviewed-by: Daniel Stone <daniels@collabora.com>
