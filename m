Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 079A6B3C8D0
	for <lists+freedreno@lfdr.de>; Sat, 30 Aug 2025 09:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A646A10E1AA;
	Sat, 30 Aug 2025 07:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="SO+yqS9V";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5087D10E1AA
 for <freedreno@lists.freedesktop.org>; Sat, 30 Aug 2025 07:39:08 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7e8704cdc76so286302785a.1
 for <freedreno@lists.freedesktop.org>; Sat, 30 Aug 2025 00:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1756539547; x=1757144347;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7fzjqNbnl1FH7mVwqP6ExvQ8qLgU7/T3+Fqhp2L/qAI=;
 b=SO+yqS9VV7IlqVgPVV+Ojp1+DGZ0P674OM6Cu5/VsAevmyghw3IxKBU25806mKoeIx
 BeKnEb5ozySzbbPCDiCRSS5rAltNlP9Lc9KHPJMisQvVODJ6hdvkby18R57C6R7oLFoU
 e5xO3acC0zT9kYbV/pAJxkprIWNOm5oyuxFqbN0ncI8QFxKWCbAxS8ssOJ+v8NFJpyCI
 H/OxyRVwgD6X6/NM790cbRNRmbEz647R/kKxLi2+eOEcigSczBuAUz+Li8MHWrB7IxEq
 DvbmE7wBc5Y8q6wtGF/kp1eFjktYDsBNk0YrzJEmQhwMmCTUr7ozkj8FGRQE/f1bGNyD
 93Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756539547; x=1757144347;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7fzjqNbnl1FH7mVwqP6ExvQ8qLgU7/T3+Fqhp2L/qAI=;
 b=BPOVgt1kyu0LlhqqlAr6YVewESoRW6IrKPCQoTp2c5HJQ2SqgdwzYQl3znFk2bSe+I
 8InO53XBnPmgoFxGiH5rzlyaXIR1cto2Oi+9cfIpZ15AazO4GmGC/z+CpsPzYiJ5p4js
 JuSLmPNHnvJLYPGaJwLbgrBbwStIhcyI6YR4CvKfdKW1HMXWw1ULexX764Chb9IcVZqd
 ZxnAqWX/j+oRNV+3TyuWyLYNS8a/h61tXfT48GheifmoQx0P20sTdMpaX2jg6Wid/7Fy
 TfJj+K+b/iERoQqsvjvCfuhaczxdBHDMNvO7JCcaL2bfpU/fZgqCxa3nZ+F8qFcUGUaH
 rUwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt/ErshwCxB4Q7pa97JU8L83XSuflj7ydiuJrlLigEc/YBZmqi/BpypQi8/JVl0IqhZelAbrPPtQg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywd8Vr/gmHbsUJga5sfOME5TEGB1jau4awSr9fW1bzE12QczwxY
 DkqzQ+F24JsBuYARQSA3Ul6sJv7o1TKBe5Pu3GyxB9qVfSUZbtwrnpygaXZVYlwDCVQb/gN/nHA
 NCky4b5cg14LWBKgayDIxUv1GAPRRYRFVHmnbvEs90A==
X-Gm-Gg: ASbGnctYBud1vMZExeXxidZNEmdhSHEhz6LdtSzW44yjJfLiQMumEeNTY73LJjOFnxj
 HwWRCx9OGR50bXgBxeuvEA3qdB63qgaQ93CDZcqwJXbH+O9N3ysYmDD2ccoaHqseEENj+sJ46yi
 LBzL/bOKCg25Zx3z51eCYZEnGDo3/gnbtr+COo5ElPiEbAkdXtIjuJ5lJM+x3n7CA49ACrNhd0c
 oeRiG/bB715oX3O
X-Google-Smtp-Source: AGHT+IGcdIb5Bh5zrCRPBVL3fLoDcfNzuR05JRese/yFeQ6WZnki9GRGlAQtC8Gf4B7czjKl7GD5FNu5efT2Tyeq4FE=
X-Received: by 2002:a05:620a:3194:b0:7e9:f820:2b72 with SMTP id
 af79cd13be357-7ff2c51b1dfmr138787485a.72.1756539547138; Sat, 30 Aug 2025
 00:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
 <CAPj87rNDtfEYV88Ue0bFXJwQop-zy++Ty7uQ9XfrQ2TbAijeRg@mail.gmail.com>
In-Reply-To: <CAPj87rNDtfEYV88Ue0bFXJwQop-zy++Ty7uQ9XfrQ2TbAijeRg@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sat, 30 Aug 2025 09:38:55 +0200
X-Gm-Features: Ac12FXzM9U8oA3u3fX5rkC_Acspb1Bpg3nyPrRsz__oJ7apEVkNTDxD29-I5hyE
Message-ID: <CAPj87rNz7PPqZ7P4JSKdnizFaEoaBMf2VFBYbpVn3VNt1giU0w@mail.gmail.com>
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

On Sat, 30 Aug 2025 at 09:30, Daniel Stone <daniel@fooishbar.org> wrote:
> On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > It's not uncommon for the particular device to support only a subset of
> > HDMI InfoFrames. It's not a big problem for the kernel, since we adopted
> > a model of ignoring the unsupported Infoframes, but it's a bigger
> > problem for the userspace: we end up having files in debugfs which do
> > mot match what is being sent on the wire.
> >
> > Sort that out, making sure that all interfaces are consistent.
>
> Thanks for the series, it's a really good cleanup.

FWIW, the rest of the series is:
Acked-by: Daniel Stone <daniels@collabora.com>
