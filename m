Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FDF7AC76F
	for <lists+freedreno@lfdr.de>; Sun, 24 Sep 2023 12:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD35210E110;
	Sun, 24 Sep 2023 10:09:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878A710E10D
 for <freedreno@lists.freedesktop.org>; Sun, 24 Sep 2023 10:09:00 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-31dcf18f9e2so4476379f8f.0
 for <freedreno@lists.freedesktop.org>; Sun, 24 Sep 2023 03:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695550139; x=1696154939; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6nXbLBps5WiXoEQE9WIccP8ivtaXBMcUBjjWn1Nzz6o=;
 b=Gzhg01rwMzQ3v0ZHM5Wt6GIXtYph65iSVFxSdKQHkUc3qyCX+728pPOGM/dFhcElQN
 WSklMWrzHjX/3R/6zYWQ8XnPCwi+Dxfq5XPIm3oAa5cp6mGj45R5Fqf6wEtY6D/970LR
 a8KrYLNp7Tokk/z2O577VoGKMLlc9CF1PM24HWYxe6nKBwBQl2/GM/Zk2Pi1uBz0upxL
 7Tgu353Lb/Y7kIQBp6tRiXMWPIe7lXLzgu/bcObusxTnQ1chpI5EbPJtcc6eMOvVpokc
 z+iVzHIj7w+yg5qr/euFrRqugwojOE/7qEAWEer+O/B3ss4cvWJsEzfcotNB9uGAk6Z3
 OL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695550139; x=1696154939;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6nXbLBps5WiXoEQE9WIccP8ivtaXBMcUBjjWn1Nzz6o=;
 b=fPfNF4G1OdJaEUiZlOY1K36K4lYOCsw7mGMSPjRfG9oeVJ2zAguIXdpPM1Tov4OxcA
 7X2q9HD1uslX8NtdSy0FLWwJcRB82mYs8WPNadXsmXQl7riqiLQppN7bf96ktoUUXZJ6
 wG+zadK936cl0Uhub8JvCuCZMama62swmaQQHAUhaRs1NA95lXKpE4KPdETUu3nErkWg
 hX5TFMETc/n49UI6tZhJSToJv3og43A3rh8b1Edf+nTjn8kA2D3k1oohr9p+2R+/jBfU
 3GPQzEyEhDc+C7Nomu1q9vMlrvvfvBFyzETvVVo+uqod5vXzqush0pA+B2uJZ6/lK3nd
 WzXA==
X-Gm-Message-State: AOJu0YytTFHKik52GL91QTWlDkrzBEDJe//qcOeMUIxFdbFgGa6PRWsP
 boTl10UTVikImu/AmWWUSa6zkQ==
X-Google-Smtp-Source: AGHT+IGc7cLLbVqMAyuO/HE0VQk/0NVpOb/G3zdJclMXCsC6r8WRPOfcesZEX59sT3GWSsST1pnbuA==
X-Received: by 2002:a05:6000:1cc4:b0:321:68fa:70aa with SMTP id
 bf4-20020a0560001cc400b0032168fa70aamr4018108wrb.9.1695550138694; 
 Sun, 24 Sep 2023 03:08:58 -0700 (PDT)
Received: from [10.73.151.44] ([188.111.42.10])
 by smtp.gmail.com with ESMTPSA id
 c12-20020adfed8c000000b0032179c4a46dsm8886160wro.100.2023.09.24.03.08.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Sep 2023 03:08:58 -0700 (PDT)
Message-ID: <2803eb0a-99c5-4cb6-9422-7b8e392f2b7d@linaro.org>
Date: Sun, 24 Sep 2023 13:08:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
 <20230828-solid-fill-v6-4-a820efcce852@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230828-solid-fill-v6-4-a820efcce852@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH RFC v6 04/10] drm/atomic: Add pixel source
 to plane state dump
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
Cc: sebastian.wick@redhat.com, contact@emersion.fr, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ppaalanen@gmail.com, laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, wayland-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, ville.syrjala@linux.intel.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 29/08/2023 03:05, Jessica Zhang wrote:
> Add pixel source to the atomic plane state dump
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/drm_atomic.c        | 1 +
>   drivers/gpu/drm/drm_blend.c         | 1 +
>   drivers/gpu/drm/drm_crtc_internal.h | 1 +
>   3 files changed, 3 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

