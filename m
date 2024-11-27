Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5E49DA8B3
	for <lists+freedreno@lfdr.de>; Wed, 27 Nov 2024 14:41:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE0510EAD0;
	Wed, 27 Nov 2024 13:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p4dpAM1H";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209D610EACF
 for <freedreno@lists.freedesktop.org>; Wed, 27 Nov 2024 13:41:22 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-53de852a287so2349175e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 27 Nov 2024 05:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732714880; x=1733319680; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+V0B8FgWwCZYmESnMjYEXbPLdTp7ON4XeU+NCnDG0sM=;
 b=p4dpAM1HIPudnB4sMJDbMRgPbLLxTj6Vskah3MEGILU2EQs1ZVlsY9UESuxLjQ8FFX
 iu1m4mSPMIKzu0SmRy2GNOonkHY8VESMFFo/5JeMlApWeqwKejoWLYJ8ch7ATy50GMz6
 6Pt8RJmvK/e9c81BClMW5jlU6vQDi9TMAbHddjZJntBfzXx9br77OiVJnggI9MkAeEVJ
 pKGOQpJpxxwJi8uclmv1Zk0tqz/l+41o7AyXu/jQuSVBjLIFJYP/S2KG8UoVu2bxmHnZ
 iaNkbCoYGp6RlbVOLDQIlgyqccSHpHsMcuijAkD2Afq77j+APJph4nSC57/8TqddN3Yt
 6gCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732714880; x=1733319680;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+V0B8FgWwCZYmESnMjYEXbPLdTp7ON4XeU+NCnDG0sM=;
 b=EmmyrRWcPKBj6M0QVIDw3I10vtLe6yXYqFXbS4cQNcGBLDD4w518zUcN7VBr+yfSxG
 3buHphmeAE11YtCl2ntSVudWI2m32WK4oTJl4cwJZyCGjl8jvUReDUVy/UXqsXI2BuMy
 d8Lkzvw+zaLPrQPYe2+dZ+S7B/B6f1mrf2su6GgocZjdkQTnH9JEMCPbiyw/MbPx8SGw
 Mus4CqIsm1eeh5Ktf35nLCfGEfWRQwPznP3hEKhMUOM42sDc2ab/PeEqJ6DpL3mMysDm
 zwILHiEyP5JRbYLDNllZi6G6i75P6Mjs1LEfFxHyRb29fQ4BTDF1OhWfDe+Pk56NjBKr
 nDkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSnWibiI4NSwGImlVvhfy/4auzE2DKn1cYS1/V/FGVdyEwSPtzfrTTGNTpw0eQV5+123ncfPfZXZ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyX27bu/SU8t2t6oF+NPmouVv9SPy+LgMl6U6JCpkdL3BRabFZn
 kNaraWLqyC01WYVB5/j3ryrtN8RCc1PhCtAAHTADZaHygo4CuUSSR8m0940TiFU=
X-Gm-Gg: ASbGncvjGrFlrJE7XXwVfu4GgfK3pxAU2ok1bQcN0iM2kQoSn3IGFiVxudjjXkEpbjl
 AWSVWJkrOffG5fqGXjIKBNvc1PjNSwmA9pGbgQpItD1RnQUFmA+rsm9Ex32GKU62gnFsuReywcW
 pV3ZQ5iBywN5DbrNJtO1TIh/6nGGuTD4YRz5cbspqaoMJPnFrvQZjHeyg1D6UuLJ+10vqSOKQBo
 bpK6KPrJeku97g5qkpkNH1BLDoI28eS0XjOvHWR/ZYku1Bwc+KZSrXjxfgSRdFOwGbEHwc8KPy0
 SwOjoAlGSFUXNAVk81/yNLG1j/WajQ==
X-Google-Smtp-Source: AGHT+IG9BNVyGMPhRMDkSB666seeuc69CW+Jv5lBWbNwNRZPtIr56nhPI2eE0zoLaGS7x7+3k7cyFg==
X-Received: by 2002:a05:6512:3a8f:b0:53d:a4f3:29ed with SMTP id
 2adb3069b0e04-53df00dd707mr910972e87.27.1732714879617; 
 Wed, 27 Nov 2024 05:41:19 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd336a530sm2263130e87.142.2024.11.27.05.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 05:41:19 -0800 (PST)
Date: Wed, 27 Nov 2024 15:41:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Ritesh Kumar <quic_riteshk@quicinc.com>
Subject: Re: [PATCH 2/4] phy: qcom: edp: Add support for eDP PHY on QCS8300
Message-ID: <new6hjxnwyuohetdprxwee3epf23uemwft2p7faym5f5zqv3og@fksrew4blk7p>
References: <20241127-qcs8300_dp-v1-0-0d30065c8c58@quicinc.com>
 <20241127-qcs8300_dp-v1-2-0d30065c8c58@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127-qcs8300_dp-v1-2-0d30065c8c58@quicinc.com>
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

On Wed, Nov 27, 2024 at 04:15:49PM +0800, Yongxing Mou wrote:
> Add support for eDP PHY v5 found on the Qualcomm QCS8300 platform.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index f1b51018683d51df064f60440864c6031638670c..90e0a399c25299ad1b2fb5df8512ba3888661046 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -532,6 +532,13 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
>  	.com_configure_ssc	= qcom_edp_com_configure_ssc_v4,
>  };
>  
> +static const struct qcom_edp_phy_cfg qcs8300_dp_phy_cfg = {
> +	.is_edp = false,
> +	.aux_cfg = edp_phy_aux_cfg_v5,
> +	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v5,
> +	.ver_ops = &qcom_edp_phy_ops_v4,
> +};
> +
>  static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
>  	.is_edp = false,
>  	.aux_cfg = edp_phy_aux_cfg_v5,
> @@ -1133,6 +1140,7 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id qcom_edp_phy_match_table[] = {
> +	{ .compatible = "qcom,qcs8300-edp-phy", .data = &qcs8300_dp_phy_cfg, },

If the setup is the same as SA8775p and you don't expect any
QCS8300-specific tunings, please reuse sa8775p as a fallback compat.

>  	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },
>  	{ .compatible = "qcom,sc7280-edp-phy", .data = &sc7280_dp_phy_cfg, },
>  	{ .compatible = "qcom,sc8180x-edp-phy", .data = &sc7280_dp_phy_cfg, },
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
