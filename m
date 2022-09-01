Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3615A9307
	for <lists+freedreno@lfdr.de>; Thu,  1 Sep 2022 11:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB3510E669;
	Thu,  1 Sep 2022 09:21:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B67110E671
 for <freedreno@lists.freedesktop.org>; Thu,  1 Sep 2022 09:21:39 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id w8so14452148lft.12
 for <freedreno@lists.freedesktop.org>; Thu, 01 Sep 2022 02:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=JjiYojy0Mwz3pYQJAf6nrTE41i34ENgZHI5xsaPwkbs=;
 b=QgAVOF+/vTR23gXiTAAucIMrT6xpBgRluRcyan6ZkbCBcvfK9t7qM/oscy5mxbGgW6
 yiHVcseXrNhwyZRwcje8hiK34BS/ZgwXTOdR2ba0BbrvVPvmnUmDmQj1HPfupjOkywfx
 XPMnS70CqhpwVZCNHpJleXKtZY9LNVrIYreW9p42W2mKoJZZCZVCVHYqqXSu6Xdnw6qA
 vc9Fk4Zuwoc0D9TT9C2iuHkdz6AahWd1MlPxIBTN7RtZwDoYCfTZpNTVrxKxHuGruVM3
 2KgfRak+QpSWD3OgRJXAAVmLE+//leXzwgE+1ZXfcExDDl3hvS1j849RBo0mC9iwzPqE
 1Tqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=JjiYojy0Mwz3pYQJAf6nrTE41i34ENgZHI5xsaPwkbs=;
 b=bmHAXPkPJ/O5xUXKXAkyy3nWF8D5FcMFc6E5Ev9e5pN4FL/p9SbTrGTGG2hVGzGbQU
 7/dW6pWJ1kNYtnAa/47NyTD7PGzMPEFHWhLuNHbnJyIcCyFi1FQMM2ZCYlisYq2Oclly
 FBJLuHoYU4TMoZFKWdpPF5Vriujs/ZdW2od6t/9eRtI1LEssjfOlvo9IBRlfQ/Uz44U5
 71jlN9xdetfbSvLAYwPCP67/LBJfzrfrxsU/u+wIhtwq3wgoS7OcXOV5nQOdFp0B/ZHq
 p3QcK1WfxymGt3izzlJ7PLNw3xJeJw31aQ14X2eK+2CUWTY0Zw2ZqN2nHPNmoj3rBHoT
 C2sg==
X-Gm-Message-State: ACgBeo2H/N5vwyMAlLKGzJ1mzQu7IRtwOEwA1iPaR9ZOsoyMI59Vgfpy
 8xsgi/YXqJja10SCyX5O2YvdZOhdNdXNmQ==
X-Google-Smtp-Source: AA6agR5xBKtqNVBobHsboicM3GsM+gKu8FjT9rT6Hgc1fgYbyDDsJMPvBhpW0VBSx8Ht3bv9lehQ9Q==
X-Received: by 2002:a05:6512:2293:b0:492:f04f:2ff9 with SMTP id
 f19-20020a056512229300b00492f04f2ff9mr9908720lfu.95.1662024097903; 
 Thu, 01 Sep 2022 02:21:37 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 10-20020ac2568a000000b0048a9e18ae67sm2293466lfr.84.2022.09.01.02.21.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 02:21:37 -0700 (PDT)
Message-ID: <f6868bf1-445b-e350-5032-09595666449b@linaro.org>
Date: Thu, 1 Sep 2022 12:21:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-GB
To: Johan Hovold <johan@kernel.org>
References: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
 <YxB5R/6u9/ERyUSP@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <YxB5R/6u9/ERyUSP@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH 0/3] drm/msm/dp: several fixes for the
 IRQ handling
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 01/09/2022 12:20, Johan Hovold wrote:
> On Thu, Sep 01, 2022 at 12:15:24PM +0300, Dmitry Baryshkov wrote:
>> Johan Hovold has reported that returning a probe deferral from the
>> msm_dp_modeset_init() can cause issues because the IRQ is not freed
>> properly. This (compile-tested only) series tries to fix the issue by
>> moving devm_request_irq() to the probe callback.
> 
> Please try to reproduce the issue yourself before posting untested RFCs.
> We're all short on time.

I do not have a working DP setup. Thus it's either this, or nothing.

-- 
With best wishes
Dmitry

