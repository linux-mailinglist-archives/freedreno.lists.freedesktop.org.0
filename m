Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A5E75132F
	for <lists+freedreno@lfdr.de>; Thu, 13 Jul 2023 00:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39F410E09D;
	Wed, 12 Jul 2023 22:05:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C977210E00C
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jul 2023 22:05:24 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f954d7309fso1675333e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jul 2023 15:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689199521; x=1689804321;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+IGnoejHJpmmAQXtyei84p3PqvM4LyL/Zj9/Bp1HQGk=;
 b=nSD1kvERFovNn1kT4bbHHTmbsphj27nYbGwJl5B42HnL/ZdSXJvFjBULLgqy4Uh801
 teO4HFmJygX9+PaR7h8YZuWs8GEF6Xke1LKdvZfzrNZ8WHbU/CCDU+XRnr2h+mbaiati
 i7xI2CQNVBGmOsTzmASIplGvjgxDyjsZh62PlPv+cq6QEZSdjqkUaETFaVQcvB4IwEDy
 oHTAqSlwHC8o8T8n1uBFofKVcLFuItG6nviMs4iDRRT4R9gNAj9K0TUqTZvvGygYZ4wA
 uquf2rnVavjLs/zGa49HoQma+kYS0dZuaI7fS4e9JjLSIFxM2nS5KHyXtvSQQ/HeKWIB
 33jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689199521; x=1689804321;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+IGnoejHJpmmAQXtyei84p3PqvM4LyL/Zj9/Bp1HQGk=;
 b=Lru5aYpUG2qfDLtT1/rubZNSHpEib/NgjwvCuchVi+gsSmO+dSvhnuEgpA8tX7/gvA
 3khZFQCs5LAVq0BLgKlxbo6kC+AbjTovsBacTFstCYHePOsiKSNgtsvryR9EKsuhRMsI
 OnhocBVjoFboubU29hfmz3LPUC6Rze5wJen+QEIiDqy+epqfpyNDs8oR6Z5WDKmX19hF
 AeGN71rDSewyLvkssOKX07c2BUG2cHiXI2RICgPxg4YYIi9kf3zy6ppLAM+Zm8Z2nIUy
 f/Zg6jP6TcBtRqOnOe6tCrNhoIkRdnnJ7M9jcKMe5GF+4OEf6wiSHL4YXf8uNwgubgIs
 /8Aw==
X-Gm-Message-State: ABy/qLYXd5LkzmlA9wJekmMCBc+fI/b5YJtTMTfm5vSyN3F1O4wYXpYJ
 Kxtpa2L9jABA4gwhmQSAZMHIOQ==
X-Google-Smtp-Source: APBJJlHYiTYghZ8lRE0BlmpMRWpmX7B6Hk6Acw5gNjaSSY+PfA0RFMceJZLm/WVODd2nENY/KAlzlA==
X-Received: by 2002:a05:6512:110e:b0:4fb:7f45:bcb6 with SMTP id
 l14-20020a056512110e00b004fb7f45bcb6mr1223425lfg.16.1689199521563; 
 Wed, 12 Jul 2023 15:05:21 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r12-20020a19ac4c000000b004f87893ce21sm869646lfc.3.2023.07.12.15.05.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 15:05:21 -0700 (PDT)
Message-ID: <b4a5291e-6925-829f-a690-7384786fbd88@linaro.org>
Date: Thu, 13 Jul 2023 01:05:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
 <20230712121145.1994830-3-dmitry.baryshkov@linaro.org>
 <9744c1a3-1e13-0c73-9add-4651c0401f8a@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <9744c1a3-1e13-0c73-9add-4651c0401f8a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 2/8] drm/msm/mdss: correct UBWC
 programming for SM8550
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 13/07/2023 01:02, Abhinav Kumar wrote:
> 
> 
> On 7/12/2023 5:11 AM, Dmitry Baryshkov wrote:
>> The SM8550 platform employs newer UBWC decoder, which requires slightly
>> different programming.
>>
>> Fixes: a2f33995c19d ("drm/msm: mdss: add support for SM8550")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Do we also need another fixes tag
> 
> Fixes: d68db6069a8e ("drm/msm/mdss: convert UBWC setup to use match data")

No. We do not need to fix the conversion. Only the sm8550 setup.

> 
> Also, this was previously part of 
> https://patchwork.freedesktop.org/series/118074/ .
> 
> In this one its after the bindings change.
> 
> For easier picking into -fixes, will you be moving this ahead of the 
> bindings change and OR do you want to keep this part of the old series 
> as it seems better suited there.
> 
> I think even if I pick this for -fixes, rest of this series can be 
> rebased without issues. But let me know what you would prefer.


I had rejects with the original series (and 0 reviews), so it was easier 
to push that as a part of this series too.

I'm fine with you pulling either of the patches into -fixes.

-- 
With best wishes
Dmitry

