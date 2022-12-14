Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBD964CFC3
	for <lists+freedreno@lfdr.de>; Wed, 14 Dec 2022 19:54:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411F710E444;
	Wed, 14 Dec 2022 18:53:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4982610E458
 for <freedreno@lists.freedesktop.org>; Wed, 14 Dec 2022 18:53:47 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id b3so12027287lfv.2
 for <freedreno@lists.freedesktop.org>; Wed, 14 Dec 2022 10:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6rJMrpZYZD2A/xpXae8B0oejAWRcmuy9sfR7fFaHOBc=;
 b=QVQrCEIZvayjhKBW1SqgqlwaNf8PyYteWOCCf4E1q99+gQs2QJayeOl1370H60k3o3
 3EaCcdL3nZuLdvqUlQOx0TjWZX67iRRGNVSY5yQEQUWCT7g+53BaMSIFnv0dEhGx5LKl
 zThoZ0JdxlKAxhtU+xZTknQD4h/BeoFbejEoLtSeH5yuDhTgVie5zrtKwvUl8MwU8ngw
 6re8naZmhWWkl10KJSdxZ3UYnrp7PSm7Si0qEUch0vyDR7tD5imx2wtWB1UK/FVD4kGJ
 MXTDlCQF5xdphRE10L/a2Cdlw600HMZr+3FoI/F0aP+I3zDOWEg5BrzbeaA/kY2H8aKx
 DCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6rJMrpZYZD2A/xpXae8B0oejAWRcmuy9sfR7fFaHOBc=;
 b=VVUgctmZDm16xKfY6+jssyG8D7Uqcs1pyJMNpeHtOLyLOfq10xHUyJS/FrnS6X7gHb
 vTQccOlvFnd+Up4eChJv1zJxfhP/62eE4Jx0N18CrY4f1cdTkH2m2BI9aKlmvaW0gFlj
 FiEroJzen1/XVGFhGGuGSrrjFym2B+GQ2z8sitzkh2S3p7Sx0/FMOOh9hcpGlk9VNpAG
 k2+LMtDAHYF50vV7vqTzinagMB2UA7YTQoR26qQtkv1y590VOM0d5s6+OAo5u0X3NT3N
 vLePekMWicgw5fjDguqyIjtiicGXVVoQBu+p7rwn1RMFkwCsT5lSWyRyjZbjbGuZWmPe
 u5Fg==
X-Gm-Message-State: ANoB5pmf3xmehqh+nm6kcAez4HwlSckxdT9Wug7Q46HbfvYhNmxrtSYK
 ILYE+9AHR4mUx6chNcUao6Qv2g==
X-Google-Smtp-Source: AA0mqf5a2Ur10inLKK3tfDV562RQOWwl9Gjlcf6ElvbgqgUeC00yin0AqxKIn1vOT9+/BxoUPUnKjg==
X-Received: by 2002:ac2:5201:0:b0:4b5:889c:f2cf with SMTP id
 a1-20020ac25201000000b004b5889cf2cfmr7321525lfl.20.1671044026895; 
 Wed, 14 Dec 2022 10:53:46 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a056512348700b004a2511b8224sm905068lfr.103.2022.12.14.10.53.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 10:53:46 -0800 (PST)
Message-ID: <7d0b3010-bcb1-657e-1d7c-a66cca7ebe8e@linaro.org>
Date: Wed, 14 Dec 2022 20:53:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Koul <vkoul@kernel.org>
References: <20221213232207.113607-1-marijn.suijten@somainline.org>
 <20221213232207.113607-6-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221213232207.113607-6-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH 5/6] drm/msm/dsi: Flip greater-than
 check for slice_count and slice_per_intf
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
> According to downstream /and the comment copied from it/ this comparison
> should be the other way around.  In other words, when the panel driver
> requests to use more slices per packet than what could be sent over this
> interface, it is bumped down to only use a single slice per packet (and
> strangely not the number of slices that could fit on the interface).
> 
> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

With SoB in place:
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

