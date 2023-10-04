Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F99D7B7C13
	for <lists+freedreno@lfdr.de>; Wed,  4 Oct 2023 11:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BC010E0F0;
	Wed,  4 Oct 2023 09:27:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C744310E362
 for <freedreno@lists.freedesktop.org>; Wed,  4 Oct 2023 09:27:27 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-32799639a2aso1908352f8f.3
 for <freedreno@lists.freedesktop.org>; Wed, 04 Oct 2023 02:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696411646; x=1697016446; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AQWwY35qHhpEyqqvsyb/9Z5p3stIxyOj1T15ZqiCbz8=;
 b=YEVGWZfIca+OH/IKH23pmrDEKa15B0U+Ucx6O3Inj3UwPjr64khibgw65IFYW7C50y
 tLAw2fTRf8PpdOHRtnUlSYQKnxyPAXr53gRZzGSk8BW4dh4XXN4IqQckiAJLUVewFxqZ
 J3OeMkTSP+wyKjXHaVEy9PgF+3slFdfbZhnby/AxEqiyUEeZkNRrGdkuNDXD59ft8vJv
 af5qMD6bng1L/FzCtfNFJLMUJYs7zm0t31he9BMxb6jaWhj1Jxw6yljYAwMIkXmDRGvq
 x4aUZHSk9RVgHXB/R+IlnEb3JTjN7nDSjTVz/ZhbMPSBSADBTTjhMuA9qNU2r0X6GXkb
 X/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696411646; x=1697016446;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AQWwY35qHhpEyqqvsyb/9Z5p3stIxyOj1T15ZqiCbz8=;
 b=k36d774/PRA6NoluZamdFoAMwLeDlHMrj/j3pC4+nH+6p/OLcYrbIzooBGyAwfPzfp
 GiqK7Me8vEQpdQFa2v0wsR51v/6NSHE6TKU1RiyRdJ5fFLMBYRNo6gsXYMP5Z3T2er/J
 IxoZkl7pCCtPB49u/481oK8vfX2uRnMvlXCrJ5xytn0E3UxdYErltndOdoPjN07qB8hQ
 9S2h+DUYIxMPsHwm2zgG7YpDDWohXTTFujzJabBsfttucO/QC4ynRpcb4v8NBOfetfuv
 ctzuSo81PbgGD1NQLXY9TfFZnpwG3QFwKv4vPA4x9H2d/ck/oBzx2UZbqmSvIXEtMkPK
 S34w==
X-Gm-Message-State: AOJu0Yzu08cp9+mJiS1CzkghTqeT6n8yLjTHyBoDcEMG17dlj/rhDLMQ
 0UrGHm2nuqUAG0aLRyjolHL5XQ==
X-Google-Smtp-Source: AGHT+IHDGjJWuvF9ybIHG+gJMqgzkYqVEZwXvDym/uLQ5V/maejxNFygps5q3rl7zG8Fs1nDOmYDnw==
X-Received: by 2002:a5d:470a:0:b0:321:4ab6:9b28 with SMTP id
 y10-20020a5d470a000000b003214ab69b28mr1447071wrq.16.1696411646062; 
 Wed, 04 Oct 2023 02:27:26 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id
 p5-20020adfcc85000000b0031f300a4c26sm3517825wrj.93.2023.10.04.02.27.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Oct 2023 02:27:25 -0700 (PDT)
Message-ID: <f129633e-4df7-4984-a19e-c16e6c7c8f3f@linaro.org>
Date: Wed, 4 Oct 2023 10:27:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Taniya Das <quic_tdas@quicinc.com>
References: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
 <20231004003125.2289613-2-dmitry.baryshkov@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20231004003125.2289613-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH 1/2] clk: qcom: implement RCG2 'parked'
 clock support
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
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 04/10/2023 01:31, Dmitry Baryshkov wrote:
> clk_rcg2_shared_ops implements support for the case of the RCG which
> must not be completely turned off. However its design has one major
> drawback: it doesn't allow us to properly implement the is_enabled
> callback, which causes different kinds of misbehaviour from the CCF.
> 
> Follow the idea behind clk_regmap_phy_mux_ops and implement the new
> clk_rcg2_parked_ops. It also targets the clocks which must not be fully
> switched off (and shared most of the implementation with
> clk_rcg2_shared_ops). The major difference is that it requires that the
> parent map doesn't conain the safe (parked) clock source. Instead if the
> CFG_REG register points to the safe source, the clock is considered to
> be disabled.

Why not have a new bit in .flags ?

Instead of lying about the clock being off, mark the clock as "parked", 
or "safe parked" or whatever term we choose for it ?

I feel 'disabled' should mean disabled and 'enabled' should me enabled 
when I read a value from debugfs and if we are parking a clock it should 
have a clear means of being flagged as a clock that should be parked.

An example. I recently inherited some autogenerated code for camcc on 
sc8280xp.

One of the clocks is marked as CLK_IS_CRITICAL by the autogen code 
meaning "never switch off" but CLK_IS_CRITICAL stops the camcc driver 
from doing runtime pm_ops to power collapse.

The solution I have is to remove CLK_IS_CRITICAL and to hard-code in 
probe() the clock to always on.

But if we had a CLK_DISABLE_SAFE_PARK flag - then not just for rcg but 
for branch clocks we could differentiate away from hard-coded always on 
in probe...

?

---
bod
