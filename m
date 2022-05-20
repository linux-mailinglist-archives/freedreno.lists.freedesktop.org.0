Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8474652EFEE
	for <lists+freedreno@lfdr.de>; Fri, 20 May 2022 18:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9331310E76C;
	Fri, 20 May 2022 16:03:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C866B10E76C
 for <freedreno@lists.freedesktop.org>; Fri, 20 May 2022 16:03:10 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id j6so7211590qkp.9
 for <freedreno@lists.freedesktop.org>; Fri, 20 May 2022 09:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rl6lj9qx0jl8NDnbz3wyyCTgYol3jXu1zxcrwsJAVY0=;
 b=hEocKPTB0k/SuvhhyFT5SNEVGtwTVR9duxGaCyxkEPY5PB/c8W8gWNKQ7wBHvRQDTN
 v9JzO9ixObe7EqTnDEf+inUVqwi6/umiSrQFKktXHWrFUYsML5SMrrO8CRU51wbuky3i
 Wl+xXCZOIJ3zhbLnT8eJCt4tUv+9hDCNqaXW/v79Pfq2q6zMeOCAuRCwBBK6qpk8D5Nd
 +YGCkUJyHdekQg4X91lKQuCIjd/kPPyhS5Uv76TlZrckHPyN51WKd42D6fHaO5E2v4pk
 r5vGMgpedKX1tbFxC2h0WBTKV2GYdZ9xdxdoV5NUIjV14YE66alofZdAacWqFHmzdGDW
 czSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rl6lj9qx0jl8NDnbz3wyyCTgYol3jXu1zxcrwsJAVY0=;
 b=JlFFnfSUrTEry6Smij+KvvZvi9rfDlZ33LVP8zqpzc9OUYtCkxcdup54O+/qcV7cQO
 p9QQLkFpC+oXv3xmzr+Uv5XLLQIZgkQi0gMeBpqD4xZkaN89qYh2RBo9NpUwiTke8Gdr
 5VJCGfh/CTCDB/R401p61Qy3Xtv/3sFXTzF2sOIcDuwE8jStF4lWyM6mTrKT+W2qEci8
 dDL97hwDH0tOpQ8I+L/cQ75z7zH1eugMT4qlASkuyOaTwA74iwj+kzLck0qiu0yJzoLp
 dbxN3eY74dq9xXvsDH1h4WWuiv4L9ydPgOwyWjRt9DABjIzJYgf4yZwfk4R97KgC4XVi
 8eng==
X-Gm-Message-State: AOAM533aFBO2AYQoG9haHwO9RFIvHutk3EKEfpBY5BjdZNJNytYEQZvO
 DQqAgLw+NBGM3l5e41RC/H/1w7uDhuZ1i/LZBgh46Q==
X-Google-Smtp-Source: ABdhPJyZI37QRWTmfOC38IDzqhvOTFVeCbuF71qmUeFydjmoyAbLvyiloaSslSvLRc7a3lrInN3ClO7mlUtVPua/8TU=
X-Received: by 2002:a05:620a:4311:b0:67e:8a0f:4cd5 with SMTP id
 u17-20020a05620a431100b0067e8a0f4cd5mr6809701qko.363.1653062589769; Fri, 20
 May 2022 09:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <1653001902-26910-1-git-send-email-quic_khsieh@quicinc.com>
 <1653001902-26910-2-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52yT6S4TLpc2e2-kkbMB2Fu2PcZskG-ZFLo7y1YVTyazQ@mail.gmail.com>
 <609bb4fc-1503-81ef-6fd8-dbb862c4ef80@quicinc.com>
In-Reply-To: <609bb4fc-1503-81ef-6fd8-dbb862c4ef80@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 May 2022 19:02:58 +0300
Message-ID: <CAA8EJpqaGqHrdtX6NUHs2YOgeievpkbm8JbwQOU8+KoW4YNf2g@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6 1/3] phy: qcom-edp: add
 regulator_set_load to edp phy
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com,
 airlied@linux.ie, freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robdclark@gmail.com, agross@kernel.org, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com,
 Stephen Boyd <swboyd@chromium.org>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 20 May 2022 at 18:09, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 5/19/2022 5:19 PM, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2022-05-19 16:11:40)
> >> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> >> index cacd32f..78b7306 100644
> >> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> >> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> >> @@ -87,14 +87,19 @@ struct qcom_edp {
> >>
> >>          struct clk_bulk_data clks[2];
> >>          struct regulator_bulk_data supplies[2];
> >> +       int enable_load[2];
> >>   };
> >>
> >>   static int qcom_edp_phy_init(struct phy *phy)
> >>   {
> >>          struct qcom_edp *edp = phy_get_drvdata(phy);
> >>          int ret;
> >> +       int i;
> >>
> >> -       ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
> >> +       for (i = 0; i < 2; i++)
> > Use ARRAY_SIZE(edp->supplies)?
> >
> >> +               regulator_set_load(edp->supplies[i].consumer, edp->enable_load[i]);
> >> +
> >> +       ret = regulator_bulk_enable(2, edp->supplies);
> > Why is ARRAY_SIZE() usage removed?
>
>
> remove it base on Dmitry's comment.

Ugh. I asked to remove the num_consumers variable, not the ARRAY_SIZE.

>
> I will restore it back to use ARRY_SIZE
>
>
> >
> >>          if (ret)
> >>                  return ret;
> >>



-- 
With best wishes
Dmitry
