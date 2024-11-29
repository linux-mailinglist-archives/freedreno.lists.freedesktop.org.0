Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F21179DE7E8
	for <lists+freedreno@lfdr.de>; Fri, 29 Nov 2024 14:45:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1FAE10E4C0;
	Fri, 29 Nov 2024 13:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aHSEeEjn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13A010E1AF
 for <freedreno@lists.freedesktop.org>; Fri, 29 Nov 2024 13:45:35 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-6ee676b4e20so21658377b3.3
 for <freedreno@lists.freedesktop.org>; Fri, 29 Nov 2024 05:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732887935; x=1733492735; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jnuFPvHlqF2+V5h7gDxD9QoNqnoE7Ul8whcq/eg7E7s=;
 b=aHSEeEjnjFZOJo3cgM4dFTXnxnk+GXbua2GZkG02HcJBNdHGw1Mp36S8G/JUOAULht
 2CH6mxfSSzBiNOB0LEzHtNBuqY7ZcCgrnvGdfM9VcSybcLRYaj9w0N9E/qGHMXZVSLOE
 j+1u9bYyH4bVMcaODTBoAJH+ks2imgrad6VEmiiYVPMiravoHHVaBSj5m70fbxVBRka5
 HUGi/pOIUbG+7Xkh/mgnow3FFkn4+i3SEVxRINIZvFMjIwbV1WrAtTmxaLv8qOTjGldu
 JZkfG6SydVM5cx5gP2RiK6Jd/6ac/HNnWaQOePjtAONPx0LoupkyR7mhQiB4Nwwf6Ky8
 OqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732887935; x=1733492735;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jnuFPvHlqF2+V5h7gDxD9QoNqnoE7Ul8whcq/eg7E7s=;
 b=bxf8fxBkNQjYnmvMp8aRMDuefgUWh3Yu0hbqJ7WDSKpzcfTD1sI/irYH92JOiWB/9f
 eUIY9TdjqYlZrqNqkWugQpTy5BSeIOvx3nHSL4UrBqST3GHXSOhso7QWnHlyUMDDYb9w
 0aQrQqdHAkmhUodJLPbHwMVoycynd9VGHaTlQ9P5Gt1GPCVVHLkBVOQhYpLhRQgdC1d2
 CSksyfB4aJnngYDV/LQw/jCm38NxtOBml2Y39qD9+dXrqyUbA0tWu02FLnAy6plFwkOL
 VIOQxcwi/fOkUYsVDuxGCT8nKeuhOovXrQkU4dZL8omjeXN3mhXsTrlADWz9Ah7NjtVd
 9iqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7lWUAwEb97Ro2fkILkS1o0dhFi33oawl90T1WDvOD0C5YM0vemMBuqXmY0gtoGfAcXClv3J8PyXE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTd/owitNPpSJ5M1uCzClQoSvtoolgNYKo4HmdZsRpqPWFLM7N
 8s8B9td1STtWW/lvUReoyGsfh7cS0HSSbpRjQkG73i87R10UVUwqeQc+4b65DWU+Na5etnwtgpU
 VIA0izSWgCH96g2d3DRHzW/LWWHDtaLC5r+XGXw==
X-Gm-Gg: ASbGncsdSJXmiyAXtuUr5o685ie0eH8Nbbl1xnqBVlZeNa68VpeJsbyGNXo/T+cWoxS
 tHjHkaffqqKErFELWrL89aoL2R42p0w8=
X-Google-Smtp-Source: AGHT+IFcdw16JjCHhf6pyyNofTqnqJtbeYn35N5Sw7fR5PMwJk8S0Dust9v7sJdcUjiPz0hKcc++q+mU90RLLwYFzZk=
X-Received: by 2002:a05:690c:9c08:b0:6ef:4ed2:7dfe with SMTP id
 00721157ae682-6ef4ed381ecmr63286207b3.31.1732887934964; Fri, 29 Nov 2024
 05:45:34 -0800 (PST)
MIME-Version: 1.0
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-8-09a4338d93ef@quicinc.com>
In-Reply-To: <20241129-add-displayport-support-for-qcs615-platform-v1-8-09a4338d93ef@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Nov 2024 15:45:29 +0200
Message-ID: <CAA8EJpqMug4u1YPxBGfDUT8Cf8F5XckxnJdau-Gm6swyU5VT=w@mail.gmail.com>
Subject: Re: [PATCH 8/8] drm/msm/dp: Support external GPIO HPD with 3rd
 pinctrl chip
To: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, quic_lliu6@quicinc.com,
 quic_fangez@quicinc.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-gpio@vger.kernel.org
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

On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
>
> Add support for handling HPD (Hot Plug Detect) signals via external
> GPIOs connected through pinctrl chips (e.g., Semtech SX1509Q). This
> involves reinitializing the relevant GPIO and binding an interrupt
> handler to process hot plug events. Since external GPIOs only support
> edge interrupts (rising or falling) rather than state interrupts, the
> GPIO state must be read during the first DP bridge HPD enablement. This
> ensures the current connection state is determined and a hot plug event
> is reported accordingly.

NAK, use dp-connector instead.

>
> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 83 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 83 insertions(+)


-- 
With best wishes
Dmitry
