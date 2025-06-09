Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8736AD20E1
	for <lists+freedreno@lfdr.de>; Mon,  9 Jun 2025 16:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA99B10E3CE;
	Mon,  9 Jun 2025 14:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PGlxAggo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB0010E3F5
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jun 2025 14:27:42 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559BJ2Gg020026
 for <freedreno@lists.freedesktop.org>; Mon, 9 Jun 2025 14:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=f/of6TTom4AU2Dvwq6I7gBZ0
 T1k7Wh85jIn8qO8HSos=; b=PGlxAggo6JmRUYZlnbJIreFKI7ywwLexQnAwMDm3
 UfrYRr4rudsM8In0zflz6G8VheoNGziyS+GzNcxC/9brNVKjhtpdWKeGt9VGZsis
 CxUtIKazhK/1DoWawXaYKewuojWxLuImek6oGgC8asE32EVZ5sdC4xEmM2Ltblf6
 HK2WQM3LX2LFrs+hrDH7VMk4kNHwfsuTBgWLKoK7ljUSB19XGyFAMIp3sSqymJip
 tGJrIH8W76wzZViQ9wRIe6kbMMvpGdSJrOV7ifro9R+Sijhyszy4TQsQHcDWr7ko
 eXv1D8yEBAxqJ6Ba1m9X8layu2zZf4xSqKg5Y8oxMf2i8g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475qctsqpc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 14:27:41 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6fad8b4c92cso117822636d6.0
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 07:27:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749479259; x=1750084059;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f/of6TTom4AU2Dvwq6I7gBZ0T1k7Wh85jIn8qO8HSos=;
 b=OurVeT+B1s52M8aDliy7HmJ311TfIScw6KLcSe2fvyszE7sewK3OfCL5louoOCAKqe
 OLpfGT50+mnGhEWqXNGSXqVSZwUpQKzPXxvmhPc4LDoj1YpOrHpXQbBRxd6wVlmOySVF
 sbv/k9kXWWtGY9TxIlPRenEAtX7XZN7mPot3Y2cmJaVbHYqd/C84mFTXwHiSuoKtHwRP
 mm7iUlyvPZksWWuYDd2AhKxXhMaTCeUfiHdGCQtrLsg993xgzWgZMFdOHnbX+gPPubMd
 Cw2piAkzZV0XhjGA8gPjNxGr0JB4WqbT5Z7cveqevad4ja1cizEeBV2fvytvN2TN4OvG
 rA+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTls5iM1vl+U7bhkBF4F0pBRT9pKkOHodNWj5VVmS604j1rvkr+Dn43WcUglbnAd2XYplsTkiPCII=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1i6UvPgHPwzvkOnfpOYaMUHQqoPHSYngKNL0wf5eoVw/0ZFgx
 TUX6xeU0dwbv3fTOVzfHdSXiXRqu6bTU4DR+/GlWutJt/gBgzuxnmDxu3UhiHEL+c7OJosly+xR
 RI3fRtR7nABi/KjJ23IXzo2LoTYu++MeGPjzsNEkJXFdrIVydMRNRfgg5umIhstzv7Lq7F7c=
X-Gm-Gg: ASbGncsdNl/svDn6Me/093C5vFyHnymFLt8vOULkO6BsZj5+rH1tSxg2FCDdrLAgX8n
 49u5Pf0KEcViG3qqXwqmkKRM6I2tfDxrsbozJBoj553FT2f0Rdele+eJMyAXiXFAFTGkefIhsRR
 abKTCiT2QzHUvu03UfhK9zvbgruuG3pekD8nIiUbT/45N9RJjibxuNoXp6qwCETsD0FSJYGsfzO
 0z3WVvjHVGTXg1gRgul7o9vfu/HjqLMIVBmqBhYkFDvFu1R68WgIU3oOUmLPu2FLY8DDX7YwCMo
 +TQkWFS4ebGHyrHaTZZNXGS22m4cLmrPq2jy+DyjcrA919XEcSGNHYK5Qb/XnCv2Q1t26JJWbB8
 =
X-Received: by 2002:a05:6214:c68:b0:6fa:ca81:4121 with SMTP id
 6a1803df08f44-6fb0905b95fmr180867606d6.44.1749479258415; 
 Mon, 09 Jun 2025 07:27:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENywj9pL8N2WDsT8WlwUxJkuPyVSuk0P83Ce8cs9bs9NhhCmWwbrm8PLpnm0ddvieJHs32lA==
X-Received: by 2002:a05:6214:c68:b0:6fa:ca81:4121 with SMTP id
 6a1803df08f44-6fb0905b95fmr180867086d6.44.1749479257879; 
 Mon, 09 Jun 2025 07:27:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553677222edsm1176230e87.122.2025.06.09.07.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 07:27:37 -0700 (PDT)
Date: Mon, 9 Jun 2025 17:27:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 34/38] drm/msm/dp: initialize dp_mst module for each
 DP MST controller
Message-ID: <oy4inbe4jg5gw77sgrkcgi7b442fqc4muiuwse5bffbftpmcbn@ajqbpxorszk6>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-34-a54d8902a23d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-34-a54d8902a23d@quicinc.com>
X-Proofpoint-GUID: WzFFuazoHum3qL0i8J_1nXnQmwxaBfVD
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=6846ef5d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=ziSFFFU8-FvEhn5Yk-UA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwNiBTYWx0ZWRfX2/isNxaSy4uT
 LZcDRdBER8J60z/l94Dv3E2ZVhXbSBPmAbYaVjq5OKKS9rqmfJm41Ks3rOyus9cwXneqD2DBcC1
 hXNi5A6ilCbXu/Yk+My+A/GOAYpOgcoHUBsrB4ds5OfJCpxyvoV/bZG7E2uj0SBIqM3bIHGs+jc
 /4VTSc4/eFQT/K6sNu7Qlby+GctUQ6MIPVpqwYF71LSXsILMWJnrryxAWbIiQNS0MRZFwTGPP1V
 WoxN7wuX9k8j3eg4g8TEWo06SxN2/fMfBU/F1aULtiKldIDMi3GjvMSqtn+vkSTnH48bevhdZG+
 bvFeEn6dvQtHvo/rDKO+bJcVmIfHTCEk7nevkCeVn891hL9NpNPrt6JH1QMEXXgKv4oxj/OB+6t
 /JqCn3Z/tnbYKunK49COg3c3bhwq6FZi5XFS3uEclOwrS6q0+0e3w/ueEtZZ2GE0aoNRffWW
X-Proofpoint-ORIG-GUID: WzFFuazoHum3qL0i8J_1nXnQmwxaBfVD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090106
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

On Mon, Jun 09, 2025 at 08:21:53PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> For each MST capable DP controller, initialize a dp_mst module to
> manage its DP MST operations. The DP MST module for each controller
> is the central entity to manage its topology related operations as
> well as interfacing with the rest of the DP driver.

I think there is an ordering issue. Previos patch has already registered
MST-related objects, but only this patch provides a way to init it.

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 6 ++++++
>  drivers/gpu/drm/msm/dp/dp_display.c     | 9 +++++++++
>  drivers/gpu/drm/msm/msm_drv.h           | 6 ++++++
>  3 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 45fedf7e74e9c6dfed4bde57eb675e3dd1762fc7..e030476dc4c69448886c29bcfe8ff3105949b129 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -680,6 +680,12 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  		stream_cnt = msm_dp_get_mst_max_stream(priv->dp[i]);
>  
>  		if (stream_cnt > 1) {
> +			rc = msm_dp_mst_register(priv->dp[i]);
> +			if (rc) {
> +				DPU_ERROR("dp_mst_init failed for DP, rc = %d\n", rc);
> +				return rc;
> +			}
> +
>  			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
>  				info.stream_id = stream_id;
>  				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index ab1ad0cb6427eb4f86ee8ac6c76788b1a78892a8..526389c718edccbac9b5a91e8dabf0d84ed1a8b0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1667,6 +1667,15 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
>  	return 0;
>  }
>  
> +int msm_dp_mst_register(struct msm_dp *dp)
> +{
> +	struct msm_dp_display_private *dp_display;
> +
> +	dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
> +
> +	return msm_dp_mst_init(dp, dp_display->max_stream, dp_display->aux);

Inline

> +}
> +
>  void msm_dp_display_atomic_prepare(struct msm_dp *dp)
>  {
>  	int rc = 0;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index dd403107b640ee5ef333d2773b52e38e3869155f..1496700c38ad73d6edcf56fbb0ebf66505c608bf 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -374,6 +374,7 @@ bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
>  
>  int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
>  int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
> +int msm_dp_mst_register(struct msm_dp *dp_display);
>  
>  #else
>  static inline int __init msm_dp_register(void)
> @@ -401,6 +402,11 @@ static inline int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_e
>  	return -EINVAL;
>  }
>  
> +static inline int msm_dp_mst_register(struct msm_dp *dp_display)
> +{
> +	return -EINVAL;
> +}
> +
>  static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display)
>  {
>  }
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
