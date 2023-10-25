Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B523B7D63FB
	for <lists+freedreno@lfdr.de>; Wed, 25 Oct 2023 09:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F5710E57B;
	Wed, 25 Oct 2023 07:49:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD0910E57A
 for <freedreno@lists.freedesktop.org>; Wed, 25 Oct 2023 07:49:49 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-d865854ef96so4846067276.2
 for <freedreno@lists.freedesktop.org>; Wed, 25 Oct 2023 00:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698220189; x=1698824989; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1mPZL+BmecJLI1raShNlD/spbj5/yWrHF1o5a2NHN48=;
 b=xrHlVU7hILNxbjkjUC3xx48SlcmPxAe++TggqSHI6t+1u3zbu8NSIwrzYEFKhC5gSL
 w/jRUchlxnFldgzsYdRGSwbF8ttyOhQ3mzVewJ+yaNtkUjLtO46PwAeN58GTjqzQ6E/R
 XAIhEFj+6t7l2vlbu18yIDD+1rZovXkbomDfnjEHH6ZCMAElQ4a/OpTU3iGvsaXCCRHe
 NC1Y8KdrjFDbgKH2Mr1S9B/VQW8YtuoddifD4YQl8xsp7LoG4n4mSUSw9xbz/5MxxAgv
 eJNwo+rFmD2444zs6bmWaw5xqa+JHhKj4THuzaeQilLlDb2l3dVivgVNcu0u/YEUbUy0
 mVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698220189; x=1698824989;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1mPZL+BmecJLI1raShNlD/spbj5/yWrHF1o5a2NHN48=;
 b=l64FNrIEZQPpuQ7F6+usagGtDQM35A1oDZI/8kyXAm18t0CAHeN0Vnr1pS9mKhBkvZ
 Xs7FHp8wUMzhOFjpzOKNsHvs3KqLeEkGbnRFkQEbQL8k7u+IIAHKghkQ+WGRexv5y3hi
 F9qkivy5a+BYXw68/rGQxG2N5nrZ4aY6PRn8JZ5NNrdtAigcQGGHbtLiQXyJ0ATn9eQS
 tt1lTkI9rcVwBf2h1Km75gc1skl4VYsbkLESNyAtWBzqcWvYIj180IkOTrAvT7foZ/OK
 RPUTe4maDHQ5pwa22ARUfWNXVshYQytTYM0WyZK9ax52eEdTNuMbdIJJ0lj9pUPoafKL
 ziBA==
X-Gm-Message-State: AOJu0YzWBzJMiruLTT4E9RuBsiayyuRQpTaCfb0gTaIY1Nx9cirQtzdq
 NEFfrrQ+1h+hGLfVPPGNwY6m5h6w94VSNF8UDwwIpA==
X-Google-Smtp-Source: AGHT+IFkibsCTPletgNIKgRFCG8zEbKtKhuMRGWu9dJ/Z2gpcZTNPiloV3NsJSBSfNWJPl9BX6pmshk2fW6iQLs8Y18=
X-Received: by 2002:a25:dc04:0:b0:da0:4576:3689 with SMTP id
 y4-20020a25dc04000000b00da045763689mr3713196ybe.25.1698220189116; Wed, 25 Oct
 2023 00:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <20231025-topic-sm8650-upstream-mdss-v1-0-bb219b8c7a51@linaro.org>
 <20231025-topic-sm8650-upstream-mdss-v1-6-bb219b8c7a51@linaro.org>
In-Reply-To: <20231025-topic-sm8650-upstream-mdss-v1-6-bb219b8c7a51@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 25 Oct 2023 10:49:38 +0300
Message-ID: <CAA8EJpqSuX=BL3x7p3SUaRQ8JLtVOQNM4Cf6LojYKV66OyOJqA@mail.gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 6/8] drm/msm: mdss: add support for SM8650
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
Cc: freedreno@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 25 Oct 2023 at 10:35, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Add Mobile Display Subsystem (MDSS) support for the SM8650 platform.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 6865db1e3ce8..33947a2e313c 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -621,6 +621,7 @@ static const struct of_device_id mdss_dt_match[] = {
>         { .compatible = "qcom,sm8350-mdss", .data = &sm8250_data },
>         { .compatible = "qcom,sm8450-mdss", .data = &sm8250_data },
>         { .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
> +       { .compatible = "qcom,sm8650-mdss", .data = &sm8550_data},
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, mdss_dt_match);
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
