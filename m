Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A4E6D7161
	for <lists+freedreno@lfdr.de>; Wed,  5 Apr 2023 02:37:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0713D10E7FF;
	Wed,  5 Apr 2023 00:37:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A13110E7E6
 for <freedreno@lists.freedesktop.org>; Wed,  5 Apr 2023 00:37:23 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id br6so44507946lfb.11
 for <freedreno@lists.freedesktop.org>; Tue, 04 Apr 2023 17:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680655041;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pnFy/mc3jjx4iHEWDYd4GHdbJCwwk5KKTntX8Ov8D+8=;
 b=YvxkDs5PG0gD2K0wdqmsnrrRw8bpd32plagXwN4qLpDRETmCzDe2Q6LgjWkaHbMa42
 2mUT8x2AggDFJ/Xmyxza17vyqUEBMyX3SpS3DXy6nNtqhqbjtq37cl1eTucVnggbgz+U
 N71JT8RbCC6QTvNQ6eAVgt/HIukKsU+90dMNv8vbgjFYLDpkfHeZqoUOxv1nXdWy7meF
 M4o8CHEh/CXIsdtvfsB2cEuQe2g43VApclRQIdhTEzMUaloOyvrOJAt9JTAjwnagjnt7
 NzvJEQ8sx3tDgUUaw2Qmk9Wypom/+1Z/MPyqSXX0zHysa0gR4R6t3BoKh/xwACyFdLW+
 4s2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680655041;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pnFy/mc3jjx4iHEWDYd4GHdbJCwwk5KKTntX8Ov8D+8=;
 b=6U67E3n4+Vtc6I2zNNEaltsjrcu140dKn0b8AIcFgBeausYcAEYj5Ey0ZNCFMzB0yr
 mk+07iY31MV9bz9soAU69gV/MLLmbNeWaeT8EpqAE6whx/KCn70LpWXvt/RhWmbdoZ3v
 ZQDfvo5hg4P9npZP0BflcNvc1Ypd+XdpX2dRCDck7PCdZHHmHaP/Iu6cYuCzn/Mmo+ce
 pHgS0EdapKWUTpHb3MddbTE6Oo3/bcNgqExUaIMnCqedBHFrpvFKWxIwSGBwRUk6b5pl
 arfy57gr5ZoDvDbeAnXLWbGAIqp5o3g0e2ogCzvX/Zz/EAC/AyyfLLdyDerA4fhD5nDv
 XqvA==
X-Gm-Message-State: AAQBX9d3A6azzEg9mdA8pZmghQrLjuI9COJka9xEtM881kh8Tm1gIiA9
 7GbaDH7Rm4BwV5sFd/CkI0+Y6Q==
X-Google-Smtp-Source: AKy350bDZEw747lsQV0d3rorHivEdfSxopq154vTzY2wwLiW6OQzh8+JoHMaMvGn5m/Tdjmhvh6YMQ==
X-Received: by 2002:a05:6512:961:b0:4de:ca63:b2d2 with SMTP id
 v1-20020a056512096100b004deca63b2d2mr946380lft.26.1680655041499; 
 Tue, 04 Apr 2023 17:37:21 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u10-20020ac243ca000000b004e90dee5469sm2565760lfl.157.2023.04.04.17.37.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 17:37:21 -0700 (PDT)
Message-ID: <b00d0507-c492-7ad6-d253-cd218376fa5f@linaro.org>
Date: Wed, 5 Apr 2023 03:37:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
 <20230404130622.509628-4-dmitry.baryshkov@linaro.org>
 <8663b3e5-8745-50ca-670e-e286652202c6@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <8663b3e5-8745-50ca-670e-e286652202c6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v4 03/42] drm/msm/dpu: Allow variable
 INTF_BLK size
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 05/04/2023 01:30, Abhinav Kumar wrote:
> 
> 
> On 4/4/2023 6:05 AM, Dmitry Baryshkov wrote:
>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> These blocks are of variable length on different SoCs. Set the
>> correct values where I was able to retrieve it from downstream
>> DTs and leave the old defaults (0x280) otherwise.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> [DB: fixed some lengths, split the INTF changes away]
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Everything is fine except sm8250.
> 
> DPU | SoC      | INTF_DSI size
> 5.0 | sm8150   | 0x2bc
> 5.1 | sc8180x  | 0x2bc
> 6.0 | sm8250   | 0x2c0
> 6.2 | sc7180   | 0x2c0
> 6.3 | sm6115   | 0x2c0
> 6.5 | qcm2290  | 0x2c0
> 7.0 | sm8350   | 0x2c4
> 7.2 | sc7280   | 0x2c4
> 8.0 | sc8280xp | 0x300
> 8.1 | sm8450   | 0x300
> 9.0 | sm8550   | 0x300
> 
> Today sm8250 is using the same table as sm8150 but it needs 0x2c0 and 
> not 0x2bc.
> 
> We should de-duplicate it add a new one for sm8250?

This is done in patch 22. It makes no sense to play with the data until 
we are clear, which platform uses which instance.

-- 
With best wishes
Dmitry

