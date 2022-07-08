Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7217256C120
	for <lists+freedreno@lfdr.de>; Fri,  8 Jul 2022 21:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F8410E256;
	Fri,  8 Jul 2022 19:51:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0735310E256
 for <freedreno@lists.freedesktop.org>; Fri,  8 Jul 2022 19:51:48 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-10bffc214ffso19813831fac.1
 for <freedreno@lists.freedesktop.org>; Fri, 08 Jul 2022 12:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=/gjPq+VtGqMyAx5uOhmiX/uYDdGj2/BayEk8UBg9x5U=;
 b=EMlmWFkf2LyyZsQ5T1TsVdwR8rDVGGi3xwaulrUugfDD6FWcRkZvti0JpiRvGrz2rc
 ugAb9GSwRyIUafQaLitKKtGSTwVYwPQ32cl2bg1KM/kaBM7zQ8k1poRPWCk/qaXdx1lN
 hLPD6MSbtz9+I0C+57durvBHXqAK1oScchki4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=/gjPq+VtGqMyAx5uOhmiX/uYDdGj2/BayEk8UBg9x5U=;
 b=71zQV7TH6/M02ReZwadHeZjJLf1kGZcqgTyWcyhDGDa4plbxptXBkLRHXL5UEWO6nW
 NXO0D3PlznNcKOexDPjl/TXKkZDQWkwAnvuWIqS6LKGS9hWyx298d48EmtYxltgQGu8O
 bQG0qeN4MD/yTcDrX7fFZRio7fzMmjOfCBhOAi5PZIJK2vRb7n8Apc7YIV6cvDTQcbdt
 MzEDX3cArReBHKj1JpHgCSDwIoy/0qt97qfuqjgbY1ACY/bq5lVr2oe7UtJFGNtuYH7b
 e/lTB7WbnJTYFmaKsrvPGL9FYYFapHzQYYFgwzL7dMdVTRV+fh/gkEaXi3BzWKRofQ3B
 pT2Q==
X-Gm-Message-State: AJIora94pPSm7ueTGMLINcfe3tBYu5uR5Ay7qaO0dnJSsDt8Wp/kZnBk
 PfLUT7P0ZVICEU36xVT0l0jHAivJYceaWhOUaR6bcg==
X-Google-Smtp-Source: AGRyM1ssYBzg3aw7EgpsvaBBCDRNrYkf2xVI0tLWP0CzvvlIHFIxz3sX3z3EmX3zGt2Lb4rzOjeEU3+B74yyqCcdFnI=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr942418oap.63.1657309907213; Fri, 08 Jul
 2022 12:51:47 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 Jul 2022 12:51:46 -0700
MIME-Version: 1.0
In-Reply-To: <eb22ae44-b347-1566-939a-4ca840688f07@quicinc.com>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
 <20220707213204.2605816-2-dmitry.baryshkov@linaro.org>
 <CAE-0n53zV2OjXxjJ_AwCDcAZvOY+BU0-xipxQkup3muHMRCPXA@mail.gmail.com>
 <b8ee5a03-1168-d5ca-97fe-f82a9d7e453e@linaro.org>
 <CAE-0n52YGDOSZpL+3d=_APsOwVvrJG7uR-x1AcsBej5KrDct5w@mail.gmail.com>
 <eb22ae44-b347-1566-939a-4ca840688f07@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 8 Jul 2022 12:51:46 -0700
Message-ID: <CAE-0n51YV7Oo1HSsoyL-9F=h_wVZh210cScB55qLDD9CM2vXKg@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 1/9] dt-bindings: msm/dp: drop extra p1
 region
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

Quoting Abhinav Kumar (2022-07-08 12:38:09)
> + kuogee
>
> On 7/8/2022 12:27 PM, Stephen Boyd wrote:
> >
> > Yes I see the same address for P1 on sc7280. Maybe it's a typo? Abhinav,
> > can you confirm?
>
> P1 block does exist on sc7280 and yes its address is same as the address
> mentioned in sc7180. So its not a typo.

Thanks!

>
> Yes, we are not programming this today but I would prefer to keep this
> as optional.
>
> I did sync up with Kuogee on this change this morning, we will check a
> few things internally on the P1 block's usage as to which use-cases we
> need to program it for and update here.
>
> The idea behind having this register space listed in the yaml is thats
> how the software documents have the blocks listed so dropping P1 block
> just because its unused seemed wrong to me. Optional seems more appropriate.
>

It doesn't sound optional on sc7180 or sc7280. It exists in the
hardware, so we should list the reg property. My understanding of
optional properties is for the case where something could be different
in the hardware design, like an optionally connected pin on a device.
