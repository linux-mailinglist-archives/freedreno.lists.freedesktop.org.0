Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7A185F530
	for <lists+freedreno@lfdr.de>; Thu, 22 Feb 2024 11:02:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6294610E7DE;
	Thu, 22 Feb 2024 10:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oK9DNBp4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC39B10E883
 for <freedreno@lists.freedesktop.org>; Thu, 22 Feb 2024 10:02:53 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5129e5b8cecso7016518e87.3
 for <freedreno@lists.freedesktop.org>; Thu, 22 Feb 2024 02:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708596172; x=1709200972; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZmFzE5KLUhVYgCITZetTHO3yyNj9Jv9D+xMMJe9LX/c=;
 b=oK9DNBp4NgJfpHLddF2CSTerVqjIWo3nSPSXLFgYwGX9ydbCqZ3fUk7Xg/CDD/bPjK
 roi73F/08jTu0f8PAM3FXRmjsjjFP4/6hZBCUXd6xYYFhfdQUkTeBTGiIyTYeCjsmZrr
 EL2Sj+7mMrdtQblWZf49EcoDahqDNNAqL3h6g2jjOrJVEHh/vFaWZovxPFOUSdBmPYou
 RLdwRFe+hsJZbbprvBe1KJ77UsPp3DqBHOE+DjPDX6SQkOcg6KnYUPQMYbmZ+KMnfHR8
 sUdJsG7EOS6t8ii8c1eiCxl3CtjWUvqbE14kteGMliEOrayhZ4vk5BI2ukgYmIzRVmLz
 d28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708596172; x=1709200972;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZmFzE5KLUhVYgCITZetTHO3yyNj9Jv9D+xMMJe9LX/c=;
 b=fzkrb93xbj+5UbQHUtG2fKWpBlyfCpvQPub1rat3sWOXxaS6GbizgZdNkiBH7M8Scr
 rED/l2DApzZpvwlQTJb7PSLFLsjHU4ebn1CXfwVQSjkceR8U/UZTf673DAi/at9MP16U
 H63Bk5XsRc5Nhn9o7HFVKppMN0LE+wE/eTgnpFy0k272XBUuAtGLIQB8Xius+KNwA418
 Pa1FKMrpwt197XFRxDCZSbEKZpMOfvQMY2yQg2Gi3mAOcq9QXXj4BBvvCsUzG9KCFsnS
 tQqiFDTDWZzL8ErNqr5Ck7Q8o+Gzb5H6JIYQbxvhJueXi4H1H/4rOjBfBRkVgoBexXaj
 jC0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcZAJVDhywHD96hRDZ/laloYwNMkrsA86AV7u3VCDq/PV4ff3lRm5UyD1kwSFj7jhG6sMbLAEGT2a815ir43eHVy6Rx6wiYWp692B/rc0Q
X-Gm-Message-State: AOJu0Yzl7oVq9TlBz+yO8IOFA+fIG7VIPItIddLXv3hR3+ME0CQndRKZ
 uVDYxnUYxoJoPIqF93nE5RjyazhJLdyhl8hab9a2yLjtYI4Wl+e/cBTV9+OmiFk=
X-Google-Smtp-Source: AGHT+IGWstWv/PpAhG69C508up9GLKHmunJIqiqA/u3mSeeTLIT3kteM6OrJT0F+RBHSuMWr0yMEUA==
X-Received: by 2002:ac2:592c:0:b0:512:b00f:a55e with SMTP id
 v12-20020ac2592c000000b00512b00fa55emr7040685lfi.13.1708596171837; 
 Thu, 22 Feb 2024 02:02:51 -0800 (PST)
Received: from [87.246.222.6] (netpanel-87-246-222-6.pol.akademiki.lublin.pl.
 [87.246.222.6]) by smtp.gmail.com with ESMTPSA id
 c4-20020a056512074400b00512ab928706sm1730595lfs.167.2024.02.22.02.02.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 02:02:51 -0800 (PST)
Message-ID: <f36c69d9-24a8-473b-872c-fa0fb722db65@linaro.org>
Date: Thu, 22 Feb 2024 11:02:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] arm64: dts: qcom: sc7280: Enable MDP turbo mode
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
 <8fcb5816-2d59-4e27-ba68-8e0ed6e7d839@linaro.org>
 <CAA8EJporaUuddHHqpyYHiYSu=toHmrDxSHf9msZUJoym4Nz72g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJporaUuddHHqpyYHiYSu=toHmrDxSHf9msZUJoym4Nz72g@mail.gmail.com>
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



On 2/22/24 10:46, Dmitry Baryshkov wrote:
> On Thu, 22 Feb 2024 at 11:28, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>>
>>
>> On 2/22/24 10:04, Dmitry Baryshkov wrote:
>>> On Thu, 22 Feb 2024 at 10:56, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>>
>>>>
>>>>
>>>> On 2/22/24 00:41, Dmitry Baryshkov wrote:
>>>>> On Thu, 22 Feb 2024 at 01:19, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>>>>>>
>>>>>> The max frequency listed in the DPU opp-table is 506MHz, this is not
>>>>>> sufficient to drive a 4k@60 display, resulting in constant underrun.
>>>>>>
>>>>>> Add the missing MDP_CLK turbo frequency of 608MHz to the opp-table to
>>>>>> fix this.
>>>>>
>>>>> I think we might want to keep this disabled for ChromeOS devices. Doug?
>>>>
>>>> ChromeOS devices don't get a special SoC
>>>
>>> But they have the sc7280-chrome-common.dtsi, which might contain a
>>> corresponding /delete-node/ .
>>
>> What does that change? The clock rates are bound to the
>> SoC and the effective values are limited by link-frequencies
>> or the panel driver.
> 
> Preventing the DPU from overheating? 

?????????????

> Or spending too much power?

Would it not concern non-Chrome SC7280s too, then?

Konrad
