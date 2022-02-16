Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A93A54B7CFB
	for <lists+freedreno@lfdr.de>; Wed, 16 Feb 2022 02:58:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB4610E5F0;
	Wed, 16 Feb 2022 01:58:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27CAC10E5F0
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 01:58:55 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 o128-20020a4a4486000000b003181707ed40so824513ooa.11
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 17:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=R+LYm6UbYwzklwgrWKfldyYMasmr0KjdKhTH+74gh5E=;
 b=V/q8gH1WZpL2h1HMbcPsyQhax1VJztQIe10OiGgLpp3mfnSElE8s1fmozTu0UZERff
 /P3g4fqN9FQkP6ymYgD59qg67zdRpuBv5i7cEmI7Vn11781ZjVZO8GYjwjRxMdiFsflx
 FyMySmz3/V8jYwp6c8ER0o3C+d0n4kbTrU5UE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=R+LYm6UbYwzklwgrWKfldyYMasmr0KjdKhTH+74gh5E=;
 b=0nmvXryG2Gs6EYCZarbQ2ngxyERntV33tzgo2wdyfraSZgf2kyjroV3T5D7g8huPV6
 tAOH9IkALnCSxDWDTkmB2tvTWuq7B4SMBA2MVTz24OUTWTardQrtuttcSEqGNlgyaekv
 LKqlkuyhpJOKcbY6ewtUyPRLc0KsLKnLngmkW7QdIHwXAHdKZOt/ep9L3eqQbzB0X0Bu
 YpzpsiIcopZP3Aj3jEMfB25YKByQgIi7Ld53Kz/8rGonNTViT4M1tWGyaI8TvCZKwAd/
 ZmC15zJLSMcTFoFjB0eUoJq9/VQa/V9jL/Q2bZJ1MuHHKCmJFCrMg9tFwymrpZH6eVu7
 Qjdg==
X-Gm-Message-State: AOAM533UFy8r7joF/0BtLreU1d8ledTMJfrg3ojsGtCNsbS8oJnoSWtf
 Knw2lmt1sP5EXncLDXG9L6t9b8L/5zvfmTu6iJDP3A==
X-Google-Smtp-Source: ABdhPJze3x/RF7+2WkKFtz8cWerX43wYucnT4Wu3WZEPmq2xYoXVy1IiMR4/cE/ZbonvVhbSyVFTMQkLvkqYp6NwLWs=
X-Received: by 2002:a4a:a9cf:0:b0:2e9:5c75:e242 with SMTP id
 h15-20020a4aa9cf000000b002e95c75e242mr206733oon.25.1644976734433; Tue, 15 Feb
 2022 17:58:54 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 17:58:54 -0800
MIME-Version: 1.0
In-Reply-To: <20220215141643.3444941-7-dmitry.baryshkov@linaro.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
 <20220215141643.3444941-7-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Feb 2022 17:58:53 -0800
Message-ID: <CAE-0n500D92XLGPHwm-SHPZ1KwzQ+2rKaDOHU-G_2j6aFv7Ofw@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 6/8] drm/msm/dpu: switch dpu_encoder to
 use atomic_mode_set
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-02-15 06:16:41)
> Make dpu_encoder use atomic_mode_set to receive connector and CRTC
> states as arguments rather than finding connector and CRTC by manually
> looping through the respective lists.
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
