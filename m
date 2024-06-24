Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4D9914F86
	for <lists+freedreno@lfdr.de>; Mon, 24 Jun 2024 16:06:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0963110E05D;
	Mon, 24 Jun 2024 14:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yxohSGXK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC7A10E083
 for <freedreno@lists.freedesktop.org>; Mon, 24 Jun 2024 14:06:33 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52cdf4bc083so2800727e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 24 Jun 2024 07:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719237992; x=1719842792; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Br/bfMy698eaHPBHFobm+lhTqSfDhm6FM3UGgSs9wVY=;
 b=yxohSGXKu+3tBFRYZPVB5gGjsgDCzDQ2Y3bWYKdZnXxXJd7ZHu468VMDFIwHG7Py5/
 cColyYVZ0kYcxbSgSCL5SGNUwgJOgivQgZt20MRBw0fplHw86qDBq4Ar88BsZ8NlSqGH
 +ao/yIOOUt2Da3BYVTuzeCIIofPf4XZu2COL4C2zmgneX2Qov1FhDNIWfDI/QqMqzW7m
 HN37YFa3/lyY/gIdBnswlW158bB/t7uE+5Spd2b8+8ijwyue+HFIUCT8gFI0tcur2IlK
 5VITCpuhFsckxulKjMmB2V2517DvZBAtRrQY3NkqcS1cvQPsNjYBYkVok2ok5YGCw6C3
 ODUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719237992; x=1719842792;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Br/bfMy698eaHPBHFobm+lhTqSfDhm6FM3UGgSs9wVY=;
 b=kUjnweL2orTIRElJI9LlGJJPJ0m6g4uJkvdeRljshchHoXtT+y5MtI5OxCodCGyOc3
 uGFIM00L5ixYoYXUDExL1Ci74VYxHefX2QklYxNCgYJs8uQeFu7r2Wb+hIRAzWJ2Z8en
 mEc/nZAX9peD1VyP44PGPXTAN7DGZ1XRmdoOkGgiHH7NdrMf8XEt/r1Vh7Vs5bGl2Ihu
 Zqqh5O2p+YToxf2+7p6SOnI4WFk0PnPbp/CQbPO+wWb2CUgCou2A9cQKY7iABAdYIyBl
 UWq/MkXdCWZi6S7MB4gYyjcIxLHaLFlLEnHuEU/AGFVnpzMhgqenZCuSBLiSkstPiSLu
 gbSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlo6B8SRO6oHKfvzUM4QSSa3SFP+Y51YB4Fh3EeHEfG/fntELn5WcXbyB63z+JpfSBc/Z1EhNcuDuH5LOaPl9Pshykv9mFG7NpmvGbc+aj
X-Gm-Message-State: AOJu0YwOq2lrygY2u4IgNwB3NZXLMiLL3HxYK1mww4oEu6RrhhZCjYFy
 ElflkoBE8jLuVOiD+90fbxCVlWOuCnwSuWFeTmvUlC23GpMQ9/uGaquu+GfdFD8=
X-Google-Smtp-Source: AGHT+IGBSD0M3AUdujBciwVWcZpdKLsKzF8yl1H7y1uyhiRnYA+q9nUuFFyookmuvfhj2CLXjQg2pA==
X-Received: by 2002:a2e:a403:0:b0:2eb:e3a7:8b with SMTP id
 38308e7fff4ca-2ec5932a10cmr41288651fa.26.1719237991629; 
 Mon, 24 Jun 2024 07:06:31 -0700 (PDT)
Received: from ?IPV6:2a00:f41:c03:9198:7df:6a16:3e8e:ed7b?
 ([2a00:f41:c03:9198:7df:6a16:3e8e:ed7b])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d3058287fsm4727289a12.95.2024.06.24.07.06.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 07:06:31 -0700 (PDT)
Message-ID: <ffdfa775-b84f-4c20-9852-b210d42dc8d4@linaro.org>
Date: Mon, 24 Jun 2024 16:06:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm/adreno: allow headless setup on SM8150 MTP
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20240623193420.333735-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240623193420.333735-1-krzysztof.kozlowski@linaro.org>
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



On 6/23/24 21:34, Krzysztof Kozlowski wrote:
> Commit f30ac26def18 ("arm64: dts: qcom: add sm8150 GPU nodes") re-used
> amd,imageon compatible for the SM8150 just to enable headless mode due
> to missing display controller nodes.  This work-around was later
> narrowed to the SM8150 MTP board in commit 1642ab96efa4 ("arm64: dts:
> qcom: sm8150: Don't start Adreno in headless mode").
> 
> This was not a correct solution, because the Qualcomm SM8150 SoC does
> not have an AMD GPU and the SM8150 MTP board does not have magically
> different GPU than SM8150 SoC.
> 
> Rely on board compatible to achieve the same in a Devicetree-correct
> way.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Let's just forget this exists, this was a hack from the start and not
a very necessary one given display bringup followed soon..

This should be handled by a module parameter if anything

Konrad
