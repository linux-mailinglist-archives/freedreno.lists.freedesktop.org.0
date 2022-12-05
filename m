Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC60564366E
	for <lists+freedreno@lfdr.de>; Mon,  5 Dec 2022 22:07:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 903E710E29C;
	Mon,  5 Dec 2022 21:07:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0404410E29C
 for <freedreno@lists.freedesktop.org>; Mon,  5 Dec 2022 21:07:20 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id c1so20543499lfi.7
 for <freedreno@lists.freedesktop.org>; Mon, 05 Dec 2022 13:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=nEcGbFYaYRq0pR1tWc2XnqrDYCVIJgjwtYCoVp42TNk=;
 b=jjcnbT5RW+Jg3fKg5EXzRhjtcYoduMPGSVCGNsD0Npm/3UICGWW531+ekuoTbmyBbD
 HdfDMcXJBnaDDuczwEKLqKcMzBpPfO1sXzHCyPv9L361Y+IpUX2Ip1DJijpomiF/s0Zv
 6rg2NF4Aj0EijsK1Z0Rz3kU539KiMSaPJ1Y+ev6TiaFO2l7RMruIkz/Cjpnows6tGfdM
 KCCN2380XaEitxlH+8Ave1Wx4AINdfYCihKjp/1lRXkMhUmNo1dXAMyxC6YkuHB4n7KW
 ovSxd9RBBMDdhqEOMEIi5uWcTpZjMXCMCf2UfLdrvn7sauI0DH8fGn4lVCZtsyqWKSgJ
 VBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nEcGbFYaYRq0pR1tWc2XnqrDYCVIJgjwtYCoVp42TNk=;
 b=R1eQCSCzW/m5AYa1kEdNaaynOB06vYiokzaOP/DUP24wrKmAGaBYgFdhah6zOW8K7f
 ZfjBcRrkICr8DvKJF8hxcrpdFaWQIgdbzCnVpcW8F3oT2Qp9mdiF1zIb7vONAAenhpLq
 RVzDDic8CeUcViNYZKuXImVQOMZwB+OyYDU5+F6GdprFiBrRRUXBf2/Qys8fFLVNs5Nd
 LmeWaPolH7uCyWnBZ34c/nap/1UlJ46O8boA3an3w84R5uWQP+5VLG0PuwKUAqquXRhG
 nQ297vFVv8DQ2dtuPg6mXCVOb9WC5jqz5jOcMdAzDB32h3VcrorO8Bkxb2uFiYKAalur
 sG+g==
X-Gm-Message-State: ANoB5pmWiqdzHZWsMZeLumux2nb0Pw8wft26M+cL+I6DZlwxv0QNMwcj
 1m7OxnVsyG7IvNnuX4pkHYU7+qrq5htRQ/cw
X-Google-Smtp-Source: AA0mqf4mFk64/EPNgptSRfBt9JSDGtHkFbbcllBU2v8HjWoBGLcLmGR4VHuZIT1dMzCprrNqwdsdsA==
X-Received: by 2002:a05:6512:baa:b0:4b5:6417:644e with SMTP id
 b42-20020a0565120baa00b004b56417644emr3342100lfv.495.1670274438364; 
 Mon, 05 Dec 2022 13:07:18 -0800 (PST)
Received: from [127.0.0.1] ([94.25.229.129]) by smtp.gmail.com with ESMTPSA id
 u5-20020a05651c130500b0027740a1b854sm1509451lja.52.2022.12.05.13.07.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Dec 2022 13:07:17 -0800 (PST)
Date: Tue, 06 Dec 2022 00:07:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
User-Agent: K-9 Mail for Android
In-Reply-To: <20221205174433.16847-10-quic_bjorande@quicinc.com>
References: <20221205174433.16847-1-quic_bjorande@quicinc.com>
 <20221205174433.16847-10-quic_bjorande@quicinc.com>
Message-ID: <62FFEABE-0074-4836-84BE-2C88C83F8674@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH v4 09/13] drm/msm/dp: Don't enable HPD
 interrupts for edp
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Johan Hovold <johan+linaro@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 5 December 2022 20:44:29 GMT+03:00, Bjorn Andersson <quic_bjorande@quic=
inc=2Ecom> wrote:
>From: Bjorn Andersson <bjorn=2Eandersson@linaro=2Eorg>
>
>Most instances where HPD interrupts are masked and unmasked are guareded
>by the presence of an EDP panel being connected, but not all=2E Extend
>this to cover the last few places, as HPD interrupt handling is not used
>for the EDP case=2E

I don't remember whether I asked that or not=2E Would it be possible to mo=
ve hpd irq enablement to bridge's hpd_enable() / hpd_disable() callbacks ? =
I think this would allow us to drop the is_edp checks=2E

>
>Signed-off-by: Bjorn Andersson <bjorn=2Eandersson@linaro=2Eorg>
>Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc=2Ecom>
>---
>
>Changes since v3:
>- None
>
> drivers/gpu/drm/msm/dp/dp_display=2Ec | 15 ++++++++++-----
> 1 file changed, 10 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/msm/dp/dp_display=2Ec b/drivers/gpu/drm/msm/=
dp/dp_display=2Ec
>index 17fcf8cd84cd=2E=2Ebb92c33beff8 100644
>--- a/drivers/gpu/drm/msm/dp/dp_display=2Ec
>+++ b/drivers/gpu/drm/msm/dp/dp_display=2Ec
>@@ -610,8 +610,10 @@ static int dp_hpd_plug_handle(struct dp_display_priv=
ate *dp, u32 data)
> 	}
>=20
> 	/* enable HDP irq_hpd/replug interrupt */
>-	dp_catalog_hpd_config_intr(dp->catalog,
>-		DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK, true);
>+	if (!dp->dp_display=2Eis_edp)
>+		dp_catalog_hpd_config_intr(dp->catalog,
>+					   DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK,
>+					   true);
>=20
> 	drm_dbg_dp(dp->drm_dev, "After, type=3D%d hpd_state=3D%d\n",
> 			dp->dp_display=2Econnector_type, state);
>@@ -651,8 +653,10 @@ static int dp_hpd_unplug_handle(struct dp_display_pr=
ivate *dp, u32 data)
> 			dp->dp_display=2Econnector_type, state);
>=20
> 	/* disable irq_hpd/replug interrupts */
>-	dp_catalog_hpd_config_intr(dp->catalog,
>-		DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK, false);
>+	if (!dp->dp_display=2Eis_edp)
>+		dp_catalog_hpd_config_intr(dp->catalog,
>+					   DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK,
>+					   false);
>=20
> 	/* unplugged, no more irq_hpd handle */
> 	dp_del_event(dp, EV_IRQ_HPD_INT);
>@@ -678,7 +682,8 @@ static int dp_hpd_unplug_handle(struct dp_display_pri=
vate *dp, u32 data)
> 	}
>=20
> 	/* disable HPD plug interrupts */
>-	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, false)=
;
>+	if (!dp->dp_display=2Eis_edp)
>+		dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, false=
);
>=20
> 	/*
> 	 * We don't need separate work for disconnect as

--=20
With best wishes
Dmitry
