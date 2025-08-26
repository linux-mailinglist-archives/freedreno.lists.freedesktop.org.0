Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D87A5B358CA
	for <lists+freedreno@lfdr.de>; Tue, 26 Aug 2025 11:26:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 984AF10E61B;
	Tue, 26 Aug 2025 09:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XOuHedPu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B28210E61F
 for <freedreno@lists.freedesktop.org>; Tue, 26 Aug 2025 09:26:16 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q31JTR026983
 for <freedreno@lists.freedesktop.org>; Tue, 26 Aug 2025 09:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=7KgDcKLK3b159g1W/t3sHnMu
 AA3fp8hQ8bh2XnHJ4Gc=; b=XOuHedPukwV2WWTwQlYfxX5/a2iR0+oJ8xUiQ9En
 OjLXPMJPmxWkkRBeWoSd6iFocYiVWJ6YmTOlpvYTig5msjnVJs3LGupRh1XlM5zw
 wM97wUlfeYI8ygDchqRFcpxyKsQUdislQIYS9BVMk+j0vR3QO5eSrjTT5qPl2U/A
 72Wnm5UhJd8qciTwCnpxH5HJ3t0/k1FnB/5dhztcv0nPoPPxGr3Lxs51xy7Nfxoy
 pXDVCQD3ALX76UUQk6nXkasTCcxDqGrEVicPI/Twh2Gqr8JWGtFN3gwpFQRfYTPW
 6c8yq9kDp3/e7JjHnZpZVTZSDyyMminjrhsnSJ1uRdIcxQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x88a5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 26 Aug 2025 09:26:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b0fa8190d4so158327181cf.0
 for <freedreno@lists.freedesktop.org>; Tue, 26 Aug 2025 02:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756200374; x=1756805174;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7KgDcKLK3b159g1W/t3sHnMuAA3fp8hQ8bh2XnHJ4Gc=;
 b=SdHVn4EmOzRy959MySNRdDxTB/O4RCg1C9V/2ueqDLUSr395Sw46fxFlOCLEM5wNtg
 qN1ioKNrJRB1pfd2mikd5NqDnKOQwBt0Ou5SnsKlvN7Rfbb7Y7BIVSBISjXe9Xs1cd3u
 lBZLWZKWv510NfpJzaojxOtKKUO086h1FJXTK6wueTWfpYQx0U5UURa9oBvsi+fJGt8/
 C0SrwJwZZqn9UpROz2jfxG6yn0wvr/hUtO8A/2F83DMt6NR7zMUFi5XxJub+T1I2bsuj
 fdtjy/IMeu1EUHT7DAf2j1pTbZlOyohGNMhBkN8m8FdjhCLda79U5HNVeu/I9tGV4ou7
 JLjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPZ2AR58wz8TeY9nU2VqB7yzc188chuzuZuNGsSt/nl2m9h/KfRqzX8dDPymyD0Z7zTrJ+JF0A7l4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyliht4lJgqp15o+SYjJEn6RVG0c07P9Iu7EKNrLll+FKwMhQKl
 4IbfN++zJVOmLRrZTnyxngN12M4zefEeltQH5/MpQ9kbFdgtu3mCrftodDH0hbWDGJyLB7rKon3
 Ejx/Ee5+8rwCnd9BKRYC8Pq2jSsUXIuPa00aEq7Uyuitp2g/V8/4E1vzBEt7DiwklSaT4Fes=
X-Gm-Gg: ASbGncsNkaaNAr5FyorJ9KRI+yVQJLH2ZdKrstJuG5dBMxCbXlwui+Hy4C/iva1/AMi
 a8FxYTJARREUGQ2rbnlVs6JqPI8KmhmaxszA2q9UwqsLBAcSosaZAKtcGe4UCxAsZAcbPkdbz03
 +sePnzZ7VAVfhLs2JLNkneo5AFInQiLOMNTeRb7HFv06BxDN38IldS5uGmjejgs5Id4Us2UESjl
 h3rpBRwovUMxvbDLtqm/DBkLonCFtpa85LYXupUBB2nQOd1QveLx4N8UP5P/1XEwsqPQgn+t0B6
 W2MtW80EngTGeynmN5yR62aKa9wLc7sBDE+DNAU2CdWx8Q5xrIR4b8DH+3u9YjkWejEaj5H1xCo
 qmTRtTTV3J+rUR9hIhooIc+5+LgQblJW7xb+2fzyGA5A5Gn56psYl
X-Received: by 2002:ac8:7d0f:0:b0:4ab:958a:6003 with SMTP id
 d75a77b69052e-4b2e76f6c0emr6051081cf.27.1756200374148; 
 Tue, 26 Aug 2025 02:26:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLI2pBmaxUZlk2JfGZiIZiLVPRGKwKddxYmLZBVub9Mv5V9yCX6KNDj8QRrTIRv5+E0q1Vzg==
X-Received: by 2002:ac8:7d0f:0:b0:4ab:958a:6003 with SMTP id
 d75a77b69052e-4b2e76f6c0emr6050811cf.27.1756200373545; 
 Tue, 26 Aug 2025 02:26:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c11ffesm2214856e87.40.2025.08.26.02.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 02:26:12 -0700 (PDT)
Date: Tue, 26 Aug 2025 12:26:09 +0300
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
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 26/38] drm/msm/dp: add an API to initialize MST on
 sink side
Message-ID: <4u5bt5y4suecanvxni2fnljdzrxnkjrg2dgkwzpj4pztvyoef3@nopu6m7w543n>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-26-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-26-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: dVnMJ1-4UPgkYB5znHQ7YdGc7_OevZtZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfX495qtwQYlsyf
 ksBe9u0vtrASCQR5b5EdeEPs5EJCg52Zmnu3mKazHbRUtyqW1UYzxcCaIe6BVZQ3dlxUUQknExH
 wGMqyqVKNWXUrep1rHRMEj7OpIZECTm0tdmzYL+nDCltGpP7yK4MQjtV/xMIQI9Yl3nFQgSWpdW
 uqFMt6dKTzq6gZNQd46q6VEWUSJHZa5OVeG7SH+95au57GefaranTEHGlyqFisN6fhlr+xPX9XM
 t7hjY6XqrdoH7N4kiPnJF08Z6DRNsfM2D/v5SqWSrV/qEyp5JvWmj6YhkzCiNVDzg+QKC7BqoUk
 mqKcQrXewfymAo3kzDtG3thgjaYs6jqqa5viqPWeyvyEeGefWvsKXenLu1ye4QO3RNNA5ITG07r
 qwSs66F0
X-Proofpoint-GUID: dVnMJ1-4UPgkYB5znHQ7YdGc7_OevZtZ
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68ad7db7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=7z2oCe98pf8tU8XqQ0sA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044
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

On Mon, Aug 25, 2025 at 10:16:12PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> If the DP controller is capable of supporting multiple streams
> then initialize the DP sink in MST mode by programming the DP_MSTM_CTRL
> DPCD register to enable MST mode.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 55 ++++++++++++++++++++++++++++++-------
>  1 file changed, 45 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index cb433103d439ac6b8089bdecf0ee6be35c914db1..84df34306fb557341bea288ea8c13b0c81b11919 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -14,6 +14,7 @@
>  #include <linux/string_choices.h>
>  #include <drm/display/drm_dp_aux_bus.h>
>  #include <drm/display/drm_hdmi_audio_helper.h>
> +#include <drm/display/drm_dp_mst_helper.h>
>  #include <drm/drm_edid.h>
>  
>  #include "msm_drv.h"
> @@ -297,6 +298,35 @@ static int msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd
>  	return lttpr_count;
>  }
>  
> +static void msm_dp_display_mst_init(struct msm_dp_display_private *dp)
> +{
> +	const unsigned long clear_mstm_ctrl_timeout_us = 100000;
> +	u8 old_mstm_ctrl;
> +	struct msm_dp *msm_dp = &dp->msm_dp_display;
> +	int ret;
> +
> +	/* clear sink mst state */
> +	drm_dp_dpcd_readb(dp->aux, DP_MSTM_CTRL, &old_mstm_ctrl);
> +	drm_dp_dpcd_writeb(dp->aux, DP_MSTM_CTRL, 0);
> +
> +	/* add extra delay if MST old state is on*/
> +	if (old_mstm_ctrl) {
> +		drm_dbg_dp(dp->drm_dev, "wait %luus to set DP_MSTM_CTRL set 0\n",
> +			   clear_mstm_ctrl_timeout_us);
> +		usleep_range(clear_mstm_ctrl_timeout_us,
> +			     clear_mstm_ctrl_timeout_us + 1000);
> +	}
> +
> +	ret = drm_dp_dpcd_writeb(dp->aux, DP_MSTM_CTRL,
> +				 DP_MST_EN | DP_UP_REQ_EN | DP_UPSTREAM_IS_SRC);
> +	if (ret < 0) {

I didn't catch this up in the previous patches. We have two sets of DPCD
accessors: the older ones which can return error or the size of the data
that was actually read / written (which might be less than the size of
the buffer passed to the function) and newer ones, which return error or
0. drm_dp_dpcd_writeb() is from the first group, so if it was
successful, it should be returning 1. It's all a pain to handle, so
please start using newer accessors in your patches (the full conversion
of the MSM driver is on my todo list, but it's intrusive, so was
delaying it...).

TL;DR: inside your code please use drm_dp_dpcd_read_byte() /
drm_dp_dpcd_write_byte() / drm_dp_dpcd_read_data() /
drm_dp_dpcd_write_data().

> +		DRM_ERROR("sink mst enablement failed\n");
> +		return;
> +	}
> +
> +	msm_dp->mst_active = true;
> +}
> +
>  static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  {
>  	struct drm_connector *connector = dp->msm_dp_display.connector;
> @@ -315,18 +345,20 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	if (rc)
>  		goto end;
>  
> -	drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
> -	drm_edid_connector_update(connector, drm_edid);
> +	if (!dp->mst_supported || !drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd)) {

In several previous patches, the functions initializing MST can
return an error, leaving the user with half-initialized MST. Are those
errors a safety coding or do they have some real-use usecase? In the
latter case, it would be nice to keep SST wokring if enabling MST fails.

> +		drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
> +		drm_edid_connector_update(connector, drm_edid);
>  
> -	if (!drm_edid) {
> -		DRM_ERROR("panel edid read failed\n");
> -		/* check edid read fail is due to unplug */
> -		if (!msm_dp_aux_is_link_connected(dp->aux))
> -			return -ETIMEDOUT;
> -	}
> +		if (!drm_edid) {
> +			DRM_ERROR("panel edid read failed\n");
> +			/* check edid read fail is due to unplug */
> +			if (!msm_dp_aux_is_link_connected(dp->aux))
> +				return -ETIMEDOUT;
> +		}
>  
> -	if (rc)
> -		goto end;
> +		if (rc)
> +			goto end;
> +	}
>  
>  	msm_dp_link_process_request(dp->link);
>  
> @@ -349,6 +381,9 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	 */
>  	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>  
> +	if (dp->mst_supported && drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd))
> +		msm_dp_display_mst_init(dp);
> +
>  	msm_dp_link_reset_phy_params_vx_px(dp->link);
>  
>  	if (!dp->msm_dp_display.internal_hpd)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
