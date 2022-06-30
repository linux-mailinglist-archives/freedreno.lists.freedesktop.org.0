Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6314562269
	for <lists+freedreno@lfdr.de>; Thu, 30 Jun 2022 20:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F02B10F68C;
	Thu, 30 Jun 2022 18:59:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDA010ED9F
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jun 2022 18:59:07 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id ge10so40781807ejb.7
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jun 2022 11:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4q21ggPdTyeit3h5q0XZaKPf1WMDwmb/exUUFTFO1os=;
 b=Ccf9ma6E9UX3J8fQ3Ht1TewapbhoTIZR4BXkKnLYPdFBaJSW1ynJ06icNRRKF2dxgZ
 lmfzm/0MWjIQ3xSjA40Swp0uVjdLdgCD2dhndiGiqWgSzc/BAJVvrN7p3OQuERLKtPIh
 t6rsj9gCvH/MMYwXnTVDXeBHLzFx0TM2LuefZoLVEcUJFEXxKTbYAZmcnno65TyJXtbb
 /zwcoLzD0V+MgwherN5IypUJazdEa77OLJa+rvgClPgSCRh0XmwTx3ZyeQ7p15b/hWOy
 eHAyiQTf9rmC/VTYkVAdQfY2KO46iT07qTdPGJlYeueYwi2EwXfo5xg3hdNVft8pmB9Y
 Zh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4q21ggPdTyeit3h5q0XZaKPf1WMDwmb/exUUFTFO1os=;
 b=4joiayXBVO9Gyy0soKhF8faPGhXnggWGX9eVX5qv9FR966Ld+WojdPnqwCLNmAqD84
 M0RHPG4fiOob+94K12caX8E87qQm+gNIR05+G43F9FXTNX14Ky55nwd6ZU9xdXZK6MNo
 Ou+q08PTBJ44wfgFtmPGicSrFgAspcntslNxNs5HTtzS4Ue5oydvFi+St5NzHDdkmaRv
 mIjT//GVPxiqsM5s3gi5k80ASdu8rTOEwPIxR2Z1bw/+jofqP/ibvLZjxDccBxGadhhx
 nUpcq+4Elwn8Iraqoox2CHVOXmGhuA7YNZxVyRgMHbdXbSaugnBuL4aegP1hNOqHvEMU
 oq7Q==
X-Gm-Message-State: AJIora/LgqjU9n/rjddJNfdWlB9UI2Wq6ZaZujNSuSHuvu2YOYAOY602
 NB503a1hLqhhWYuqBRgpnW06Og==
X-Google-Smtp-Source: AGRyM1uE64dtWtGZMbzHs6M6S5fYap/RCGHDO9B10pekIM+vwNcayRqVPfpHlkOeAiMbW59r9xjd2g==
X-Received: by 2002:a17:907:948a:b0:726:f3d7:c7d6 with SMTP id
 dm10-20020a170907948a00b00726f3d7c7d6mr10467497ejc.2.1656615545858; 
 Thu, 30 Jun 2022 11:59:05 -0700 (PDT)
Received: from [192.168.0.190] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 i13-20020a1709061e4d00b006fef51aa566sm9414673ejj.2.2022.06.30.11.59.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 11:59:04 -0700 (PDT)
Message-ID: <ff3caa0b-a248-d5ee-a3e5-c49fc41b8cff@linaro.org>
Date: Thu, 30 Jun 2022 20:59:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-2-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220630120845.3356144-2-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/7] dt-bindings: msm: dsi: Fix phy-name
 binding
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
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 quic_mkrishn@quicinc.com, swboyd@chromium.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 30/06/2022 14:08, Bryan O'Donoghue wrote:
> The driver doesn't care about the name of the phy in DTS. msm8916 has since
> 2016 named the phy "dsi-phy" with later SoCs taking the name "dsi".
> 
> There's no reason to have a constraint on the name here, simply to have a
> name. Remove the redundant const in favour of maxItems: 1.

For single entry the names field could be as well removed. But if it is
there, let's make it specific, not generic. Therefore instead add
allOf:if:then restricting it per variants.

Best regards,
Krzysztof
