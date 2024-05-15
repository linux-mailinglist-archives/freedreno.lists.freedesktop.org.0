Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A51D08C618C
	for <lists+freedreno@lfdr.de>; Wed, 15 May 2024 09:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E02689343;
	Wed, 15 May 2024 07:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wE8wOWzU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C4F89343
 for <freedreno@lists.freedesktop.org>; Wed, 15 May 2024 07:22:42 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-420104e5336so23116145e9.1
 for <freedreno@lists.freedesktop.org>; Wed, 15 May 2024 00:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715757760; x=1716362560; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w838iTqcEdF/wb4Y5xIa/WPLb8ecXgpzd26gnDTPlSs=;
 b=wE8wOWzU9x6Z4LtcGlcPoJlrsg/Nr3FBmRg97zOUJ1sy9l9GdKtJDGkMzxG9GC6WlS
 GdNu5n2E7Cc06frCOYTxzmxsx1Ka6TcvLV/hoFTlcPVcjHOcRmzpIxMXMkAZxHmGegul
 xNBiOVJVs3tM117S9LX+aONqwHAXKaRNLvW7QjWgzpKW6hkNs1KiIULa6N682fFHp+Qt
 NwhAIIxqMdIRzrr6XQAPLG+t0Y2mw88jGx0UjtamecohAyhWqscdsD3pveVRpebxGojN
 Qru1KFrTi5JPZZ6zIv8PIy2k4yOSwGaBSRH2aTJO/RhwDaJoGUCDqecn6CEVWrkUG2iM
 FnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715757760; x=1716362560;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w838iTqcEdF/wb4Y5xIa/WPLb8ecXgpzd26gnDTPlSs=;
 b=lF2r3cdAiUcUev57esaV5aH9qiaEqJed26fQqqm/n3nHS8ocjLwjQY+PaRKP22SO74
 NyrRk2jqm66mAC7mhsinNEayu9w1ZIPkGPyeFgwUIiLBLKbVNQG13yMmH0NoYfewy4Ak
 AUWtRXRNrlC1vXTkJDdaZaZKSHcef3XUumQB6x6/UwloaffczP17jJKWbdtezsDMFzhj
 DiMlli2VjfPNqN06HlhQVlAHEiTfeHMTs+7sBf0IL6OP9eEqg89WXXmlnppt3YjsbCCZ
 2xCNQgSk28h6Z2a6IPW/mizJe/yfVAZLtLiMdTm72dar/3Je8FBzjqaaAWoN0rH0Atjw
 mQ4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUajQMs4I3mnnLTd/IlADtHnA9Av0HusO1Za63Wc/9yxi/IJpoyWLvMGo05opSPDpOoGq5g+eQy8l/Ap6gFIFljYaUA2AOmVz4uvWx88w6T
X-Gm-Message-State: AOJu0YxauNB6+AEY5RsM8wvBPT6+gQMHvzVUYLT2Z7oi/9FNxZx1ZI67
 2xaV6UL6LKKWG5osYj4JgZY4c7M/69dkrsHRWZiANuaJFCifR47bicyecfgYtfA=
X-Google-Smtp-Source: AGHT+IHRNvpzKANP6HmQMDSLC74SFWdzuu8uJteTxxXVhmOixHXfwakzFmM76TwcqtKAYC5rdjUpgw==
X-Received: by 2002:a05:600c:3548:b0:419:c9e1:70b8 with SMTP id
 5b1f17b1804b1-41feac51e2emr129937675e9.13.1715757760345; 
 Wed, 15 May 2024 00:22:40 -0700 (PDT)
Received: from [10.1.3.28] ([149.14.240.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502baacfd3sm15717366f8f.84.2024.05.15.00.22.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 00:22:40 -0700 (PDT)
Message-ID: <fb4b166e-2940-4b0a-9ea7-ac8c838ef5ca@linaro.org>
Date: Wed, 15 May 2024 08:22:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8998: enable adreno_smmu
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: MSM <linux-arm-msm@vger.kernel.org>, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
References: <1ba7031f-c97c-41f1-8cbc-d99f1e848e76@freebox.fr>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1ba7031f-c97c-41f1-8cbc-d99f1e848e76@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 14/05/2024 18:04, Marc Gonzalez wrote:
> Right now, GPU init fails:
> 
> [    2.756363] [drm:adreno_bind] Found GPU: 5.4.0.1
> [    2.767183] [drm:a5xx_gpu_init]
> [    2.767422] [drm:adreno_gpu_init] fast_rate=710000097, slow_rate=27000000
> [    3.003869] [drm:msm_gpu_init] ebi1_clk: fffffffffffffffe
> [    3.004002] adreno 5000000.gpu: supply vdd not found, using dummy regulator
> [    3.008463] [drm:msm_gpu_init] gpu_reg: ffff0000819e4000
> [    3.015105] adreno 5000000.gpu: supply vddcx not found, using dummy regulator
> [    3.020702] [drm:msm_gpu_init] gpu_cx: ffff0000819e4180
> [    3.028173] [drm:adreno_iommu_create_address_space]
> [    3.054552] [drm:msm_gpu_init] gpu->aspace=ffffffffffffffed
> [    3.058112] [drm:a5xx_destroy] 5.4.0.1
> [    3.065922] [drm:msm_gpu_cleanup] 5.4.0.1
> [    3.074237] msm_dpu c901000.display-controller: failed to load adreno gpu
> [    3.082412] msm_dpu c901000.display-controller: failed to bind 5000000.gpu (ops a3xx_ops): -19
> [    3.088342] msm_dpu c901000.display-controller: [drm:drm_managed_release] drmres release begin
> ...
> [    3.197694] [drm:drm_managed_release] drmres release end
> [    3.204009] msm_dpu c901000.display-controller: adev bind failed: -19
>

I agree with Marjin the log of the failure isn't required.

How about this as a commit log ?

"The GPU currently fails to initialise because the adreno_smmu node is 
missing. We require the adreno_smmu node to translate device virtual 
addresses properly.

Enable it now."

> 
> [    3.220381] msm_dpu c901000.display-controller: bound 5000000.gpu (ops a3xx_ops)
> [    3.235503] [drm:dpu_kms_hw_init:1053] dpu hardware revision:0x30000000

I'd drop that, we know the fix works.

> 
> Fixes: 87cd46d68aeac8 ("Configure Adreno GPU and related IOMMU")

Retain this though, its a legitimate fix the GPU won't work without this 
change.

Then add

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
