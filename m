Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E959917267
	for <lists+freedreno@lfdr.de>; Tue, 25 Jun 2024 22:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C07510E2F3;
	Tue, 25 Jun 2024 20:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="D9i6sIeV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B2D10E302
 for <freedreno@lists.freedesktop.org>; Tue, 25 Jun 2024 20:20:14 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-63bdb089ffdso47446637b3.3
 for <freedreno@lists.freedesktop.org>; Tue, 25 Jun 2024 13:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719346813; x=1719951613; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DALwJlK2ARCJSSDqUvIVUXkdGRcly/r/299uWG55Xls=;
 b=D9i6sIeVB73iIEkepQty7PEf9a1LTbBtm4YTz2UmFg3AC+iktqaCDLlZlzPUER7st5
 ufRTejDSVkRa1qadxC487B+5mml/6ciyz8EzvbTPOKmvzQTtK2nv//4fDR3koUjl8GVu
 uaf7vowjjZosV6aI0cpdSmD6TnRTpMglxGBTxrLwSPdoEnTOxpFcQtuqWF4tTnMFwrWE
 2pA2Cmd/hYaNeyEx4rTGy3cl0leCZiAfOSwkXg6LJz9xhyeSgxzhqnzmR0H0EWYeiEF3
 c8+bB7FQ1S7ZkW6ht/67qr792U+kjzq4CnXnliMpGwhfz80vUL6hdnD4j1L3Jn7dYvNx
 xrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719346813; x=1719951613;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DALwJlK2ARCJSSDqUvIVUXkdGRcly/r/299uWG55Xls=;
 b=BK/GW7+jEh1UbifLr1xmc5kjq8xhttMrWjKM7JNqQidh2hNeEx4qPRgA9PLJI4P9wS
 NGg1Ryd2pA09IWSWOWOI10iSG+hW3paKZEp8fhCL/XtptvEjYGaVHkhF2Be1vkgmzBo7
 hfZp837Zk/1hYkhd2n2pKrlvQ8LpQvE9fzLMgQGDeDsDXAp+mWZ6Ypf5Cre48gTAnX2z
 8wHXeVTp1xE5XdUmFM4dlUXwx8e2Zdnvp0zOlYtMHPy5634cQcq0MTHZYPvy/BXS7j6O
 fon454NJk+XGJ6+CAi8WpubPHLqNY0w+FvQYDNcAn+IyGlSSkiquQmyQsxG8mv6PGzTN
 iC/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjrxi89aWPuIGnXcH2m2RCCUK8s3XluO3K68w/sWXNLlXFPySIbFWkU/b8ErAAyIi2cecEYEColcXPUSnaMUonySEbpKmLHk4R+zPY+KAB
X-Gm-Message-State: AOJu0Yx+XvuHgO31S9k0G+CZlUXKyj1nZZWIqkN0lUEzL8JoDKAsO9tn
 NsbxW+2tfuCEe8M/DjoRV8sdmyvhacWHIG2uY5SsQuyt3F+hrECVt/Ymavt92lAqo3FeTry8ZpH
 zrQKf38FCi46tHcUhQf8Zf8wbfFJXy9/wfB2alw==
X-Google-Smtp-Source: AGHT+IHc1N8cdXnOekY/fB5EQn9UtYA0M5VUrWEfImUf2l5menZg5peEHCsjMvw2qLy6pLFOXbVvbc4dD7/Rh87mw18=
X-Received: by 2002:a05:690c:4905:b0:646:5ae1:b74d with SMTP id
 00721157ae682-6465ae1bb94mr47631727b3.48.1719346813387; Tue, 25 Jun 2024
 13:20:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240613-dp-phy-sel-v2-1-99af348c9bae@linaro.org>
 <bbdb8f56-4948-b0dd-55bd-ca59b78ed559@quicinc.com>
 <0ae0fddb-07f4-3eb9-5a62-0f7f15153452@quicinc.com>
 <3a5f68fb-2487-bda0-91a1-18ecd414937f@quicinc.com>
In-Reply-To: <3a5f68fb-2487-bda0-91a1-18ecd414937f@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 23:20:01 +0300
Message-ID: <CAA8EJppd8Vm5uGzzVofWoTpVkfxE5atv6VOt0WMUsu4oYP1UZA@mail.gmail.com>
Subject: Re: [PATCH RFC v2] drm/msm/dpu: Configure DP INTF/PHY selector
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 25 Jun 2024 at 22:28, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/25/2024 12:26 PM, Abhinav Kumar wrote:
> >
> >
> > On 6/24/2024 6:39 PM, Abhinav Kumar wrote:
> >>
> >>
> >> On 6/13/2024 4:17 AM, Dmitry Baryshkov wrote:
> >>> From: Bjorn Andersson <andersson@kernel.org>
> >>>
> >>> Some platforms provides a mechanism for configuring the mapping between
> >>> (one or two) DisplayPort intfs and their PHYs.
> >>>
> >>> In particular SC8180X provides this functionality, without a default
> >>> configuration, resulting in no connection between its two external
> >>> DisplayPort controllers and any PHYs.
> >>>
> >>
> >> I have to cross-check internally about what makes it mandatory to
> >> program this only for sc8180xp. We were not programming this so far
> >> for any chipset and this register is present all the way from sm8150
> >> till xe10100 and all the chipsets do not have a correct default value
> >> which makes me think whether this is required to be programmed.
> >>
> >> Will update this thread once I do.
> >>
> >
> > Ok, I checked more. The reason this is mandatory for sc8180xp is the
> > number of controllers is greater than number of PHYs needing this to be
> > programmed. On all other chipsets its a 1:1 mapping.
> >
>
> Correction, number of controllers is < number of PHYs.

Thanks, I'll c&p your explanation to the commit message if you don't mind.

>
> > I am fine with the change once the genmap comment is addressed.

-- 
With best wishes
Dmitry
