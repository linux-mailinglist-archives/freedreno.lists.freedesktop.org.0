Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0DF9ED860
	for <lists+freedreno@lfdr.de>; Wed, 11 Dec 2024 22:21:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7130810E15F;
	Wed, 11 Dec 2024 21:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="KglMSAMh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1AA10E15F
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 21:21:08 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-6efc58fae20so64476027b3.0
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 13:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733952067; x=1734556867;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=brnEi/aJpSTL43ttJW7MhyFkF6Ud+FSLpSFKqAmDpCw=;
 b=KglMSAMh5I4Yz+BY5qB5zZjshoNtovcyv6hUburz/x96AAgeLMN681lXk/xOssf2Rj
 WRvzVaMbF8JL/fCtShNdYC1GxOSb0XKnXiXh09DeEDuFUd/Sslqt3M/aaB/bWgwbEEkw
 luJWjqkEriG8f9pTyNnzQsD7lt1SI+VG/rniw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733952067; x=1734556867;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=brnEi/aJpSTL43ttJW7MhyFkF6Ud+FSLpSFKqAmDpCw=;
 b=bAGxTOUD0Sq/jv/dFpUfhNzlBmokKy5q3/h/mXgaFUFMzDgrwizNHdzRg2K7lQpQOJ
 kPzUmTXD5mtp0n54SdzbhsqJtrYO5ODzLU3qpnNnUbpIvEo69JXWQSfooaMogWs+bCfp
 uxG00aLYXSxKtZ9gIjovcDHAcGFKUqljT18IaC/s/GKwm4TfTJIj3jNXjnNcdQ66J0RS
 ZsbNk62HhiVP4nPmcIZqGxPvkV9FfRFodRUTMJq2/wiVaMZs19ILv8ZC5UIDHdn2x08E
 SK1BRxrj7cqXQtzqa9P8R2Ia1QDP9dLVDi7QfVIvbPWybzl266Ofke5zIXKwHIhWIw3l
 0GIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpHyTsfthS1JSu4AZa7sxpYEmVrRhkUvk2rt4le5gTvuinaFKn8r+2gDPUYebay5hpTfSoF9LLB14=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEkhyy1OEVq60khlcaf/o8wKT44xPqJzaOxNa6DP44xuBIrYJY
 8+Uhk2Z7oXK0vkkK82EOtm1xe3oK4S3oZM1SZDFScezE05QJV91pMbALAfQb5mgoH/Wo2p7eIFF
 Qfhr/882UY3FuT+2UwuHiJlRRFw1S1+CWcxER
X-Gm-Gg: ASbGncujYcPnHO7GkY6PQTjsGm4VE+CD86kn94llJZXMvnHMQXRZrqcGxaRnqUbupsj
 nm+zx+1pdjyUcbAQFuJbASoF94cPEKyoz1DByblS8L7gjuwqJ+CgK2YResIB/+SE=
X-Google-Smtp-Source: AGHT+IEq7Zw2BDt+iOPDyUWk0YHRW/a0ILaMn5oRc2ufsHMgU7TT14V8Ms7zyoIfRG/qrZpS8pIGFl7jVktKfKw+4P4=
X-Received: by 2002:a05:690c:4c13:b0:6ee:4ce9:b33e with SMTP id
 00721157ae682-6f19e4f0f18mr13027267b3.12.1733952067697; Wed, 11 Dec 2024
 13:21:07 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 13:21:07 -0800
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-3-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
 <20241202-fd-dp-audio-fixup-v2-3-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 13:21:07 -0800
Message-ID: <CAE-0n50U56XYpayM64BBOPE5U8xQaYg9TOWWmCvtyzB4kChgYg@mail.gmail.com>
Subject: Re: [PATCH v2 03/14] drm/msm/dp: drop msm_dp_panel_dump_regs() and
 msm_dp_catalog_dump_regs()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Paloma Arellano <quic_parellan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Quoting Dmitry Baryshkov (2024-12-02 02:06:33)
> The msm_dp_panel_dump_regs() and msm_dp_catalog_dump_regs() are not
> called anywhere. If there is a necessity to dump registers, the
> snapshotting should be used instead. Drop these two functions.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
