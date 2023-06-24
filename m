Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8C373C9E6
	for <lists+freedreno@lfdr.de>; Sat, 24 Jun 2023 11:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7064810E18B;
	Sat, 24 Jun 2023 09:11:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2EFD10E174
 for <freedreno@lists.freedesktop.org>; Sat, 24 Jun 2023 09:11:19 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-98de21518fbso52290266b.0
 for <freedreno@lists.freedesktop.org>; Sat, 24 Jun 2023 02:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687597878; x=1690189878;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TB9IHENJDTgP3/+RgmCR40mbzefHRkoxy0VpWnLxklY=;
 b=grwUtLESlVNXp6uim+dHlAYHJFBXetSUjezL5bHBZaNCN4WHItbgPsVqVEFsjYN4Rt
 2BAB2zpWJwRo9UEqMnSqwJkUbanLf/6B1TSOZLeZ8UfKg2TvccWv5R4eHxIvn5z24DMl
 qk+juz7k5H9qq5p8oUhdEvxEClDedMtrUTeu1djwzyeMCx2QWE5ZyGXJqSF4iB+D7sFM
 IorPe6SpPqO7N3InbG456FHlrS70BkvkEJqIrsMdwpNPXQoILbm6jRlrMgiKN3OppCZC
 39cqq4zhyC9Ea/FvFTODLTojMQmM0Ft5CoePsTengl0SjhapGJAjF1w5j8Ao5uvmcgWP
 gmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687597878; x=1690189878;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TB9IHENJDTgP3/+RgmCR40mbzefHRkoxy0VpWnLxklY=;
 b=QVSK/fFg5rAZ8b0F0nAXCn3ACCyF/1F16We5O7Pbvrwtmg/qrzw3nt57/RbQruMiWI
 ZWaMUc74vKVe2XF+sfQ+UYD76GO2YZcpEKPHj+e5M217DkWS/SLkFB3ip4MJG+88Ucr3
 Zp37zTdhCgdYwSK8cPqYQw51iKFAr3vP9FQRLzVd0NLBM7IsKGCOkUAnfynjQyCYBaVF
 ul1LpRY3dmaEV9wakbxMiCQb8HoJhe+ulYIGqDlSXxdADNvfAmIvLAsGJ+M5OjKinFVI
 GCmHhXdmRrFHH3QSJXJhMRiHexx6FEE4twDQm2rCi2L4M1YTKkiB3QPv/1JMR5Ox13ro
 apsw==
X-Gm-Message-State: AC+VfDyTXr++yBKPqe506NilxYg6liCBHf7bXUbPG3+7tUF2fGSwzHKc
 IC0EwklrZRosXJCdtu5FiRHpFw==
X-Google-Smtp-Source: ACHHUZ4TP0Vdg3BKzhJVTx8ptKa5/v9jsxLjJ+4KkREwbvl+gOjJuEvoSK1K+Qjdqw+DMfHimDsPFQ==
X-Received: by 2002:a17:907:7293:b0:988:84e8:747c with SMTP id
 dt19-20020a170907729300b0098884e8747cmr15007406ejc.32.1687597877906; 
 Sat, 24 Jun 2023 02:11:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a056402064a00b00514b3dd8638sm455576edx.67.2023.06.24.02.11.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jun 2023 02:11:17 -0700 (PDT)
Message-ID: <f880e10e-080e-4c80-4faa-fc2c0e62f260@linaro.org>
Date: Sat, 24 Jun 2023 11:11:14 +0200
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
 <20230624-sm6125-dpu-v1-5-1d5a638cebf2@somainline.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230624-sm6125-dpu-v1-5-1d5a638cebf2@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 05/15] dt-bindings: display/msm:
 dsi-controller-main: Document SM6125
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
> Document general compatibility of the DSI controller on SM6125.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
>  1 file changed, 2 insertions(+)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

