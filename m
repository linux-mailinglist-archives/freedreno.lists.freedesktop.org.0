Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC95264CFB3
	for <lists+freedreno@lfdr.de>; Wed, 14 Dec 2022 19:53:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60CC810E444;
	Wed, 14 Dec 2022 18:53:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A7910E444
 for <freedreno@lists.freedesktop.org>; Wed, 14 Dec 2022 18:52:57 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id y4so7571497ljc.9
 for <freedreno@lists.freedesktop.org>; Wed, 14 Dec 2022 10:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZseIU9pUHVwznNtxNlFxx+0mTPXyTHR3NZJ8jxTNHvY=;
 b=r/gW/N2Pnn4oZW8y86l9QHLF343OH2bshWe8KXeJ0yZ3tWuEcwyRugUz0q4xtyDE1o
 cGWrdvNidcO9AiiaboC+4oTdrw+29Bm8FDdoRZXbnfjdJe/Cto/H5RvQTS58jWylWX1K
 SZyM5/ZHedIIs3MDjXFzCk0B7wntCny+eUl+Ui6cx07xFFqOwCK5W5X3zQtJx14x6c5i
 YeU0DexZQtJfMT/w2tCslRmgsZAtV681kCGIU/1Jo03bVYZna9POL3J0x1noKdjgocZR
 n4ncmQzYUp/aBrcoiU+A5tP3hxbdzICfzSi+O/oP9XMIs4Q5OU5ERsgBzeRc3xmu/JCn
 wVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZseIU9pUHVwznNtxNlFxx+0mTPXyTHR3NZJ8jxTNHvY=;
 b=XgXlVjwucovZm9tFX8Z4dbfuENDxbK6xnWfHiJO019BJoGeB+RyBoRkjtCjgGQ4pi2
 jDvpxfo9Csw0Mfjy84UaDh1DIRIcohSLroGE95L1h4OE1qdL3chPCfcgnFCEIpA4zRt8
 lEIt7Q/ZTIG4ki6PpiPiLcSmGGJIgNK3Wa5g4/5wDCKx7vSqMsYLf7qV+MufLLXl+b03
 ULgc8zaduomL9SEvflJk4v9CbRn1bbtjP9Yg1kDYAmLa5FcK34DQ2sf4ik6gJ8cxNaVL
 qf7nMqlPqgXwlYPXg/uuSv6CNpaeYCvkqrYuQ6Drle6u8B/xXUjMydGbLcwtYPScmWNq
 iyqw==
X-Gm-Message-State: ANoB5plAzF+Mblt+Ga+3gIcUxnoliSs+h/FeoFouc+zuK9gJ7JDlXi28
 eRuP5qNV0kMyqmXLX9COm4o4iA==
X-Google-Smtp-Source: AA0mqf7ZgNkE56lYnu/RzMo2/dyqB/FcOcbFfYQFPy+YE495hfWhIWasUAYLlY1RxV/76aJczrI/Tw==
X-Received: by 2002:a05:651c:178d:b0:26f:e87b:d3bd with SMTP id
 bn13-20020a05651c178d00b0026fe87bd3bdmr8121650ljb.39.1671043975587; 
 Wed, 14 Dec 2022 10:52:55 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q20-20020a2e9694000000b002770eafaafbsm695766lji.99.2022.12.14.10.52.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 10:52:55 -0800 (PST)
Message-ID: <ca33cb5d-363d-dddd-4ad9-62f8a2d87bb1@linaro.org>
Date: Wed, 14 Dec 2022 20:52:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Koul <vkoul@kernel.org>
References: <20221213232207.113607-1-marijn.suijten@somainline.org>
 <20221213232207.113607-5-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221213232207.113607-5-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH 4/6] drm/msm/dsi: Use DSC slice(s)
 packet size to compute word count
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
> According to downstream the value to use for WORD_COUNT is
> bytes_per_pkt, which denotes the number of bytes in a packet based on
> how many slices have been configured by the panel driver times the
> width of a slice times the number of bytes per pixel.
> 
> The DSC panels seen thus far use one byte per pixel, only one slice
> per packet, and a slice width of half the panel width leading to the
> desired bytes_per_pkt+1 value to be equal to hdisplay/2+1.  This however
> isn't the case anymore for panels that configure two slices per packet,
> where the value should now be hdisplay+1.
> 
> Note that the aforementioned panel (on a Sony Xperia XZ3, sdm845) with
> slice_count=1 has also been tested to successfully accept slice_count=2,
> which would have shown corrupted output previously.
> 
> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

