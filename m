Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7470E56B112
	for <lists+freedreno@lfdr.de>; Fri,  8 Jul 2022 05:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82DE12B264;
	Fri,  8 Jul 2022 03:47:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5ADE12B268
 for <freedreno@lists.freedesktop.org>; Fri,  8 Jul 2022 03:47:47 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id bu42so14453064lfb.0
 for <freedreno@lists.freedesktop.org>; Thu, 07 Jul 2022 20:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BqnCXi3hFwX+gJLrgLBhrt7Qzd6TSa0MoJ61QYVzy4E=;
 b=RZ3Nk0ZROIPez1V5MMBryu6/7I8uXedhc6CeNeskxvfMC+l6AOmCzTxu0UXcyQE+WA
 hMwryQtgp+UcwA1qABUjq3ntw3q9LbOUwELgVnHeCVkFi8LTNBXG6mvbpoxfCwuwu2D1
 4FO7kcJLO8vy2hdPaJP5esItiGSysP0RdgtIemR/2NDpqsEUXfs8OCcW1zw8WzqiPONF
 VUvHidXWA9T4nOXzFtFibrkMB+ojfObaYVwBdOS83r9m8oyGO91wHj1I9sbiL+vc5KFb
 0Hqr+16h9qTBSQxsSS2m9HCCncsisED12QxGN5wq3vvL8JJF9bXgpRRz/5YY7WYgwDjZ
 BPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BqnCXi3hFwX+gJLrgLBhrt7Qzd6TSa0MoJ61QYVzy4E=;
 b=YFh+H0eTEcXWkml2ubLEjqqYeSusoJI4SYjPIEt31Ut4SLShdyJbRuii8TOuu2v+kk
 1b2dxWE7cq2sF6CjdtJWKzDI102/qCo+Qp2HwrmHEUxQtKzQuFAEXFL4vw5Fa8XXUrMQ
 O+4ruenhyscBsa2ag24+GnLUQQ+9nQFvH7GzV/DPtXaAzpu4kMCbEolMm/oJHN5Xgm1E
 y4Qob3At+L9BCLGEcfvZSBWyKcQ4sd0UlLuoI6Ysxhdc8/qOdgsfP+Oa0LixTcwiFr9G
 XkcF33VEkkV8N+9kkdZ4c+ed056FBfbTij/mGYVEXk/GWZv6Tbz8FVaCZMPzXa6HZcVK
 ujkQ==
X-Gm-Message-State: AJIora9MT03A23nnoogXpukfTRlix/fB7jWSauyq0Bh3TPWoF/PXkz+l
 mXGlaEiYuSR0O+QEHYE9QgP42LSJ+XtSnA==
X-Google-Smtp-Source: AGRyM1sKT8szMXfjnFBIEzhyqg49K4tUUgVw6UFCa270cKcbGYd7ZsszdH/U+2dGJ/fE2ZlA+H759g==
X-Received: by 2002:a05:6512:b96:b0:489:3a4:a267 with SMTP id
 b22-20020a0565120b9600b0048903a4a267mr944515lfv.18.1657252005333; 
 Thu, 07 Jul 2022 20:46:45 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 r25-20020ac25a59000000b0048355942defsm1892032lfn.249.2022.07.07.20.46.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jul 2022 20:46:44 -0700 (PDT)
Message-ID: <b8ee5a03-1168-d5ca-97fe-f82a9d7e453e@linaro.org>
Date: Fri, 8 Jul 2022 06:46:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
 <20220707213204.2605816-2-dmitry.baryshkov@linaro.org>
 <CAE-0n53zV2OjXxjJ_AwCDcAZvOY+BU0-xipxQkup3muHMRCPXA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n53zV2OjXxjJ_AwCDcAZvOY+BU0-xipxQkup3muHMRCPXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/9] dt-bindings: msm/dp: drop extra p1
 region
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/07/2022 04:28, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-07-07 14:31:56)
>> The p1 region was probably added by mistake, none of the DTS files
>> provides one (and the driver source code also doesn't use one). Drop it
>> now.
> 
> Yes, looks like the driver doesn't use it.
> 
>>
>> Fixes: 687825c402f1 ("dt-bindings: msm/dp: Change reg definition")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> index 94bc6e1b6451..d6bbe58ef9e8 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> @@ -29,7 +29,6 @@ properties:
>>         - description: aux register block
>>         - description: link register block
>>         - description: p0 register block
>> -      - description: p1 register block
> 
> The p1 registers exist on sc7180. They start where the example starts,
> at 0xae91400.

Do they exist on e.g. sc7280? In other words, should we add the region 
to the DTS? For now I'm going to mark it as optional.

-- 
With best wishes
Dmitry
