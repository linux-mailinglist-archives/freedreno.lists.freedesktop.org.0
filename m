Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B27AAD1E72
	for <lists+freedreno@lfdr.de>; Mon,  9 Jun 2025 15:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B7810E1C1;
	Mon,  9 Jun 2025 13:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lB9G+JBK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9F910E04F
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jun 2025 13:05:27 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55994vJD013568
 for <freedreno@lists.freedesktop.org>; Mon, 9 Jun 2025 13:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=7xkCVUQwqf7RIq+KwaSJ+GbN
 K/6py51WB61ukwc4n9A=; b=lB9G+JBKRDqQx8/SLtb4+Vz7y3LWXBALFUokCXRv
 xS/ojDQormalUxO0F4XVKuNJmUoq9rvSs+FWv9pyvi9HGOqWsxGRwV88uBLUrU7/
 sxQMHQAXnpd3mxwX/dhFDvbXsqIBqhBGyUwFIvZa/NG0sbfwlKoRqAuecZrsN1gI
 fwndSjbJ6dB8Z8ki2f8eCrq5w43xkD169DvvNa7UNELhvIKTJB5X8AXQtxmlvY1e
 rY62E8pYP9TPwZhNjrcb8eQCMO4dy87P5NbpBCK+IoOXlgWPSp4xyagneNSt/wmL
 Rn3H8BeM2S7uPpPByEbd3424okOCtiWwwrIVw/28PjrPqw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcdvgq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 13:05:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c760637fe5so822856185a.0
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 06:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749474324; x=1750079124;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7xkCVUQwqf7RIq+KwaSJ+GbNK/6py51WB61ukwc4n9A=;
 b=b0c48XzdA6tT/xWV6Ek2dbj/eFttNeECL2uVQYe/FIvBU13/g7u0jBZhl10CCA57wp
 VBiJV/Oiyvu565os0n4Iof9TxA4SOyYsZDgorpX54JChjDeAILc7MD93dmG+HWe9ZlXx
 1ACf5BxTRM5HYa2FrdY5nWrABU5xTVi8wEJwW6Op+DoOY9wPWb0yiD1zgfFpYeJ8CWCZ
 2naO+3mQJ3Z4EjiFoNL0OXP/sZpjwmeSjYgdQJEqRPRVtX8iAKKgn/XWRRp5xyhcKUSV
 dpBD+qrgaHGH89lrQKOcxaPG1YbjLVhxOE/08Qn4xeULormvclG9FHMi0jlFD8LLIcV7
 KMww==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4aom8PgRZ05qcrl8IlEr9SejV68OX1MfGbnKW1s1DdvIuUg/hzzrjT7nWsrORnycuK5UtJY/fhhc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywXnKOYgDCSVis4A/BgH2lGUja+LYxy5woSKORvWZUvV0d0tJZ
 hwYTxAxBHZyrl2IqPomOC2TLJHIMO8N4dov3Y2aa29ReUZvXdU/hu+LTaNn35Th75rYXyDs7vRm
 0itUSU/w2XUw7i7FJh24Yqm//DAcrcrmde/9aCyt+/IZm9Fzr8dkg4OAYKAGSUY6GbC6KJf7MN/
 KpXQs=
X-Gm-Gg: ASbGncuUoUx30D2WKhPcJe/fRxVNAp28ohn8Db/eEOgFgEPyDLBQNzXlbrQxm/VkmTD
 y+CDB/13YAJPTUFFL7SnPGiWWncPNrAS7zOzC8/0YNTPjpZfY3Fg1AFF8YtJnb23JF8qd4wj4/o
 KevX/8b7+eg3z4svNSiZUkKYSBNds7a/K8skvKp5VwTRqLsknEuTWaJGfXF7hOQtkyDVDVjRljw
 Y23fdxQA+xG0fF3A57UClOrKolJluIyGc1AFdaCJ+uhC+Y0NIkyriUyAyKGMRNVnYuMDMOXB1cC
 PwX9Bv/PiLhxk6k6BHAaHAmiSRjb4UeG34iiD0tggP/8IE9emy263edEzycrRkU9LPVllWUyZ6g
 =
X-Received: by 2002:a05:620a:4048:b0:7d3:9155:ea48 with SMTP id
 af79cd13be357-7d39155f25dmr803703485a.5.1749474324446; 
 Mon, 09 Jun 2025 06:05:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEanFjvz+Pab/BnSn6wIWlNME2jCR2jQzVdPVbp6lEZBUiSoLG6wPdevQH+wVkpMZKGh9CrVw==
X-Received: by 2002:a05:6e02:1a2d:b0:3dc:7c44:cff9 with SMTP id
 e9e14a558f8ab-3ddce494e22mr142829055ab.8.1749474310150; 
 Mon, 09 Jun 2025 06:05:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5536772a429sm1139330e87.147.2025.06.09.06.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 06:05:07 -0700 (PDT)
Date: Mon, 9 Jun 2025 16:05:06 +0300
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
Subject: Re: [PATCH v2 04/38] drm/msm/dp: re-arrange dp_display_disable()
 into functional parts
Message-ID: <ikvsacoatahnmjff4c762cpq6lvmr6cavlbjw6z7oyrvuno5hp@mykq3ts2hhbw>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-4-a54d8902a23d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-4-a54d8902a23d@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5NSBTYWx0ZWRfX80bG6XMN0ZtM
 o72xeQLNDj0a5Ahjs3mobJit6KE8nQj0mDENm4RTriKjSG33/ricjSmrcG2jsZvSv0jVy+4dn7T
 KyR2FugDC+tmwzv33kUXSt+TbUjdkpPrszR3q96K9NdONmY5AcMtfcO8OFTd7QwhbRKhVMHts90
 U8pB17PRZqoWP/4kNQdBOxhc8UYEzlhsXuFkZaSQI+A1ovw8a0VS1NfbiZX+Y3IsisPP0M0fyW+
 YSuUPjIH/RXmunVz2bLwSf8OzUZDhUVVm/Gd/x8ceKcv6GMD5WbmIMqVAbPq50spje44ME1fY7v
 DyDo/4HOeM2JaNh2cq4VosMeJeEEqJr2LqpS1mHgZElz9DJgOcxJCpfO5si4s8Ev8mx3qLsphIu
 JQ5y2CMEL/7naFXm0RDMQyuaqGzd+/YimtqAS6L23eKuFQUk5tgEojwgSR+coX936eusVqDK
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=6846dc16 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=yxpq3E9kyWjuSYLohSwA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 3a4c7YItTtP06EzkOz4dIBqRurAOcE6u
X-Proofpoint-ORIG-GUID: 3a4c7YItTtP06EzkOz4dIBqRurAOcE6u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090095
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

On Mon, Jun 09, 2025 at 08:21:23PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> dp_display_disable() handles special case of when monitor is
> disconnected from the dongle while the dongle stays connected
> thereby needing a separate function dp_ctrl_off_link_stream()
> for this. However with a slight rework this can still be handled
> by keeping common paths same for regular and special case.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 29 +++++++++++++++--------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 ++++-
>  drivers/gpu/drm/msm/dp/dp_display.c | 16 +++++++---------
>  3 files changed, 26 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 1e13ca81b0155a37a4ed7a2e83c918293d703a37..1ce3cca121d0c56b493e282c76eb9202371564cf 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -2081,30 +2081,31 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
>  	return ret;
>  }
>  
> -void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
> +void msm_dp_ctrl_clear_vsc_sdp_pkt(struct msm_dp_ctrl *msm_dp_ctrl)
>  {
>  	struct msm_dp_ctrl_private *ctrl;
> -	struct phy *phy;
>  
>  	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> -	phy = ctrl->phy;
> -
>  	msm_dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
> +}
>  
> -	/* set dongle to D3 (power off) mode */
> -	msm_dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
> +void msm_dp_ctrl_psm_config(struct msm_dp_ctrl *msm_dp_ctrl)

I'm not a fan of (almost) one-line wrappers.

> +{
> +	struct msm_dp_ctrl_private *ctrl;
>  
> -	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>  
> -	if (ctrl->stream_clks_on) {
> -		clk_disable_unprepare(ctrl->pixel_clk);
> -		ctrl->stream_clks_on = false;
> -	}
> +	/* set dongle to D3 (power off) mode */
> +	msm_dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
> +}
>  
> -	dev_pm_opp_set_rate(ctrl->dev, 0);
> -	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
> +void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl)
> +{
> +	struct msm_dp_ctrl_private *ctrl;
> +	struct phy *phy;
>  
> -	phy_power_off(phy);
> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> +	phy = ctrl->phy;
>  
>  	/* aux channel down, reinit phy */
>  	phy_exit(phy);
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 42745c912adbad7221c78f5cecefa730bfda1e75..edbe5766db74c4e4179141d895f9cb85e514f29b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -20,7 +20,6 @@ struct phy;
>  int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
>  int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl);
>  int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *dp_ctrl, bool force_link_train);
> -void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
> @@ -42,4 +41,8 @@ void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl);
>  int msm_dp_ctrl_core_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl);
>  
> +void msm_dp_ctrl_clear_vsc_sdp_pkt(struct msm_dp_ctrl *msm_dp_ctrl);
> +void msm_dp_ctrl_psm_config(struct msm_dp_ctrl *msm_dp_ctrl);
> +void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
> +
>  #endif /* _DP_CTRL_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 5ac5dcf35b789f2bda052a2c17aae20aa48d8e18..a5ca498cb970d0c6a4095b0b7fc6269c2dc3ad31 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -925,17 +925,15 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
>  	if (!msm_dp_display->power_on)
>  		return 0;
>  
> +	msm_dp_ctrl_clear_vsc_sdp_pkt(dp->ctrl);
> +
> +	/* dongle is still connected but sinks are disconnected */
>  	if (dp->link->sink_count == 0) {
> -		/*
> -		 * irq_hpd with sink_count = 0
> -		 * hdmi unplugged out of dongle
> -		 */
> -		msm_dp_ctrl_off_link_stream(dp->ctrl);
> +		msm_dp_ctrl_psm_config(dp->ctrl);
> +		msm_dp_ctrl_off(dp->ctrl);
> +		/* re-init the PHY so that we can listen to Dongle disconnect */
> +		msm_dp_ctrl_reinit_phy(dp->ctrl);
>  	} else {
> -		/*
> -		 * unplugged interrupt
> -		 * dongle unplugged out of DUT
> -		 */
>  		msm_dp_ctrl_off(dp->ctrl);
>  		msm_dp_display_host_phy_exit(dp);
>  	}
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
