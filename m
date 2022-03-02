Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 444904C9A97
	for <lists+freedreno@lfdr.de>; Wed,  2 Mar 2022 02:40:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00B710E159;
	Wed,  2 Mar 2022 01:40:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC7F10E1BC
 for <freedreno@lists.freedesktop.org>; Wed,  2 Mar 2022 01:40:02 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id p15so474038oip.3
 for <freedreno@lists.freedesktop.org>; Tue, 01 Mar 2022 17:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=7r8DktoMMiU6kxZgUtdDfLqEPV/rwGM/wklZZcGwOD4=;
 b=WdqbcJlWPnIcq2+R/OIykf8Q79FLutQ0RbnFIsrAEpPLjz6XCU1oay5mqgDdvCJO8Y
 NZOPAE6HdrFggV3YuxmiHX1E1Zify14iFztVq+7HKMczhnlVrz3iIAocivmbdioHcHT4
 4CPih0Xbfoqhdwta56tEDFVEySyZanmiA7ftc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=7r8DktoMMiU6kxZgUtdDfLqEPV/rwGM/wklZZcGwOD4=;
 b=3emarKTtxWDBW0N/Vx3hawjLcbGeVtEifTW+AVHePVBydmK5V0ADIGa3iARZXSjVFv
 c9HIaymnbCb35ZHkSezdvklsBEqD/JkWxs6Nz7hunH1iHUUvtuRzl8bwDg2W7F/H/GPP
 x3XM6fh3TrqjhJbPrfUNW2L18dAyU2hGYwfxeWbM4qTwSSZvajmMI3rSGHfidwFleSME
 UddYBUzrmAc+aeJ6+y1JgY2R/ubBnDkWKTV+MSGn5ZjYSV4Id0ByJTsF2tKjXFjHO9iK
 ervsFuEkiI4ICKxo+mwtJnyaVgzHUDCfDQ4Dz4YL88FzZU2FFdQgMOBnNgflrBtlpwqZ
 aZaw==
X-Gm-Message-State: AOAM532MDz0zKtSpP348OSCoijkt0eU2aveXjWXCZK9S75wmf7CqqckZ
 zxHcbB60xD1Ig8TVpER1IVkls89g+bTmAPdApgPkCWMu0u8=
X-Google-Smtp-Source: ABdhPJz4RH+Hn9px5XpnHBpdIX3jYHmWz/PqejcAlUI+/KcKmgS9mOVXw0I7Y3pQHCbvaFV4ZDAd2OxUfohCVeqYf1U=
X-Received: by 2002:a05:6808:20a7:b0:2d4:d2f1:9edc with SMTP id
 s39-20020a05680820a700b002d4d2f19edcmr15561879oiw.64.1646185201756; Tue, 01
 Mar 2022 17:40:01 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Mar 2022 17:40:01 -0800
MIME-Version: 1.0
In-Reply-To: <20220302001410.2264039-1-dmitry.baryshkov@linaro.org>
References: <20220302001410.2264039-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 1 Mar 2022 17:40:01 -0800
Message-ID: <CAE-0n53oEDNsHnmZJp7GuAM9t-50dnQ7M2fhRGhQbeZ=R8M1tg@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RESEND PATCH] dt-bindings: display/msm: add
 missing brace in dpu-qcm2290.yaml
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 Rob Herring <robh@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-03-01 16:14:10)
> Add missing brace in dpu-qcm2290.yaml. While we are at it, also fix
> indentation for another brace, so it matches the corresponding line.
>
> Reported-by: Rob Herring <robh@kernel.org>
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
