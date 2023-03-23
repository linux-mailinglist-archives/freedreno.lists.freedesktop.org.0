Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1266C693E
	for <lists+freedreno@lfdr.de>; Thu, 23 Mar 2023 14:13:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CDB10E097;
	Thu, 23 Mar 2023 13:13:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CEF610E097
 for <freedreno@lists.freedesktop.org>; Thu, 23 Mar 2023 13:13:05 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id l37so515026wms.2
 for <freedreno@lists.freedesktop.org>; Thu, 23 Mar 2023 06:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679577183;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=juhp9OBUsPann54i4wUeJoNbrt/MgaPH7KWeZa71+xE=;
 b=jNzxhh+kAMOJUnJAJiZlm8CqqNjJB84FeneV/bsFBFNkwsv5ewzKW99RwM/+yo+dWD
 O5M7PoVQ+HmSm0Fp7TUSM4WUmaCD/M9RquYD/SYCw+xZ3DF85LQBhq6DffN9QsAzPSiz
 +SXGeH8zvrCymDFBZtcQHoWfSF5M0GCyh2Yk8xunJZ3oUEoj5sOSwvola6tWm9KPAExx
 wppVx0YrDi/ArfaymWwbqT75kwaGW9d3Z9Vn8zQPyMtL5GoGAHwYOoySoOmjx3hdS1VP
 UJk4RORne+G8ZcUQqELIerD3KaGhrzSzjw76MslFrWinmJXZ+hINTJ/vsGD5S7LbjbfF
 VXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679577183;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=juhp9OBUsPann54i4wUeJoNbrt/MgaPH7KWeZa71+xE=;
 b=K3i+2E8kISU2ua+Az29xmOrSCYA/02QDma+QeyWcvFRrgs5aaCPqEiuLOI6X3IQeIi
 MDvFo2EOiJVY2ovbhBQoPahKQ8LBeqg3z1GC9ojeF9Sso2MgffV74ytK4d8TliScwTwh
 P5HS0C0+jpOTpcc928pvG4IY7pPDIV5T0Lyc1HZDZXps9jeU95TfuQIDRrycouQ1zT3L
 OvEFr8mQOs4ySRsEH0D8FNk3lWOsCk3x3M1OwHfZy2IVtoxgt4SenTVgD8jNUWNXGFSO
 1iz8DwUbr0ivFiq7C+iT0hsESJGXnvNKW1n6FHD/u/BL8G5r3bG6StJYm//9bY71uA8E
 7qIw==
X-Gm-Message-State: AO0yUKXVwLizLGdMFYUmkBoLyRqsIJMSVtndTnRPVc0OU8td4wNl2c5B
 sfQHIpvNglWaphu/VuJ0tZR1tw==
X-Google-Smtp-Source: AK7set9AOlKnA/7JArDu4NZy/tacv+1Jc1By+62lRGQ2qjTDOfxTCEOmbDcLbYSrwaVOaWhWVZPiKA==
X-Received: by 2002:a1c:f709:0:b0:3ed:c763:2765 with SMTP id
 v9-20020a1cf709000000b003edc7632765mr2405501wmh.7.1679577183642; 
 Thu, 23 Mar 2023 06:13:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e25a:65de:379a:3899?
 ([2a01:e0a:982:cbb0:e25a:65de:379a:3899])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a05600c470400b003ee8ab8d6cfsm1825918wmo.21.2023.03.23.06.13.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 06:13:03 -0700 (PDT)
Message-ID: <006bf3bf-ab9a-4a08-3ba5-fa23ff4ea05a@linaro.org>
Date: Thu, 23 Mar 2023 14:13:00 +0100
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
 <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-6-3ead1e418fe4@linaro.org>
 <35e3aa8b-ccff-25fa-42da-d8934ef366c6@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <35e3aa8b-ccff-25fa-42da-d8934ef366c6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 6/8] arm64: dts: qcom: sm8450: remove
 invalid npl clock in vamacro node
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

On 23/03/2023 11:47, Krzysztof Kozlowski wrote:
> On 23/03/2023 11:25, Neil Armstrong wrote:
>> Fixes the following DT bindings check error:
>> codec@33f0000: clocks: [[137, 57, 1], [137, 102, 1], [137, 103, 1], [137, 70, 1]] is too long
>> codec@33f0000: clock-names: 'oneOf' conditional failed, one must be fixed:
>> 	        ['mclk', 'macro', 'dcodec', 'npl'] is too long
>>
>> The implementation was checked and this npl clock isn't used for the VA macro.
>>
> 
> This does not look correct. DTS looks good, you miss some patches in
> your tree.

I'm based on today's linux-next, while the other lpass macros uses the npl clock,
the lpass vamacro bindings doesn't document the npl clock.

And I found no fixes whatsover to add the npl clock to bindings.

Neil

> 
> Best regards,
> Krzysztof
> 

