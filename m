Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 064A86CC663
	for <lists+freedreno@lfdr.de>; Tue, 28 Mar 2023 17:32:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C25F610E70B;
	Tue, 28 Mar 2023 15:32:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9271710E70B
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 15:32:10 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id y15so16336171lfa.7
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 08:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680017529;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6kpJPb5YFzFq3dKnHkW0EYm3cbKljFaAKRN09G45xkk=;
 b=GFMyUty6jLFErND7rsuicmJVe+fKzEZclYqmm6ULU9RQq7ey5SI2H/+uELoaFpPM4E
 bexYbMx5kMxNlPdqdeuM9r04QTPLizjPYjRNdlIfrAqKgBfaezGVqGFzzpwyYe1Pa7SR
 Y0QASB4hZzeXKhpp/3ay0txNteuTICoeTli0O4uH2sx6IYX6plROtHCix6N/DkHMeIFV
 G0ZTwTgiFcajiE9QHYGkiAvIneLjaABEHo/uM5xEGQV8tLaNKtfZHoFpK10PSDb0U5kr
 A4Z2KWa97JsHJFNhBO6VHwm0Q9BTxaFr1Q3i51Q/sJL1PPERVSYeErHn0BEaq824qlM0
 Eakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680017529;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6kpJPb5YFzFq3dKnHkW0EYm3cbKljFaAKRN09G45xkk=;
 b=KM9UYsCrsRETvY0A0lxz+rXoNW5+5Warsj0I7znkytU9KDv5XOuhVX3R+2HR7zagkl
 wF9kG7GLd4yE6fTJVOxJtYHGEwCaVsXoP0Sm7KrNhDvCjOTyfVyH2QAQ2l8u3CUDk2Y5
 k852hmuwBVSx9n3b+h3/K43n/6g9HAsh73eX47IzT4ZSTZc4268l8GuHsv+YQ+pHq/hT
 k6hxHvjFOgbiWftAdXqSf47QBo4Xf0hLqaefDvH9it/VDXnqwFTUFtJVXXWBDm3mH6Ls
 0XV7aekxCIeZdQ6aqLbGa3KlQ/9pau2cWuv2KGWLUX7XGIPx7zEICofaQs8Pp85uPYjo
 k7XQ==
X-Gm-Message-State: AAQBX9eWJ2/nJfxNiS9L3lbyIBrcXsMs0Yu/N5a2DfC81PHrHYY7mKO4
 yv0XSB328tyqmBV/GCMSDd3YDQ==
X-Google-Smtp-Source: AKy350bTy8RE9QqIMjHPeexUwuLburZ3vMaCr3DV7vct3bL7+xdnv1gnc/gwwp0QNcPHuRwUpKkyww==
X-Received: by 2002:a05:6512:910:b0:4dd:9a38:1b9c with SMTP id
 e16-20020a056512091000b004dd9a381b9cmr4670977lft.20.1680017528925; 
 Tue, 28 Mar 2023 08:32:08 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 x18-20020ac24892000000b004eae73a0530sm3352354lfc.39.2023.03.28.08.32.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 08:32:08 -0700 (PDT)
Message-ID: <06251057-59a4-e24e-cb18-c0095232622c@linaro.org>
Date: Tue, 28 Mar 2023 18:32:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <20230223-topic-gmuwrapper-v4-0-e987eb79d03f@linaro.org>
 <20230223-topic-gmuwrapper-v4-14-e987eb79d03f@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v4-14-e987eb79d03f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 14/14] drm/msm/a6xx: Add A610 speedbin
 support
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 14/03/2023 17:28, Konrad Dybcio wrote:
> A610 is implemented on at least three SoCs: SM6115 (bengal), SM6125
> (trinket) and SM6225 (khaje). Trinket does not support speed binning
> (only a single SKU exists) and we don't yet support khaje upstream.
> Hence, add a fuse mapping table for bengal to allow for per-chip
> frequency limiting.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

