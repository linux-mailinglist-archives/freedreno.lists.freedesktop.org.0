Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F177760E92B
	for <lists+freedreno@lfdr.de>; Wed, 26 Oct 2022 21:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF6E10E2BE;
	Wed, 26 Oct 2022 19:41:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59C010E2BE
 for <freedreno@lists.freedesktop.org>; Wed, 26 Oct 2022 19:41:56 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id p8so30842873lfu.11
 for <freedreno@lists.freedesktop.org>; Wed, 26 Oct 2022 12:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wlJf3bJtBBgfFdtr4YnzwfnWV9gabWn1JKDOmEMYAcs=;
 b=OaLRVdla/d+TMqXrOSWuQDnvl/G7v76nRGBeNbCqwidDlA8awO3d5kSaxKuHb6uhkF
 Nw8YdrDWyEnIij7buDNTNnMa2aSEqwgANRyQ3ajpcYUFNNK9c+oJ8hVOMg2Q1fe+J1aG
 aiY7MSOx82phb+XMhm1/SwWIqD+PWr8ITBEH/eXc9vUL+bAsq2V0qY1TFMsYo9IF8QeI
 TugngMXn8L2O0W3K6u49V43g6OJfNd5VQ3F0LVg9HYAhHdtJ4mE0sy07SlVKXNRwwKa4
 2/4kfn8ucbcPfBsiCL4CpWG1AhnRvwRGTWzzRcrzlvTBXUTWAHOx7ZtwLczl+0y/wX1P
 cWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wlJf3bJtBBgfFdtr4YnzwfnWV9gabWn1JKDOmEMYAcs=;
 b=MZhVhND6dnpN6H6S2BKTqsCxjDbT5jT4LbIAGSk+FWnvj5WDppWNiJhKExLyK5J76e
 WpQtkvAt8vqv5k1gZItlOnwJmd94j0qLUvJb8BbIabkGig7iW6dR8Z5nWDwhB5C9+QPl
 YmC1EjXH2Y7X6e9k8ROj4isAtH1oWBLJZ14XiiVHz3D8ojFXIavQcoTm2K4qJVI0nHD9
 heAekrxxZCxMc6xiDJsBjCZ+LamJOeya3+QQ9Us93CkUpC+Am7PU3Y9GJR404XweZp2K
 zqThMMWQsSVwrUjT+yQHV3/a1tFVZ8ZL5bC7ZD6xkG0QnmNyT9YdYiYScRY6nV3bsgyH
 RzxA==
X-Gm-Message-State: ACrzQf1uIB+1LtZH1hZ28w+nLwHC4JWYnHzKKBlbfjv2OB0A9/5UJ7z6
 9zxDlUm4uM6uiXBYL4ieP0ILzg==
X-Google-Smtp-Source: AMsMyM7PFC5Uw4to/B1qlnRLPHlmqEyPFzMnsc0jMDHWsc7stttckh7FiiZh9Te3P35yPA6tQ0aD6g==
X-Received: by 2002:ac2:5cba:0:b0:4aa:5b6d:fb33 with SMTP id
 e26-20020ac25cba000000b004aa5b6dfb33mr7781326lfq.491.1666813315070; 
 Wed, 26 Oct 2022 12:41:55 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a056512314e00b0049f6484694bsm942263lfi.161.2022.10.26.12.41.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 12:41:54 -0700 (PDT)
Message-ID: <3aa1d8f5-156d-2bd8-b9fc-3e496d7d64d3@linaro.org>
Date: Wed, 26 Oct 2022 22:41:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Koul <vkoul@kernel.org>
References: <20221026182824.876933-1-marijn.suijten@somainline.org>
 <20221026182824.876933-7-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221026182824.876933-7-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 06/10] drm/msm/dsi: Migrate to
 drm_dsc_compute_rc_parameters()
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
Cc: freedreno@lists.freedesktop.org,
 Jami Kettunen <jami.kettunen@somainline.org>, David Airlie <airlied@gmail.com>,
 linux-arm-msm@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 26/10/2022 21:28, Marijn Suijten wrote:
> As per the FIXME this code is entirely duplicate with what is already
> provided inside drm_dsc_compute_rc_parameters(), supposedly because that
> function was yielding "incorrect" results while in reality the panel
> driver(s?) used for testing were providing incorrect parameters.
> 
> For example, this code from downstream assumed dsc->bits_per_pixel to
> contain an integer value, whereas the upstream drm_dsc_config struct
> stores it with 4 fractional bits.  drm_dsc_compute_rc_parameters()
> already accounts for this feat while the panel driver used for testing
> [1] wasn't, hence making drm_dsc_compute_rc_parameters() seem like it
> was returning an incorrect result.
> Other users of dsc->bits_per_pixel inside dsi_populate_dsc_params() also
> treat it in the same erroneous way, and will be addressed in a separate
> patch.
> In the end, using drm_dsc_compute_rc_parameters() spares both a lot of
> duplicate code and erratic behaviour.
> 
> [1]: https://git.linaro.org/people/vinod.koul/kernel.git/commit/?h=topic/pixel3_5.18-rc1&id=1d7d98ad564f1ec69e7525e07418918d90f247a1
> 
> Fixes: b9080324d6ca ("drm/msm/dsi: add support for dsc data")
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 64 +++---------------------------
>   1 file changed, 6 insertions(+), 58 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thank you for the expanded explanation.

-- 
With best wishes
Dmitry

