Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D803EB348A2
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 19:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981B410E518;
	Mon, 25 Aug 2025 17:28:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gBow2Tw2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D6C10E267
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 17:28:43 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PFmn1c018404
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 17:28:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=a8nUyAPGjf8x9ikWVpGDqkIv
 +8rZqElYhK4d+QfYf+E=; b=gBow2Tw2JnrLZzOWisGdzxf6rKnKfn14a1JYIE0N
 tg9HvO8y5SMF/NKFCI+KJCjb3TaQ1ZzsvFC4kecymjcJBdgZVnQ031xlKsoxwJhu
 3Gm3aLgCmKcfihXGVGHeKULG6YZOs9INXlyeW2yYW3nH0pBccQWEGlDFqsHQGyEL
 NiCEvZLR9hwaAJ3sKEBqrg7Q3xQ7xI3OdhBgNgWH8tcN1s/n/CHS48U8FTWo3unC
 LdHp6pn7CTEP+JaKezD0CcpnAZJZuoqbTaXiFn3hoPz8t62THVp/bf4kKxQ+YSyR
 GGxevGj5CRzLlQEcjrFOxS9nzYM6n03CX42773UdqBnGWg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpp223-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 17:28:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b109c7ad98so171473381cf.3
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 10:28:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756142921; x=1756747721;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a8nUyAPGjf8x9ikWVpGDqkIv+8rZqElYhK4d+QfYf+E=;
 b=l5Hy4QXCXTeoFXC+iTS0odZ6smY/gT0HubCWg4KMdLXhkJz5fFC4a1iLhfNzHFNjTS
 CsRKPwIsNOuu+xCrN4envEh1TIO1bzB9LkquCNSvajersit+NA55pVOjAgb6Hp9GH/q9
 a3hvvAY4jWXFPcVsAz757qpQAaoL1Ka6Of7HQiGRRDKZHPQCMxSWYpRUDeOekZ0ACyxF
 OlGSsRAMhYu0J8NKHGaCcH7AC5Ef7E8gzjB05Y/H/zxPTEvJ/4B++svhXpVcItdlLev9
 uaao7Nvtt0opcCjmt8FqB1axwymG+DCOQAwBWe00pM6RYtcHmYx53LArlwTxaDQaZgAt
 fT6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXunkF2kpOBeoBezs5CTxfeDC9VSqu1jxj0zR5AFP2w4Fmr19HYQk3P+bb3kS9p2S3YI2uJP6hBjA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzakZvxuFTSnzO/RdJ0jXOSTwMS1eL7P6Wei0z6TCQweTKHnw+R
 IXK5ltvHJKXNluAjQOEinAF+xaoYVy0lovjFqTN8fB4soau9TpN3AUUnihGFX3lmCxkAyhgdPJ6
 5U7UEAiXq8cX6t6+4xqHei3+6Q93hL0Wf0+7fbCsZv7WEg4uNklmSlNrdY3uGGx/BIjmb/ks=
X-Gm-Gg: ASbGncvhpghhnJ11CyqJXRaLrA/FbT61kCmePfI0J5MfDDq1j2SvRoaft3jwaac359a
 MnxdR1ggPbm5hg5Htz+QD+SYvGEX2BbLh4IgQ3JRXdJDfe+0teSLg9Jx9dlNQrDkLf3LMq1xoIS
 wz8hf4USx6awscZnl+M7++cvqTH4ZhUrbkPlLyaDQuZO/zawbNeRclX1Kdr/zNa8qnMiwTvcXPh
 /KwkmLRJdPZzt3D6CUs+FYUnuMLPVzJDegwthFRwY5go7ZjYK1p/Bc0354KoqDDAdihY0jVlLQi
 ni9cuSer0OHKqUb92/3br3YK78mLMp9ZZMPzie3Xz/HbMxOx/HVEWwK/0ZTgIWHq/tqtqXgoDBY
 N7Gqfivd9y5eIHijIR8GwsYOC1VftJhE7Be3n3jLc7sqmB7c3Oy/h
X-Received: by 2002:ac8:7dc8:0:b0:4b2:d4d8:13e4 with SMTP id
 d75a77b69052e-4b2d4d8177bmr46741621cf.19.1756142920946; 
 Mon, 25 Aug 2025 10:28:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElrTmsGh7ReiQT+rKWOGk73Md6WxupMETAj2QE15ZZrrWLzM1ZHzlak3lQmf4cmEkmQHgLYQ==
X-Received: by 2002:ac8:7dc8:0:b0:4b2:d4d8:13e4 with SMTP id
 d75a77b69052e-4b2d4d8177bmr46740991cf.19.1756142920362; 
 Mon, 25 Aug 2025 10:28:40 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3365e20dac8sm16526111fa.8.2025.08.25.10.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 10:28:39 -0700 (PDT)
Date: Mon, 25 Aug 2025 20:28:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/38] drm/msm/dp: splite msm_dp_ctrl_config_ctrl()
 into link parts and stream parts
Message-ID: <vvemyg2t3ycjwb3uhwua7ow6yjvo2mnu5tdrqc3ed3iuj5ue3v@bfvgfhcxbgke>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-5-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-5-01faacfcdedd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68ac9d4a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=irA99dXQLtNLEYesqbQA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: ZCPkaQdA8jneG2v8HDUMcfcvgpn3af97
X-Proofpoint-ORIG-GUID: ZCPkaQdA8jneG2v8HDUMcfcvgpn3af97
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXyYqf2bjWAr6K
 5J4n4oyViE4/7i4f0ZcWdnxLbjxHdnID2CPAd8WGYwu9tyrGiqNDhdtCiGdvWXmyFMouvcYg3df
 4YwuBuZIH72YTnzoQ17qY/ADc7Iz8k/tV1WL+ke8wLNMF10Tl1gKqi4tcX4UW1FT7DeT010BzoG
 I70EtpciszHAfSlkPN7EdnRTNHee3NmYsVsbma1Wciv/GuXCeJdrndHlXBUXZgO9YwoMYdCSENQ
 TFaS6GBiR+8AyLKebwUo+ru5xcnvl4JHaOH9itIKheLxfRHtZokAqyzm86+gwWvX8Qzqj0EmuvP
 Gif9YjSbEM3jfpwcyLfDZVAccO9q8ftDg77UzygP2i73Ou6EWFvWFeGcUJxMlEdnHcbztp4A6nA
 mey3Qver
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

On Mon, Aug 25, 2025 at 10:15:51PM +0800, Yongxing Mou wrote:
> The DP_CONFIGURATION_CTRL register contains both link-level and
> stream-specific fields. Currently, msm_dp_ctrl_config_ctrl() configures
> all of them together, which makes it harder to support MST.
> 
> This patch separates the configuration into two functions:

git grep "This patch" Documentation/process

> - msm_dp_ctrl_config_ctrl_link(): handles link-related fields
> - msm_dp_ctrl_config_ctrl_streams(): handles stream-specific fields
> 
> It also moves the link-related configuration out of
> msm_dp_ctrl_configure_source_params().

Why? And it looks like a separate patch...

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 49 +++++++++++++++++++++++++---------------
>  1 file changed, 31 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index e1ff4c6bb4f0eed2e1ff931f12ba891cf81feffb..45d6c9a7f7ddaa049443253cbf4c6fc5feda3177 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -380,26 +380,41 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
>  	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");
>  }
>  
> -static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
> +static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
> +					    struct msm_dp_panel *msm_dp_panel)
>  {
>  	u32 config = 0, tbd;
> +
> +	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
> +
> +	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
> +		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
> +
> +	tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
> +			msm_dp_panel->msm_dp_mode.bpp);
> +
> +	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
> +
> +	if (msm_dp_panel->psr_cap.version)
> +		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
> +
> +	drm_dbg_dp(ctrl->drm_dev, "stream DP_CONFIGURATION_CTRL=0x%x\n", config);
> +
> +	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
> +}
> +
> +static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)
> +{
> +	u32 config = 0;
>  	const u8 *dpcd = ctrl->panel->dpcd;
>  
>  	/* Default-> LSCLK DIV: 1/4 LCLK  */
>  	config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
>  
> -	if (ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
> -		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
> -
>  	/* Scrambler reset enable */
>  	if (drm_dp_alternate_scrambler_reset_cap(dpcd))
>  		config |= DP_CONFIGURATION_CTRL_ASSR;
>  
> -	tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
> -			ctrl->panel->msm_dp_mode.bpp);
> -
> -	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
> -
>  	/* Num of Lanes */
>  	config |= ((ctrl->link->link_params.num_lanes - 1)
>  			<< DP_CONFIGURATION_CTRL_NUM_OF_LANES_SHIFT);
> @@ -413,10 +428,7 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
>  	config |= DP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN;
>  	config |= DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK;
>  
> -	if (ctrl->panel->psr_cap.version)
> -		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
> -
> -	drm_dbg_dp(ctrl->drm_dev, "DP_CONFIGURATION_CTRL=0x%x\n", config);
> +	drm_dbg_dp(ctrl->drm_dev, "link DP_CONFIGURATION_CTRL=0x%x\n", config);
>  
>  	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
>  }
> @@ -439,10 +451,7 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
>  {
>  	u32 colorimetry_cfg, test_bits_depth, misc_val;
>  
> -	msm_dp_ctrl_lane_mapping(ctrl);
> -	msm_dp_setup_peripheral_flush(ctrl);
> -
> -	msm_dp_ctrl_config_ctrl(ctrl);
> +	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
>  
>  	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link, ctrl->panel->msm_dp_mode.bpp);
>  	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
> @@ -1614,7 +1623,7 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
>  	u8 assr;
>  	struct msm_dp_link_info link_info = {0};
>  
> -	msm_dp_ctrl_config_ctrl(ctrl);
> +	msm_dp_ctrl_config_ctrl_link(ctrl);
>  
>  	link_info.num_lanes = ctrl->link->link_params.num_lanes;
>  	link_info.rate = ctrl->link->link_params.rate;
> @@ -2524,6 +2533,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
>  	 */
>  	reinit_completion(&ctrl->video_comp);
>  
> +	msm_dp_ctrl_lane_mapping(ctrl);
> +	msm_dp_setup_peripheral_flush(ctrl);
> +	msm_dp_ctrl_config_ctrl_link(ctrl);
> +
>  	msm_dp_ctrl_configure_source_params(ctrl);
>  
>  	msm_dp_ctrl_config_msa(ctrl,
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
