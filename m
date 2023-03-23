Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 008286C694B
	for <lists+freedreno@lfdr.de>; Thu, 23 Mar 2023 14:14:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B233D10E8CC;
	Thu, 23 Mar 2023 13:14:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5433710E8CC
 for <freedreno@lists.freedesktop.org>; Thu, 23 Mar 2023 13:14:16 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id l37so517244wms.2
 for <freedreno@lists.freedesktop.org>; Thu, 23 Mar 2023 06:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679577255;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=3ozbiTjZMTtZdhbfQMuafqLt5s0mYlr+S+oK5ku6wPM=;
 b=lZT4yTsZI86TtOEPmavRCOef4D3RW1/nuZBrTzMbE98FuAzEIyWdjLDegnf6jrxZA+
 ONjkVPvzSXDq88fS+6uvpspwpVLfj7god+2EuT5bsj6nKTpu7cbyXlXJQdX9OEDOdepB
 syE9WfGnMbNFde06i6F3ixx2V0DbrfH+dZHIlaf49AJsawg656MXcwsT9BMUjL7hnxki
 gXw5ww2yJmINWWYwei7sFMPdJnSkkzgYORHmb7bz7OJYWX/DNcZBkv5lehSjkSuTnHo6
 M4nzoMLmTmrsmqOVP7mWrYBY8IrxinwiliUyVl6MADd+4Ty2C/ig8WfYV8E0zh0IvO90
 /UBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679577255;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3ozbiTjZMTtZdhbfQMuafqLt5s0mYlr+S+oK5ku6wPM=;
 b=vpVTbw5HOFLsBwtr9nvM6e8yO6Uo4fjjwUQt9ONY42N0FWJQXg1Yra8dNV0cOG+zcj
 6qdV4FPJUTbVzFts458nWXI06kslLYuq54tNVZy9w2draH7HYh+4xSvsN1SMfaVDuw1C
 Py86oqziSV+PLLOUUqoihyNOVXlBxO/63nv3dIKF6JA6zt95GBhcdXkLy5XUzwyrocUj
 QAYPX+Zj27RkvqzGpmcllq8Y+vvSpoLyoXEZVRjkCdlbLiE8G/sWvJlZttEfYCDDgSlT
 3vaFcvjkSUWN06bRvGORk39Z9xMzh/x1Nm4Rg1n3yzp0uhxDeVLSo/woYKyQGpylec2l
 ByWA==
X-Gm-Message-State: AO0yUKU6BNyx1HaYjSNg4s8C/IgJrB8qthefG3IkLM263lZPO/wVb3wn
 QkGrCN9bslWkTKZZyTPO95YDqw==
X-Google-Smtp-Source: AK7set9KH31TZh7tubmQPEjPzDWKzuzoSIfSWMARsbW8oRdJ+eBdyMTtKXVVNWxugh2iobMdSN2lww==
X-Received: by 2002:a05:600c:a0c:b0:3ee:90fa:aedf with SMTP id
 z12-20020a05600c0a0c00b003ee90faaedfmr1139192wmp.11.1679577254774; 
 Thu, 23 Mar 2023 06:14:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e25a:65de:379a:3899?
 ([2a01:e0a:982:cbb0:e25a:65de:379a:3899])
 by smtp.gmail.com with ESMTPSA id
 g20-20020a05600c4ed400b003edc4788fa0sm1992204wmq.2.2023.03.23.06.14.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 06:14:14 -0700 (PDT)
Message-ID: <215efc34-68bf-53d7-2191-a5132c3d2198@linaro.org>
Date: Thu, 23 Mar 2023 14:14:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
 <0bcad5cc-112f-386c-b70e-146530ac4898@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <0bcad5cc-112f-386c-b70e-146530ac4898@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Cc: Rob Herring <robh@kernel.org>, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzk@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 23/03/2023 11:51, Krzysztof Kozlowski wrote:
> On 23/03/2023 11:25, Neil Armstrong wrote:
>> Fixes the following DT bindings check error:
>> domain-idle-states: cluster-sleep-0: 'idle-state-name', 'local-timer-stop' do not match any of the regexes:
>> 'pinctrl-[0-9]+'
>> domain-idle-states: cluster-sleep-1: 'idle-state-name', 'local-timer-stop' do not match any of the regexes:
>> 'pinctrl-[0-9]+'
> 
> I don't get from the commit msg why these properties are not correct
> here. The idle states allow them, so maybe something is missing in the
> binding? At least commit msg should explain this.

The domain-idle-states bindings doesn't document those 2 properties, so perhaps it's missing ?

Neil

> 
> Best regards,
> Krzysztof
> 

