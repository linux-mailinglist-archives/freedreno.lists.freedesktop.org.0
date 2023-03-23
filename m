Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE4B6C65B4
	for <lists+freedreno@lfdr.de>; Thu, 23 Mar 2023 11:51:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5657C10EA7B;
	Thu, 23 Mar 2023 10:51:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D65EA10EA70
 for <freedreno@lists.freedesktop.org>; Thu, 23 Mar 2023 10:51:37 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id ew6so21546625edb.7
 for <freedreno@lists.freedesktop.org>; Thu, 23 Mar 2023 03:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679568696;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=djtaE/vDO9AshUny6zh2qbJYY96TbEf/QaEy8Z7dISo=;
 b=SRYru7BV5FR7ta8lPrUIXW94emfeyPMudi/J/EMfbkFNYjvxPuuuCtIgIjTFppzt5J
 h47JOMbYqxJEhXHDRhoDQZOi5LsuHzIa9xib2kjIEWEwzFDcQiinKOl6DhVxf2dlkUqk
 cl2UiDVdkqTl3m4NONc0sYA4ZkpCf3KLz92O44Roa8oBCtRKjQKzHRwmd32u4h3jxMZF
 AL44QCRcffkl+m18R1qNfbTMqd/NtCF04/yWSwKsF+ndBVZy1CHlUBeAccJmObux8Ql/
 C91+8cHII8qrIIHnAA2R7Fmhi+ArI40unMmf8XVfCT/GB92O3kRBWbPhZFI54L18KOGb
 YwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679568696;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=djtaE/vDO9AshUny6zh2qbJYY96TbEf/QaEy8Z7dISo=;
 b=E+7XAL3cXnWyEvJnkB7fY1dLpSgqqZ2yGnY6Nv6TkMUQlS/k5BEl851KgD2f6mGlkr
 JLxWNLn/VfdvYvgg7Q2VybZlfW35JzbYpJsmNTTvk/RcYU24eTfC+TIOKjssci4ltR6o
 NPxAFaEWCHGuT3wic90ozHXVNufxaGCoyqfksN/Ng3J+QyGjNlr15pH5wdxOKvEuhEFF
 QLlZFt+/7+mhu11x2KrPiSo0sKw806otkWUQi3uG/Oane2GaVaEdDzWJqknh8FuWAFxN
 oGJGM6IgZfE5vblRNCrNL3GPUlHGG74PGn4Oi5gpPMHOEpsnCiuHNxuOCRnIKE0KvcG1
 SNWQ==
X-Gm-Message-State: AAQBX9eLj9isjOPLd6PYLHlGChMwdpIylnxyDP14ySKkyOA9mHGY+GVy
 HJmQ/WQvm9MTbdLr5BTleiCsiP+8Rwh1VduCf1c=
X-Google-Smtp-Source: AKy350Yzr6pk7HTLyfZ07cA6Ohdh8rwBb3p/inRxryeP80LTyCA3RyLKk49pTM05/lxqV+Y/sTkmKw==
X-Received: by 2002:aa7:d38f:0:b0:502:1299:5fa5 with SMTP id
 x15-20020aa7d38f000000b0050212995fa5mr1174047edq.16.1679568696138; 
 Thu, 23 Mar 2023 03:51:36 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a665:ed1e:3966:c991?
 ([2a02:810d:15c0:828:a665:ed1e:3966:c991])
 by smtp.gmail.com with ESMTPSA id
 q30-20020a50aa9e000000b004fadc041e13sm8999033edc.42.2023.03.23.03.51.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 03:51:35 -0700 (PDT)
Message-ID: <0bcad5cc-112f-386c-b70e-146530ac4898@linaro.org>
Date: Thu, 23 Mar 2023 11:51:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Bart Van Assche <bvanassche@acm.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
 <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-4-3ead1e418fe4@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-4-3ead1e418fe4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 4/8] arm64: dts: qcom: sm8450: remove
 invalid properties in cluster-sleep nodes
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
Cc: Rob Herring <robh@kernel.org>, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzk@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 23/03/2023 11:25, Neil Armstrong wrote:
> Fixes the following DT bindings check error:
> domain-idle-states: cluster-sleep-0: 'idle-state-name', 'local-timer-stop' do not match any of the regexes:
> 'pinctrl-[0-9]+'
> domain-idle-states: cluster-sleep-1: 'idle-state-name', 'local-timer-stop' do not match any of the regexes:
> 'pinctrl-[0-9]+'

I don't get from the commit msg why these properties are not correct
here. The idle states allow them, so maybe something is missing in the
binding? At least commit msg should explain this.

Best regards,
Krzysztof

