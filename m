Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED143543F80
	for <lists+freedreno@lfdr.de>; Thu,  9 Jun 2022 00:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7427B113D00;
	Wed,  8 Jun 2022 22:59:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B704113D00
 for <freedreno@lists.freedesktop.org>; Wed,  8 Jun 2022 22:59:03 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id k6so13569832qkf.4
 for <freedreno@lists.freedesktop.org>; Wed, 08 Jun 2022 15:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=X9hlImzyEvBxvl0tBCS9rvUZQGqdth4+UM0LIHHP/pc=;
 b=qY+gKBjBgfP092SAeHRL4sRZ4XAGmRJK1yLkZ/bIXSH/CnhFAyg+dNJ030tm5BNXgY
 TWxVnmD/BONZSUFczbaTBBCNtSp928utbjynS6qnIUN/xy85AKs3cszkXM9LyiC/sYj6
 jCzurspWKF9AlY4lYaRMsKgA84iKor9D6Hju7E1YDwWOANaC6ybTVvH57QV7jwJTsg2E
 sYIdnfADedR6+Olp0fJsePKCT4W6FYPi6XRmDJousdkgkZglntONzt1ERrtGIrFLGtkl
 76ByOL8Br1PGC//d1JhvdrbsheodSJH9lTJ+jUCTqFXlVrQQ54dTWKDxBMxEXU0OW/7b
 zt/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X9hlImzyEvBxvl0tBCS9rvUZQGqdth4+UM0LIHHP/pc=;
 b=d7ip4fo00GdM/XCfX3G6wcM+2+3FJ6ySTK+2+SdeUnNmCbGcUzljIWzwvN6lzq7f4q
 Vw2tQydCJyLUMwweH9idd2dG4SssKzvp0au+7F3k9sYtE9T3+R0e8aLaTKNCEtSyrrw7
 NGwlnnrEObXl7AGZhzwgzQT+4mp2PUOLixFFBN9X2gjwxro75i58LEzAhNecPkcK4BA4
 S2FujG80NVTfI8UDfq2Js3nh9WwRhY5IucSU0KNDLbsA7H3MBbP3orjlIwf2iQq+dCrW
 R/fYRyVfAzrc8HWXx+luQQ94wFjuErVEv9uj7vtH9NlCX5xWXk45NTJilaEJdH+bOcJ/
 OCzQ==
X-Gm-Message-State: AOAM531N5BgPsa9cSxUKY0K0C7m7wIAXuPfZ9an3CQSZF7DEmpGUgNgh
 GGOrwNkY1IJIBIUMQOFBF3F7VWBxLYYmD/kyP5R4kw==
X-Google-Smtp-Source: ABdhPJwloqlLrxryB81tH2mmTWtotD1MwJqZdjuhJ822FbZIJ5roIbw1TX8CMKFMm0yFALwyZTgjVd6J1q7pOTTD9Ls=
X-Received: by 2002:a37:a83:0:b0:6a6:7e4d:41dc with SMTP id
 125-20020a370a83000000b006a67e4d41dcmr23472964qkk.59.1654729142674; Wed, 08
 Jun 2022 15:59:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
 <20220608120723.2987843-8-dmitry.baryshkov@linaro.org>
 <CAE-0n517WyGbmN86=q5Qx06ektgKFNdY1N5fgkH7ZM6AhGJ+9A@mail.gmail.com>
In-Reply-To: <CAE-0n517WyGbmN86=q5Qx06ektgKFNdY1N5fgkH7ZM6AhGJ+9A@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 9 Jun 2022 01:58:51 +0300
Message-ID: <CAA8EJpp5OzD+GXosia=O87AThqCEA8jAV9fCxRhQ6FnLck8fyA@mail.gmail.com>
To: Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH v2 07/12] drm/msm/hdmi: enable
 core-vcc/core-vdda-supply for 8996 platform
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
Cc: devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 9 Jun 2022 at 00:02, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-06-08 05:07:18)
> > DB820c makes use of core-vcc-supply and core-vdda-supply, however the
> > driver code doesn't support these regulators. Enable them for HDMI on
> > 8996 platform.
>
> The 'vdda-supply' name makes me think this is another scenario where the
> phy isn't powering on the analog supply when it should be and so the
> controller driver is doing it instead. Is that the case here?

Good question. There are different HDMI pins on 8996, with slight
disagreement between the schematics and the datasheet.
vcca_hdmi/vdd_hdmi1: 0.925V, Power for HDMI circuits =E2=80=93 low voltage
vdda_hdmi/vdd_hdmi2: 1.8V, Power for HDMI circuits =E2=80=93 high voltage
vdda_hdmi_pll/vdd_pll3, 1.8V, Power for PLL circuits

I'm not sure which are required for the PHY and which are required for
the core HDMI. However I'd note that we have a generic tendency of
duplicating pins between the HDMI and the PHY devices. Compare this
with 8064, where core-vdda-supply is also used both by the hdmi-tx and
hdmi-phy devices. I think we unify 8x74/84 with 8996 and allow
powering up the HDMI correctly even if it results in duplication
between the -phy and -tx parts.


--=20
With best wishes
Dmitry
