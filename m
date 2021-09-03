Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3ED4005AD
	for <lists+freedreno@lfdr.de>; Fri,  3 Sep 2021 21:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F3A6E8C7;
	Fri,  3 Sep 2021 19:16:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A906E8C7
 for <freedreno@lists.freedesktop.org>; Fri,  3 Sep 2021 19:16:28 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 i3-20020a056830210300b0051af5666070so271157otc.4
 for <freedreno@lists.freedesktop.org>; Fri, 03 Sep 2021 12:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=L/2apcW8mrsz6OK3ilemzV65I67pSLK0BxUTy23sO3E=;
 b=WKQZrk6yltU3VyKmYhd5vG0mMGP/sJVUz/zftd7FGa0OxfST8O3CEhtI9sUdu1a2jv
 wfzLRo5HzKmq1GGXyS15IkB2T+5d8mWYilCkCGIVmPcCO9JTonM0qsBo3StvWz6q2xfA
 EnQGHVQDN9xrNbe755whrDgTDu9W+Fm8kboQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=L/2apcW8mrsz6OK3ilemzV65I67pSLK0BxUTy23sO3E=;
 b=bIc5u+ApB8fDH5bBDfU2v0M3U6JUy+ebqxkG47MkGA/7DWfv03i5Vsy4ymNvoNp5ku
 O8qlQXwsfQtawaiId/hZeuGQo/SPelLd4WNU+lYQvG03Txi6BAQ/SeOOwxksBD9Nh6CQ
 b2fygmeqHU4ni8EXgWaq13kt4UFrgo9/EFpQ2NixkY77UVZkZbJJMgiLp57hUFobavxT
 vptU004nNbCpqsnS9r1tzV0kElRkB3+mnciFHpCRVSfxBMDekneasxLiK1HLHa79YJD7
 3sLmyR21j1+RmWtbQogOwKIH0d6Wluoev1SdcYK8LUhNiEcMobi1WotEpttmf0e+qFUb
 UIzw==
X-Gm-Message-State: AOAM530ad51looqYHXSSVcotnhwJ14+zh8oXBJnsInXEuawhEOrRmq6G
 rpxS3SwxklTru36z3szbGLkE4oEZo3YBq19CIVP4bA==
X-Google-Smtp-Source: ABdhPJw/cOlPupXT1h50NnHT0u5fcyjLVurBe+rkxu3+Ri7msyNK7piJ5M/yOhc92+uWMS+u1chlm0BirEeM+SKmFXQ=
X-Received: by 2002:a05:6830:719:: with SMTP id
 y25mr502893ots.77.1630696588117; 
 Fri, 03 Sep 2021 12:16:28 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Sep 2021 15:16:27 -0400
MIME-Version: 1.0
In-Reply-To: <72483937-8ccb-331b-e1af-8f30f6cefc07@linaro.org>
References: <1630098658-23149-1-git-send-email-khsieh@codeaurora.org>
 <72483937-8ccb-331b-e1af-8f30f6cefc07@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Fri, 3 Sep 2021 15:16:27 -0400
Message-ID: <CAE-0n50R1+6Jx4+OeLS2XZdO5RdueEbrp=tUxk2YoJPJ9v-ssQ@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, 
 agross@kernel.org, bjorn.andersson@linaro.org, devicetree@vger.kernel.org, 
 robdclark@gmail.com, robh+dt@kernel.org, sean@poorly.run, vkoul@kernel.org
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kishon@ti.com, p.zabel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] phy: qcom-qmp: add support for display
 port voltage and pre-emphasis swing
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

Quoting Dmitry Baryshkov (2021-09-03 12:09:14)
> On 28/08/2021 00:10, Kuogee Hsieh wrote:
> > Both voltage and pre-emphasis swing level are set during link training
> > negotiation between host and sink. There are totally four tables added.
> > A voltage swing table for both hbr and hbr1, a voltage table for both
> > hbr2 and hbr3, a pre-emphasis table for both hbr and hbr1 and a pre-emphasis
> > table for both hbr2 and hbr3. In addition, write 0x0a to TX_TX_POL_INV is
> > added to complete the sequence of configure dp phy base on HPG.
> >
> > Chnages in v2:
> > -- revise commit test
> > -- add Fixes tag
> > -- replaced voltage_swing_cfg with voltage
> > -- replaced pre_emphasis_cfg with emphasis
> > -- delete drv_lvl_reg and emp_post_reg parameters from qcom_qmp_v4_phy_configure_dp_swing()
> > -- delete drv_lvl_reg and emp_post_reg parameters from qcom_qmp_phy_configure_dp_swing()
> >
> > Fixes: aff188feb5e1 ("phy: qcom-qmp: add support for sm8250-usb3-dp phy")
> > Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> > ---
> >   drivers/phy/qualcomm/phy-qcom-qmp.c | 117 ++++++++++++++++++++++++++----------
> >   1 file changed, 85 insertions(+), 32 deletions(-)
> >
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> > index 31036aa..021cbb0 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> > @@ -3546,12 +3546,11 @@ static const u8 qmp_dp_v3_voltage_swing_hbr_rbr[4][4] = {
> >       { 0x1f, 0xff, 0xff, 0xff }
> >   };
> >
> > -static int qcom_qmp_phy_configure_dp_swing(struct qmp_phy *qphy,
> > -             unsigned int drv_lvl_reg, unsigned int emp_post_reg)
> > +static int qcom_qmp_phy_configure_dp_swing(struct qmp_phy *qphy)
>
> As this becomes a v3-only function, could you please rename it to
> qcom_qmp_v3_phy_configure_dp_swing()

Can it be combined with the v4 version instead? The code structure is
essentially the same, modulo the tables used and the register offset
written to.
