Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F967040B2
	for <lists+freedreno@lfdr.de>; Tue, 16 May 2023 00:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E17210E2A2;
	Mon, 15 May 2023 22:07:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1EF10E2A7
 for <freedreno@lists.freedesktop.org>; Mon, 15 May 2023 22:07:09 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f37b860173so2953614e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 15 May 2023 15:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684188427; x=1686780427;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LD3bzTcohof43Cv5AIGVz5AV6O0c+E0Pt23Vyll0iRw=;
 b=m7SEzQnaOG9G40vLqC6KQRYLcHGnGmqXVV6ugylQNm9QRGPCm7OChPJDzYf5HlG/VD
 6fFqfpcon8wfBF1cfeOkgvWQ59BU7jWRGdMxbnto+4xTd94i6uIlGRXEsxlVm/RE7OBe
 PwCM84DiHy+nJDJreIk99Nw95sWtUEYPNtr4ZlFO74oHKStI6gRBS/O0on8tKEvQaDHe
 Q5Vs81fimTZXvYfUvuPx+LzPbrMtGB7Su2wc1Dgwdt62XUuwPf9DVdXpaU+zBQhCbqRU
 LlBDfxS5o/tj98PluRPBBFMFM1ueWT342vMJzk2iJEnNyDGvf0yHMMxpez0vTjHsWbS2
 SRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684188427; x=1686780427;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LD3bzTcohof43Cv5AIGVz5AV6O0c+E0Pt23Vyll0iRw=;
 b=dVWZJRmI6sICgUDI+QtgzMslf1W5d9ouvTR8PuGRXpRndapOk2VH/yu6rdVX6igLUc
 lgqNRD+uBCNh2fJb4sljzGuEh8cbVcOg16bBK2lS/lTraBmkC6S5G7q1kDD3YRpQMTKx
 mVoY0jwaWV170nDoZMbdLGT3ttptIwnK2D0nMFLhd8bhbUUnXOvt8uM/zqPDkM3y3mYD
 ZtZuiiewr+34wCivboZZokSwm+RyvhsVPM8SmTlXwNLg7dOGXD1cLAcpdz4chBShQ5hY
 SoWFWUgZUkU+uIitMptwbyPyBXXM2WJ426GeYCnou3dSFIYW1c9dGHE73MSwgVn8Cwt6
 wFgw==
X-Gm-Message-State: AC+VfDz51fN7WY5pO6Gf3WgwE4ZBqasL/v8lQbGV2qfCL9YA/uvVSSdL
 c/QDWlRw04jpe1mkcsey+37nfg==
X-Google-Smtp-Source: ACHHUZ7rAS8Yhzo15Yx5iO4kwGAT54cP3w6YUHDGMWLvzttCZGZfbj1o6VqJoKR83WVC9y08J07Fnw==
X-Received: by 2002:ac2:46c1:0:b0:4f3:85eb:97b1 with SMTP id
 p1-20020ac246c1000000b004f385eb97b1mr888074lfo.8.1684188426777; 
 Mon, 15 May 2023 15:07:06 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 6-20020ac25686000000b004f25ccb6f7bsm2558045lfr.301.2023.05.15.15.07.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 15:07:06 -0700 (PDT)
Message-ID: <a5a56711-3607-407c-aa8f-aed39a41fb73@linaro.org>
Date: Tue, 16 May 2023 01:07:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v10-0-4cb21168c227@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v10-4-4cb21168c227@quicinc.com>
 <kx3be4c2okye2ts4rzy4j4ltnveixf7v4rxp5v4tl2irvevg6t@c5tuelunmn4c>
 <0e8a8af5-5ab8-c1b9-e08d-909072cc9b76@quicinc.com>
 <4cbqbu47vcshskl4npyzos5r7gxipjbbzyfvdfx7fenfh4mzmx@jj6lrysp35du>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <4cbqbu47vcshskl4npyzos5r7gxipjbbzyfvdfx7fenfh4mzmx@jj6lrysp35du>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v10 4/8] drm/msm: Add MSM-specific DSC
 helper methods
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
Cc: Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 16/05/2023 01:01, Marijn Suijten wrote:
> On 2023-05-15 13:29:21, Jessica Zhang wrote:
> <snip>
>>> Const, as requested elsewhere.  But this function is not used anywhere
>>> in any of the series (because we replaced the usages with more sensible
>>> member accesses like slice_chunk_size).
>>
>> Acked.
>>
>> I would prefer to keep this helper so that we have a way to easily get
>> BPP information from the DRM DSC config in the future, but if you'd
>> prefer we add this helper then, I'm also ok with that.
> 
> The inverse helper is available ad DSC_BPP in drm_dsc_helper.c.  Perhaps
> we can move the two variants to the header and define them uniformly?
> This isn't MSM-specific it seems (i.e. the format supports fractional
> bpp but no RC parameters appear to be defined for such a format yet).

I think DSC_BPP was removed (around v2 or v3 if I read changelog correctly).

As for the fraction-point BPP, I think AMD supports .5 bpp granularity, 
see drivers/gpu/drm/amd/display/dc/dml/dsc/qp_tables.h

-- 
With best wishes
Dmitry

