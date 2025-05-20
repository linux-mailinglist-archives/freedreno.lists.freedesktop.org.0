Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44889ABE476
	for <lists+freedreno@lfdr.de>; Tue, 20 May 2025 22:07:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF9510E5C5;
	Tue, 20 May 2025 20:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zo+n/FMs";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B808110E5C7
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 20:07:17 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGe3bd001359
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 20:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=4+TilPmXDGw/Gtk0BqOASle1
 /UOmT/X4bq+tNDck6q8=; b=Zo+n/FMszjKFBUWpEfP52eZJPyhg4y7h1VjyQptn
 9X1oEHTRtb/0U2ZF5HaCpX3xq4i0JAX1yB5ZmxqXyKSBliCiigqjulOhXff3qJcc
 /JdtG9DuzWUM2DYKZR5aRquMgfE+Rzow5zwtpHbN8llRmKPpqJ4INUe6k+CmWabu
 YEkNKSuTQsIp7oLRHDO3DBSS5kPpQTAP2gLg8K6avYEhLg86cQQc0jddhdm+vL0o
 qz4L76TeOq9SjQ6V/NsS5wiGmqHuHCvc24JhdSEHwIYWEc8jc19EeM5zFj9+dHnh
 WevVPQU6n/7qtHLVAryGlXgb4E2z5572+nZcaEzo6x+izQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf18hje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 20:07:17 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-3feb24cea56so4862449b6e.0
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 13:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747771636; x=1748376436;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4+TilPmXDGw/Gtk0BqOASle1/UOmT/X4bq+tNDck6q8=;
 b=AB5zUrI7PreqnhPmkUkGajyYxb95uTuDhNn5+5NXDsitWAaE5iW1HIgUJvB897zGdA
 sNjWntVHEi5Pz8OqaJt9Q+8CPJVw3qADqivWrfWWHq/wOSIzTKqPjN65Fw9PteS2FlJe
 ns4BHDgi5BDK63Nj9zaC5MAZUXkZEG2daGjqi4/i77y3B86IvucJNxm9tQBHJ5JPsEI6
 uOi7cnj9zTpxZdGUOzzLKk0Xv5MVLT7Z/PwQQe4Lgsnn3VpN5bjXGiWQl5awt+4S3Es9
 des3p+GPBgJxA9vRlUUVgG54ZW7fDi2Z/uNNz4UnwmfW4+CQvGEVTawo9EpNty/2ZZax
 RxwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXa9RHwXUaWmPRGQkxFKd/liEZAail6MTufgEwlVJmfnp3w9kKMsqeLIecWqfbHnNKkqalkNXq+WI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxapXgfPqI6OQ+/xSBpLnSCWZasBB5v9XV+7Jrv8uEZCxQXMBmb
 Qm7mSexM2wVqD7tPeIM6EjONYpcNa3mPqKMPmrptdu6aQgpgvgmZMiq3NoFk5Ofyegb9pbT/aeJ
 JirYYxMI0CAZNcm0bUofVkknemE321G2zgZJN0SFxmnV6qqE+4Cf96guDy3UtB/KLSZA7ty8IBc
 TBy0YnYw==
X-Gm-Gg: ASbGncs6/YJOyBkf8QCTAvekgJdvq3A2kTPbhl3B79HtEgPBo7w5/7e5+OAOiaeYoiA
 7Aq9UUO5sCiaO/btQz3hsTfHp6s8jO33Qur31fJhM0FQ5sPZzqnFougzTkoKJK07gnyMpnACW1W
 ZGSUJcX7Ods4/1KHDXRSenfmCpMuvX6ydHoixvek30bVJvdxioLDLn2FZade1K0F5lAb4yf/GB4
 RfHrf+aXehungBfSo0+5R7sX0npDpUaZdz2iePfwXVXPf1V0SO5kYMVBs7nOjIUAgCqpe2v6xj2
 2LqDECDwgvMFRvqo7NSu/SBU2bf6zyLjcW47f0Zd24YQ0K/u+kWr8IekRYQFgMR1su9NcwP1H50
 =
X-Received: by 2002:a05:6214:410:b0:6f8:ad68:7cf1 with SMTP id
 6a1803df08f44-6f8b084afcemr282827276d6.2.1747771625298; 
 Tue, 20 May 2025 13:07:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZ0ooob77YB33x3sc9TZXU71R5l2H/nFxJ6YO2AEHokNTU7hQE0QXzh10z0MZ3u3nyRxcaMg==
X-Received: by 2002:a05:6214:1251:b0:6e6:6964:ca77 with SMTP id
 6a1803df08f44-6f8b09023b4mr282754806d6.28.1747771614002; 
 Tue, 20 May 2025 13:06:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e7017f18sm2485042e87.158.2025.05.20.13.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 13:06:53 -0700 (PDT)
Date: Tue, 20 May 2025 23:06:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi/dsi_phy_10nm: Fix missing initial VCO rate
Message-ID: <3ywacd4x23zadvwikw4hdprgbgxxdmbcar3lyayy4ezmd5lcyw@3h2oosmbk6yb>
References: <20250520111325.92352-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520111325.92352-2-krzysztof.kozlowski@linaro.org>
X-Proofpoint-GUID: NiFniufibnpO4WMdXMWUNr8MLOMa-njK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE2MiBTYWx0ZWRfX8r+PRjxIh/qd
 kZKDLqdu353wZSKo+2lmqYppXHfV69asSt4lLw/lhQW4/PX5xv48CgOYneWS2TAqhFJGkoifPNs
 wrHsdASGohTfg57/DXfnDLq++rAttmq/9U4/HSs0iGXqiu1xo/Jfj4ymcuRkiMneYH4IorLS3h6
 IyUxrSOG3bTC9lrXtCzuVuENPzJyUc/MFCqApqQKZaLJyb6OQ4URfssiRt/4Wz1H/DL1i2X04Sv
 zI0Pne0z+xKNFp9HF7ntsRB4ZzmVht+cfJLgA/vkZBkHX4gnmqNlRHIdMZ17ZtdWkAgn8XJc5XA
 xaV7gQGFie9eEaXeXZekSIGrRHhMlwcQkNxMwOJseG5YhAYPtu0YOtt9DmUZ8PGgHjSf64pw8x4
 vPn1Awoo84vngSfrMJBevs3IRwKDkfuSSOcs2/l/6/jPcEMWUQlFNJQJf00Xg1UFkmknRAxw
X-Authority-Analysis: v=2.4 cv=F6JXdrhN c=1 sm=1 tr=0 ts=682ce0f5 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=qeqVY09uaiYIOShEJ-EA:9 a=CjuIK1q_8ugA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: NiFniufibnpO4WMdXMWUNr8MLOMa-njK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 adultscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505200162
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

On Tue, May 20, 2025 at 01:13:26PM +0200, Krzysztof Kozlowski wrote:
> Driver unconditionally saves current state on first init in
> dsi_pll_10nm_init(), but does not save the VCO rate, only some of the
> divider registers.  The state is then restored during probe/enable via
> msm_dsi_phy_enable() -> msm_dsi_phy_pll_restore_state() ->
> dsi_10nm_pll_restore_state().
> 
> Restoring calls dsi_pll_10nm_vco_set_rate() with
> pll_10nm->vco_current_rate=0, which basically overwrites existing rate of
> VCO and messes with clock hierarchy, by setting frequency to 0 to clock
> tree.  This makes anyway little sense - VCO rate was not saved, so
> should not be restored.
> 
> If PLL was not configured configure it to minimum rate to avoid glitches
> and configuring entire in clock hierarchy to 0 Hz.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/sz4kbwy5nwsebgf64ia7uq4ee7wbsa5uy3xmlqwcstsbntzcov@ew3dcyjdzmi2/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Fixes?

> 
> ---
> 
> Not tested on hardware.
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index 9812b4d69197..af2e30f3f842 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -704,6 +704,13 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy *phy)
>  	/* TODO: Remove this when we have proper display handover support */
>  	msm_dsi_phy_pll_save_state(phy);
>  
> +	/*
> +	 * Store also proper vco_current_rate, because its value will be used in
> +	 * dsi_10nm_pll_restore_state().
> +	 */
> +	if (!dsi_pll_10nm_vco_recalc_rate(&pll_10nm->clk_hw, VCO_REF_CLK_RATE))
> +		pll_10nm->vco_current_rate = pll_10nm->phy->cfg->min_pll_rate;
> +
>  	return 0;
>  }
>  
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
