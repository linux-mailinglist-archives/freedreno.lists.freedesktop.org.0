Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C867D889C
	for <lists+freedreno@lfdr.de>; Thu, 26 Oct 2023 20:57:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D72E10E867;
	Thu, 26 Oct 2023 18:57:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D4A10E867
 for <freedreno@lists.freedesktop.org>; Thu, 26 Oct 2023 18:57:40 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-507b18cf2e1so1760866e87.3
 for <freedreno@lists.freedesktop.org>; Thu, 26 Oct 2023 11:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698346658; x=1698951458; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AMg17KxuWBUiUv6A0i2QEQW2s5Z+lVHigup08bOBCUE=;
 b=sphVyJ14mCKDKlMVd9Xwkv/JO2ScQA9xAbaX3fT9WG/WIk+EcIKUfp9eB3l606Lv8D
 SspfMp1F68W4qe5ZvdJPlu3LXC450wUp1aLG7PqHpwdN+y0t8ho59IZkI+Pm0GwhRr9K
 Y6ASYnC0Sfwi+mIJgNIDP5oNcLCUfIDvDO2mOFcCDMb5yfOOZkWX/fQiqZhnY6F38Gna
 J1Pz8t/hFFwbVtgiLYX4gIw57E/Mexy5wV1J1loOMG5QC6hQ9saVtXOXYSSEvMi7AOiz
 Cdek3JRM7ma1LG+u6wXwOwgIN/vL9vHgCPjVRfXwvXKHV1z/Dpmlcn9UPXG8x/0hXx6W
 jR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698346658; x=1698951458;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AMg17KxuWBUiUv6A0i2QEQW2s5Z+lVHigup08bOBCUE=;
 b=gSm5oTY/duzPOVGTKH0Ak4t2dHDCO/tK9KSPRNLXVYnLgOX8J75PQrAK6rIp8q9OJp
 MvR6BcQuTbH3PEA3ZWbBR/YJBcaGA974AzGrcBWP1uSE3zLIebiMS3ajhZiKSOIMJKtF
 JZVxSvEcQmG632gYIVze/fOu60XO6j2Q+NydFC4/LRk6f55LhZ6+xwiFK37VuyMg9fc3
 5J6wKK3Wm0ZoPeoVJwRB0OBFrTzC+UOj7Gq7r/r7MkqwTi/4ei9DYrGsZYWuQJzZ3Gbz
 TWpRW3mFv1sTt2y/JL8uoCsM3wvSVdC1S1B7oBUFD8t1xZPuk8fhQCD11dEGaefTs6yv
 Jrcg==
X-Gm-Message-State: AOJu0YwEjZuGKwIneT/fxni7yFYWRQlq/jqz4sfQHuDG+bjxcd3U2IwK
 BvYKqfLP2lUIS/myabZs5zhnfg==
X-Google-Smtp-Source: AGHT+IHuQWDn7OUiBtFrH0a1lZxUUGtlxrPanh02+ZPMGloHbEwjjoFN8dI3E0sKr4JffKJU2N8AoQ==
X-Received: by 2002:a05:6512:2256:b0:503:1aae:eca0 with SMTP id
 i22-20020a056512225600b005031aaeeca0mr175782lfu.44.1698346658359; 
 Thu, 26 Oct 2023 11:57:38 -0700 (PDT)
Received: from [172.30.205.8] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 q18-20020a194312000000b0050797cbfa82sm3122255lfa.17.2023.10.26.11.57.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Oct 2023 11:57:37 -0700 (PDT)
Message-ID: <ed18292b-efe8-48fc-8696-79e51acf8ab4@linaro.org>
Date: Thu, 26 Oct 2023 20:57:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Taniya Das <quic_tdas@quicinc.com>
References: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
 <20231004003125.2289613-2-dmitry.baryshkov@linaro.org>
 <abc36c33-bfd9-4451-80ab-a631492044de@linaro.org>
In-Reply-To: <abc36c33-bfd9-4451-80ab-a631492044de@linaro.org>
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



On 10/7/23 01:43, Konrad Dybcio wrote:
> On 4.10.2023 02:31, Dmitry Baryshkov wrote:
>> clk_rcg2_shared_ops implements support for the case of the RCG which
>> must not be completely turned off. However its design has one major
>> drawback: it doesn't allow us to properly implement the is_enabled
>> callback, which causes different kinds of misbehaviour from the CCF.
>>
>> Follow the idea behind clk_regmap_phy_mux_ops and implement the new
>> clk_rcg2_parked_ops. It also targets the clocks which must not be fully
>> switched off (and shared most of the implementation with
>> clk_rcg2_shared_ops). The major difference is that it requires that the
>> parent map doesn't conain the safe (parked) clock source. Instead if the
>> CFG_REG register points to the safe source, the clock is considered to
>> be disabled.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> Would the intention here be to replace all usages of _shared_?
?

Konrad
