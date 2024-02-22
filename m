Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8497885F456
	for <lists+freedreno@lfdr.de>; Thu, 22 Feb 2024 10:28:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5F410E8D5;
	Thu, 22 Feb 2024 09:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jAgV3Gqm";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C166910E8D5
 for <freedreno@lists.freedesktop.org>; Thu, 22 Feb 2024 09:28:23 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2d243797703so46712301fa.3
 for <freedreno@lists.freedesktop.org>; Thu, 22 Feb 2024 01:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708594101; x=1709198901; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=afxYQISKwoDQxjr1GUcN5bUK+FSZJNALOlRyIMUtSrs=;
 b=jAgV3GqmO4CGMLUghvCuzdHoMcaOmRfID0zwrWlIgfoKCOrYuHJhQP/e4lHaMwf8on
 HJYZNIlGbur/ih98ZHKsKxq6ZHvEfuIbSEUCn4fzpcYSaIvqBYaO6REfMoDs1fEe7mVK
 HCluCgUEMJUoQdZNMgWnSC/2qnLdYWxjBHv8BcKN+AsnlZV3loncVDhl0kWbXfM/kskW
 GfRN8dd4g3JOr1tCIqU1d34fkkPa2j5oIfhFSN4kQxWuzeMkn6N9xG6TDtODXr7IHPN/
 oXAqG37hQShlo+MJpMSb6JOedzhW7mSqbQnZV2s9MeREW9xhXnzbP3lzwq5HvInifOcx
 owkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708594101; x=1709198901;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=afxYQISKwoDQxjr1GUcN5bUK+FSZJNALOlRyIMUtSrs=;
 b=Vpp5y/GZhFslgdT9PKjMJbQ36BFY4ByozXj4EqCFW9u2JRfLQiUkFoHGu5O0uZfgZp
 aYW1KhoQHF+a4gIk0zCQcRyJKVH0ZdiidMo7AylAflbQ7F348jI8jQDYQvFH/AXOykKO
 sUYcQKlIV6up4WKAx52zAkNL2D9dfpl6mqN90noC0JaFnB18IJixOPimZfLjtU7NJQgu
 rnjQ3TE/kqm1HK8+2taSWMfdZ07ivYFLtAKuTGSjRiMICIGTNEFh+Zh/5bZNdkAIjsFu
 NYgu+I3+W2GcVq6+9UBBqpDrMjAWL2va/sZ1BibOErOuvFqo37SFzOmdO2kIx+rVXBJy
 XlTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNOmOCayp1bRBQiouWgakcbted0HsE8U9UrJgnE0N5rCo1qXZ/xwoDy8NLY+d8tEZsAnWo8uaXbB2MHKYAyjJmNVn+0nsgnlupcQ9VMzba
X-Gm-Message-State: AOJu0YzlJdRlguhJ3g6AuJkr38L5HYLIGDgbBeRtGP54GhfPPGvH/TIm
 nvmKCZE6zxP3ZxLyuEvVEfxIJNPxTKyR/WxLmD+/Ccd4WOE7WK7q59hdDfJpszc=
X-Google-Smtp-Source: AGHT+IFGHclsIGY09YVRHR/OaiuAmuqnwj+msdJgmr6dF0K5qvEVB4HdflgvI1iN1TebKlQSDUpGnQ==
X-Received: by 2002:a2e:9dd1:0:b0:2d2:3a18:aa11 with SMTP id
 x17-20020a2e9dd1000000b002d23a18aa11mr7488948ljj.39.1708594101469; 
 Thu, 22 Feb 2024 01:28:21 -0800 (PST)
Received: from [87.246.222.6] (netpanel-87-246-222-6.pol.akademiki.lublin.pl.
 [87.246.222.6]) by smtp.gmail.com with ESMTPSA id
 j5-20020a2e8505000000b002d2556a6e08sm590077lji.30.2024.02.22.01.28.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 01:28:21 -0800 (PST)
Message-ID: <8fcb5816-2d59-4e27-ba68-8e0ed6e7d839@linaro.org>
Date: Thu, 22 Feb 2024 10:28:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] arm64: dts: qcom: sc7280: Enable MDP turbo mode
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-3-dc0964ef7d96@quicinc.com>
 <CAA8EJpo=9vhM+5YzaFxUoYRuEWQyrMS8wLNPSF3K=bN5JwWyDw@mail.gmail.com>
 <8313a7c3-3ace-4dee-ad27-8f51a06cd58c@linaro.org>
 <CAA8EJpqFj5nf8d_=Uoup7qg+nQrxqQU-DHbL3uSP138m9AcXLw@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpqFj5nf8d_=Uoup7qg+nQrxqQU-DHbL3uSP138m9AcXLw@mail.gmail.com>
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



On 2/22/24 10:04, Dmitry Baryshkov wrote:
> On Thu, 22 Feb 2024 at 10:56, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>>
>>
>> On 2/22/24 00:41, Dmitry Baryshkov wrote:
>>> On Thu, 22 Feb 2024 at 01:19, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>>>>
>>>> The max frequency listed in the DPU opp-table is 506MHz, this is not
>>>> sufficient to drive a 4k@60 display, resulting in constant underrun.
>>>>
>>>> Add the missing MDP_CLK turbo frequency of 608MHz to the opp-table to
>>>> fix this.
>>>
>>> I think we might want to keep this disabled for ChromeOS devices. Doug?
>>
>> ChromeOS devices don't get a special SoC
> 
> But they have the sc7280-chrome-common.dtsi, which might contain a
> corresponding /delete-node/ .

What does that change? The clock rates are bound to the
SoC and the effective values are limited by link-frequencies
or the panel driver.

Konrad
