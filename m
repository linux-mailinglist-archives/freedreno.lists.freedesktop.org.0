Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 696B863599C
	for <lists+freedreno@lfdr.de>; Wed, 23 Nov 2022 11:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1617410E53B;
	Wed, 23 Nov 2022 10:23:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335EC10E53B
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 10:23:03 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id g12so27514899lfh.3
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 02:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iyV5wkkV+56LS1142qAbRPAZ5W6yT49HpnDkBiKI+fo=;
 b=CWYgX3BLOd1a5W9OrGrrE00EzTu9LWEnFq7ewW/QTaQNntrtstJL3d/8qfdeYeJGuo
 sybFuUG+1wi2ZfbRx9RV2JFo/sCLKUELrWpOfTXNyFifC6TcwtnCi93Sjrhg1t9DNG23
 bv2Ekszqe9cuDp3nkePvcgKVogaizSo9bdfqY0vXs82mQCtDj2XaK2YNCvcB5kI6XDl4
 dE3Tdhzv92fWggDi627YQlpO/vYCy+mVc1zOZ4VhrfbS7gZymiQj9se5jvqSWyvscFnA
 YdH+KkCs2gy/040hKtWTfrEahS1o31TWCU+VjLRzWNNACcrptfybwBCNt9m8uIluN2tL
 S9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iyV5wkkV+56LS1142qAbRPAZ5W6yT49HpnDkBiKI+fo=;
 b=zMSmeOtwJu/eO0fTEyeBDoTvXgtDkcMtdMtJUKZS5AXlV30uSgUPmLdxWDZMElOR9L
 w0822Zs2DkEwSo684VncIepapC6Dc1UPujS+XTQZjQRpk1Makrkedb07dAqGYD6dk8Cu
 DckRfHuNAmncsCFcbqdtXtg28OQZeNg/Wj9hDPxxglUlyN+ywUJjNbB5Lizq4BJyHtwJ
 GaFLHtZNxieFwvmPwuEVHBO8Anv5V/FV11hgskNgX99qMCN67ry33UJIMQ6C4D1cfj/Z
 YMBCGh1GBsEyl6aJZFGLQ8ZN570luSSnP5DL+vyMwKrOAT15dd3JMBA5df65y5nLeDP1
 DaHw==
X-Gm-Message-State: ANoB5pmSVASY1uL3n2ryJgHnkG72qRprpnaM0beQnEN6Ddq+N/av4iJO
 /J86EH8TDVnnfopGKg8UnJzKHw==
X-Google-Smtp-Source: AA0mqf5KadIDbTlUhk+bHqHP0r/gHM476ILBj7yIIwNnSw9V4mopS+n8G9HpU9ilYX/dIC6V/cqupQ==
X-Received: by 2002:a19:dc08:0:b0:4b4:6460:24d with SMTP id
 t8-20020a19dc08000000b004b46460024dmr8902674lfg.386.1669198981520; 
 Wed, 23 Nov 2022 02:23:01 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 j21-20020a2e8015000000b0026dcf81d804sm2125822ljg.31.2022.11.23.02.23.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 02:23:01 -0800 (PST)
Message-ID: <2094ee64-c17b-2f9d-2497-bab4aeee5709@linaro.org>
Date: Wed, 23 Nov 2022 11:23:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 00/11] drm/msm: add support for SM8450
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 23/11/2022 00:12, Dmitry Baryshkov wrote:
> This adds support for the MDSS/DPU/DSI on the Qualcomm SM8450 platform.
> 
> Dependencies for the DT bindings: [1].
> 
> [1] https://lore.kernel.org/all/20221024164225.3236654-1-dmitry.baryshkov@linaro.org/
> 

I don't get... this was merged, so how that patchset is still a
dependency? Did you mean that this depends on commits in maintainers tree?

Best regards,
Krzysztof

