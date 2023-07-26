Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A817634F0
	for <lists+freedreno@lfdr.de>; Wed, 26 Jul 2023 13:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E9B89131;
	Wed, 26 Jul 2023 11:30:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B58A10E45F
 for <freedreno@lists.freedesktop.org>; Wed, 26 Jul 2023 11:30:01 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5221e487e08so6498386a12.0
 for <freedreno@lists.freedesktop.org>; Wed, 26 Jul 2023 04:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690370999; x=1690975799;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=onPbV8Yv+Ue98mrxtxqkTtpVYJaOzehqj+NNEv4BhAY=;
 b=T5Oly7FluqjUGaa3lMgD/oPQ2J+nYChOgoHh0jYspY5uXfnE5MYT68UsCB3SjoGnFQ
 FppOWSh1MMLtLlGVIhLDk80CzltGf8n0bY7LbZRLYLaCBZDOqOZ1HtmVYMQnHzseWQzX
 v4w1WbDM/bozmL701yPTBbu6Ixc2TBHPJdHGhfqc6T9O1T/Qa1N43ddjF25ap/TZnj7y
 5hk3yJUQlIFxnRWT4FNF242L13jbB7r1iEGB5w+kTDi/te5hlCGLKFxTkNjC23DSJdfA
 6gRlLeuyAOh7mpG+mGiCeuxaWY71tVSERdRQ3u6jpvurjUHVpuwxU1y8CbGt9pDVVYYi
 QpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690370999; x=1690975799;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=onPbV8Yv+Ue98mrxtxqkTtpVYJaOzehqj+NNEv4BhAY=;
 b=Mk/amImu/JJStSHOuJKGOz48HdxjW3Lnr19ocfElJ/whpL6aLgk2HRHVzhDED2es3J
 nw05GrFwKzePNvWlc+gdC3RbQ/jwGbTqdlluo5rbs0WlvstW9Y3vNGUjb0m1eUwcbfWP
 EMydMtkAGPr39TBijluy1l4JLdeSCBtul3ZK1a2ui5feQEPdU3mQYFZVIvMnZRd9O6Mj
 aE+AK3YTGvB+yLGmXBq1Ke0zGnNe5bBJgfBFp5QSWfAm4i5q1CvHVtADhMn0W7qBeoQe
 oYTcvEOoYIk4lCZbIcIKl7oGwVv0rT0pp6CG+JjQ7yIrq+Ye3D1xC9vRxE3wOQ8X/hL7
 DUXg==
X-Gm-Message-State: ABy/qLY6fOaaYCQOlhXL0+V8ZfR4TdxhRI51pWnMYRR2StBY9PicEqGS
 rvryYZjtrewxM6gTi46RdtFZkw==
X-Google-Smtp-Source: APBJJlGhsZALbMTZop+J6WRH+YKEaAOscUT56bRny+XG/qT9JQFYAWirvKrTQSzu9bEF7f9tZf78gw==
X-Received: by 2002:aa7:dcca:0:b0:522:4de8:f3e2 with SMTP id
 w10-20020aa7dcca000000b005224de8f3e2mr1563220edu.22.1690370999558; 
 Wed, 26 Jul 2023 04:29:59 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 b9-20020aa7c6c9000000b0051d9ee1c9d3sm8686862eds.84.2023.07.26.04.29.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 04:29:58 -0700 (PDT)
Message-ID: <3ef4f91f-0afd-0246-4f8a-210aedb0b94c@linaro.org>
Date: Wed, 26 Jul 2023 13:29:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Amit Pundir <amit.pundir@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Bryan Donoghue <bryan.odonoghue@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230713165238.2814849-1-amit.pundir@linaro.org>
 <20230713165238.2814849-2-amit.pundir@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230713165238.2814849-2-amit.pundir@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v5 2/2] arm64: dts: qcom: sdm845-db845c:
 Mark cont splash memory region as reserved
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, dt <devicetree@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 13/07/2023 18:52, Amit Pundir wrote:
> Adding a reserved memory region for the framebuffer memory
> (the splash memory region set up by the bootloader).
> 
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> ---

I think your commit msg misses describing the actual problem, impact to
users and finally cc-stable.

Best regards,
Krzysztof

