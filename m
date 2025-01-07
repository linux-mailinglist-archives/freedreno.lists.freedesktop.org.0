Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38924A037C9
	for <lists+freedreno@lfdr.de>; Tue,  7 Jan 2025 07:17:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 167F110E2EF;
	Tue,  7 Jan 2025 06:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WfDmuvmC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D3510E2EF
 for <freedreno@lists.freedesktop.org>; Tue,  7 Jan 2025 06:17:01 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-436246b1f9bso24046555e9.1
 for <freedreno@lists.freedesktop.org>; Mon, 06 Jan 2025 22:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736230560; x=1736835360; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=yb0B47kPggnzrOfjZ59CM6EgcdP+n2GDl92NqEA4xvY=;
 b=WfDmuvmCHa3fvCeDbGcGFZRT60tizk1/ygEaCSS2bXF0qo/FDzlMyOtm0xkrclvCpr
 QdegrIseqNL5XBrb9744O1CMVUEoCSTKquC0yVQvri0pzVCJm5ZFVkCKp2QysrTqBzOO
 8XBZ2tznyiGYC0LmZnIAcFzCArLTVyPXef1vwINb3FIqqlFka8LIt3VZMPNu1TEelv6X
 tI6rPOF1xCwIlidbgm29nIiiM/Vf2X88bTbJnsAFNluN7gkIfMw5dfXPyLvCZ7aR/dmx
 PJbEzBv+e/PDwEN27qHLxGVqBm6B/n7rG1GIsLlGbADX8LoNLqkTg+pk8cOyIHrGQV9z
 ADYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736230560; x=1736835360;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yb0B47kPggnzrOfjZ59CM6EgcdP+n2GDl92NqEA4xvY=;
 b=qZojvEh3TlLUDcdj7Q1XT8Ay5SXK0Q9naeH9iUaQh2Xh2+NjkHVniofhqrVa0rnX/5
 8fDU7v83ZQMn70oA1SLpkC+5YHn1gMU+kU4psxQoPKEs56gN2W8eIgr8CJ5BpsX6anWO
 eouvH+SwUlqqeHZJMFZxapQv7X0NRggEBRxwqs1c3py5jXxdWc5jda5Lar1l7BgxXOR+
 H6AMnldjL4Bbaj9jyLr8y0MUFu9I0mI0thOAo5h/O4FAoPH7xMqK7TcMI1QAuiaG3A/z
 QhDE2n/ibo+xXgOpK8GhG19mgVl62p/4p5tn+BlY/0xdox1qVYY+h7pquw8Jr3n8O7o+
 Yf4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDzyrnuhOll7R9b6Rtf1cqoUS2MTTExpAIwysYBWeagAnitqDbacuOaEOpFU9R3JkEuAWg7DUMDyc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMK9eOIsTQPTuisk+/ZRcpbPt0quM+aUFO30w2PX7mbcR1bFXe
 ntuAqrEvnyxZq8SsZlfTsvxHFyZ1jf4a0iEECsw22MXV/NMe7mbMKoXpL+RK8weAQnEltIOuHPT
 o
X-Gm-Gg: ASbGnctAj8pJ6VR5Y7xhlgeWoO+Y/4439lgs1x0Br7pNtG5WPkYETTf6YMWNdXzq8dy
 +QkxN5R11O/VsIPt4CUcwbFSGhPPbttr6/P9pNLl08VoS8Fg50bI2+nbvPjM1rYdtBGoxCCZk+/
 3bRIGm9/aqQDANHGawv8PlD+Cr8pakL6vrUybV4h76man2+xGoh54kudwMR+fyhUZmnUfylFEYs
 wHD8RYqxc2kT2ntfVEqgc+lrNd6XvifokWi2RmjSwVLzZ9gbG2LPoRNxXFKrnmkdSKB+9uNb8iA
X-Google-Smtp-Source: AGHT+IHflGZ6wpbNOLFCb7xKGfIKtq49c/6aFYql6+evnAZ8chYTm0kIjQZZbtMFKgE47/vzLpzFaA==
X-Received: by 2002:a05:600c:5103:b0:431:4983:e8fe with SMTP id
 5b1f17b1804b1-43668b93cb8mr211738975e9.9.1736230087411; 
 Mon, 06 Jan 2025 22:08:07 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436612008casm589326135e9.14.2025.01.06.22.08.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 22:08:05 -0800 (PST)
Message-ID: <18f3b5c9-1729-448d-9257-5cb82e675542@linaro.org>
Date: Tue, 7 Jan 2025 07:08:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/msm/dsi: Simplify with dev_err_probe()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
 <20250106-drm-msm-cleanups-v1-2-271ff1c00795@linaro.org>
 <5edcfc62-ee70-48c2-a24a-642a39f83767@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <5edcfc62-ee70-48c2-a24a-642a39f83767@quicinc.com>
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

On 07/01/2025 03:56, Abhinav Kumar wrote:
> 
> 
> On 1/6/2025 12:49 AM, Krzysztof Kozlowski wrote:
>> dsi_clk_init() and msm_dsi_host_init() are called only from platform
> 
> dsi_get_config() as well? OR you didnt want to explicitly mention that 
> since its called from msm_dsi_host_init().
> 

As well, but I forgot to mention it.

Best regards,
Krzysztof
