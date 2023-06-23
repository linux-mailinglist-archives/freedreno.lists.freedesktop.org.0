Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1CE73ADE7
	for <lists+freedreno@lfdr.de>; Fri, 23 Jun 2023 02:41:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A693410E5C8;
	Fri, 23 Jun 2023 00:41:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015ED10E5C8
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jun 2023 00:41:49 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f955850e30so1552912e87.1
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jun 2023 17:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687480908; x=1690072908;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FnBlHYwMZ9lJep8bxCghDkQQW2uToj06bE3oV1fX/ZA=;
 b=EC5a6JU+v7Zbpm70kJjSs2tawiTV4zC1FWSIGTv0q4pPIyNEF4J46LsGErGMoe4k//
 eq9t2hdhkWWSR0jUXfxoOYQ7ca3VtFktY0RV9IUgzpF5eNIg0R0UsClKV5TcNu3gj7/p
 MGMs+8i2SmhYCo9qbK7Fgj4pMR2Pq1z/Cx/oCcftj95rtSttLAyPZhtmko7ez/TWCyMI
 kHY6+0AjnOsjDpyJDvfLxa9ISRJwlgUPHFi30u3WtEIrx+2W2gyHkIVkqAtoVELTeh6D
 siylrR8sLVRB0ZkXlGxY8XGLqfK//rhHEoCrKBv1xZr49+f/uGFAYxwhhfwUi2jU9/Z7
 i6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687480908; x=1690072908;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FnBlHYwMZ9lJep8bxCghDkQQW2uToj06bE3oV1fX/ZA=;
 b=AGNvzvyi8iRv+Cqvnf5asUShyIlyNgrAZiv2tDD0lMrwO+1VMuP228aSWk3ei28Khh
 uPBCfRNqR1bYOLOBHt0hMuUHnJVaTsGS0EbggA5kf9Ha/s6TFLj60PK7OId4gOopfmo7
 Tl0iL4TPD6/JBMlnEomRDwY18D2E1L1JkKwz36JJ6Dghpy9/Fuu5LPVJfTa+/IJb1BIe
 5ZAg07ba9kzeSH/swELHWz8suQDnY0CiCd26+Vjqx/UXIdV45y/2sxo/GZQYVEef6Kib
 pcVx5y+dD1CfMdaOdmKmK6hUMXdECFYpkUmga+40O9nqhpZmSG1mGHg7Pc6X5VfZKbTc
 7PSQ==
X-Gm-Message-State: AC+VfDw323+6Dt56aQBbrj3Xn92UoSzj9E1BSnu0YGLStTiCIF1BB3ZZ
 QkKONq/1YzYwdVk9iXk7AXBZfw==
X-Google-Smtp-Source: ACHHUZ6YvyXVM4V18WeBDx3J5dkaKy+DyzMZeq7Hohys+X32z96d0MrmRQwCYRYslyfv0Cfubs2Klg==
X-Received: by 2002:a05:6512:1590:b0:4f8:70d2:672c with SMTP id
 bp16-20020a056512159000b004f870d2672cmr4529327lfb.17.1687480907934; 
 Thu, 22 Jun 2023 17:41:47 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 eo15-20020a056512480f00b004f875356ab8sm1278005lfb.153.2023.06.22.17.41.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 17:41:47 -0700 (PDT)
Message-ID: <81866240-260b-0891-36ea-34676674c9b3@linaro.org>
Date: Fri, 23 Jun 2023 03:41:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
 <20230525-add-widebus-support-v1-3-c7069f2efca1@quicinc.com>
 <ky7sgsaohak2pcdf6pbhedfyrwk4ea7y3ekfqlw7rn6cpk4rhe@rjuhb23n37oz>
 <cf968ab4-e4c4-dcad-f7d1-4edff6f08147@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <cf968ab4-e4c4-dcad-f7d1-4edff6f08147@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 3/3] drm/msm/dsi: Enable DATABUS_WIDEN for
 DSI command mode
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 23/06/2023 03:01, Abhinav Kumar wrote:
> 
> 
> On 6/14/2023 2:56 AM, Marijn Suijten wrote:
>> On 2023-06-13 18:57:13, Jessica Zhang wrote:
>>> DSI 6G v2.5.x+ supports a data-bus widen mode that allows DSI to send
>>> 48 bits of compressed data per pclk instead of 24.
>>>
>>> For all chipsets that support this mode, enable it whenever DSC is
>>> enabled as recommend by the hardware programming guide.
>>>
>>> Only enable this for command mode as we are currently unable to validate
>>> it for video mode.
>>>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>
>>> Note: The dsi.xml.h changes were generated using the headergen2 
>>> script in
>>> envytools [1], but the changes to the copyright and rules-ng-ng 
>>> source file
>>> paths were dropped.
>>>
>>> [1] https://github.com/freedreno/envytools/
>>
>> More interesting would be a link to the Mesa MR upstreaming this
>> bitfield to dsi.xml [2] (which I have not found on my own yet).
>>
>> [2]: 
>> https://gitlab.freedesktop.org/mesa/mesa/-/blame/main/src/freedreno/registers/dsi/dsi.xml
>>
> 
> Thats because we havent submitted a MR yet for this on mesa.
> 
> Generally, our team does not have legal permissions yet for mesa MRs 
> other than mesa drm because we got permissions for the modetest.
> 
> Rob/Dmitry, can one of you pls help with the corresponding mesa MR for 
> this?
> 
> The xml file change was autogenerated so this patch can go in.

Ack, I'll handle it.


-- 
With best wishes
Dmitry

