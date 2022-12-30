Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE54659A74
	for <lists+freedreno@lfdr.de>; Fri, 30 Dec 2022 17:14:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2061510E459;
	Fri, 30 Dec 2022 16:14:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C0710E459
 for <freedreno@lists.freedesktop.org>; Fri, 30 Dec 2022 16:14:50 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id 1so32275594lfz.4
 for <freedreno@lists.freedesktop.org>; Fri, 30 Dec 2022 08:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Jbyv4Oy8didpwFYD17V58dHAAX/DTrU/zE0z4pQAgYo=;
 b=To2ksXIJV9+WbeESZs4xX0hYjVnUCAO4VCpaHiAeqtYOYKKCu64D+fUEBE+Jrr6qIP
 R/eTASpH7PGcWf8qszwbDC7n/9gdjeXMjrTBPc8iLqvBCKYTpU4eOrHgDQaC4ybgWGKq
 q/fOUTvwI/e5ld0Eqzbuw/BLJj6f+uTK81hNG1kYpy2pk5abJXnTJ40aDty9D4sPCV45
 iCyl5bFYVIjl4hTAfg80QkDr4p9sCnGH1YOPeVekJbSCF+TVzW+5OrsKwO0t17ffCgZd
 RJl82P6e+SqL3JB3EuaVd6VRw4W9bUuO8f8nMx+AjQ1wJYMtGCLwv2+uuHjwWRuzjcXj
 Zujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jbyv4Oy8didpwFYD17V58dHAAX/DTrU/zE0z4pQAgYo=;
 b=iP58Z0wqAq5sfIHeHhVCRp87jdtz55F6fd6W1kCyXWvK2Zpu1MdtOo6e+9tCjWZy0u
 A8L/qFeByYx+PjKnncADEP9kTbTXaWv66olgk1RVUeH/50RxS4ZVeIEqu4vZoNp6qfXm
 0+Dx2+D22B9EnUB7BUSA77qTvU37T5ITuuFAgBgY9m2oVQTje+FoKj0ptaD3sOEKmL5B
 /SAy+rDBn4TPg7aMNZQ7kZHYKRIsph9hEGz6pZee6+h72ikeySgX2X3NTVCBxMopEVA0
 MaG4BVLCl5NlQpfGYfiOzH5SadGsG7WPj5yLkQvxbwv8W1vMBVxhE6Y767OT9GxpAqG8
 NjmQ==
X-Gm-Message-State: AFqh2krwbgFHaU1PhWW4pW5BBnE9Ft7nXxwwO4mN2uy5wDsug0mereqZ
 CsV8LMaaHab5qPtZjTPDL4f+4A==
X-Google-Smtp-Source: AMrXdXvt2vZu5fuaitjDO5j8xBPAxgO+bIc23hMUVB0akOKLgqyj9XAcwvHkgYQWNICQMS6eagpzuw==
X-Received: by 2002:ac2:5394:0:b0:4b4:e2c9:9b25 with SMTP id
 g20-20020ac25394000000b004b4e2c99b25mr8707849lfh.44.1672416888646; 
 Fri, 30 Dec 2022 08:14:48 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 j18-20020a056512109200b00498f67cbfa9sm3539912lfg.22.2022.12.30.08.14.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Dec 2022 08:14:48 -0800 (PST)
Message-ID: <b32cf5e6-15be-4055-35b1-ad9d90e3c0ad@linaro.org>
Date: Fri, 30 Dec 2022 17:14:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Robert Foss <robert.foss@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, agross@kernel.org, andersson@kernel.org,
 konrad.dybcio@somainline.org, quic_jesszhan@quicinc.com,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 vkoul@kernel.org, a39.skl@gmail.com, quic_khsieh@quicinc.com,
 quic_vpolimer@quicinc.com, swboyd@chromium.org, dianders@chromium.org,
 liushixin2@huawei.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org
References: <20221230153554.105856-1-robert.foss@linaro.org>
 <20221230153554.105856-8-robert.foss@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221230153554.105856-8-robert.foss@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 07/11] arm64: dts: qcom: sm8350: Remove
 mmxc power-domain-name
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 30/12/2022 16:35, Robert Foss wrote:
> The mmxc power-domain-name is not required, and is not
> used by either earlier or later SoC versions (sm8250 / sm8450).
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---

Please, do not mix fixes, cleanups and new features. This delays
applying of fixes for many, many days without a need and causes a lot of
duplicated work...

This SHOULD be merged long time ago so I won't waste time on such stuff.
But because it was always waiting for rest of patches it was never merged...

Best regards,
Krzysztof

