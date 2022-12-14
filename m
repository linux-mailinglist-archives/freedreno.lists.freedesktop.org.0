Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C7864CF93
	for <lists+freedreno@lfdr.de>; Wed, 14 Dec 2022 19:41:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D97AB10E450;
	Wed, 14 Dec 2022 18:41:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F4110E44F
 for <freedreno@lists.freedesktop.org>; Wed, 14 Dec 2022 18:41:02 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id b13so11958071lfo.3
 for <freedreno@lists.freedesktop.org>; Wed, 14 Dec 2022 10:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KlbzUq+tOvWZTX1iTC62dGCw8tS1Tawz7StXXWUJBow=;
 b=OAHpv2sC74xYtK7Xb0MxTnMZXhNCPvr5e5pBtGJRmjeJlqY6rHJaEE4yL1hu1z6IZu
 dFyUbOyyxj7OLPnojhoX+UTzb9zQZ8uiAsrxzZu6USLFMAvEknD6gBYUG5AzQg49FulN
 8qiEu/iYD2aUDeE5Vs/GK5UEdMFYFor271iX4sGEAvzUChWjhlTJxuf6EnImeqMYEObO
 g2jTu1v8VQHGWTr74qcswrFPZ4uvyKZFOf/uigJIUFYlphLrmpQREbRpdqQF08UspHPC
 zOrVLnf+iJWQwZNC2dcXcw9Uk1KWRlGaAHz2aKn7r+PwyntXykUbJnLn3BQLZ9wbQV1Y
 RPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KlbzUq+tOvWZTX1iTC62dGCw8tS1Tawz7StXXWUJBow=;
 b=0rzn2TmEsV4fjmi8dyGvi9GoT0ybQgSr3LsK9vhCoWqd42U3nUv/BBRWvewJ0LYHvJ
 l4Pl2Qv5MyyyMfEIZnVYJfA3h0diWYVFcUv6zVMPxT4jWIiQ8DM1CMSiYY3JFhbInKF2
 N9I22JIp0SpxD8NNR7I8+02PT+A+s28SDLh5S/e6CceTygb4TQvFBbS9ruzInLgEBuZM
 u2iuuoodwLpwIxjOqDQh65+O40fdZmwmYFZHxcLLlP9CaQl5CxlhDFSpEiaiyCCCsk+6
 LdVOHlO3IM++LhDij0ScD43N2K63B39uKIaXT8pBzQ9P9z1EXDVgNTGhSGtxYHN/LYZl
 4kKQ==
X-Gm-Message-State: ANoB5pnzbmpF0fl4bug2KlmmkBCyV2iPel/QLpVIaReH+uwXCun9hjuO
 Zxn0jbibU9bv0E0YgepuH60+7w==
X-Google-Smtp-Source: AA0mqf4INakKd3LZMtzDYYR0L5yC7mvhNniVhImL4nXThcWEcwVIgzV3XwS24djEPGbC3exkq6EPgQ==
X-Received: by 2002:a05:6512:2812:b0:4b5:ab12:9acf with SMTP id
 cf18-20020a056512281200b004b5ab129acfmr8428468lfb.60.1671043260708; 
 Wed, 14 Dec 2022 10:41:00 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a056512200400b00498f00420e9sm892123lfb.194.2022.12.14.10.40.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 10:41:00 -0800 (PST)
Message-ID: <c90f6017-b757-f514-a6c4-1fd0f010a2e7@linaro.org>
Date: Wed, 14 Dec 2022 20:40:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Koul <vkoul@kernel.org>
References: <20221213232207.113607-1-marijn.suijten@somainline.org>
 <20221213232207.113607-2-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221213232207.113607-2-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH 1/6] drm/msm/dpu1: Implement DSC binding
 to PP block for CTL V1
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Haowen Bai <baihaowen@meizu.com>, David Airlie <airlied@gmail.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, sunliming <sunliming@kylinos.cn>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 14/12/2022 01:22, Marijn Suijten wrote:
> All V1 CTL blocks (active CTLs) explicitly bind the pixel output from a
> DSC block to a PINGPONG block by setting the PINGPONG idx in a DSC
> hardware register.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  3 +++
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  9 +++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    | 27 +++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h    |  4 +++
>   4 files changed, 43 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

