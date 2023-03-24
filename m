Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 425E46C85ED
	for <lists+freedreno@lfdr.de>; Fri, 24 Mar 2023 20:27:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 147A510EC5F;
	Fri, 24 Mar 2023 19:27:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F4E10EC5F
 for <freedreno@lists.freedesktop.org>; Fri, 24 Mar 2023 19:27:15 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id eg48so11822669edb.13
 for <freedreno@lists.freedesktop.org>; Fri, 24 Mar 2023 12:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679686034;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dqZs2i/FLy+ED4dLZjowRQFkaHxvBAh+o8hN0bmWyLI=;
 b=KVn8cXn6sXVrxXuf8nrF+qMJiC96QpfFwWzGi0AJOMIXNA1WbuNvCCIOwSHeyY7QuY
 2aGiXOkDBP1efMYKns1u4VjrdsX6UBZaVSVMGrcmOeB50NcFvurY90jzSuzriCWhmopr
 XyQ23MoNZT1HAnni3RE5Sk4UCeFIgfsZpRIdj6m1hDT3jjWaKajUB6dNoi4jitu/3SqA
 mdRpebq18inaSa6zisiVZksSO7XbFDvZ1r2H9Ci+c/CUKYM0RW95Go5QvZZg156S5X6S
 EAbyWkd6Sek4ooGqTwrfTJCkOUy1lbNh9i4uUG4maTTUI3jNi3t4MUI78wdKzQ3YtM8l
 nBOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679686034;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dqZs2i/FLy+ED4dLZjowRQFkaHxvBAh+o8hN0bmWyLI=;
 b=7vmAhocwR5Lxx+GjxZBQTVbUxg3OE6p+KbDLGBUo+TsZrF8ssZIk9fGgtnSlJ1OZ3O
 DVmmiHtJRUXEiAxRKdWXI78SQGmBci/ya7OZo9oeAPvXWSBjiFRlqQbTAg8+xwQPbQVU
 TPmsYz6pRRcqig1VU0W6WGr1kX+sELWMWoTue0p4WpZeMPTT4me4I3RX7zPNpK8qvRWy
 zlVOCtutFzYbrDUbsFUqsdHOw8Bru9ltiEHUKxsxVm/TlkELNzT9nBKdUsf1RgdcOASn
 Rv7SUyMCEMD8P1m4BbJzbAfTW6LWFjEaha/iaXpC7vUmhaovT1itt05ndpEBw7ZhoL6w
 r5pg==
X-Gm-Message-State: AO0yUKWlIStUczAQVl0P5u06qpddKxfDMSXZ8U6x0TUTKHs0lKuJDeJq
 gleeZFCwVMZMIndccdeDCZtSWg==
X-Google-Smtp-Source: AK7set9TEoYzluKH8HHNN0BPwpvbjgxekVvQlU++HyMqrJZpjHWj9ML3a63GwAtC8Qcp8LL/1FOyoQ==
X-Received: by 2002:a05:6402:a53:b0:4bf:b2b1:84d8 with SMTP id
 bt19-20020a0564020a5300b004bfb2b184d8mr10928336edb.19.1679686034296; 
 Fri, 24 Mar 2023 12:27:14 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:3027:fb0b:ae08:588?
 ([2a02:810d:15c0:828:3027:fb0b:ae08:588])
 by smtp.gmail.com with ESMTPSA id
 jj19-20020a170907985300b008c327bef167sm10682737ejc.7.2023.03.24.12.27.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 12:27:13 -0700 (PDT)
Message-ID: <fdd51d3d-a1fd-c3a9-c578-59a11c5213de@linaro.org>
Date: Fri, 24 Mar 2023 20:27:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-0-0ca1bea1a843@linaro.org>
 <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-2-0ca1bea1a843@linaro.org>
 <20230324174518.2arvdglqqixmxqcp@ripper>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230324174518.2arvdglqqixmxqcp@ripper>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 2/4] arm64: dts: qcom: sm8450: remove
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 24/03/2023 18:45, Bjorn Andersson wrote:
> On Fri, Mar 24, 2023 at 10:28:47AM +0100, Neil Armstrong wrote:
>> Fixes the following DT bindings check error:
> 
> Is that because idle-state-name and local-timer-stop should not be
> defined for domain-idle-states or are you just clearing out the
> dtbs_check warning?
> 
> According to cpu-capacity.txt local-timer-stop seems to have been a
> property relevant for clusters in the past, was this a mistake in the
> binding or did something change when this was moved to
> domain-idle-states?

I cannot find anything about local-timer-stop in cpu-capacity.txt. Where
do you see it?

Best regards,
Krzysztof

