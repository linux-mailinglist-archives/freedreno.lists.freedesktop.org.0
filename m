Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EA359CED6
	for <lists+freedreno@lfdr.de>; Tue, 23 Aug 2022 04:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0333B90707;
	Tue, 23 Aug 2022 02:56:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3CF11BC2D
 for <freedreno@lists.freedesktop.org>; Tue, 23 Aug 2022 02:55:57 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id a133so6748176oif.4
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 19:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc;
 bh=T+S/nKyRsVKnDI2NI2XWxFbudSWc5/W62WtWCj7xI5k=;
 b=FyTH6s+w0NZh2OcFL16yY9rrPwgEsLeMGuckTfZFJvUpiQgZhvKwNJDT6oZiYYI1Z6
 ahxK6O/w05oVFZ4wDew/xvyytGyxYN+aSDywQsmGUSyGn5wO+1YdQUKE/fCXgrv+Mdeh
 DuW/vVKva1riddVn6fvIhACtHvxgTngeF1ltc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
 bh=T+S/nKyRsVKnDI2NI2XWxFbudSWc5/W62WtWCj7xI5k=;
 b=K2PRSxsFh4BhQPk7SLZgzltVN6ICo9dMSVS6XsR/U6UAUdORUEqgVf/e5C6ylvwh8H
 IgJugdVGJy7jXh2+GzNTWcuWnQaP1dDg35H/z0YStrkWln+beLNWO3HjAdNB25Ouukap
 YSU+EI2NrWG1YmD1Q18OwuIgbVL5icDP8FbP8210TgWUJ9kkpACAoJkbf58qUbyV8Q8c
 tsCbUkQJ8OUGYkN3wj3h8Fe4k7o17rg8YamkGR99kFijeRYf2HBaxVa1qf9PqryOntk+
 wzJNsy7uM1KOxVr1Hnh1cVJCmba2BvHIr4TZ2OGGsLOdfJVa7PF6XuRvdZgeymP8k44i
 y8iw==
X-Gm-Message-State: ACgBeo1ou4Nplua4wnZQwiVFt97yYtnssTGyjfgyWPiAHduN5cfHQy4y
 S5LyJ2XllBE9K+cF3D9Vl83CJn39rNgVUvaxX1vePQ==
X-Google-Smtp-Source: AA6agR5B1RXiqU24b10dVaT51Y2w8Tu58T9a6cri/gxITu0yRHhbmrCSL4kKosa2BPr7V6Lbpg9/mCneKS0FOSLLrzY=
X-Received: by 2002:a05:6808:1142:b0:343:86a0:dedc with SMTP id
 u2-20020a056808114200b0034386a0dedcmr510821oiu.44.1661223357058; Mon, 22 Aug
 2022 19:55:57 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Aug 2022 21:55:56 -0500
MIME-Version: 1.0
In-Reply-To: <e9760ee4-421a-5c87-4370-50262930aea1@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-9-dmitry.baryshkov@linaro.org>
 <20220711231638.GA449827-robh@kernel.org>
 <e9760ee4-421a-5c87-4370-50262930aea1@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 22 Aug 2022 21:55:56 -0500
Message-ID: <CAE-0n50OhC=+twQiei8fdXjCAV_XpAW-7N2zDFQMu9Vx7Zyy+Q@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 8/9] dt-bindings: msm/dp: add missing
 properties
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-08-22 11:46:39)
> On 12/07/2022 02:16, Rob Herring wrote:
> >
> > But this is the wrong location for 'data-lanes'. It belongs in an
> > endpoint node.
>
> I rechecked the existing device trees (sc7280-herobrine.dtsi). The
> data-lanes are already inside the main dp controller node. I'll take a
> glance on fixing the driver to check the dp_out endpoint (and update
> existing DT to move the property to the endpoint node), but to make
> schema compatible with the existing device trees we'd probably still
> need this property (which can be marked as deprecated once the proper
> endpoint property is supported). Does that sound plausible?

It would be nice if drm_of_get_data_lanes_count() took some port and
endpoint number instead of a node pointer directly. Then you couldn't
mess this up as easily.
