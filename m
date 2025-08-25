Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5344DB34DB3
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 23:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA5710E579;
	Mon, 25 Aug 2025 21:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DC4YZkLM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5DC10E576
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 21:10:47 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PGv8pt024596
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 21:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=o5NoSP+kvpf4oCKEIwkFCPBr
 ErrR3qlyUVN/G6WnM1o=; b=DC4YZkLMVND8ne/s2IQo8cjon2ytCnBP/FLRTRcT
 IiYyfsb0jaqG6Tob0so8DryTQo4nefIN/tAANhpd9rfYEdzF59h/Ii1nnYW0jbZB
 m/i95Xs/dr2h+O7uhsbXheqPKd5G4i2sbzG4dMzemLbYvt3hEei9LXsBHi4d4I0d
 8q4BdCuCuiD48GxzJGkTzb3jsXjtHPsFUBsvcVXto5JtnrlFgFiYJlxD4332jOx6
 ehtIquPaPbrGDYCvMFWz+Jbus9G12Z1ZtAFQ3c/uLA8NTKZp+YYQLw4+d4UyYlb8
 Qf9tJgZLid4qNrClcfQdoYuwUxVX4f5ZryhtiObcrskPZw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48rusk8mg1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 21:10:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b2d09814efso24814991cf.0
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:10:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756156246; x=1756761046;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o5NoSP+kvpf4oCKEIwkFCPBrErrR3qlyUVN/G6WnM1o=;
 b=I/XXViDCtwebg4L9TxGscYdnOnrY1TSo1YPxZca+Um/gxX0hn9Nf0P4x8QH0W5cDKi
 FKbsWSM871lh+ojMmWLUvxxMhG3WLP6rxCOQ6r6lpzkR/QgyXmfz6kbggDtpvMiP+ofn
 a/opAxl5+/fqZ4eh/9d/WPQcNlF5+ULPwJh4OmDfUzePXSH7QfOxQpxR+NbAwABVhMRO
 D59Sec+yLmBTC5SgGthTy3eXY6x2DwsW1g2Kg0fYome1AdRuKHx9DUSHyzen5ZXcjMGW
 RJesHC/4Aayfpg7Yf6oVS4kd44mDJEC5FfzJHSYoDCJ9CeDqNxkRGtsgpjxNsUWU9BKd
 GaWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtkEPHInSWDM/ejtuQCkHmVyImforGe6VlwQdYIojvvcfZa0McE7deNvdLz4mAj7uWmej0vuYVRts=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAQCvj6R9SSZkAQc6s2P1ZVjItGnTAtWQcLiug9J0rA4X0Jb5v
 GIji2jtMYLCDCQai6w1/7HLZsftDDDdVTG0kaA+wEheHo/rNYZo06Gi7mJMPwpwq+k67z8XgzR9
 Q6cqnbFETl4KGjYg6y389VbmYwfUtcVzYKeJQsk4Q1b8ufUbMEiE8FjBjO/oMHk+/UvPV7VI=
X-Gm-Gg: ASbGncvya57kD9Bgi6mcblMXee/q+URl0S/kNffULPGTQcjybfv9znfKIdcphxMeW1S
 Urrcz/XlNn2T4T9bow9L8CY4vndJmXt6VU85Trbj4w0MCvqJVc+/JoWqlAnxvwXsj8b0Druqkan
 uOV4GaCN671x42netun+yHxDyVpX9ZqP5ktHl81TYsCEt/k8GdSqUgrEy5YZjfX5WANoQFFeQ5j
 pmHT9l1usCSt0ee2ZHCDZ7h0NEF/Rh1w3udM1BNhcchtEU9rfZFDWHXfWWNDzAxDkK1XIg3gPVu
 dTi0MJXlGRQLY8XVmj8v80T4vwr8QYHeLM19rztCYbuOZNEeapuvvu0Or8J/nCdp7ZNeJgMTXOM
 /mQYkpTX9qOJntmABF/0Xg1d6crDP08PyWFo6ybahZdz/sd81BXWP
X-Received: by 2002:a05:622a:241:b0:4ae:cc75:46e7 with SMTP id
 d75a77b69052e-4b2aab44eb1mr153288401cf.57.1756156245446; 
 Mon, 25 Aug 2025 14:10:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGo1/N0DbFsRaUXJYQAheMpfHeFkegCfsbtibM2neyB5yZ+Wlh3+3JMp7GtjIumnjz3kcEsdA==
X-Received: by 2002:a05:622a:241:b0:4ae:cc75:46e7 with SMTP id
 d75a77b69052e-4b2aab44eb1mr153288021cf.57.1756156244734; 
 Mon, 25 Aug 2025 14:10:44 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35caab61sm1814974e87.140.2025.08.25.14.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 14:10:43 -0700 (PDT)
Date: Tue, 26 Aug 2025 00:10:41 +0300
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
Subject: Re: [PATCH v3 17/38] drm/msm/dp: add support to send ACT packets for
 MST
Message-ID: <mtli7kelybfot6ai3lqjagy6hahnpkimqjnjbk26shaoekqoht@cbycvfsmry4o>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-17-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-17-01faacfcdedd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SY73duRu c=1 sm=1 tr=0 ts=68acd157 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=xirQvcjanROXNmDBG14A:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ND5UCZRIbgdtfvfDnxFF9j36RqflXhrn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE1MyBTYWx0ZWRfXzKyvNsQuGkA3
 An3U0USkKdvyKKropuHTricWvVy/7pALg2QwnlXHUDFIKZg5cUKM1A33HruqMQ4i0unsCcpikNG
 ItrC2DDXVFrIWC5hATc8+uWXvX55Y7lOHLr93QHMAEB5A8SJw9+oOECLZ4kB76YI3Ke1kcbtIUo
 lMYQ7iHMYDIERqvY/LeanRIZj2wHhz+/8N591UMHBdNEPai+dOM0mw7zUTVm7LaM4z40AQTlZm8
 /vZ6JLYZvQALAK2dRBDU3eWOxWp75vDXAdg1Tjrw6ZJjQ89cECrkJ39qD+/260om614VP7VfAom
 qdWRWQPaQUJLLvp5r6Oi3EMv4hK5b9xgbfIKbNuJUwEICWk5bKGYCEPBhnfKdVWEIF/KuCU8UA6
 IchSIP60
X-Proofpoint-ORIG-GUID: ND5UCZRIbgdtfvfDnxFF9j36RqflXhrn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_10,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508250153
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

On Mon, Aug 25, 2025 at 10:16:03PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Whenever virtual channel slot allocation changes, the DP
> source must send the action control trigger sequence to notify
> the sink about the same. This would be applicable during the
> start and stop of the pixel stream. Add the infrastructure
> to be able to send ACT packets for the DP controller when
> operating in MST mode.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 39 +++++++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  4 ++--
>  drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_reg.h     |  2 ++
>  5 files changed, 44 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 608a1a077301b2ef3c77c271d873bb4364abe779..16e5ed58e791971d5dca3077cbb77bfcc186505a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -142,6 +142,7 @@ struct msm_dp_ctrl_private {
>  	bool core_clks_on;
>  	bool link_clks_on;
>  	bool stream_clks_on[DP_STREAM_MAX];
> +	bool mst_active;
>  };
>  
>  static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)
> @@ -227,6 +228,32 @@ static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
>  	return 0;
>  }
>  
> +void msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl)
> +{
> +	struct msm_dp_ctrl_private *ctrl;
> +	bool act_complete;
> +
> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> +
> +	if (!ctrl->mst_active)
> +		return;
> +
> +	msm_dp_write_link(ctrl, REG_DP_MST_ACT, 0x1);
> +	/* make sure ACT signal is performed */
> +	wmb();
> +
> +	msleep(20); /* needs 1 frame time */
> +
> +	act_complete = msm_dp_read_link(ctrl, REG_DP_MST_ACT);
> +
> +	if (!act_complete)
> +		drm_dbg_dp(ctrl->drm_dev, "mst ACT trigger complete SUCCESS\n");
> +	else
> +		drm_dbg_dp(ctrl->drm_dev, "mst ACT trigger complete failed\n");

Shouldn't it return an error if the register dind't latch? Also,
shouldn't we set mst_active only if the write went through?

> +
> +	return;
> +}
> +
>  /*
>   * NOTE: resetting DP controller will also clear any pending HPD related interrupts
>   */
> @@ -2079,6 +2106,8 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
>  
>  	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
>  
> +	msm_dp_ctrl_mst_send_act(&ctrl->msm_dp_ctrl);
> +
>  	ret = msm_dp_ctrl_wait4video_ready(ctrl);
>  end:
>  	return ret;
> @@ -2275,7 +2304,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
>  	msm_dp_ctrl_off_pixel_clk(&ctrl->msm_dp_ctrl, ctrl->panel->stream_id);
>  	msm_dp_ctrl_off_link(&ctrl->msm_dp_ctrl);
>  
> -	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl);
> +	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl, false);
>  	if (ret) {
>  		DRM_ERROR("failed to enable DP link controller\n");
>  		return ret;
> @@ -2355,7 +2384,7 @@ static bool msm_dp_ctrl_channel_eq_ok(struct msm_dp_ctrl_private *ctrl)
>  	return drm_dp_channel_eq_ok(link_status, num_lanes);
>  }
>  
> -int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
> +int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl, bool mst_active)
>  {
>  	int rc = 0;
>  	struct msm_dp_ctrl_private *ctrl;
> @@ -2373,6 +2402,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
>  
>  	rate = ctrl->panel->link_info.rate;
>  	pixel_rate = ctrl->panel->msm_dp_mode.drm_mode.clock;
> +	ctrl->mst_active = mst_active;
>  
>  	msm_dp_ctrl_core_clk_enable(&ctrl->msm_dp_ctrl);
>  
> @@ -2643,6 +2673,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  
>  	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
>  
> +	msm_dp_ctrl_mst_send_act(msm_dp_ctrl);
> +
>  	ret = msm_dp_ctrl_wait4video_ready(ctrl);
>  	if (ret)
>  		return ret;
> @@ -2682,6 +2714,8 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
>  
>  	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
>  
> +	ctrl->mst_active = false;
> +
>  	dev_pm_opp_set_rate(ctrl->dev, 0);
>  	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
>  
> @@ -2849,6 +2883,7 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
>  	ctrl->link_base = link_base;
>  	ctrl->mst2link_base = mst2link_base;
>  	ctrl->mst3link_base = mst3link_base;
> +	ctrl->mst_active = false;
>  
>  	ret = msm_dp_ctrl_clk_init(&ctrl->msm_dp_ctrl, max_stream);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 2baf7a1ff44dd7139d2da86390121d5e7a063e9a..abf84ddf463638900684f2511549a593783d2247 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -16,7 +16,7 @@ struct msm_dp_ctrl {
>  
>  struct phy;
>  
> -int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
> +int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl, bool mst_active);
>  int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel);
>  int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
>  void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
> @@ -50,5 +50,5 @@ void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
>  
>  void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
> -
> +void msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl);
>  #endif /* _DP_CTRL_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 562a5eccf3f08c5669cc7c2ad1268897e975d0c4..eeba73f81c5ce7929dac88f4b47ac3741659864b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -709,7 +709,7 @@ static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
>  		force_link_train = true;
>  	}
>  
> -	rc = msm_dp_ctrl_on_link(dp->ctrl);
> +	rc = msm_dp_ctrl_on_link(dp->ctrl, msm_dp_display->mst_active);
>  	if (rc) {
>  		DRM_ERROR("Failed link training (rc=%d)\n", rc);
>  		msm_dp_display->connector->state->link_status = DRM_LINK_STATUS_BAD;
> @@ -1557,6 +1557,7 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
>  	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
>  
>  	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
> +	msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl);
>  }
>  
>  static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index a839d0a3941eac3e277185e42fddea15ca05a17f..9442157bca9d63467b4c43fa644651ad2cbcbef5 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -21,6 +21,7 @@ struct msm_dp {
>  	bool audio_enabled;
>  	bool power_on;
>  	bool prepared;
> +	bool mst_active;
>  	unsigned int connector_type;
>  	bool is_edp;
>  	bool internal_hpd;
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index a806d397ff9d9ad3830b1f539614bffcc955a786..de3d0b8b52c269fd7575edf3f4096a4284ad0b8d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -158,6 +158,8 @@
>  #define DP_CONFIGURATION_CTRL_BPC_SHIFT		(0x08)
>  #define DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT	(0x0D)
>  
> +#define REG_DP_MST_ACT				(0x00000500)
> +
>  #define REG_DP_SOFTWARE_MVID			(0x00000010)
>  #define REG_DP_SOFTWARE_NVID			(0x00000018)
>  #define REG_DP_TOTAL_HOR_VER			(0x0000001C)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
