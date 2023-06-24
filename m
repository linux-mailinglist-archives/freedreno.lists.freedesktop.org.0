Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F6473CA2C
	for <lists+freedreno@lfdr.de>; Sat, 24 Jun 2023 11:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E14810E18D;
	Sat, 24 Jun 2023 09:31:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FD810E18D
 for <freedreno@lists.freedesktop.org>; Sat, 24 Jun 2023 09:31:23 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-98df6bc0048so31205866b.1
 for <freedreno@lists.freedesktop.org>; Sat, 24 Jun 2023 02:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687599081; x=1690191081;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uwFIAccLIYNITGdMmhfyslt2bwDng0x/ZpNayYHghu8=;
 b=gc9/259HB7eikMHCQoNfzHBy/dycbEU/NjOFFnU8PbxsvPGyfNqoAKoAttafP2LK3K
 o8T887iu1nUWr8WHUlorPc2GkgFZqr90iFjwHQhPBsi2sF1sSxGB52kj4CmKlPDCq8BM
 9LbSM1ZwP1UK8Rl3mgeAq+IsMhGGArCApiHtotYKsX4U4up0ZEe9AnGqGORSAJmafl5M
 bpyubo+oVuadRCq3PFmiBKS/XJP3UBqd8FG+l06PHSS6AjgDQvzgQ7NXRzAqxLt8Hqy8
 JzWDz4sBifpXB99IaCL4BLgAR8765gFH3HZmDw32SGCMnXXJ3TcvvNyXRHLH6L50/stk
 fFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687599081; x=1690191081;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uwFIAccLIYNITGdMmhfyslt2bwDng0x/ZpNayYHghu8=;
 b=TjknnVcilpJfPVcTQ4Qw7+2DH3dnHwLgsFareijkAkxPtYpd4hb/rQ5mo67vbRmBoa
 GsJWyiLYHoK87akXtpTl7d0ke66piCBdiOy/kAlt7EuA4Jc0WZ7VATlk6SdwuO1yDHFy
 OrmnUpwRpvt3zqcM78z1Yib7+/VZO2h0VJDPF1o+pHmsxzgycGB5flgNFZpXfCkOREpN
 sx7KgaD1KdwphPe/Ezzi9DxHq1QL5IsDoBGWUJ675hbn+e/B5mc8jgQMkPLh4pbPKTp5
 T8fGMtUQ5K5/DddI/C0Lv+u/3n2QUdEYj8Aef9nRiU6Gv3ADcdp8Eudsf0PxKWnAEN14
 CjCw==
X-Gm-Message-State: AC+VfDzQg0+yzqrV87WcecE+V6aAs/Kn4VYfnrFn8tpL/npMuDGGswU+
 ZZnmQWQRCdhTUiIN8Ab7lryP9A==
X-Google-Smtp-Source: ACHHUZ7LC+7hcCDvBte5xgktiTToiRBYnv91b8Sj+cbLeoDMK97jXgfSs6kpS0Rkuj/xi6REicP9TQ==
X-Received: by 2002:a17:907:5c2:b0:974:55a2:cb0b with SMTP id
 wg2-20020a17090705c200b0097455a2cb0bmr21160376ejb.55.1687599081475; 
 Sat, 24 Jun 2023 02:31:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a170906229a00b00986bf50fe7asm699359eja.60.2023.06.24.02.31.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jun 2023 02:31:20 -0700 (PDT)
Message-ID: <0747247e-22ac-f798-6d95-9cd14fb24cb1@linaro.org>
Date: Sat, 24 Jun 2023 11:31:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-7-1d5a638cebf2@somainline.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230624-sm6125-dpu-v1-7-1d5a638cebf2@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 07/15] dt-bindings: display/msm: Add SM6125
 MDSS
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lux Aliaga <they@mint.lgbt>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 24/06/2023 02:41, Marijn Suijten wrote:
> Document the SM6125 MDSS.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

