Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD655B4F2C
	for <lists+freedreno@lfdr.de>; Sun, 11 Sep 2022 15:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D7810E471;
	Sun, 11 Sep 2022 13:45:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B63F10E471
 for <freedreno@lists.freedesktop.org>; Sun, 11 Sep 2022 13:45:47 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id e187so2985190ybh.10
 for <freedreno@lists.freedesktop.org>; Sun, 11 Sep 2022 06:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=5HqIOcG8x4likLdUFYhKV2vDY9FYKtBGRhEqTmUcrsY=;
 b=S0L2CvFshXTcGx2gV46rtMsvefTjoiczN+TXYgfWm41bgtY5+1jOsw23Zi37N3K9xE
 aA8oemxSJ8X44ndvDESNHxSgYaNeJ7mTyK/aBqONVba0zXB5J2mORlp/g6atZvc8N1Mb
 pfJPM8bY+vqXL5sIpUA9OZk1TvH7z/LBReR+5OpkdsnvDD5LPw4a0Dz5vWOfcbssPthJ
 jPy4+g0+7UGuUZ7leUeqENKSWArOTdfzeVt0Ta8cDtnKhGhgDl8O43G8pmbzi1veftNs
 ihWjWQW2XqbphhnfvFev+xbJsd3vzfxS6HPhACJsORvpF26WEIJie9CdMYt6fEJtk23Y
 uNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=5HqIOcG8x4likLdUFYhKV2vDY9FYKtBGRhEqTmUcrsY=;
 b=QbHWD354vrw3uO6/sOB/M7prtKaFGVKIxeSF+snb34jFOCdMH539/PZUmtYIome80u
 n04uQ4oUJTVLVZixcYYqLc8PJRpjoJ2kIAOFWuKRWF8AKmuFlzMJYgEHJdwIuAJ0D8h2
 KrtZdSXlFBZ/c82EfK2h6nvpshY3YMj/f6GvmFiEfNgQRvxGrBi540oU+f8CsE3Uc3Wg
 XLbvTbOCeBFmXX/fYLvOEa0dzKDy0U/XM1wMgn0OVMoPZN88ksvYECO9ks82r9/UPsA1
 c5W1ca1EOyDjXb55oFuYF5XFH+/3R6nrgFmG9eTLVzM2L4k8dk54GZDmWaFNnBWtzgse
 DUKg==
X-Gm-Message-State: ACgBeo0TIc8mTf4vZzfDEMeJlsIQuBU9gDVVAyPfeVKWFn06y1+7ENXk
 3Tg9Cfg/CgXWBpAsGLnvNSKqwpmi7D+CCt27DJEBmA==
X-Google-Smtp-Source: AA6agR5b3srfz+0UXFR6VD9/hRFnzkydunMZcHEgtygrOZCAfrlPx9UUN7wz0ndz1t7d1pWP7P7GK4PEl9YOqEl2K/0=
X-Received: by 2002:a05:6902:1029:b0:6af:2c99:4630 with SMTP id
 x9-20020a056902102900b006af2c994630mr696449ybt.516.1662903946156; Sun, 11 Sep
 2022 06:45:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-2-dmitry.baryshkov@linaro.org>
 <3e525135-d205-eddc-ff2d-98c8321386e3@linaro.org>
 <20220908193705.GA3002673-robh@kernel.org>
 <1ebe64a3-fab9-1dd7-517a-01001a176d9f@linaro.org>
 <CAL_JsqLkV_fnUnc4cS=cdTvP3rKYAS011_+KZYiBGhXDx-pHnA@mail.gmail.com>
 <2204eab4-b22d-8ee7-4595-49139cb387a8@linaro.org>
 <CAA8EJpqHL-gO=zSG6Ek=-y4njGF5R66z0MwLeKZ9U4Ag1j51Og@mail.gmail.com>
 <e7a132e7-a819-ebe2-e6e5-c01cbfacef15@linaro.org>
In-Reply-To: <e7a132e7-a819-ebe2-e6e5-c01cbfacef15@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 11 Sep 2022 16:45:35 +0300
Message-ID: <CAA8EJpoPPRAQPfVQmSfrrDrroMp0bzvJ=-vHMRx72aKTBgPOTA@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6 01/12] dt-bindings: display/msm: split
 qcom, mdss bindings
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
Cc: Rob Herring <robh@kernel.org>, Loic Poulain <loic.poulain@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun, 11 Sept 2022 at 14:27, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 10/09/2022 14:54, Dmitry Baryshkov wrote:
> >>
> >> However I think there is no such problem, as Dmitry said, that ref
> >> changes anything. There will be always failure - either from parent
> >> schema (using $ref) or from device child schema (the one which actually
> >> misses the property).
> >
> > Initially I stumbled upon this issue with the dsi and dsi_phy nodes
> > for msm8996 devices. If I have $ref here, dsi1/dsi1_phy nodes will
> > emit warnings regarding the missing -supply properties despite nodes
> > being disabled. If I use `compatible' here, the schema checks pass.
> > Thus I'd prefer to leave `compatible' here. Not to mention that it
> > also allows specifying a tighter binding than just using the $ref.
>
> I don't think we understood each other. I claim that error will be there
> anyway, just from different schema. So your change fixes nothing in
> total schema check...

If the node is disabled, there will be no different schema check.

-- 
With best wishes
Dmitry
