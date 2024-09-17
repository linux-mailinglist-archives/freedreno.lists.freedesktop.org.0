Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D40697AE1B
	for <lists+freedreno@lfdr.de>; Tue, 17 Sep 2024 11:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4672F10E1FF;
	Tue, 17 Sep 2024 09:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="C6+1Da6S";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F6B10E169
 for <freedreno@lists.freedesktop.org>; Tue, 17 Sep 2024 09:41:29 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-6dbc9a60480so34435097b3.0
 for <freedreno@lists.freedesktop.org>; Tue, 17 Sep 2024 02:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726566089; x=1727170889; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YUQo1bSSq8kX3HOSdvvfhK2hzhUvDoWKXHhQXYw0D7Q=;
 b=C6+1Da6SK/qgKMh/C/8WinI603xc2mlC/GENc4B++2X3l0CI5fCGDQQAzxXoJxTcEY
 da+cfl3EDXHkmCZG5uQJkim6u5mN+G7IkDlQKHv8un2jwCA/GQUn7wfjJXPap4eC6wgr
 QDskHvy/BUkUbcTeMmwczbaCWnEjhIU35a4M6zdom7uNuuUh3BY56sgmh8MM1/EioeD0
 TqM94zPpnIjUb8h2afAj2/I4dSGo6O0W6g2vGVRdMP6QR9T012KY/c+czROTA2el/GCj
 O/pRp8VA2vozST02/GwITV0oOrkgyojAmp0xrWUjtH+ibMpF7GvSCPuKyR4zTav1Z9wx
 x4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726566089; x=1727170889;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YUQo1bSSq8kX3HOSdvvfhK2hzhUvDoWKXHhQXYw0D7Q=;
 b=IRkeJeqmSPF1F/WEEENtUr/M7mTzN4QLfzFq0dw5LRAEcdNGibXkeJDtd3j/NXodGc
 k43uTeu59s9t020gxzfY98NBv00+HRbVlN4hPQ4IcaNwd28wSi2HiFCRNzjgHqdpAIED
 kp7m/AfG6rvTGjUBQp1L3zgR37SZlXlDhuxUzJiNOBVmXqjORzHhbUWMtM9Kd8PmmoiP
 +5iWhW89s9EiTfaHBeCMuHOf8V3ZU7m9sV7jYaL1pAa71Ygav9rkNs1jmgxYO4rM0FJb
 XYeXI4a7MeOmUE1NuIzpRMDD4ZJOiOwcqlS8feW23pH9Y5YR6wTGzhuzHVzO1gperoy2
 rz2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVScNeUoLsdRtFYbFKZRLCs2Q+B7xy1qcxo7UNDe56evt9BXtam+zzxqgzDSbf+SpmlysvFWepMGwc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGOMVnKJt97u4yK7s0wCj0dkm4SEGGAoYmyrYDPA2UbQhZW6f7
 sSMmqbUjgRXwIBXZkOhH4y9De1Zzx25w5edbpr8nXcXQ4zh/jLqec0qN3IiOc9zE21xFhZgoNZf
 nQXEVNKdMr7uxGH7Ybpj+bQBa3HDT2/K7dfSs4Q==
X-Google-Smtp-Source: AGHT+IHT1V3PeZZNewflXjW3i9JRWZQTKzirw4DGT5uyJzF4Av2YmvMp/sQpcgwEf52Fa8aoOQlE9ZuHN9AEzEooIwQ=
X-Received: by 2002:a05:690c:3687:b0:6dd:ba9b:2ca7 with SMTP id
 00721157ae682-6ddba9b2dbemr60897387b3.46.1726566088694; Tue, 17 Sep 2024
 02:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240913103755.7290-1-quic_mukhopad@quicinc.com>
 <20240913103755.7290-3-quic_mukhopad@quicinc.com>
 <CAA8EJppddLmzJ9WSkLLr-nwM-qe647Sm6jV8SpHdB=0vRQT-=Q@mail.gmail.com>
 <3ea1189b-8b06-45bb-9d60-178f69ee407d@quicinc.com>
In-Reply-To: <3ea1189b-8b06-45bb-9d60-178f69ee407d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 17 Sep 2024 11:41:17 +0200
Message-ID: <CAA8EJppKrOVi3B7g9dUMXwCDWR9GKUVD2BgSnNy+PkC5fq3GGA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] phy: qcom: edp: Introduce aux_cfg array for
 version specific aux settings
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

On Tue, 17 Sept 2024 at 10:40, Soutrik Mukhopadhyay
<quic_mukhopad@quicinc.com> wrote:
>
>
> On 9/13/2024 5:12 PM, Dmitry Baryshkov wrote:
> > On Fri, 13 Sept 2024 at 13:38, Soutrik Mukhopadhyay
> > <quic_mukhopad@quicinc.com> wrote:
> >> In order to support different HW versions, introduce aux_cfg array
> >> to move v4 specific aux configuration settings.
> >>
> >> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> >> ---
> >> v2: Fixed review comments from Bjorn and Dmitry
> >>          - Made aux_cfg array as const.
> >>
> >> ---
> >>   drivers/phy/qualcomm/phy-qcom-edp.c | 37 ++++++++++++++++++-----------
> >>   1 file changed, 23 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> >> index da2b32fb5b45..bcd5aced9e06 100644
> >> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> >> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> >> @@ -90,6 +90,7 @@ struct phy_ver_ops {
> >>
> >>   struct qcom_edp_phy_cfg {
> >>          bool is_edp;
> >> +       const u8 *aux_cfg;
> >>          const struct qcom_edp_swing_pre_emph_cfg *swing_pre_emph_cfg;
> >>          const struct phy_ver_ops *ver_ops;
> >>   };
> >> @@ -186,11 +187,15 @@ static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg = {
> >>          .pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3,
> >>   };
> >>
> >> +static const u8 edp_phy_aux_cfg_v4[10] = {
> >> +       0x00, 0x13, 0x24, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03
> >> +};
> >> +
> >>   static int qcom_edp_phy_init(struct phy *phy)
> >>   {
> >>          struct qcom_edp *edp = phy_get_drvdata(phy);
> >> +       u8 aux_cfg[10];
> > Please define 10, so that there are no magic numbers (and less chance
> > of damaging the stack if it gets changed in one place only.
>
>
> Sure, we will update this in the next version.
>
>
> >
> >>          int ret;
> >> -       u8 cfg8;
> >>
> >>          ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
> >>          if (ret)
> >> @@ -200,6 +205,8 @@ static int qcom_edp_phy_init(struct phy *phy)
> >>          if (ret)
> >>                  goto out_disable_supplies;
> >>
> >> +       memcpy(aux_cfg, edp->cfg->aux_cfg, sizeof(aux_cfg));
> >> +
> >>          writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> >>                 DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
> >>                 edp->edp + DP_PHY_PD_CTL);
> >> @@ -222,22 +229,20 @@ static int qcom_edp_phy_init(struct phy *phy)
> >>           * even needed.
> >>           */
> >>          if (edp->cfg->swing_pre_emph_cfg && !edp->is_edp)
> >> -               cfg8 = 0xb7;
> >> -       else
> >> -               cfg8 = 0x37;
> >> +               aux_cfg[8] = 0xb7;
> >>
> >>          writel(0xfc, edp->edp + DP_PHY_MODE);
> >>
> >> -       writel(0x00, edp->edp + DP_PHY_AUX_CFG0);
> >> -       writel(0x13, edp->edp + DP_PHY_AUX_CFG1);
> >> -       writel(0x24, edp->edp + DP_PHY_AUX_CFG2);
> >> -       writel(0x00, edp->edp + DP_PHY_AUX_CFG3);
> >> -       writel(0x0a, edp->edp + DP_PHY_AUX_CFG4);
> >> -       writel(0x26, edp->edp + DP_PHY_AUX_CFG5);
> >> -       writel(0x0a, edp->edp + DP_PHY_AUX_CFG6);
> >> -       writel(0x03, edp->edp + DP_PHY_AUX_CFG7);
> >> -       writel(cfg8, edp->edp + DP_PHY_AUX_CFG8);
> >> -       writel(0x03, edp->edp + DP_PHY_AUX_CFG9);
> >> +       writel(aux_cfg[0], edp->edp + DP_PHY_AUX_CFG0);
> >> +       writel(aux_cfg[1], edp->edp + DP_PHY_AUX_CFG1);
> >> +       writel(aux_cfg[2], edp->edp + DP_PHY_AUX_CFG2);
> >> +       writel(aux_cfg[3], edp->edp + DP_PHY_AUX_CFG3);
> >> +       writel(aux_cfg[4], edp->edp + DP_PHY_AUX_CFG4);
> >> +       writel(aux_cfg[5], edp->edp + DP_PHY_AUX_CFG5);
> >> +       writel(aux_cfg[6], edp->edp + DP_PHY_AUX_CFG6);
> >> +       writel(aux_cfg[7], edp->edp + DP_PHY_AUX_CFG7);
> >> +       writel(aux_cfg[8], edp->edp + DP_PHY_AUX_CFG8);
> >> +       writel(aux_cfg[9], edp->edp + DP_PHY_AUX_CFG9);
> > Replace this with a loop?
>
>
> Can we use below approach for this :
>
> #define DP_PHY_AUX_CFG(n)        (0x24 + (0x04 * (n)))
>
> for (int i = 0; i < 10; i++)
>
>      writel(aux_cfg[i], edp->edp + DP_PHY_AUX_CFG(i));

That's what I meant, thank you!

>
>
> >
> >>          writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
> >>                 PHY_AUX_SYNC_ERR_MASK | PHY_AUX_ALIGN_ERR_MASK |
> >> @@ -519,16 +524,19 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
> >>   };
> >>
> >>   static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
> >> +       .aux_cfg = edp_phy_aux_cfg_v4,
> >>          .ver_ops = &qcom_edp_phy_ops_v4,
> >>   };
> >>
> >>   static const struct qcom_edp_phy_cfg sc8280xp_dp_phy_cfg = {
> >> +       .aux_cfg = edp_phy_aux_cfg_v4,
> >>          .swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
> >>          .ver_ops = &qcom_edp_phy_ops_v4,
> >>   };
> >>
> >>   static const struct qcom_edp_phy_cfg sc8280xp_edp_phy_cfg = {
> >>          .is_edp = true,
> >> +       .aux_cfg = edp_phy_aux_cfg_v4,
> >>          .swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
> >>          .ver_ops = &qcom_edp_phy_ops_v4,
> >>   };
> >> @@ -707,6 +715,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v6 = {
> >>   };
> >>
> >>   static struct qcom_edp_phy_cfg x1e80100_phy_cfg = {
> >> +       .aux_cfg = edp_phy_aux_cfg_v4,
> >>          .swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
> >>          .ver_ops = &qcom_edp_phy_ops_v6,
> >>   };
> >> --
> >> 2.17.1
> >>
> >



-- 
With best wishes
Dmitry
