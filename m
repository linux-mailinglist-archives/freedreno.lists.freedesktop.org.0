Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FFB63978F
	for <lists+freedreno@lfdr.de>; Sat, 26 Nov 2022 19:09:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7896010E121;
	Sat, 26 Nov 2022 18:09:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B6D10E06A
 for <freedreno@lists.freedesktop.org>; Sat, 26 Nov 2022 18:08:58 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id cl5so10951634wrb.9
 for <freedreno@lists.freedesktop.org>; Sat, 26 Nov 2022 10:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=14HxlRV+SCHhU12Rhd+agDyzR52gxT5y8aPZsUnVBcQ=;
 b=JSUOpnXVUL/GtjGB+U5r8O3XJS4oO27vbjQDsLdJ/FGIJwOWh64sgz7OetrwgWMst1
 KrwUMvbwqF2PHIhNvMwFnwMJwvCh5oCq9NeTbMC0koYwiyCcUMUfFWMoNBgWQWIi2JbK
 KclHHIy1Bl2rI4igM/+Z0pkMB2rCxdjNgOr/NllrCeUSiSA+YGceRa5Z76k6Buc4lU5u
 y5iNQcvrw2ImTH9iCOLtAwOCuuuWrS2+AYNeNdF3amFmXCsGGX0GM01XcoyI6loLInRP
 uVsBJMKKeKn2nDwhkRwsy/Ba4ft5IAxbKs8jRxMXRKnmlbHVpo0zW8c/PPvtVotGuUlC
 U8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=14HxlRV+SCHhU12Rhd+agDyzR52gxT5y8aPZsUnVBcQ=;
 b=fPoqS2hsHFqyLLL6EfC2DSQXQRux0Shyd0YjGHvareK0cAjhqapLOSO0PiF1/v2x/I
 Ff8arJ4h1qfkLLg6hpuM5tmFrmRm7w80etK9crropDXrcOXvbI1TLYtcYliiSZ5BKrvQ
 JNKTX5r1PvApGNwIJ7M0sr9II1d0VxZKpwKpH0xBHRx1u9DAPu8SR/c8m4/A/8IqCD3X
 6IwGIgOFsx7xXCsmCIw9LVqyZmOWjOsR/+naHkdkACVFOPPOqeeON41ZwxFyCJ67D4zd
 gBC+VYkOInG4EXN8Url17rvc01gHSrYxpPy+YsA5EGIBbCwVpkq2dxRSRH2u9OwhtKzr
 UPRg==
X-Gm-Message-State: ANoB5pnSgeCRgVVXgf7BtRLGIlm59rNYGXR6s9/WXNyKjOpXrx5rKbXj
 8gmths1QkRXUK0ipTLZ3Ro7rJw==
X-Google-Smtp-Source: AA0mqf46lNLHAVNwE5GbJ272Q83inWMEqFqLSYa4pDcNM0EpPB/YRth9LRxuNf6zHFVz4J8/8Pl5fQ==
X-Received: by 2002:a05:6000:886:b0:241:b933:34a1 with SMTP id
 ca6-20020a056000088600b00241b93334a1mr17565403wrb.550.1669486137356; 
 Sat, 26 Nov 2022 10:08:57 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a5d668b000000b00241bc4880fesm6383609wru.111.2022.11.26.10.08.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Nov 2022 10:08:56 -0800 (PST)
Message-ID: <26f9ff51-b6ee-5d2b-fc8b-93f7778d99a4@linaro.org>
Date: Sat, 26 Nov 2022 18:08:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
 <20221124004801.361232-4-bryan.odonoghue@linaro.org>
 <4fd1500d-e3ca-45fd-1cc8-81783697b809@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <4fd1500d-e3ca-45fd-1cc8-81783697b809@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 03/18] dt-bindings: msm:
 dsi-controller-main: Rename qcom, dsi-ctrl-6g-qcm2290 to qcom,
 qcm2290-dsi-ctrl
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robdclark@gmail.com, robh+dt@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, swboyd@chromium.org, airlied@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 26/11/2022 14:36, Krzysztof Kozlowski wrote:
> That's a bit surprising. Did we discuss it? It breaks the ABI, so I
> doubt (driver/bindings were already upstreamed).
> 
> Best regards,
> Krzysztof

We did discuss it but, apparently didn't grep it.

I'll drop this
