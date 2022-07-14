Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EA9574A56
	for <lists+freedreno@lfdr.de>; Thu, 14 Jul 2022 12:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D1BA3F35;
	Thu, 14 Jul 2022 10:15:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12208A3F37
 for <freedreno@lists.freedesktop.org>; Thu, 14 Jul 2022 10:15:33 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id t1so1998600lft.8
 for <freedreno@lists.freedesktop.org>; Thu, 14 Jul 2022 03:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kZy7eak2tgSmF/ML1yqzjltWCPwtqthXqM78zNDO+OI=;
 b=eMSSra1OPQfu7qXpz6L3saU1JxVj07p/HHh/qXvdSMrvPrpI9qzcyriFOtEcrm9xsq
 hetCcxkb3c2U8abIkPdW++76prqun/Vd24FxpWfWpCdXT3DP1bPcplIo2B3ULIAFXyN0
 RJBbYXxuWRYFJej6+xS6qXa9hkMoclJM97KGsgSY6KXBlG2c6tiB3t23uDbTCEfQeGJt
 2bj5bT6Xs4/8eGC5UjkA2K5J6iOIYjIA1PW/4r1LCIRP3fxMmFj1HOkDxOoyKib9R6ot
 tLm8NLit0aZHhCsBUusz9vadcvFZJBDpI6Fdc2ijF4xNhGgYBpjQ84xeYuUXehixkcx+
 IXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kZy7eak2tgSmF/ML1yqzjltWCPwtqthXqM78zNDO+OI=;
 b=ChhjsXOjUX4pxupxnweDtsB6PnyZa8kpLih1p0oRSR5LI9891iL72q+DMAmEWbu36Z
 Nv3XnudZtemzt0Pwsbf7HIt/BNeh+LZti8rQYznF+dB7rRouK3U6Rs5OBWuOrk3RZmv/
 T+kworJJBksUOKOhXUXARa27tY63yUVNT221yDGGwf4LD/utxGVnRxM0NAjrJnARYWR5
 fdE61MZnSp1jnc270FkKE+MED2Zews5fqKRAKJkyGAfCSGnUAEogS5kXaWNCvemqafzY
 i9yNK+E0s+rsdcIG8FEPP2tmyX096rO4eWe9/GHP8d5Rc5Jsf1BttKOl22mRNRlNMhOr
 exzw==
X-Gm-Message-State: AJIora/NWD0PdZbeHuD5lHtGKCQlphFH3005qb1Rhy7SPKT9eplrN0MF
 bH5QtcnqLWiLgLGx4vpEhA2eUA==
X-Google-Smtp-Source: AGRyM1v1V9ZiyZF7bonIiq2DwpF3Map16xUjhG7MRlmoFvEpyTCgjb4sm6OM4dfGd+xpxCSIJBPwUA==
X-Received: by 2002:a05:6512:1399:b0:486:2ae5:be71 with SMTP id
 p25-20020a056512139900b004862ae5be71mr4640937lfa.246.1657793731321; 
 Thu, 14 Jul 2022 03:15:31 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a2e808f000000b0025a968f4ffesm205854ljg.19.2022.07.14.03.15.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 03:15:30 -0700 (PDT)
Message-ID: <35cbf2d1-f851-fb6b-309a-8d7499b4abb3@linaro.org>
Date: Thu, 14 Jul 2022 13:15:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-8-dmitry.baryshkov@linaro.org>
 <bd84ef20-e6e1-74e5-5681-7aa273d5255c@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <bd84ef20-e6e1-74e5-5681-7aa273d5255c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 7/9] dt-bindings: msm/dp: mark vdda
 supplies as deprecated
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
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 14/07/2022 12:38, Krzysztof Kozlowski wrote:
> On 10/07/2022 10:41, Dmitry Baryshkov wrote:
>> The commit fa384dd8b9b8 ("drm/msm/dp: delete vdda regulator related
>> functions from eDP/DP controller") removed support for VDDA supplies
> 
> No such commit exists in next. Do not reference unpublished commits. If
> this is your tree, be sure that it is in next.

Excuse me. It might have changed at some point. I will update the patch 
description in the next revision. The commit in question is 7516351bebc1 
("drm/msm/dp: delete vdda regulator related functions from eDP/DP 
controller")

> 
>> from the DP controller driver. These supplies are now handled by the eDP
>> or QMP PHYs. Mark these properties as deprecated and drop them from the
>> example.
> 
> Right now I cannot judge whether this is correct or not. I don't know
> what's in that commit, but in general driver implementation changes do
> not warrant changes in the binding.

The vdda supplies were initially made a part of DP controller binding, 
however lately they were moved to be a part of eDP/DP PHY binding (as 
this better reflects the hardware). DP driver dropped support for these 
supplies too. Thus I wanted to mark these supplies as deprecated to 
discourage using them in the DTS files.


-- 
With best wishes
Dmitry
