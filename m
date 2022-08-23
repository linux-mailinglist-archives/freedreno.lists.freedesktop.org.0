Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B1D59DA99
	for <lists+freedreno@lfdr.de>; Tue, 23 Aug 2022 12:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3BAB310C;
	Tue, 23 Aug 2022 10:22:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0136B30C8
 for <freedreno@lists.freedesktop.org>; Tue, 23 Aug 2022 10:22:15 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id l19so9913686ljg.8
 for <freedreno@lists.freedesktop.org>; Tue, 23 Aug 2022 03:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=kW7te9++6zj/2sA/1JFiFaJwC/VuRhhQ3+OUD8QzdyQ=;
 b=N+3+nblwaKvranNQu5ZLkFEJVD0V8Kh5L1aCicV8oOG4puiJizV9xHY/vNdRlz/YCM
 JD0EzOieszeOq1Ev/NFpfYlgnlK6Q1vWCk5MK2sEAD0SvuS2evY3mpagh+yDJIL3HuQK
 1fDkSspBXg4AFXl9Jp5mD6W1pWHY+/k2SEhbvjj0aXFWSxGPQvj5i610itPmlpXif0il
 qe+p/TmU75rvtSRUAybCkAXGRsUwALRO/hKj18XGoLgB31yMBvFTv6w+92VA3eRl6ix9
 RvPGkGjgwWdaZPNV3KuoVHBpcqMxMB/3nmcH8mgmKSnlZlhK/gmVh9bpnINTkDzs7ReY
 oUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=kW7te9++6zj/2sA/1JFiFaJwC/VuRhhQ3+OUD8QzdyQ=;
 b=tM4UwmoNmlVenUo8Dw3N6m9RR7b7FWd1Xinqiw8AkbaNqLrTBmh4QTb3auEJqpV8w1
 IsIuj4jYWXWxxK88DRbuetAaYQY3cWZZSTUULxlAewmfQoqWqcWMI/Xy0a7U7OT8Yzy9
 kIVwqfYhRhh30EK85nigHb382SUwdPDlfdZqJqpi6+InTfkwo8f9jeYkGE2d7MHvCeGg
 PoGt+fL2n8AxCiy2UPaqQ6l/NiUalJna+DygDWMM56qbnkdGj3gu9PQxJ9AvrM+mC9io
 aKqfOiqy2yuaevcdcpqrZTb2mkXcJ78lPVYNvP0fZW9H3PRYuP2uKusc0MmxcwZUwwHf
 7Mtg==
X-Gm-Message-State: ACgBeo0m1PzxuEnwdn78tTuJGb+M64oWRtx77P9zYoXXDgkjh2OMpYiO
 YlrgrDTuR5AzV32eaXjQ/WVQNg==
X-Google-Smtp-Source: AA6agR4lvtDEQD5n2gZcVUqeIv4vFwxirf/UExZM2GSUkocuDpW/zvL/LU5ea/L5NBX6eKujEc1qpQ==
X-Received: by 2002:a2e:b8d1:0:b0:261:caee:4049 with SMTP id
 s17-20020a2eb8d1000000b00261caee4049mr3186459ljp.405.1661250133956; 
 Tue, 23 Aug 2022 03:22:13 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
 by smtp.gmail.com with ESMTPSA id
 bg11-20020a05651c0b8b00b00261c6342636sm220772ljb.14.2022.08.23.03.22.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 03:22:13 -0700 (PDT)
Message-ID: <e810c877-82a4-c9ef-5f63-c22c246cf340@linaro.org>
Date: Tue, 23 Aug 2022 13:22:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220822191138.316912-1-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220822191138.316912-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] arm64: dts: qcom: sm8250: move DSI opp
 table to the dsi0 node
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 22/08/2022 22:11, Dmitry Baryshkov wrote:
> It makes no sense to have the OPP table for the DSI controllers in the
> DSI1 PHY node. Move it to more logical dsi0 device node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
