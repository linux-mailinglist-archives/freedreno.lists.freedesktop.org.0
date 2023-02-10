Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCFD6921CB
	for <lists+freedreno@lfdr.de>; Fri, 10 Feb 2023 16:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887CC10E18C;
	Fri, 10 Feb 2023 15:18:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF0F10E254
 for <freedreno@lists.freedesktop.org>; Fri, 10 Feb 2023 15:18:07 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id r3so4933784edq.13
 for <freedreno@lists.freedesktop.org>; Fri, 10 Feb 2023 07:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=02mVlAKKl5whYqnP1fhbv+HUroK8DSxLT6KvxX0YmEU=;
 b=d80SCFeeuXdzM2sc0gNhKexwi2OYpwvllAanBCtNQFUACaIKCwzcTKOlDp5lYf6Y14
 9WlT9bOY6ck+OsK9+bCwE60vkbmunWSO574f8WHJ1DqQ1vMXo8CaF2gY5N6v09fqENiC
 GNbW4T/3/0y33GHxS+cTuQgMJ/vp+xjDMmASxek7TaDBgADIXZk9M+6mlryf7wel7PJZ
 5TrwR9vpEmiNb/teZs7Rjz7uwYqVuouZWPsTRD8U/NivqPjlvXDE8KW6Z/wmNbvTobvm
 9bxRSX7pACBLWedpPQ6HxhEu45bBq3hRPibIpdUm3vGbJ4P7nHhbHxBEBXIjDmsgeTbL
 ms4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=02mVlAKKl5whYqnP1fhbv+HUroK8DSxLT6KvxX0YmEU=;
 b=h75oluUKBWmjfFQPuLA/FLQERACABRjNwgTnGaZqc7grkhm0+BiDO4iR1j1serF1EG
 I60DsREAIBXV09k9Azh9SUkfb03owrpT3eQNyLMQo/hRmxuqNMLWMo9FqLptY4yQ/gAK
 0ehnJxU0qNPMDza+a8I+j8t3uRUTZYrhYTsYoQ6IPLe+ugBzHimY/BdVp33q39y1uYva
 OSkjRh+IEYRxp1y1gYHVe+05JC4IQo9keYRqCiPvTgOg4C5m/PTDc0ujpK/k/VAjqieD
 9D5eJlHav7RI6LN6rH1hsQIVmdt2S/c+Xx39JduHLNoogh5tTOC3EFmutpV0aMBV1RLI
 ivxQ==
X-Gm-Message-State: AO0yUKWL8Vzb+kGZBAupY5rBc+1dTrWpHyUEp/qL8ad3bRXDyAonHJw4
 8hiM2uiuqf2YNTwf2WQ4IbhOdw==
X-Google-Smtp-Source: AK7set/iNkirutTUnbExRgezrYds0gZeyGu3ozG/ELlq3e0A3uK/LBqaiqxq4aGczsJNKJv1AGSCrQ==
X-Received: by 2002:a50:ce41:0:b0:4ab:4b85:a69f with SMTP id
 k1-20020a50ce41000000b004ab4b85a69fmr2491931edj.1.1676042286235; 
 Fri, 10 Feb 2023 07:18:06 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a50c252000000b0049148f6461dsm2321942edf.65.2023.02.10.07.18.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 07:18:05 -0800 (PST)
Message-ID: <44fa957a-b47d-d913-917c-a614884d62ca@linaro.org>
Date: Fri, 10 Feb 2023 17:18:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v3-0-636ef9e99932@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v3-3-636ef9e99932@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v3-3-636ef9e99932@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 3/5] arm64: dts: qcom: sm8350: add dp
 controller
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/02/2023 16:44, Neil Armstrong wrote:
> Add the Display Port controller subnode to the MDSS node.
> 
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #SM8350-HDK
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8350.dtsi | 79 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 79 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

