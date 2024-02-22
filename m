Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB10860442
	for <lists+freedreno@lfdr.de>; Thu, 22 Feb 2024 22:00:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9849310E97B;
	Thu, 22 Feb 2024 21:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BSUieNJe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A225D10EA81
 for <freedreno@lists.freedesktop.org>; Thu, 22 Feb 2024 21:00:20 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-dcbc00f6c04so128446276.3
 for <freedreno@lists.freedesktop.org>; Thu, 22 Feb 2024 13:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708635619; x=1709240419; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dmvjj7fhOobzTivUlelD//oyOg39L8TaqEJkHM6CbjU=;
 b=BSUieNJe/E/HmksNIik+eHjOUeUpIv/u3uPUjULvq2UP+P/st+m99o+KlkWO4O5x9q
 AdxkPcgEZqfkdEi4YvfT+1eRSqmioZMvqkiMCOscxWfwQV5n2zCbN8nIrDnhIgJRJrFT
 5XJWFs1dVVLN5cAhqW0VTKU7ViRVWlU4bXbJm4SpWqJunipm1dCuYxmTIal+tcQbgKzC
 zwqfexXk1kOk3+hr8bjGK/avV8LXEnsrJTOr8QobzEblIWmGQv3xLaS5rTM9cHfnt5Nm
 HWp+7qNTGo3JRkEZEoy95dmxnM8GOmzxy9wAJIOB1SwoOnilFnYhMjz7P4VTU/P8LQjt
 Vung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708635619; x=1709240419;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dmvjj7fhOobzTivUlelD//oyOg39L8TaqEJkHM6CbjU=;
 b=wWC18Tia9bm7GEcms/7/4woj79T8e1yJsdeIsaLD3TW39qVpoaiE9k9evF8I+0Npgr
 k2LzU7wHujw9Z2Ir/ONzSGwVPjDZxdZ+aea5nsB+3F+Fx7O664VyqXBWwu031TEH8WBH
 MmqpzuJsQ/y4yDJRPiGJOq4pC8oyjBscGxGbuF2Tp1vjNxhy0QT8K2cP1INFX9NKIQNv
 s5IF0Tp9c8F08pUiIDNxedWpZYydZtXWxzU1S58H818s4Csk/CH0Nilk0XOVLpaHDe6g
 Ez7RT2yR1Xa+Z0yY8AhZVyRBECUfvnPGNF5iSC+5u9TTZ4rKuHFT1pIjnEit3YtUyL3+
 pqTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2K8AWJ7OBraQmMdG0c3IQ8H9J6znqdKBpO91715987+kF9qCdPS1fZX0Ii7pafTmDjGjmV/z6lCYH7zLfA+OGH6ZSoUcyCD2PRLPCmBO4
X-Gm-Message-State: AOJu0YxaOGORVxpqLfJJiI/fIXg6b1E/+rpmgWyOI0TDn23N/A3pL9Gi
 XlZ0TekY3C+hqVgPjtQ4aHQRwDJFb3L3hzK8iLqAd0JIEm8yeNIJhn6mDxlteAEgJi38pBXc22g
 6vFBpAMbmJ+/0dxfwovvC6l8aoa6s9lEt02cS0Q==
X-Google-Smtp-Source: AGHT+IFdnFEXZ/1Ob2Rd+e7Qs1/dnY3m9z+vfb8chmIF2GjOTnC5mGKNn2WgjovOSKHSnuhiBw7HcB/7y1Jd6eekJXs=
X-Received: by 2002:a5b:d05:0:b0:dcc:8aaa:3ed3 with SMTP id
 y5-20020a5b0d05000000b00dcc8aaa3ed3mr303376ybp.16.1708635619664; Thu, 22 Feb
 2024 13:00:19 -0800 (PST)
MIME-Version: 1.0
References: <20240217150228.5788-1-johan+linaro@kernel.org>
 <20240217150228.5788-2-johan+linaro@kernel.org>
In-Reply-To: <20240217150228.5788-2-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 23:00:08 +0200
Message-ID: <CAA8EJprBs8ASwZMAHFMQUEg7NN67rzRtUX--8h72-7F9R_=o6Q@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm/bridge: aux-hpd: fix OF node leaks
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org
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

On Sat, 17 Feb 2024 at 17:03, Johan Hovold <johan+linaro@kernel.org> wrote:
>
> The two device node references taken during allocation need to be
> dropped when the auxiliary device is freed.
>
> Fixes: 6914968a0b52 ("drm/bridge: properly refcount DT nodes in aux bridge drivers")
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/bridge/aux-hpd-bridge.c | 3 +++
>  1 file changed, 3 insertions(+)


-- 
With best wishes
Dmitry
