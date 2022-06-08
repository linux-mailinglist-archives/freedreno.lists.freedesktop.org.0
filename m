Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7ED543E25
	for <lists+freedreno@lfdr.de>; Wed,  8 Jun 2022 23:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6622F11A2F6;
	Wed,  8 Jun 2022 21:04:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF7711A2F4
 for <freedreno@lists.freedesktop.org>; Wed,  8 Jun 2022 21:04:48 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-fb1ae0cd9cso18191525fac.13
 for <freedreno@lists.freedesktop.org>; Wed, 08 Jun 2022 14:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=76kDmXTl6n20l0N3wMIAHBopXj92kDXl0aNreW0xlog=;
 b=ACuv6dIrKUhatTPgkh9ihw4JDfAtZuexalyvUFBehcn/g+w/cHWDoutvKBlHUMd2kw
 peSHMKjHkNUiammMRf68xcZ2JmCc/DhEmaL6TiakXagb0GPM5zat5pp83dPEot/afrw1
 N2gj2q2+Wy8zKbhtuhcf7H9z2iAhobZcKb7GM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=76kDmXTl6n20l0N3wMIAHBopXj92kDXl0aNreW0xlog=;
 b=6xiXDEG4Cv/sb81dbon0m22yvu5PgYK6R9Yfu1EhAnjl8ndKqyB4w/hKIuIu1IUTih
 BtriPJ5g5Va5dZjD+0DDTtoVqn+JgQzrzBtuGZ8fHyNpsGWOnEAjnjIrSBvNofw3YLdV
 ntWUevSaH28NCmF3Kbe7ehhP3m4EkCX68w/HztoYpa03WI4TyrJxVsx5oBfe+sBknS+g
 Qttaj7jjPRnPQ5a051zvzYOSy+RRI8G3qvwnWuF7nG/ryq3BvDB71ECuC4njK6jXRQ8v
 S3/2igD5dIKjDr+0hlnShLXw5vsx7mCcGHlK2NPlQ49tBuFje9y0T8CM0O75t7kB2h5F
 USTw==
X-Gm-Message-State: AOAM530UeZrtwOdq4Mu0olL4nLmFbb5ee1QA2RJciEsORPmJVP6uGYoE
 uAJoRRwBIKdfQo0/91Uk8HYFFVl+t8UFLNz6eqSOWg==
X-Google-Smtp-Source: ABdhPJx5QgouVrnNVjSRQ5Ti8tygKWrwahuC3IBuZEnkG6Id6JLff5As9nN3YO6dFQR/ervQ0uOSDKBZDydn+sTQqj8=
X-Received: by 2002:a05:6870:240d:b0:f1:b878:e97c with SMTP id
 n13-20020a056870240d00b000f1b878e97cmr3386036oap.193.1654722287412; Wed, 08
 Jun 2022 14:04:47 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 14:04:46 -0700
MIME-Version: 1.0
In-Reply-To: <20220608120723.2987843-12-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
 <20220608120723.2987843-12-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 Jun 2022 14:04:46 -0700
Message-ID: <CAE-0n536e0+huMmmiBaXMZ4v_GiOYfrEh6Zp1b5piLpv4WMogw@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 11/12] drm/msm/hdmi: reuse MSM8960's
 config for MSM8660
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-08 05:07:22)
> MSM8660 requires the same set of clocks and regulators as MSM8960. Reuse
> MSM8960's config for the MSM8660 (8x60).
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
