Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F826513DE5
	for <lists+freedreno@lfdr.de>; Thu, 28 Apr 2022 23:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B1610E770;
	Thu, 28 Apr 2022 21:49:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7303910E174
 for <freedreno@lists.freedesktop.org>; Thu, 28 Apr 2022 21:49:47 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-e656032735so6522698fac.0
 for <freedreno@lists.freedesktop.org>; Thu, 28 Apr 2022 14:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=raLa1RhQQr1A0ntQ+5+55SWHnInlmTf3908R5YkmSCU=;
 b=By+Tcwfzep/u2vDE7Vf7eynSfwr4hxh3y0ltm0hrThSrt8S+bvPbf9p7fAvp7HzwGq
 YMsf64RiGKps+dUqUstzBn7RBIf6Ye2A6sbcDRw9ijC9orNf5Hbz8k8KSlmI5xFht95O
 agZKIb5xq8+0n7+6O8pt1nmfjXN3TVYWdZRYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=raLa1RhQQr1A0ntQ+5+55SWHnInlmTf3908R5YkmSCU=;
 b=hhUCgW7aAD/7xeSXbfdpgO8MHWxbU+MvPxIegeqsOXM7tjeFlEQg6zpu6IE5ZQk6jL
 j7QwffKklJVUObtQo4kkRmq2SCEj632PnueGoDNO+azb4so7LUUkKfkYVrz2XqOc+L8Q
 9HYGMkwBlhT2xGkIFvhBXy2VF3QaRhDWSzXV8PJIwaUPrycQCM3qzcHPZ8W5ksmhGPz7
 OYBV1m1d9QuQrYPcUMTvvUOOdn8LpnUVJq7TGugLjgFH5G8/sS1McpFib/879eT520nz
 4Nl2ILHOZRt9BQkgQiUDLqLjr5fWtAaZvhDRYc90vTBrYuEsWb0tHjJ/t9q2rQLOlN1D
 VByw==
X-Gm-Message-State: AOAM532jwOpvZ8gaD3dWr11A5vSnuO0n1h/uIQj4hwORAWlC8ya5eqo3
 nycWQXkD9NM1875MHvL7/zs9Cw0Nq/xa2DBhvBceXA==
X-Google-Smtp-Source: ABdhPJxDunjl2C+LoabmMLvodkEblzsXuptAtAJwy3mvIfzQev+jhaT8KsU38spAnnhbSrFhbrc/fgXXhQlP30Kc/MA=
X-Received: by 2002:a05:6870:15ca:b0:e9:551:6d1c with SMTP id
 k10-20020a05687015ca00b000e905516d1cmr105932oad.193.1651182586543; Thu, 28
 Apr 2022 14:49:46 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 Apr 2022 14:49:45 -0700
MIME-Version: 1.0
In-Reply-To: <77e7ed06-8b7a-35d9-c133-561058a9ea6d@linaro.org>
References: <20220217055529.499829-1-dmitry.baryshkov@linaro.org>
 <20220217055529.499829-4-dmitry.baryshkov@linaro.org>
 <CAE-0n529mx1ke89iw8xXZEDcs0z84hA09B31cWeVQSTU9RAAYg@mail.gmail.com>
 <CAA8EJpq4fXHH6GEJO=m3Ckw0A2p7B_X0D3SiXi1xnJ=4VZOC=g@mail.gmail.com>
 <CAE-0n50h=REsyLsjNMaMaZtH7Dptowink7Tq0nzmBRYNas9OmQ@mail.gmail.com>
 <CAA8EJppT9O+bDjfEZv9tWCWpeCDMDPTf+VV0a0HxDw2mXhiMtw@mail.gmail.com>
 <CAE-0n522eve3K1ou-sFgNnfwtb6qSzOssB0=Ewu53PnBYkzO-g@mail.gmail.com>
 <77e7ed06-8b7a-35d9-c133-561058a9ea6d@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 28 Apr 2022 14:49:45 -0700
Message-ID: <CAE-0n50NyXAYuyb0-uWfHkt56ZNZXM2aWrApoBBkbKU=++y_iQ@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 3/5] drm/msm/dp: set stream_pixel rate
 directly
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-04-19 09:34:18)
> On 08/03/2022 23:46, Stephen Boyd wrote:
> >
> > Yes that's my concern. The qmp phy driver has a couple clk_set_rate()
> > calls in the .configure_dp_phy callback. That is called from
> > phy_power_on() (see qcom_qmp_phy_power_on() and qcom_qmp_phy_dp_ops).
> > Looking at qcom_qmp_v3_phy_configure_dp_phy() it does
> >
> >          clk_set_rate(dp_clks->dp_link_hw.clk, dp_opts->link_rate * 100000);
> >          clk_set_rate(dp_clks->dp_pixel_hw.clk, pixel_freq);
> >
> > and I believe the child of dp_pixel_hw is find_clock("stream_pixel").
> > Looks like that is DISP_CC_MDSS_DP_PIXEL_CLK which is
> > disp_cc_mdss_dp_pixel_clk_src for the rate settable part. That has
> > clk_dp_ops which is clk_rcg2_dp_set_rate() for the set rate part. That
> > wants the parent clk frequency to be something non-zero to use in
> > rational_best_approximation(). If the clk_set_rate("stream_pixel") call
> > is made before phy_power_on() then the parent_rate in
> > clk_rcg2_dp_set_rate() won't be valid and the pixel clk frequency will
> > be wrong.
>
>
> Please excuse me, I didn't have time for this patchset up to now.

No worries. I lost this in my inbox!

>
> I double checked the previous patch (drm/msm/dp: "inline"
> dp_ctrl_set_clock_rate("ctrl_link")). Note, that the OPP is set _after_
> the PHY is powered on and configured.
>

Ok. If the clk_set_rate("stream_pixel") call is made after the
phy_power_on() then it should be equivalent.
