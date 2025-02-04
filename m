Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8FEA2766E
	for <lists+freedreno@lfdr.de>; Tue,  4 Feb 2025 16:50:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878F210E6A8;
	Tue,  4 Feb 2025 15:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XneKPkTo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E28710E6A3
 for <freedreno@lists.freedesktop.org>; Tue,  4 Feb 2025 15:48:48 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-385db79aafbso290738f8f.1
 for <freedreno@lists.freedesktop.org>; Tue, 04 Feb 2025 07:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738684127; x=1739288927; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=gU8TkOLaJsHF42Jr0I2/13286opa6qB6pqpOwuEjyOo=;
 b=XneKPkToOK2PUuuNZ3JAQRxYhWnpiOyNBYsYdKHTZG4I/a9D6paJ9mrMld0yn8hZtR
 xl7YCctOSeyxCgeNbiBLqQQeMIciNAur4Ow17jDNDon5rfqm+0VUeE++wdnezKQHkB/c
 kPqhxbB1aYyIcj8pF9nqoP+Mjr5PDrhAozTcbmi8MtKkg9O6ezkZGvsslA3vPGqtGcJ3
 ZSZcs11oPcmB9R+Z3uhgefsxDzb6bi3qmP6kr2X8aGSoYKfP+KUUvMM5yFS6sJBQamtd
 Ki9eeuKfWJxg78LEafgcm40iSmffle1OQrJPF7N09cvzMDW4wMvBzPikTP/tJ4psacrM
 9yJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738684127; x=1739288927;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gU8TkOLaJsHF42Jr0I2/13286opa6qB6pqpOwuEjyOo=;
 b=EfJ5Kq6lAPUBLc2i5WbxCnSyIZQVR/yQoefKGh1QXQhIrXv6VnOs8tVhHjc1psjUYY
 Ua2pbH3K8o7IuM3hqhZoaWgizPA6ZQU0CFwS/hxSOaCNVxMU1jqo/wlIPpZ1FwQnZEFn
 7cQEHg7qLiaekezrKR0hSHLVO9Z5t772rVvj52mKBh9NAqyS1itPjuAP7c3B6GWsIzg2
 aLC1hkQduZN5zLzETykJn8mxbT3A0tytxgB+AT1Tv8JED3Ji4YPCMVl9IXSCUbL+SZ8K
 4dGyVCaDXmMUbGG6QXXySmH8sjrsmS6mGBcN9ozmdP5Xja+KSsCArKqDFS8mWjjicS0/
 1how==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZKu24mVlJ4ed/I3YL1v4SzpuCbcFDnWXesqzqLTSbk5wgllbw9gVPjjgrqWKGqjA7YyMIEVsRASg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEUYAzb1D1M2yPuHg6Az4q8sIU8JbluNXthkA3OTCPM0uMeWDi
 O0i4VNYuWSrWsdfov2+1HLKXcHSrrJGqmKCXVOONv1SmIcWZKe5RN8PSo4Mrnms=
X-Gm-Gg: ASbGncslP5www4xwTxoUakd6dlEp4CumuzjKLm7fIlFY8oXMJ5JXGqiRAPVfBuFAsDH
 oKkwRS5VczkhYXWKkiUN5Mbs1HyUxFfB35nelZixUZzHwbKGMxSPbFS8qStNFVCtqGrUYS6rOeL
 07ZbP/t989sE2SE3tYJNt0qRUe9G8iCWSfMApfaLNchbTxizEzwddPdwB1TpEWh36qWg+yR7sqY
 FkkKoU/Y7HlyeXtv1E/+rNF5nLcaaSe2gFpnpX7EXylcsQWNq8LWQ53WZ8QmF+YaUfUkpvC4C2I
 u0FyqdU0inaKh+K36UvzIniXRr69KWi8mLI=
X-Google-Smtp-Source: AGHT+IGveqdu2JixWRUhsUl00uKh2Op+HVMUCQsDgohpXpwMPeoN8qwI4EsRYKpKAjwTtITIgvSlug==
X-Received: by 2002:a5d:584a:0:b0:38c:1496:2d44 with SMTP id
 ffacd0b85a97d-38c5a4d87b9mr6729049f8f.6.1738684125187; 
 Tue, 04 Feb 2025 07:48:45 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23e6a4dsm192729835e9.21.2025.02.04.07.48.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 07:48:44 -0800 (PST)
Message-ID: <30518b66-71c5-43ed-a770-e3ecbfdb1f58@linaro.org>
Date: Tue, 4 Feb 2025 16:48:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01]
 bitfields and simplify saving
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-4-862b136c5d22@linaro.org>
 <hhedgfdbqpbv7s6iegtoztmznqdqn7bdumik7dm5xtsfsj6uwp@3jz422fhchcn>
 <ef1f91e4-aec4-41e8-b842-52d3f91e82bb@linaro.org>
 <dtenajcyhcrejiiadcfmpz3h3cg3l2rkio55625umao6gl3q3k@asy2ecfz37ps>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <dtenajcyhcrejiiadcfmpz3h3cg3l2rkio55625umao6gl3q3k@asy2ecfz37ps>
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

On 04/02/2025 15:28, Dmitry Baryshkov wrote:
>>>>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 31 ++++++++++++----------
>>>>  .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  | 12 +++++++--
>>>>  2 files changed, 27 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>>> index 926fd8e3330b2cdfc69d1e0e5d3930abae77b7d8..b61e75a01e1b69f33548ff0adefc5c92980a15d7 100644
>>>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>>> @@ -67,8 +67,7 @@ struct dsi_pll_config {
>>>>  
>>>>  struct pll_7nm_cached_state {
>>>>  	unsigned long vco_rate;
>>>> -	u8 bit_clk_div;
>>>> -	u8 pix_clk_div;
>>>> +	u8 clk_div;
>>>>  	u8 pll_out_div;
>>>>  	u8 pll_mux;
>>>>  };
>>>> @@ -401,12 +400,12 @@ static void dsi_pll_cmn_clk_cfg1_update(struct dsi_pll_7nm *pll, u32 mask,
>>>>  
>>>>  static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
>>>>  {
>>>> -	dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
>>>> +	dsi_pll_cmn_clk_cfg1_update(pll, DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN, 0);
>>>>  }
>>>>  
>>>>  static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
>>>>  {
>>>> -	u32 cfg_1 = BIT(5) | BIT(4);
>>>> +	u32 cfg_1 = DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN | DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN_SEL;
>>>>  
>>>>  	writel(0x04, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_3);
>>>>  	dsi_pll_cmn_clk_cfg1_update(pll, cfg_1, cfg_1);
>>>> @@ -572,15 +571,17 @@ static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
>>>>  	cached->pll_out_div &= 0x3;
>>>>  
>>>>  	cmn_clk_cfg0 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
>>>> -	cached->bit_clk_div = cmn_clk_cfg0 & 0xf;
>>>> -	cached->pix_clk_div = (cmn_clk_cfg0 & 0xf0) >> 4;
>>>> +	cached->clk_div = cmn_clk_cfg0 & (DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__MASK |
>>>> +					  DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4__MASK);
>>>
>>> Could you rather store these two fields separately by using FIELD_GET?
>>
>> So make the code again more complicated? OK.
> 
> It was already there, bit_clk_div and pix_clk_div.


Yes and I (believe) simplified it. It is subjective, so I don't mind
going back to two fields, as you asked.

Best regards,
Krzysztof
