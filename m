Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B02C6C658F
	for <lists+freedreno@lfdr.de>; Thu, 23 Mar 2023 11:47:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA4F10EA77;
	Thu, 23 Mar 2023 10:47:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2BCC10EA71
 for <freedreno@lists.freedesktop.org>; Thu, 23 Mar 2023 10:47:23 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id eh3so84477731edb.11
 for <freedreno@lists.freedesktop.org>; Thu, 23 Mar 2023 03:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679568442;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZwBaazd46Os1h8UWb3mzhS3tM1p34VAmXxtP/Asef4g=;
 b=Dtslf0444+9v58G4yE+r0N4jTKSFCxfgxadg83fFpxNHJ4ac4nlxy0bFQDZh3eNAKB
 6WssITCbUrDgO1As33oV9qKLdQbyrHIJ2/gRtUdUK8XNctG/tWxxNfnYwi9XdL67Rwz2
 jN5zgGK5gewqPRnTYvHYAntqZ1Mrs6KMySeUgtH1R0O51kUmgjC5iviB4XcBg1oXkJ4C
 wsPdAy3FmmaFAuFdsxIiH2CG84/CHpAs1LMRnB5QWHwBtoXNosOoPlLukKgM+rmy+rJ4
 VrJPlkZfxEfp7h9c067CxWlfsxIXgtjVtA8ANFGhrqOP7GyVkLgwoh2y61aQiFLP4vgB
 YbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679568442;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZwBaazd46Os1h8UWb3mzhS3tM1p34VAmXxtP/Asef4g=;
 b=MUrOTi7FCGmn9YjSePYJcoN7w3IyXF0qJG35Eq1W24ve7Ams4y9BRNWx9fxSgiGbpF
 3CCT/JkhMNDcuxfvWRgL4/Hto7+1ARmDu+utO1QAN0ygFgV6Pn6utVt1gTDIW6JBlknM
 AZfbsYyWBuULGco3XMVRK/+cwdv9J2sbctOQp0dCgN6mn6lc9PzJoDUo+FKYc3rycqNi
 DkYSCRC4qVatZpHk+qomNRVy3FCLgrKia3hrAEBKdKkFl0hw5CqbJsKMXDVqaownZAqJ
 iz3uX7ovRjrMM5H3dD/RelvwmZgrwD/FhkAW/Zda6H/MkpqqcfgOwgnsliwIhGjfV+NY
 lnAQ==
X-Gm-Message-State: AO0yUKVIduA+EBJ74QTpOvSchnahinYXk25Cx6z2AI6rk3Q+fZG1GFla
 XJwJ/ESVrXHDVTYkkoYhCfxOVw==
X-Google-Smtp-Source: AK7set+syZHTlqpATJV5H45QwNgqlRP+3WJYWaGjq6Y6tMtvCBdNqC47gy0P9OOBSjJ/vCiMdvKECQ==
X-Received: by 2002:a17:906:9457:b0:930:a74:52bb with SMTP id
 z23-20020a170906945700b009300a7452bbmr5414585ejx.14.1679568442296; 
 Thu, 23 Mar 2023 03:47:22 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a665:ed1e:3966:c991?
 ([2a02:810d:15c0:828:a665:ed1e:3966:c991])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a170906b29200b008c607dd7cefsm8484887ejz.79.2023.03.23.03.47.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 03:47:21 -0700 (PDT)
Message-ID: <35e3aa8b-ccff-25fa-42da-d8934ef366c6@linaro.org>
Date: Thu, 23 Mar 2023 11:47:20 +0100
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
 <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-6-3ead1e418fe4@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-6-3ead1e418fe4@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: Rob Herring <robh@kernel.org>, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzk@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 23/03/2023 11:25, Neil Armstrong wrote:
> Fixes the following DT bindings check error:
> codec@33f0000: clocks: [[137, 57, 1], [137, 102, 1], [137, 103, 1], [137, 70, 1]] is too long
> codec@33f0000: clock-names: 'oneOf' conditional failed, one must be fixed:
> 	        ['mclk', 'macro', 'dcodec', 'npl'] is too long
> 
> The implementation was checked and this npl clock isn't used for the VA macro.
> 

This does not look correct. DTS looks good, you miss some patches in
your tree.

Best regards,
Krzysztof

