Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 309B8974FD6
	for <lists+freedreno@lfdr.de>; Wed, 11 Sep 2024 12:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DCF310E83F;
	Wed, 11 Sep 2024 10:40:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aXKJPl5t";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2047610E83F
 for <freedreno@lists.freedesktop.org>; Wed, 11 Sep 2024 10:40:14 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-6daf46ee332so60096727b3.0
 for <freedreno@lists.freedesktop.org>; Wed, 11 Sep 2024 03:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726051213; x=1726656013; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=quaLdCg89/Q3ErVCYpGz/S7qzPrQHkWX+pHMVVZKZIc=;
 b=aXKJPl5tJg5sgpG4txHEQwyhSR7hDQdoYO75rxkRAlHAxi+zXuMdKYO/mUWwDbu1ux
 3y4tSn8BJAtf/c7w6onec12RoGziQbfGNikbQctlspn94liDiAmDmBmfRsKFtugWND1T
 Z69oiBugRBKx1kB4RbhozF/H8jU/PkRYhNdhhfgLxezMutV11+BbOOZXPkENsCaPqogR
 G6fIePDDgxqnpGXHfxfOUBVxj0tmPwvZ3FtTwK1nPHYiUlusQS/3T0ENYsxBnRJZ9b3M
 RkzoJONMKjRMyYHPplg759a40VSCOFri3V6V3898Ej0SJiyekiYcTjzADEpHrRmvKefn
 QQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726051213; x=1726656013;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=quaLdCg89/Q3ErVCYpGz/S7qzPrQHkWX+pHMVVZKZIc=;
 b=F7VfXc1BqIlgiYCTDOLvE8Koh2jNaXSX+fijUB8gCILRQXGOZPI3If8wsgBN0mMoPn
 2NcViNHLUIObqZ6BE00EyKrNzekBfzAYfTosi+U1R5Xz22gzyRdd7BmaU/D3nZYvDioC
 f7QTRjk8COxp0PvGeLrz4yG6mmXFTZiREqqXSlfezLZRWarHRKPxTTh5O3GyemcEJy+J
 pFmbsIfuoWwJfVjTQvJ26b75DSVkV7eOld8jsL1Op76FtLseNDWAJeTXtjItPJ32lySr
 0+m6pyXsjHsPq1ea3zekWMIdtCUkz0vvANy3V8KJ7rscfJJ7CdnVUOHUakqsJjawmcY3
 KHHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJVWeEdwCUVHKR0jerNqNli1poXfRwspMybw8I490G/i0UQMELB3w4sxez26RORiw8oa0IWcKI8ec=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcrCBX3+lYVydIvGrLlEqfXkYB5f7bB3bxP2+0hF0MyX8f4lco
 oOZQk4F1oph6sBSXO7+CRzvOIxW+jAfVCVukXIFhnyxPCe+he/HPCeZSrec5X4QO7N82+K9DvYP
 zBMjPuW5IRkXaVKbe1sbZnfPoAKVsWAaw3+4Wsw==
X-Google-Smtp-Source: AGHT+IFBbb4wmETvjaXqgLn/MDWKCHL6pj57SkqVhM0/cPEdnbQlphBpHqZfas0PwZIxjI6E5z9qO73trRYEsWxee9I=
X-Received: by 2002:a05:690c:660e:b0:6b3:a6ff:768e with SMTP id
 00721157ae682-6db44a63f29mr197379867b3.0.1726051212892; Wed, 11 Sep 2024
 03:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240911100813.338-1-quic_mukhopad@quicinc.com>
 <20240911100813.338-4-quic_mukhopad@quicinc.com>
In-Reply-To: <20240911100813.338-4-quic_mukhopad@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 11 Sep 2024 13:40:02 +0300
Message-ID: <CAA8EJpqurbPKjmRH8zdqPkMuze4zwJVu+=W0nP=Ldc6o_4Tu4w@mail.gmail.com>
Subject: Re: [PATCH 3/5] phy: qcom: edp: Add support for eDP PHY on SA8775P
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, konradybcio@kernel.org, 
 andersson@kernel.org, simona@ffwll.ch, abel.vesa@linaro.org, 
 robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 quic_khsieh@quicinc.com, konrad.dybcio@linaro.org, quic_parellan@quicinc.com, 
 quic_bjorande@quicinc.com, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, quic_riteshk@quicinc.com, 
 quic_vproddut@quicinc.com
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

On Wed, 11 Sept 2024 at 13:08, Soutrik Mukhopadhyay
<quic_mukhopad@quicinc.com> wrote:
>
> Add support for eDP PHY v5 found on the Qualcomm SA8775P platform.
>
> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 47 +++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index 0f860a807d1b..34a47cd2919d 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -191,6 +191,45 @@ static u8 edp_phy_aux_cfg_v4[10] = {
>         0x00, 0x13, 0x24, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03
>  };
>
> +static const u8 edp_swing_hbr_rbr_v5[4][4] = {
> +       { 0x07, 0x0f, 0x16, 0x1f },
> +       { 0x0d, 0x16, 0x1e, 0xff },
> +       { 0x11, 0x1b, 0xff, 0xff },
> +       { 0x16, 0xff, 0xff, 0xff }
> +};

Same as v4

> +
> +static const u8 edp_pre_emp_hbr_rbr_v5[4][4] = {
> +       { 0x05, 0x11, 0x17, 0x1d },
> +       { 0x05, 0x11, 0x18, 0xff },
> +       { 0x06, 0x11, 0xff, 0xff },
> +       { 0x00, 0xff, 0xff, 0xff }
> +};

Could you please confirm that there is a single value difference?

> +
> +static const u8 edp_swing_hbr2_hbr3_v5[4][4] = {
> +       { 0x0b, 0x11, 0x17, 0x1c },
> +       { 0x10, 0x19, 0x1f, 0xff },
> +       { 0x19, 0x1f, 0xff, 0xff },
> +       { 0x1f, 0xff, 0xff, 0xff }
> +};

Same as v4

> +
> +static const u8 edp_pre_emp_hbr2_hbr3_v5[4][4] = {
> +       { 0x0c, 0x15, 0x19, 0x1e },
> +       { 0x0b, 0x15, 0x19, 0xff },
> +       { 0x0e, 0x14, 0xff, 0xff },
> +       { 0x0d, 0xff, 0xff, 0xff }
> +};

This one looks fine

> +
> +static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg_v5 = {
> +       .swing_hbr_rbr = &edp_swing_hbr_rbr_v5,
> +       .swing_hbr3_hbr2 = &edp_swing_hbr2_hbr3_v5,
> +       .pre_emphasis_hbr_rbr = &edp_pre_emp_hbr_rbr_v5,
> +       .pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3_v5,
> +};
> +
> +static u8 edp_phy_aux_cfg_v5[10] = {
> +       0x00, 0x13, 0xa4, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03
> +};
> +
>  static int qcom_edp_phy_init(struct phy *phy)
>  {
>         struct qcom_edp *edp = phy_get_drvdata(phy);
> @@ -520,6 +559,13 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
>         .com_configure_ssc      = qcom_edp_com_configure_ssc_v4,
>  };
>
> +static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
> +       .is_edp = false,
> +       .aux_cfg = edp_phy_aux_cfg_v5,
> +       .swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v5,
> +       .ver_ops = &qcom_edp_phy_ops_v4,
> +};
> +
>  static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
>         .aux_cfg = edp_phy_aux_cfg_v4,
>         .ver_ops = &qcom_edp_phy_ops_v4,
> @@ -1114,6 +1160,7 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>  }
>
>  static const struct of_device_id qcom_edp_phy_match_table[] = {
> +       { .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },
>         { .compatible = "qcom,sc7280-edp-phy", .data = &sc7280_dp_phy_cfg, },
>         { .compatible = "qcom,sc8180x-edp-phy", .data = &sc7280_dp_phy_cfg, },
>         { .compatible = "qcom,sc8280xp-dp-phy", .data = &sc8280xp_dp_phy_cfg, },
> --
> 2.17.1
>


-- 
With best wishes
Dmitry
