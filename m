Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD94AD8E76
	for <lists+freedreno@lfdr.de>; Fri, 13 Jun 2025 16:02:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFAE910E9D2;
	Fri, 13 Jun 2025 14:02:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JBCe5/Uo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7EDE10E9D2
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jun 2025 14:02:37 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4530e6f4db4so2122545e9.2
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jun 2025 07:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749823356; x=1750428156; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=BR72CRYf/tZsZyJh78bV+xCODP+r79zbrQtaAW04L5w=;
 b=JBCe5/UomoLSinTXOnRk2vc5P8xNetUKJc1VfKW4jvI0fVLpC1IRHDxyNW0q3uGS2H
 aIlcTOqrxTd5IEbZoCUEvsNxCT81262zs1rvFxtpqPotf2TaVeSn/v3LCx4xJ5IwG0e9
 H52F9PDyndsx3mNypomL00d8cMwzL8CFRVTOyVoQCefhYiZtHBHHbVIBww2G71zzcY1E
 QW2RqHg9QoKG75iTs06x+r+4Ke9MrxQkcOe+csCrIyWV9DgNAsBBOufe/sS2Q48CAHs8
 nRY0tRfWm3bgyMVckLpKoJ/3gkL9XDiJqgBRfgxLp7/uApQXhJKERBSOXlWnUeTFP2EH
 OSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749823356; x=1750428156;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BR72CRYf/tZsZyJh78bV+xCODP+r79zbrQtaAW04L5w=;
 b=Cknc+T1x66WDaDOoiUPb0Fvle7oEf5xPgegdG8MvQX0T4HF8wWz0MdPsmO4+L2luny
 QLj7YuUox/FgsDFikzMVK1jIuUp2krALJVZLN983X/ci4KTu5vBWhqPTSgY9mzseSUUi
 dUO2E+SBCvJiVOzDE04yXZB1Qm7wU8Fc1GCCztRg9bSVS4vDf13STJBzEVhfkMdRVaPz
 1aXbNe3RE3g2YHg9WQcQRMAYlDuyLEhmAGr/MyPrA3w217BHe4YhDPKUBfgl1pcbPXaf
 gBe7okKzkdors8XAi8zM5j48RTm3Q8jbZcoD0i53Z9gQUROo1qSLdgHgO+ybzUhC5tj7
 x97Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG5+h23kzZw/en6DAF2mL8/hDK/qhZV91b0c5WHnpIIgF/I1Hk4QAxf5odYpQYvieAxmPIegEKSA8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRbTm9WXxKjPEot1mt4n46LBS7ayKApZ3/y0FfG2sUERrsO2Re
 5qaixdQZWt5YxetI0iEt0SgQqbjtDfhqs2M4rvbq74jSW8UQytEDYk37u88MsSjaYJc=
X-Gm-Gg: ASbGncuoMEfe8KcH2Zi++BWJjwQA79gsmA1dCffSh6L/o9ow+kOOzLxftVdd9k7iLFm
 vNuFVZvbCzc7sQOKSPJNPiOsCf7Mj8sIqID5MOPmjVmWEqBWCnq37xcrMTmT4B0emq8OYA9yl05
 iBsgQx3GYC3zteHLMHOkCvvoJE0y9js5vU8TQt6wuOv9jFmWJqjETwlmrwqdgOcT9+Ji0kYqtay
 bwyzA/hXJUHwTIVIppxnub5S57V5yCf4SUiEgdYLs2GNiVSlUp4DW342gWOoFcg/Ya0AZvoVi5P
 58PMFrm66DbEQpIJ43ul3UdPdTmn5i1nehaLG0f9X3McAKsjWXcETgLzuHFJFAclRBgenduEw+d
 9O0aTd+4=
X-Google-Smtp-Source: AGHT+IFFm+p6A3s3c92JdQ/PjxjL4ne6Il5/xS3QixUN9WcusvUDpgO0/WQqRAfuIGx27EXI54dhVA==
X-Received: by 2002:a05:600c:858d:b0:439:a30f:2e49 with SMTP id
 5b1f17b1804b1-45334ad8375mr9408615e9.5.1749823354507; 
 Fri, 13 Jun 2025 07:02:34 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568a612d8sm2464566f8f.24.2025.06.13.07.02.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jun 2025 07:02:33 -0700 (PDT)
Message-ID: <dbcfcb3c-0cba-45f6-aaed-b79494d96cde@linaro.org>
Date: Fri, 13 Jun 2025 16:02:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/17] drm/msm/dsi/phy: Fix reading zero as PLL rates
 when unprepared
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>, Srinivas Kandagatla <srini@kernel.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-8-ee633e3ddbff@linaro.org>
 <n5djafe2bm4cofoa3z4urfogchhfacybzou763nelttgfspo25@bywfd5febe6g>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <n5djafe2bm4cofoa3z4urfogchhfacybzou763nelttgfspo25@bywfd5febe6g>
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

On 13/06/2025 15:55, Dmitry Baryshkov wrote:
>>  
>> @@ -361,24 +373,47 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
>>  
>>  static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
>>  {
>> +	unsigned long flags;
>>  	u32 data;
>>  
>> +	spin_lock_irqsave(&pll->pll_enable_lock, flags);
>> +	--pll->pll_enable_cnt;
>> +	if (pll->pll_enable_cnt < 0) {
>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>> +		DRM_DEV_ERROR_RATELIMITED(&pll->phy->pdev->dev,
>> +					  "bug: imbalance in disabling PLL bias\n");
>> +		return;
>> +	} else if (pll->pll_enable_cnt > 0) {
>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>> +		return;
>> +	} /* else: == 0 */
>> +
>>  	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>  	data &= ~DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>>  	writel(0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
>>  	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>> +	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>  	ndelay(250);
> 
> What is this ndelay protecting? Is is to let the hardware to wind down
> correctly? I'm worried about dsi_pll_disable_pll_bias() beng followed up
> by dsi_pll_enable_pll_bias() in another thread, which would mean that
> corresponding writes to the REG_DSI_7nm_PHY_CMN_CTRL_0 can come up
> without any delay between them.
> 

Great question, but why do you ask me? The code was there already and
MSM DRM drivers are not something I know and could provide context about.


Best regards,
Krzysztof
