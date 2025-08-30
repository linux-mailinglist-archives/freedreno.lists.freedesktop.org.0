Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 349E0B3C8C6
	for <lists+freedreno@lfdr.de>; Sat, 30 Aug 2025 09:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D8F10E1AA;
	Sat, 30 Aug 2025 07:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="XgCCygt1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483EE10E1AA
 for <freedreno@lists.freedesktop.org>; Sat, 30 Aug 2025 07:34:39 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-4b1099192b0so53082251cf.0
 for <freedreno@lists.freedesktop.org>; Sat, 30 Aug 2025 00:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1756539278; x=1757144078;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/XKolNdOG4rWtnm/Z1Xm//IS1jzblLqTcVqQ5IMS/rM=;
 b=XgCCygt1+ceeQo9FSytavHM0RPVoeBDY3xoEo4LofhTttbrel1EEyEWUAgZDO2quzZ
 aGvAKL+TrZ9hKQ4c6ZM6qaSRY0eSKUrBAbJF9HWXYa+F1xavcvm//YG3x+4kIGjMZEec
 lgw3wjZhDxhFwyr5Hpz5FNxTrXKUNOvpcO9DMsHUAA0a4SM+SFGAG3PTh1QFKQ/8YtVC
 dSG5NSNdfFgNGChl4t5RLPcSNXJ3nJ7l1fDBlfS7HebvH8Ev1wmMjgA/CCmiATcCezjX
 8jZLrJoU7pc7h7TxD0LkU/bHaoQGpeN2gPZpFFFvuTU15h/87Erwewlsdjz2plcC5+8i
 0HyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756539278; x=1757144078;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/XKolNdOG4rWtnm/Z1Xm//IS1jzblLqTcVqQ5IMS/rM=;
 b=RHo3di1jxJ+s7v1DpJnZ9wDhsD0q0YzoPW6ttHH/FQoY40UFH8NXjhbjGoqunTyXiz
 bTK+yOUULSelzj1U/17eAra4yxX2YFXXf5jccif4wcYuk8dahTDMbbaHY4ihia/sn9iL
 sL6kRuZjq83kT1K4oNjJUJdqtKa/QZmjuA4npRXCNYr4a8GhzfutlsiOgxk0YMV7QI4h
 519c+04p75UFvc2yYv9mVt+23lwssBZvUfoozqlnAenKBBLM5NsKnf0eFLyjJ3ffydKk
 yGUPrOjlJfLbPbTqqD0dBPEuuhg6PS8GWskEjhCFrL8403z8D5SUH6Vp7+F9R7suq0xX
 A9Gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAEUTsvbXkKWpgifWa+NoKx+eeXUEYpWEGje+2YRIoqDsmP4+EFupUIMPraQsuVySHt7TWpW78dWw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQhYm8IIMGZDycuJyiGzcoUgkBDTFVnlW/B6c7+D3gg998/fEe
 IqZEV/bNxUwjvxIRN7vGx84uFg9c3wfXFCnK92t1b6I4BP83D7ohTyiOwRnwFfcEifJHrnRwuPG
 +2uDsS4TqB/48jeGUSNW7bJEGZHfK1DZPPmhpv8hDzg==
X-Gm-Gg: ASbGncv0x32NJtCbpIdBR8oYjWlJWpHLk/8JDvZ9ePqaHGpFxTZSbW6nak+3TdCXF69
 W+2iEW2mBAs9oVyVxFOO8Ph6wcQtc9yUG+daT4G+Q4vnHZ5UeL91es4bRe5NNMPv0D8sZrWW/LM
 Hc3qvPbvGZx9ug9Ah4XCo9xiqEMsdXaF0W/k3Mk1kEmG5a4FM7bufnz3fVy91cRQRxziGNdY1Yv
 vtl7w==
X-Google-Smtp-Source: AGHT+IF+RtT0nHcRaStCokPpIqIxLujpZpjFFgu9P7ssG1Dbp9cdTPQGJvkbcXDD3qNhvrdS/Kj2NXgLvHLELse+VQw=
X-Received: by 2002:a05:622a:4116:b0:4b2:ec43:3de4 with SMTP id
 d75a77b69052e-4b31dcb27f5mr15037901cf.75.1756539278311; Sat, 30 Aug 2025
 00:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
 <20250830-drm-limit-infoframes-v3-9-32fcbec4634e@oss.qualcomm.com>
In-Reply-To: <20250830-drm-limit-infoframes-v3-9-32fcbec4634e@oss.qualcomm.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sat, 30 Aug 2025 09:34:26 +0200
X-Gm-Features: Ac12FXz1p7iZOdEEQR_vXRtXiF18jyko9t937NCSmf3jeVcnUDmrfFo9HX_W5zM
Message-ID: <CAPj87rNMr-2ZeZ2Pqb5qG4Z-xtUyOVxbY635pw_PDEjVpd5-OQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/11] drm/connector: verify that HDMI connectors
 support necessary InfoFrames
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
> +       if (!(supported_infoframes & DRM_CONNECTOR_INFOFRAME_VENDOR))
> +               drm_info(dev, "HDMI conneector with no support for Vendor-Specific InfoFrame\n");

'conneector'
