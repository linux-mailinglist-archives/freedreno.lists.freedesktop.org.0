Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E633F578EE4
	for <lists+freedreno@lfdr.de>; Tue, 19 Jul 2022 02:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FAB71139E3;
	Tue, 19 Jul 2022 00:13:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571341139E3
 for <freedreno@lists.freedesktop.org>; Tue, 19 Jul 2022 00:13:18 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 o16-20020a9d4110000000b0061cac66bd6dso2123139ote.11
 for <freedreno@lists.freedesktop.org>; Mon, 18 Jul 2022 17:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=tcMPkgy5AkYVoz+3cfHB2slyw4qwE3dhd9DnPWhtJMc=;
 b=LLO39Dfu3dhAmJv6RF2nqh5TD7PjF/dptrPchH8NYHTaBeUmpa988m24WqNUmZ6mrj
 csCZTfbPCAg4mBav+WbY79TzDknZUQ5qLQ/DbNqRgOWzWuYrlP4Kt2OTH2BguR1fL6/N
 6UKFk98Y27/36eSRjwlMm9G4KZRPKD1p12tYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=tcMPkgy5AkYVoz+3cfHB2slyw4qwE3dhd9DnPWhtJMc=;
 b=og6tacwkmuKflPVqo/S9Yg42wHk/4yg8XX1HFcnqkGpXJ+Y9mmS4FmygfI2cO7I8bR
 8y75LShs1v37FFyW8yNVyvJqkeP9A0wkjeiQFRUAvzybgccFSCCUzO1X8jRXU+2SWdS+
 kKUjXo53OZMrH4pA0ciGrsWq0fRGr0+BRkAfoqmie+b87zBanf69+mFdvn7JN0vLt2cv
 GZ4kV2VpxErMWsUjjk4qloE4idzCpB7GL2rmrcAJhMDzSA6m7vprU8DIiB6iDkUEmX/z
 dh2df2pAp71SGdR5YwsYDurkQSi9ueyE0wgRDH/PwYhYyY2TsVbEqWT00GVIJR9rrxLu
 qy0w==
X-Gm-Message-State: AJIora/xKdIMWExzXA84vGCkXbeLKCpNlPVLDUSFBePTXLX/SRiu9AWu
 bp84ccLq99KfiwfwW7BAw4XR9MbdRV7QfzPwYopNOQ==
X-Google-Smtp-Source: AGRyM1vWi89aXjlaCd34r6iFy+/kWv2yYLIXV7zIq7RVPWxgUmLtiyM6+wg9JULu4OxUrtKaNySQPrm92VWaoteipX0=
X-Received: by 2002:a05:6830:1d88:b0:61c:8b2a:22b0 with SMTP id
 y8-20020a0568301d8800b0061c8b2a22b0mr7059089oti.3.1658189597554; Mon, 18 Jul
 2022 17:13:17 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 Jul 2022 20:13:17 -0400
MIME-Version: 1.0
In-Reply-To: <20220710084133.30976-4-dmitry.baryshkov@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 18 Jul 2022 20:13:17 -0400
Message-ID: <CAE-0n53ONeCzX5jAOmGACjgXqLGSSmsj1jY60WL4MhP0OfPrsA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 3/9] arm64: dts: qcom: sc7280: split
 register block for DP controller
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-07-10 01:41:27)
> Follow the schema for the DP controller and declare 5 register regions
> instead of using a single region for all the registers. Note, this
> extends the dts by adding p1 region to the DP node (to be used for DP
> MST).
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
