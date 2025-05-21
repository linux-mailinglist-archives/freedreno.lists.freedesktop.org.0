Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A982ABEBB3
	for <lists+freedreno@lfdr.de>; Wed, 21 May 2025 08:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C404910E10A;
	Wed, 21 May 2025 06:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Cz1fGQXd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCEDC10E10A
 for <freedreno@lists.freedesktop.org>; Wed, 21 May 2025 06:09:18 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-442e9c7cf0eso3612905e9.2
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 23:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747807757; x=1748412557; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ZEUbi3Q05HXkxlWwhqCkqBQxo/YQlWetyK+KN6/4iB4=;
 b=Cz1fGQXdl6qr9ev8S9ThSAiYKjTAGcweBa8D2mzW5VaLwHcxgPKKoSLjEHJzfGEWTZ
 HNmvEv9eUXmgu/yPTREvhNj5T8rflLuLD9F+lehPhShycfJdbsFEu6k6mH0T+IzTXM9C
 SIdyCrm5PSru1+r2MakJpFBSfq6lUNu/wRjjvdvrR5OE0Ot7/dhkju2OVJk/TP3mABr4
 MF8hUMIkON1IDtGYx+4DZoW7buSR5+rUAEhi2CRtuf97e1orsO5YrCa1o9p9d25Q/2Hf
 KDJyTGVfatdjZHXDiWfBFUP57+Aa0eHtvu1qxYR1NHjbjVC5UyGHHfnyfg4QMDVaMBjO
 9dQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747807757; x=1748412557;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZEUbi3Q05HXkxlWwhqCkqBQxo/YQlWetyK+KN6/4iB4=;
 b=u8v3nbeCfJOSwx0ne1tAhoaRmXM31xdTmKAWPGW7AGozQs8XXXkUngupJgJ/MBpulx
 ex6B8cKM98DvAO0Vtf/fhkiwWENE2GxR0/Ofb1TqkzS6PB+tptYXPhlnyEttrfy5vPAy
 HAO/I41DcQltydwjje67yTzYhf5O3EU4i4vcQpwoTmkq0iSzlg+Pd6chakL+jNQOIX2b
 Kqbw+yQQ7lDy23tANHuXrUNwM0aHetdn4/l3aiSUGg8EmDbgBh+XVB8WoqjSm+OLm84y
 x9KfTarIJJ8b7DKPROrN5DoJid+ARGIjn+1e1jltcqUnEKCKs2SxA3xjToyBRE/V0qkG
 ha4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0kQjzIVJHyRa23F00ulwroy4pd2bY8O+9mLbS404fQrdZ5HkCKln0ONmJv5Ljl/yPlhX5+9jxZ84=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsZ7MHC/OxfgIjMVuXWyVymsfsu0woKpz0EhzlaFjRuPppspIp
 kaQ4llZmWGSIEzxglPOwOI3ws66zeowAtG7abZhU8E7qkJIeY8Gr77QqeV3xM8zllxE=
X-Gm-Gg: ASbGncuxq42WN+cjvTn7uG1rcDo2NCYyPA/mJcTyJ1QCEwJ0PeLHorLPi9D/iHZPSzE
 ycrYRKNYmtmWYWTNVQAPcZVZ/4qPJzJaAA6Jecog0XFfq61kmW4tr7j7uyUK8QLBQeMPe8cWR2v
 Vdvr5cCQP95bAQHagyrTVtw2waL0QaDKe8b0JmP6SUYOEfeezAxMpsBjbnctPctE1oGymFbEoYB
 29YCafUrapS7Sa+hTeEHDsvKYROg7FPEk6z2qOjP0cV6E0eDNXhfvDf7WM+kC8EY5T+AmvqPvgK
 fYnj9TTrsOdLD5CdeGuXoBmyf5NniV2+bykZ4tuv2ZSlIjQxPBFu8lh4+ZuD9Fi+D/WAduL217L
 N15de0g==
X-Google-Smtp-Source: AGHT+IF+1B2jv5MQsNyTXXrHvnGqFgZWabS6OWBTZnJ1wkFfzcgIBoXkTS8I6Fg4OWkmktx/hyVW4g==
X-Received: by 2002:a05:600c:a41:b0:441:c5ee:cdb4 with SMTP id
 5b1f17b1804b1-442fd66ded5mr61457855e9.4.1747807756996; 
 Tue, 20 May 2025 23:09:16 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f1ef01besm55860565e9.10.2025.05.20.23.09.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 23:09:16 -0700 (PDT)
Message-ID: <87af51dd-a35c-460a-af4c-813427cdaf84@linaro.org>
Date: Wed, 21 May 2025 08:09:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dsi/dsi_phy_10nm: Fix missing initial VCO rate
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250520111325.92352-2-krzysztof.kozlowski@linaro.org>
 <3ywacd4x23zadvwikw4hdprgbgxxdmbcar3lyayy4ezmd5lcyw@3h2oosmbk6yb>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <3ywacd4x23zadvwikw4hdprgbgxxdmbcar3lyayy4ezmd5lcyw@3h2oosmbk6yb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 20/05/2025 22:06, Dmitry Baryshkov wrote:
> On Tue, May 20, 2025 at 01:13:26PM +0200, Krzysztof Kozlowski wrote:
>> Driver unconditionally saves current state on first init in
>> dsi_pll_10nm_init(), but does not save the VCO rate, only some of the
>> divider registers.  The state is then restored during probe/enable via
>> msm_dsi_phy_enable() -> msm_dsi_phy_pll_restore_state() ->
>> dsi_10nm_pll_restore_state().
>>
>> Restoring calls dsi_pll_10nm_vco_set_rate() with
>> pll_10nm->vco_current_rate=0, which basically overwrites existing rate of
>> VCO and messes with clock hierarchy, by setting frequency to 0 to clock
>> tree.  This makes anyway little sense - VCO rate was not saved, so
>> should not be restored.
>>
>> If PLL was not configured configure it to minimum rate to avoid glitches
>> and configuring entire in clock hierarchy to 0 Hz.
>>
>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Link: https://lore.kernel.org/r/sz4kbwy5nwsebgf64ia7uq4ee7wbsa5uy3xmlqwcstsbntzcov@ew3dcyjdzmi2/
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Fixes?

Probably:
Fixes: a4ccc37693a2 ("drm/msm/dsi_pll_10nm: restore VCO rate during
restore_state")

But CC stable would not be appropriate, since this was never reproduced
on this PHY/hardware and we only guess a visible issue being fixed here.


Best regards,
Krzysztof
