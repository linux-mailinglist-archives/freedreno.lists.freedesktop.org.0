Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A376A3FA2
	for <lists+freedreno@lfdr.de>; Mon, 27 Feb 2023 11:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49F410E3B5;
	Mon, 27 Feb 2023 10:45:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C0510E3B6
 for <freedreno@lists.freedesktop.org>; Mon, 27 Feb 2023 10:45:19 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id f41so7868671lfv.13
 for <freedreno@lists.freedesktop.org>; Mon, 27 Feb 2023 02:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677494717;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EfjmsqJC9S5uRIo+JPoAyc5Ef8JBEAdP5rQctKxSj5k=;
 b=NMM1JoMwJ4Qw/j/sBsGu2nc5CU19hz1sII+HLrMsy0mBo8KJpOW3Ty2YNMu7gVL/Ij
 dHwILQ7PZvsNgvLVWFGma4K7Pi8q0UqGejZohfMNqXBx15KXULLOw3QPaA1QP7JbX5bm
 Wp1Ab2mKZaJh5EyoBZCOPMmmDJvsmdeVBEpRQ0fFHbztXOxEhObHDvVTxuyfXUkVKlQr
 2uJ0Ttl1wlqwqFvYuLgyFbzVAMzyECCLhppODH3QgDxW03BbEpbZdZbxlQvG9Rm3A9/d
 4C14eR45pnaIkOnoZ8wxDBz/t+XuF1kkgD05T4aJ0EcHJPvT6SSJu1bTE6bKS+inonpU
 37uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677494717;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EfjmsqJC9S5uRIo+JPoAyc5Ef8JBEAdP5rQctKxSj5k=;
 b=ak9eKVbi6AJ97F4WUC8X4w69C3HEWBLZpEmQ/6jTXRC46fEWOL5oeXQqweYqQGTctc
 ZitJ2yHABvFarvUwhFm5gfl2CoxABG+CCKZ7qNpKibqFmddhtOfWu6ckPWbjsVBB81m/
 uj+yW6+bS4X/b6Txdc9uUgDocKNPfIqAzM08epRBZEhFFaFVmK+N0253nI3pJX2+M5+v
 YqKLNXsZCpi8HaUjcMzxdKoCv8e6SO0y53lJO+a2nSKPQ06gvWmL9YVBW2rCIty4W4Dr
 yrZnGQ3RUYmz6wiEEk8yshjcf4TA0UsbfntkzQfwtvi3cKCerodEne73jyQSNty9wGLI
 R2Fg==
X-Gm-Message-State: AO0yUKVTYHYCte6Wkhinvne1O9XFn8khx0yPJ98qmhQv65nXhugvNIcy
 nAGbIcRw7weC1gOSlsOUvbKXGw==
X-Google-Smtp-Source: AK7set+nivcoX0kYRGE1+gk462k0UjOU2mFC4PctvVhZJ8cocReI8Ypj8vCbMc3f77ikk9Gih+q3uQ==
X-Received: by 2002:a05:6512:390e:b0:4dd:a66d:b6de with SMTP id
 a14-20020a056512390e00b004dda66db6demr4726598lfu.65.1677494717376; 
 Mon, 27 Feb 2023 02:45:17 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
 by smtp.gmail.com with ESMTPSA id
 v28-20020ac2561c000000b004b5831b69dcsm865191lfd.140.2023.02.27.02.45.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 02:45:16 -0800 (PST)
Message-ID: <3d951b70-ecea-c97c-8a2e-72ca6b1a2bf7@linaro.org>
Date: Mon, 27 Feb 2023 11:45:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Chris Healy <cphealy@gmail.com>, dmitry.baryshkov@linaro.org
References: <CAFXsbZqnstOLFBrVVa7aFLSGCPNj4VkjExqq1XUoRdUUuBKdog@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAFXsbZqnstOLFBrVVa7aFLSGCPNj4VkjExqq1XUoRdUUuBKdog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/5] drm/msm/adreno: Use OPP for every GPU
 generation
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
Cc: sean@poorly.run, Marek Vasut <marex@denx.de>, airlied@gmail.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>, quic_abhinavk@quicinc.com,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 24.02.2023 17:56, Chris Healy wrote:
> I may be missing something, but looking at the code path for a2xx,
> it's not clear to me how this would work with SoCs with a2xx that
> don't support 200MHz for GPU frequency.  For example, the NXP i.MX51
> requires the A205 GPU to run at 166MHz while the NXP i.MX53 requires
> the A205 GPU to run at 200MHz.
This is something outside the scope of this patch, I feel like.

If I'm reading the code correctly, the driver always assumed 200 MHz
for non-pwrlevels and non-OPP targets before this patch, and this
patch is meant to bring no difference in the rates selected.

Konrad
