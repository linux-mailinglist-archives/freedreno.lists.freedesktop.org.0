Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E094CC8D1
	for <lists+freedreno@lfdr.de>; Thu,  3 Mar 2022 23:25:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C161310E34A;
	Thu,  3 Mar 2022 22:25:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5323910E34A
 for <freedreno@lists.freedesktop.org>; Thu,  3 Mar 2022 22:25:37 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 k9-20020a056830242900b005ad25f8ebfdso5868147ots.7
 for <freedreno@lists.freedesktop.org>; Thu, 03 Mar 2022 14:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=W6b+sDlQ6fUC15y02viB9CBBs238nvSYgTbrXnSADxI=;
 b=i2VfhCwlYGuVKKwL2On8iEbyuLJyjQn2RZoPEiUYjw6HvvOnr1qNcHvsCi6NwL3w+Y
 oau/hrdWaWQwCpLO3mcfsYYwxfC4AXGtI8JB3sTnm8lZsoE7z3uI2oXik9/GeHNZW4GQ
 KBU77p6PVW4i8EQ+/ue+Mj1ZHXAesYbfQbVW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=W6b+sDlQ6fUC15y02viB9CBBs238nvSYgTbrXnSADxI=;
 b=OjtVUIhvZKVRRjuPngC9ifGcl7vVgvdI4fVSjigvnFMpuNRRoIJHm2OPORzgjMEGka
 ZbkpbABzvEpyATZ62ldzHU0plgqChs/+2RirkZALilLed3kwc8M34szwKQZJnc5kRMGg
 bhhE0Y0LdVSpCvhFZ11NMx+zZo6IQopiLA9ry7JN1i30vLK7+BXFlADHwhKRLQI1OFUv
 yXiBEj0HnUBnv4ikb8ro8UT09ki05Y6c5IXiKv7GshmAtsRiAWvdUQFAciU38KD8RQL8
 dOKdGTJjbP50FeZFhSI2c+oANWlj9t/vCNgLj2KqpAd2Fm+TqfEQlnToChAQgpnXR14O
 UzHw==
X-Gm-Message-State: AOAM5317P+3zEKsIFaNOoWTsrkWycIdZiaIef3H3PCe7xB+d1LTVDohr
 Q3FwId2Q7MNhI0XMtB3+aRvUVM9bD052w0FVdH11aQ==
X-Google-Smtp-Source: ABdhPJySDSyjRk7hKcrQxOwP82H8qzkkTjbRnV9lItUMyzxYwnq8G8pll8AB/Htj0HsykplhTrDx4gVGSByQP9iDe0k=
X-Received: by 2002:a9d:22e9:0:b0:5ac:1754:342c with SMTP id
 y96-20020a9d22e9000000b005ac1754342cmr20039488ota.159.1646346336645; Thu, 03
 Mar 2022 14:25:36 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:25:36 -0800
MIME-Version: 1.0
In-Reply-To: <20220217055529.499829-3-dmitry.baryshkov@linaro.org>
References: <20220217055529.499829-1-dmitry.baryshkov@linaro.org>
 <20220217055529.499829-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 14:25:36 -0800
Message-ID: <CAE-0n53Zy3BV3Z0A55Fo2vefndAKayPdUBfQy1i0BFj0cNMnzw@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 2/5] drm/msm/dp: "inline"
 dp_ctrl_set_clock_rate("ctrl_link")
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-02-16 21:55:26)
> "ctrl_link" is the clock from DP_CTRL_PM module. The result of setting
> the rate for it would be a call to dev_pm_opp_set_rate(). Instead of
> saving the rate inside struct dss_module_power, call the
> devm_pm_opp_set_rate() directly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
