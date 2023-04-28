Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA376F17D1
	for <lists+freedreno@lfdr.de>; Fri, 28 Apr 2023 14:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFE110ED0E;
	Fri, 28 Apr 2023 12:25:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D1C10ED0E
 for <freedreno@lists.freedesktop.org>; Fri, 28 Apr 2023 12:25:41 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-506b8c6bbdbso14523813a12.1
 for <freedreno@lists.freedesktop.org>; Fri, 28 Apr 2023 05:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682684739; x=1685276739;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JZaTVYj+7JHW5ogrU2gshDHZR4SGV9IAITO2F/xNkdE=;
 b=S09ujwy6aOa6ctTYPXwZoPuRqF36CQOsazZonATFMiCtuWUqgPKeTkzkXMlHuMRDwV
 fLyWqUdCI9LTy5qBVXnvUr9nsc1iUB70043XxxZExzigT7J8Q5IBgzamv6tF2kALgu1Y
 Yea9deTDF9RU3VYdjcs6b5Rjz461ikvTNh/RO1MsUPAASsf9MNnIjvxm5MHjXHO8mWd3
 MpDfVvBEqhnqWnh/krHjWorg//QItjEdQCqnZZ+7NaRY3SFEK9fv0qHuNQP8oTu23hUq
 XRgPM+D1+VtGFF4UcvqEN3Z1pUWM0Gxg0ZN152oSurdgRNsePO4i9JsPUHjavQrMvg1Y
 Uwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682684739; x=1685276739;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JZaTVYj+7JHW5ogrU2gshDHZR4SGV9IAITO2F/xNkdE=;
 b=dT075yjPcDwND7NPvfi26bu+VqqRd6UfkVfl41LZYnOUwISYSAF49jYzkuaMeaOIi/
 eEit6MXMMKYj4iJQEy4LABA8Fel/8eNBcVp/aSNfpHlpFSdp9zNsTCmG+japFhkwMqJh
 EZ9abMzYWCtyh4nM7VKHrJEtvNgTO8zrXGad0KrmkS7DaeSNqfWIyTI/6YUe+uX7SeIa
 0U8uun9Fk08IeRQR3We7JgX4fMzuzs7i9vnvaOi38VfBKCZhe6J8NFpf1/OoGMz/HdAO
 d9fUuhRFqd6X4OJfjxK6PIdmBz/apd8PhjrhwMyxk45ap2CxI4pdpjJpNLjSGJ9PXoWj
 hQdA==
X-Gm-Message-State: AC+VfDzR7wvdxNYXg6g2MMzRdHQ0J30xt3bzbZAHXI+JdE8kHczbI5WY
 eeR++rTqQlZ8ILsoO43WiY1ERw==
X-Google-Smtp-Source: ACHHUZ5nE8CV6swtaa6RT8oWCahIZAfJUkO/1Goui9aA/rILn+31p0oddbno5lpzYsEOiXt4oKJLeg==
X-Received: by 2002:a50:fb04:0:b0:506:be49:243a with SMTP id
 d4-20020a50fb04000000b00506be49243amr4117396edq.15.1682684739187; 
 Fri, 28 Apr 2023 05:25:39 -0700 (PDT)
Received: from [172.23.4.26] ([31.221.30.162])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a05640214c700b004fa380a14e7sm9102383edx.77.2023.04.28.05.25.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 05:25:38 -0700 (PDT)
Message-ID: <87d16bb4-178a-2583-5338-d9e9674da6e9@linaro.org>
Date: Fri, 28 Apr 2023 13:25:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
 <20230411-topic-straitlagoon_mdss-v2-7-5def73f50980@linaro.org>
 <k25jg7cez2kimpxr4ztbdzjr2adq6a2vjknyvfe5frxujtogfg@vhfdyt45unv6>
 <b3fajcbkfxqy4bxzjezrugbetpbjxdskarr3fhtn2unhqv2srj@y2o3wfd4v7dz>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <b3fajcbkfxqy4bxzjezrugbetpbjxdskarr3fhtn2unhqv2srj@y2o3wfd4v7dz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 07/13] drm/msm/dpu: Add SM6350 support
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
Cc: freedreno@lists.freedesktop.org, iommu@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Joerg Roedel <joro@8bytes.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On 4/27/23 16:48, Marijn Suijten wrote:
> On 2023-04-27 17:37:42, Marijn Suijten wrote:
>> On 2023-04-21 00:31:16, Konrad Dybcio wrote:
>>> Add SM6350 support to the DPU1 driver to enable display output.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> After addressing the comments from Dmitry (CURSOR0->DMA1 and
>> CURSOR1->DMA2), this is:
>>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>>
>> See below for some nits.
> Actually found one glaring issue that might explain why INTF TE wasn't
> working for you the other day!

[...]


>>> +	.vbif = sm6350_vbif,
>>> +	.reg_dma_count = 1,
>>> +	.dma_cfg = &sm8250_regdma,
>>> +	.perf = &sm6350_perf_data,
>>> +	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
>>> +		     BIT(MDP_SSPP_TOP0_INTR2) | \
>>> +		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>> +		     BIT(MDP_INTF0_INTR) | \
>>> +		     BIT(MDP_INTF1_INTR)
> For completeness I should've pointed out that you're missing
> MDP_INTF1_TEAR_INTR here, likely resulting in INTF TE not working.
>
> - Marijn

<annoyed noises>

so it might have been this.. I'll retest, thanks!


Konrad

>
> <snip>
