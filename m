Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5156FCCBB
	for <lists+freedreno@lfdr.de>; Tue,  9 May 2023 19:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB94010E3C1;
	Tue,  9 May 2023 17:27:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C229B10E3C1
 for <freedreno@lists.freedesktop.org>; Tue,  9 May 2023 17:27:53 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-50bcb229adaso11629303a12.2
 for <freedreno@lists.freedesktop.org>; Tue, 09 May 2023 10:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683653273; x=1686245273;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4A92c1vtjQm0dyCbqNgY2DMk3DzF3junHi3LSgNBl4I=;
 b=TXeeB171PkquAzTh2Cb0+GAqKxFrnr/28vWsBAAsiX1GmpHMKTH4WIpmo9CM5wQ6te
 uaP/FI9TPDHJU3c4bbCTwYfVPrZVVdpduFFE5kF4vYNAXIKSSX5KMCDJLJfxg5FxZ9ax
 msfG4HsvxkWhIkEftL4Gwco1z7wYG3df+pYlRngxYt175YoPuL6YzRLh7YuTDKyYoVmJ
 jwFbJzPAPCnnsLJOz3El5GPJnmIrszkfckhATeMdbA/XOIpiwwzORkntblZYRHsNeEg6
 z3ipJpbqE0gluja6FTwOTzx9LC3w8TrU46l4wEDXvCj7/kbhdr/dBADhg+dh48TCXSsb
 BoHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683653273; x=1686245273;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4A92c1vtjQm0dyCbqNgY2DMk3DzF3junHi3LSgNBl4I=;
 b=c83mjfKDIC3XXPyKoXDGVQOtjPe23z/LroSAWanEzi82ZTigl0gPd0HmycDg6Dxop6
 cnTYMKR2EL1o7PpIQ6XxPXrof340dfnz/pPpUs9RcvzWCGzYahVDE46TmnxhIwH+N4rC
 mIvGJ53uUlOVm/RLVqahT1rJKoaWKYJcb1U8U6w2yHEHK7wYObGhopMsUC5hxxiirMtH
 fQd8xE+3UazEAAiwlxr8Xix9ASYELsHptiq4OdF2V7d9uoDILN6xNTRbwuhX14aYrxLT
 ZCwR/5DzRcGuDIIT3bS1/GNf/EEsYB9bsSNXdy1WGY+tBifycD4av1IUeuQVpZjpKi56
 QCag==
X-Gm-Message-State: AC+VfDxX9L1JOHloshQDAfkAbA7jID6jSBs28qiy07c0rJsOlBETvkkW
 4onQfGTKkTt1oi3g/ftbSiPFtQ==
X-Google-Smtp-Source: ACHHUZ4MwBHj1nlk8aNZla64nFIvcafvGf40YO9N3RH/cCJQ7uMOJbn+Er+XO4QfiBoAembA4xcT0A==
X-Received: by 2002:aa7:c747:0:b0:50b:fb49:c4a8 with SMTP id
 c7-20020aa7c747000000b0050bfb49c4a8mr11588323eds.27.1683653273247; 
 Tue, 09 May 2023 10:27:53 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d0d5:7818:2f46:5e76?
 ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a056402134200b00504ecc4fa96sm960737edw.95.2023.05.09.10.27.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 10:27:52 -0700 (PDT)
Message-ID: <e17bd606-dd58-0eef-2835-7a35b629d82a@linaro.org>
Date: Tue, 9 May 2023 19:27:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230507201218.2339014-1-dmitry.baryshkov@linaro.org>
 <20230507201218.2339014-2-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230507201218.2339014-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/3] dt-bindings: display: hdmi-connector:
 add hdmi-pwr supply
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
Cc: devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 07/05/2023 22:12, Dmitry Baryshkov wrote:
> Follow the dp-connector example and add hdmi-pwr supply to drive the 5V
> pin of the HDMI connector (together with some simple glue logic possibly
> attached to the connector).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

