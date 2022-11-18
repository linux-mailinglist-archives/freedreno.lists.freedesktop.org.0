Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE02D62F607
	for <lists+freedreno@lfdr.de>; Fri, 18 Nov 2022 14:30:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE17F10E73F;
	Fri, 18 Nov 2022 13:30:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA9010E73E
 for <freedreno@lists.freedesktop.org>; Fri, 18 Nov 2022 13:29:56 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 a11-20020a05600c2d4b00b003cf6f5fd9f1so4050954wmg.2
 for <freedreno@lists.freedesktop.org>; Fri, 18 Nov 2022 05:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HN8LVu2tBOU+OG4LnFinIFanAXLqtN8dB9g7K9KkfjU=;
 b=OG2Ckv2ZO0fmf4LFpZ1ezKwfBJtCEtj08HMol4o7P/Y/9Ta89WhfUr3KKSF/viNvCS
 Y2ZI5LjDOEBbGfVDg1BNP7WAozSBVCRJSPz0ubyYaaAeOrSEqRPWIv4HqA6hIhXRbyCs
 z3Q6LA5CQYLLyPVszidp2Cv0N6FhlbL9Am8OjFiludhX67cUsXWwjDY01oFyhvbFj9CT
 8qZGqZOOphmvobWLK2G61e5D/yCVnvjcEJKLmXM0HYkY3LOX2g0cjeFwC9R6BUgKV6Qf
 1v9OwBYOVyWeKLa1Mquh74I6yx3SLyhX9aN0PzZsw8wSUrtQxzhVIoWyoh86XMxaYAMu
 Gzsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HN8LVu2tBOU+OG4LnFinIFanAXLqtN8dB9g7K9KkfjU=;
 b=WCxrEstaM8LT7f/Hml7G+B5bfOzI5bmvGQj6x+wNzbhfFm5yAv/F32niFKdUkaFV7/
 rAsbKcto/bf42SAMAdXj2Cm5Wr0Ym/1W91pBDt/pu36HdIrK2X5otx0tAS3tYKv+G2+5
 JBdrSgyvWQ6rDMtZyAQabi2YHmefCmwPFUwScnX9jZY089SBVP3ll9ObzjTcAteshfrj
 UUBYCRaKUY/4Nib/l0FG8E/FAhdWeWf76Pg9JwloNrn2Pp4y1AQkkErZXYO79CrvS3yc
 ktp/npdnaCk1ZBPMHQj/SGKPSnhZ2Jcql2/j36S+CRLdKsIWR+Jhbdpa6w4RJuVeKKWD
 wZzQ==
X-Gm-Message-State: ANoB5plNxuzGrZTcU2joKED4yomDFrrJ3NZ2qTFv6vHacurddzK8SsPM
 8mCKW78KgKlRdmZu5J8goO5SeA==
X-Google-Smtp-Source: AA0mqf7i8dywQOhFfIFUfTreejp7KFR0nIu101KikdsXbMRrFt1RKBxdvI3qgRZVHoWm4mbMT54yiQ==
X-Received: by 2002:a05:600c:ac1:b0:3c6:d18b:304b with SMTP id
 c1-20020a05600c0ac100b003c6d18b304bmr8044158wmr.142.1668778195318; 
 Fri, 18 Nov 2022 05:29:55 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a056000014d00b0024165454262sm3607708wrx.11.2022.11.18.05.29.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 05:29:54 -0800 (PST)
Message-ID: <0993d2bd-c0f2-8139-8f02-84abe6b8ad8b@linaro.org>
Date: Fri, 18 Nov 2022 13:29:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
 <20221107235654.1769462-8-bryan.odonoghue@linaro.org>
 <aeb59d3c-34d0-f00a-bfc3-524cd03acb71@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <aeb59d3c-34d0-f00a-bfc3-524cd03acb71@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 07/18] dt-bindings: msm:
 dsi-controller-main: Add compatible strings for every current SoC
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 Loic Poulain <loic.poulain@linaro.org>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawn.guo@linaro.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/11/2022 12:46, Dmitry Baryshkov wrote:
> On 08/11/2022 02:56, Bryan O'Donoghue wrote:
>> Currently we do not differentiate between the various users of the
>> qcom,mdss-dsi-ctrl. The driver is flexible enough to operate from one
>> compatible string but, the hardware does have some significant 
>> differences
>> in the number of clocks.
>>
>> To facilitate documenting the clocks add the following compatible strings
>>
>> - qcom,mdss-dsi-ctrl-apq8064
> 
> Generic comment: I think we'd better follow the arm/qcom-soc.yaml and 
> use qcom,soc-something as compat string. This would leave us with 
> qcom,apq8064-dsi-ctrl
> 
> I'm not sure if we want to follow the qcm2290 approach and encode the 
> DSI ctrl revision here (6g vs v2).

For qcm2290 I'm thinking qcm2290-dsi-ctrl - without the 6g piece.

a) Nobody is using the compat at the moment
b) I'm not sure what - if any real information the silicon version
    number conveys here.

+ Loic, Shawn

---
bod

