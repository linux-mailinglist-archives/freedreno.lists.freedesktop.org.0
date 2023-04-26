Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D73756EEB30
	for <lists+freedreno@lfdr.de>; Wed, 26 Apr 2023 02:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3F210E826;
	Wed, 26 Apr 2023 00:03:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08FAA892A6
 for <freedreno@lists.freedesktop.org>; Wed, 26 Apr 2023 00:03:18 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-506bf4cbecbso9558365a12.1
 for <freedreno@lists.freedesktop.org>; Tue, 25 Apr 2023 17:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682467397; x=1685059397;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yRVhWkMKZivSpY0wYZD5uOa2bgROjQL/7zymO21uVoA=;
 b=Q392l+x2KFNeu6328CzD7ySXVmsmaQZSDPTzVKkT5LIuOezJrWV9PDyEMrxKw0YxPE
 HSxgggHrHReqIDvIZwqAHVj7I1O0J9AcPOksU1hapxAimTs0a5bgaCKXE0c/X5KND4yV
 Lpkr8Hiz8E+VA3rsCwHn5H3xDdT2ZU4Mpb/uPcDR6FhG/D8jvyugBzvRVe+bAKh66Cpa
 QKqn+ZERvvV6irIYXlXn03VmobsoaIERy4fTMvfyOhPI/JVQWSG/9SmqBbUYqnbn2zBx
 3UI/mDvQTGmjnhMNABfDyLcan0yQasK/8UIACwilLkh+B+wWxMUyejpXcFWO/9IqJvu8
 x0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682467397; x=1685059397;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yRVhWkMKZivSpY0wYZD5uOa2bgROjQL/7zymO21uVoA=;
 b=StyUMHafKZUxGuVnW/IzZTJP9oLF8TaDCH4N1n327wQUCdeHkd8izPY3zwFvzcCpGT
 Q2z0UBrgb+Gn+K4j6WolB2z+lmKGjBF15x395USQMrIVdoIEemM+h1opDnVHihL1uMPT
 BljBrFuDs3Q/JRUmCKqXoHhSDfa+8CUnxzCz5tQBAMfPO+7+u/JDEaBv7jwtfofWW6uJ
 7ZMaqqxRDY6HpzXStye8IDFKC87HjsXr6VP3Q4220DyHqWyASehcXzU+0724g6HhFn2e
 ewnnwUukrug/xF9l566izJQIeKXmAtilyrV45SmBK3EeBHPGbDCwsGL69n4Up5u82qJk
 g6cQ==
X-Gm-Message-State: AAQBX9eRfT4YH0tW6YJ/QcxtiUBbmr9CMHQZIwzr4TRCnA2V7bgoWxBA
 dwko84OWdm3WbeEBJHaFystYFQ==
X-Google-Smtp-Source: AKy350a8WmKy65DIWCeLM/7FjOwKIt8z6sNVa9zWC3nyJQchP1QE63hpq6lkCzTY10NCqk8SaWXcZQ==
X-Received: by 2002:a17:907:7888:b0:94e:6f2d:d1c9 with SMTP id
 ku8-20020a170907788800b0094e6f2dd1c9mr14666185ejc.68.1682467397106; 
 Tue, 25 Apr 2023 17:03:17 -0700 (PDT)
Received: from [172.23.2.4] ([31.221.30.162]) by smtp.gmail.com with ESMTPSA id
 kw15-20020a170907770f00b0094f8ff0d899sm7294372ejc.45.2023.04.25.17.03.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 17:03:16 -0700 (PDT)
Message-ID: <d24ecc5f-1322-40d7-dec5-e4dc2f09ff84@linaro.org>
Date: Wed, 26 Apr 2023 03:03:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Adam Skladowski <a39.skl@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
References: <20230411-dpu-intf-te-v3-0-693b17fe6500@somainline.org>
 <20230411-dpu-intf-te-v3-10-693b17fe6500@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v3-10-693b17fe6500@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 10/21] drm/msm/dpu: Take INTF index as
 parameter in interrupt register defines
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
Cc: Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 26/04/2023 02:06, Marijn Suijten wrote:
> Instead of hardcoding many register defines for every INTF and AD4 index
> with a fixed stride, turn the defines into singular chunks of math that
> compute the address using the base and this fixed stride multiplied by
> the index given as argument to the definitions.
> 
> MDP_SSPP_TOP0_OFF is dropped as that constant is zero anyway, and all
> register offsets related to it live in dpu_hwio.h.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 156 ++++++++++------------
>   1 file changed, 72 insertions(+), 84 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

