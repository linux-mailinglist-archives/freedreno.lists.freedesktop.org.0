Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A09945E8AD8
	for <lists+freedreno@lfdr.de>; Sat, 24 Sep 2022 11:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB1110E5A8;
	Sat, 24 Sep 2022 09:31:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD54C10E5A8
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 09:30:54 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id x29so2468836ljq.2
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 02:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=IBvwqmIkee/mEk1eD5GIAynGE3bP9mLepq0/KSN1Z5Y=;
 b=hh7eQEeW6wXs4cFtgikwHPFejQs6Z2iZT49SRVErbpM0JPT9bkVbj+UE4NK40uTWGx
 yRRzZxZkcyeWhPDshqZT7nOCg10uktxFTJ8drdK0gqu8bzXz8I/sWhhgkCNZDoQn66eK
 rrzu4gXwmRZXRqO2LEs4ZiH2zwjj7MIlm6LiU8Xe2hWTeOwYcy8WBNN3n7/KrYVHyfLV
 juqQjvBR6EP9GRQaO7dV9BppulXNEoQ65mAYdLHi6B+sx0MpUeAlVzwm2UvBU0XXHsFw
 40ebE3mjnhuTmi6gkIrd5xMCyE2fY7zxWkgPUbe2YMaPlfa+JePEyUrdoEakscxGeF1W
 /A2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=IBvwqmIkee/mEk1eD5GIAynGE3bP9mLepq0/KSN1Z5Y=;
 b=Ckpo2PwuFnIMCasYXuDge0sbRA8TkDOiboq0Fi7uQ3CNiFXrXxDDujtR4QZzdBeiMQ
 bnXA5XF/zsoyKq7JfFUg2RelOtan9iZs4STTB/sYpBGlVf2oNvOh6pDB01GKh/x6HrkN
 bwYGByMA+rGPIOd42mqgxs7pdABQMk3tNHbxUOfUsogaXvLRmWN/u506fIlfHzZ1j4lr
 9zfxxVNbwv5BDhcrpHOtT/rG8rRmciUdJ+5E5I+oAx7mPd8Q9AvTaGLLy9Xg/Gu6WVsy
 IFQwKW1R8v0b8FmTG84vNFmEO79znAMtu/sv0EDTnRilEGyEKRKDE9hR9iMalox4f9Sq
 ay6g==
X-Gm-Message-State: ACrzQf0oKdHL4fw8bbDfIgDW/JHHalr/iG0RERbhRYURwKx1xbX4vZcK
 zhWG/Bhv3s9igc/vkjSLZ9BRug==
X-Google-Smtp-Source: AMsMyM6q7OFFmd1o39LcSba3lrIQxa4YwVSfF+8mWBXUcfDHwPhNUgchHb43l4lT5adb2/5ei3KeUA==
X-Received: by 2002:a2e:9608:0:b0:26a:a73b:b8c1 with SMTP id
 v8-20020a2e9608000000b0026aa73bb8c1mr4456920ljh.328.1664011853076; 
 Sat, 24 Sep 2022 02:30:53 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 f5-20020a05651c02c500b0026c0d7a9f5bsm1712863ljo.96.2022.09.24.02.30.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 02:30:52 -0700 (PDT)
Message-ID: <bba397b9-891e-4ff4-17b8-cd15c04b4239@linaro.org>
Date: Sat, 24 Sep 2022 11:30:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
 <20220924090108.166934-4-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924090108.166934-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 3/9] arm64: dts: qcom: msm8916: change DSI
 PHY node name to generic one
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 24/09/2022 11:01, Dmitry Baryshkov wrote:
> Change DSI PHY node names from custom 'dsi-phy' to the generic 'phy'.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

