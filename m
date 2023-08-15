Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2640B77C72D
	for <lists+freedreno@lfdr.de>; Tue, 15 Aug 2023 07:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33D110E0CC;
	Tue, 15 Aug 2023 05:43:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7FB10E14C
 for <freedreno@lists.freedesktop.org>; Tue, 15 Aug 2023 05:43:13 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b9dc1bff38so74614671fa.1
 for <freedreno@lists.freedesktop.org>; Mon, 14 Aug 2023 22:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692078191; x=1692682991;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jw6ZKn2vNcjA9MqDmrsGFXdRmKd5KhjNUkjx2Uq1Kd0=;
 b=BKPeeD2U5MUnrhf2RZMUCETsWAXISwTYH1oSOI+t2Vck3SDjGoEiNzMWDyFmdcHs/j
 uyTL46pkrEV5ecqCe3sq2Pnn6PUCw/k+qZsRw471glKKDFPifLXrTwy2V40oVR7V+rEQ
 q3jBlmWdxIrFdkIho2LetNiOrmtJnPyxYIEXGh5vtVMQRgT3UFee42wen2p8fcX0zbg6
 0QTT1v/c2mt1LDGjwZCnJsAZqyDF1qW5UCUXq8znpC/GwRrsQMAOo2wrp950tBowieZB
 rizyV7w0X1IOn7f34tjjcw5F5PoRHjKpvJn//xBWCEld44q4wJsYWMzXy7IFITeD4IeO
 kGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692078191; x=1692682991;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jw6ZKn2vNcjA9MqDmrsGFXdRmKd5KhjNUkjx2Uq1Kd0=;
 b=Lkr3Nhq+tYxqkRoNVw8oxFn3yy22n10X3CAqfksjD74q0JocSPJd+7lq5OhHJDmB+h
 m8sHAG3Y30K9Czpg2G3d7JF+AKKp5mp/A7AYOPl8LM03hMaDhXXZRdZi3CN/+C7Nr5GV
 0fFGqVn/uKaJdpFPcGa6j3r1PPxARbHJHEiqjqFJ9BIDYKDq2jqa61qrC1reIiGoDQtl
 DRjeahUjnpFXMjIfFYRhlyTRp/60Y1Q3h20rp5hfIeTyYhiUZvlb8Oy7MrksMzSVM8qN
 lIMdbdDNIH43NSEP8KIyGbctXnAbrKbig0ljJQoFzrwTaq5hcZsvQAmrDY9qhlO2cMoU
 Hp/Q==
X-Gm-Message-State: AOJu0YwiGNaLqhSMBch3Qm71mpoUngxB4EOUCjQo3g/kAjJGJRw3/jGs
 0EVIIP/EglnqMgUTiFhN8YsaHg==
X-Google-Smtp-Source: AGHT+IEvyC3KHqPI4Aqoe7nlXlx/XKraQasiWSzM4QIIBy+bofI9pfUzQQxcwHNZtVA6mH3J4pDrQQ==
X-Received: by 2002:a2e:8317:0:b0:2b9:ecc5:d1de with SMTP id
 a23-20020a2e8317000000b002b9ecc5d1demr6962968ljh.37.1692078191458; 
 Mon, 14 Aug 2023 22:43:11 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a05600c00cb00b003fe29f6b61bsm16416026wmm.46.2023.08.14.22.43.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Aug 2023 22:43:11 -0700 (PDT)
Message-ID: <c70422eb-ca6d-ed86-dd15-dfa555e64c89@linaro.org>
Date: Tue, 15 Aug 2023 07:43:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
References: <20230628-topic-a7xx_drmmsm-v2-0-1439e1b2343f@linaro.org>
 <20230628-topic-a7xx_drmmsm-v2-2-1439e1b2343f@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v2-2-1439e1b2343f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 02/14] dt-bindings: display/msm/gmu:
 Allow passing QMP handle
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/08/2023 23:02, Konrad Dybcio wrote:
> When booting the GMU, the QMP mailbox should be pinged about some tunables
> (e.g. adaptive clock distribution state). To achieve that, a reference to
> it is necessary. Allow it and require it with A730.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/gmu.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

