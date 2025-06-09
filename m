Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 772EAAD20B6
	for <lists+freedreno@lfdr.de>; Mon,  9 Jun 2025 16:17:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA5210E0DD;
	Mon,  9 Jun 2025 14:17:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VgGY+WkX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C9010E0DD
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jun 2025 14:17:11 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599jfZJ009687
 for <freedreno@lists.freedesktop.org>; Mon, 9 Jun 2025 14:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=aVI7bwlPGVd8Av54c0R1XNDW
 MOUYLmY37xlJhTSHOiY=; b=VgGY+WkXGoS8+3WLnJDc+9R3ASU1McKGz4DffR/v
 00K9+8PYYRTeFvLDBix/2Q31EYKhCmWogRfcfZrpQrbfXRKTS+mazgfw2anFgB1R
 BBTOrLcqvl28eQGhdfHCOc1v1ACGQv4npIxJm1w/w5xh229o5WvMX6iz7ulUuIK6
 O/1UokFeta5pvrujRqGRjTsZwzRAji9r3XBVTTYq4cZ9m3slcmIyij2rhr3Vd7I3
 bhMpfeDcAlxWNgE/YrYOpiRNS9X+77EJQxhPsTh4SDnuyu3ZL81lIeR1EMPaRccP
 yEPHcWvVos7adGwyqwWBBxY80iRTRRh11E+nsDNQTYj79A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474e6je2gs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 14:17:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5f876bfe0so815179685a.3
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 07:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749478626; x=1750083426;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aVI7bwlPGVd8Av54c0R1XNDWMOUYLmY37xlJhTSHOiY=;
 b=pQMqKLIJOAiwfF++0ufMi+JDURSxJSv3lixVIoVHtkB7x3jhBSUx6ZZiFmJghV9Imb
 B/I3218pARs+x77NlafTlDg+tpEryBusX79uwPX7lD/0hG5iIGlQXc0g8/Vajt+K45b/
 5PinJZBjsquzYAFVQcezupPvIw8QjXVvwAP6aUtImAWwxNiHC2y0vINSD5/9XrdprGrT
 wvDwccgcjaDiVlz2ZR4l5vEfDzxW6SmSZHNFgTN8gGY85tlaES59iL+KY4G3JF8k/Axp
 yMpw4aQ7eCWISFX9RQ3yVxch/by2Zuu+eCOsrXpvZbIZSqMRMnDyWF/f9l637n6/ULIv
 GaGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrQiaphgA0XqWNZ7OcdLZCGg/3zf2nMF7B3q04aNYQt1Tnh5h6JPOsZud/qoIZpq2ysbQlZAszLmQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy08p+inOu2tvYKY/SMGoVH/1rZ829/L67n+H7WGQQ57xVf51oI
 o0TL6aP70NOizVeahl07UxL/S9Dd+0mVdNQ3hhrBqpcXpMLFxvQ0cxeBZ3PHC5UfT2Wy5hjFX8C
 CM3rkdNLr91l+J1wZnEvdvJoApXBIthODJg9g/LJJ56q9mg9kXsv29LtSJ8VDZ1MzF/AUvZs=
X-Gm-Gg: ASbGncv2u5TN/5iF7dbCjXLajcg02Xal7GDafzJYisIWHU7Xfg+Ng4dHR0j1S6DcaHl
 QOlmw6XZmTKxMluk8P81i8PGQQpMdm0rsJa1qIpbcwjefvK1erarAPMdvBNbUQHTlUAlOa5iTi3
 zGWylEZrfAXVQ5xQgEWo79Lbxv/WvCBde1AJm9yqtSFR4HsckHQAjIwEhJUqtJjjoiaOBIWMX2u
 W9IvoX+3hvYMmBwTAFCVVVGxWeHJ552yhXlFeWEvlLVXhLISKfXjxRPd0KOEYZsyHo/MhohPd7y
 5m5moHg8v9CpvCkkFuKQCkoq6SqNuxLCn79gkvb3c/GDlxUz6qZ1CTO2s/CgrNYWkJDLuYceXBs
 spY+YtBL00w==
X-Received: by 2002:a05:620a:28ca:b0:7d0:eac6:6df8 with SMTP id
 af79cd13be357-7d22986ec80mr1995014185a.18.1749478625635; 
 Mon, 09 Jun 2025 07:17:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVnzslQ94N1zxxegjmppOQmspczMZd4IHKM4NH9MnXEl7WiguTQ9BljuHGN9i9ooyXLGUUCQ==
X-Received: by 2002:a05:620a:28ca:b0:7d0:eac6:6df8 with SMTP id
 af79cd13be357-7d22986ec80mr1995009685a.18.1749478625147; 
 Mon, 09 Jun 2025 07:17:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553676d7118sm1173826e87.54.2025.06.09.07.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 07:17:04 -0700 (PDT)
Date: Mon, 9 Jun 2025 17:17:02 +0300
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
Subject: Re: [PATCH v2 33/38] drm/msm: initialize DRM MST encoders for DP
 controllers
Message-ID: <hxqeilu5fcgsykghxwbhp4r3exu3o45n5lftzeupjxam7r7ux7@wdrfc6lor4gl>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-33-a54d8902a23d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-33-a54d8902a23d@quicinc.com>
X-Authority-Analysis: v=2.4 cv=Id6HWXqa c=1 sm=1 tr=0 ts=6846ece3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=3qYReTC3F8QknLo2NzEA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: gH_vOknoUFq22rf-2YeAHfu8jlFcQC-M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwNCBTYWx0ZWRfX4Z+823yUFJpl
 kuLHfBWcL3G5ciPinUrVfAIzHell77qHBZrit4D1sQPEoBsEDkvz9+Tk1v+KgSuKD5ga9UMpMHK
 qfLy6z6voIFEdSRwRUwAyGUwXK34jxNrjEWZh/riQsAQHuJOaA2pCHsFatEJdIPP8H3ZD7tIlwR
 tFXNFnDO4MLKYau6Yua9Km/Y/ja75j2ppBslBHnJ5+O67ULbiRwup12MM5IhFFMWRw25h9FWXzz
 LfUAooUqaw4ykdTXq4pcsCJA9Zju6w6ggaPjcLWTWSau89ILWDeJNsF0xhHG5zDy90PD8SOfItH
 gshq+KpmYG79uRNnb39CUoCcjc9iDK0SZIV1F3jFRFLaqIhNNpcjlVJ46BPs6sQAkGKwfMNgA4K
 2u8W+w63Wl/gniJr1Y0yX2yXHKbRjvCfHIqpMb9aedmQlZ1+dzzusg7VSjfSgB0/WOeHEUdw
X-Proofpoint-GUID: gH_vOknoUFq22rf-2YeAHfu8jlFcQC-M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090104
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

On Mon, Jun 09, 2025 at 08:21:52PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Initiliaze a DPMST encoder for each  MST capable DP controller
> and the number of encoders it supports depends on the number
> of streams it supports.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 23 ++++++++++++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_display.c         | 14 ++++++++++++++

Please don't mix DP and DPU changes in a single patch.

>  drivers/gpu/drm/msm/msm_drv.h               | 13 +++++++++++++
>  4 files changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index ca1ca2e51d7ead0eb34b27f3168e6bb06a71a11a..2eb4c39b111c1d8622e09e78ffafef017e28bbf6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -28,6 +28,7 @@
>   * @h_tile_instance:    Controller instance used per tile. Number of elements is
>   *                      based on num_of_h_tiles
>   * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
> + * @stream_id		stream id for which the interface needs to be acquired
>   * @vsync_source:	Source of the TE signal for DSI CMD devices
>   */
>  struct msm_display_info {
> @@ -35,6 +36,7 @@ struct msm_display_info {
>  	uint32_t num_of_h_tiles;
>  	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
>  	bool is_cmd_mode;
> +	int stream_id;
>  	enum dpu_vsync_source vsync_source;
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 1fd82b6747e9058ce11dc2620729921492d5ebdd..45fedf7e74e9c6dfed4bde57eb675e3dd1762fc7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -652,7 +652,8 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  	struct msm_display_info info;
>  	bool yuv_supported;
>  	int rc;
> -	int i;
> +	int i, stream_id;
> +	int stream_cnt;
>  
>  	for (i = 0; i < ARRAY_SIZE(priv->dp); i++) {
>  		if (!priv->dp[i])
> @@ -675,6 +676,26 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
>  			return rc;
>  		}
> +
> +		stream_cnt = msm_dp_get_mst_max_stream(priv->dp[i]);
> +
> +		if (stream_cnt > 1) {
> +			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
> +				info.stream_id = stream_id;
> +				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
> +				if (IS_ERR(encoder)) {
> +					DPU_ERROR("encoder init failed for dp mst display\n");
> +					return PTR_ERR(encoder);
> +				}
> +
> +				rc = msm_dp_mst_bridge_init(priv->dp[i], encoder);
> +				if (rc) {
> +					DPU_ERROR("dp mst bridge %d init failed, %d\n",
> +						  stream_id, rc);
> +					continue;
> +				}
> +			}
> +		}
>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 9dbcf4553cad70c9e3722160a87403fc815765d7..ab1ad0cb6427eb4f86ee8ac6c76788b1a78892a8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1417,6 +1417,20 @@ static int msm_dp_display_get_connector_type(struct platform_device *pdev,
>  	return connector_type;
>  }
>  
> +int msm_dp_get_mst_max_stream(struct msm_dp *dp_display)
> +{
> +	struct msm_dp_display_private *dp_priv;
> +
> +	dp_priv = container_of(dp_display, struct msm_dp_display_private, msm_dp_display);
> +
> +	return dp_priv->max_stream;
> +}
> +
> +int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
> +{
> +	return msm_dp_mst_drm_bridge_init(dp_display, encoder);

What's the point in this oneliner?

> +}
> +
>  static int msm_dp_display_probe(struct platform_device *pdev)
>  {
>  	int rc = 0;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index a65077855201746c37ee742364b61116565f3794..dd403107b640ee5ef333d2773b52e38e3869155f 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -372,6 +372,9 @@ bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
>  			       const struct drm_display_mode *mode);
>  bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
>  
> +int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
> +int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
> +
>  #else
>  static inline int __init msm_dp_register(void)
>  {
> @@ -388,6 +391,16 @@ static inline int msm_dp_modeset_init(struct msm_dp *dp_display,
>  	return -EINVAL;
>  }
>  
> +static inline int msm_dp_get_mst_max_stream(struct msm_dp *dp_display)
> +{
> +	return -EINVAL;
> +}
> +
> +static inline int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
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
